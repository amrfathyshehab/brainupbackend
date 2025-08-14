<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Permission;
use App\Models\Teacher;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
  public function create(Request $request)
  {
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'username' => 'required|string|max:255|unique:teachers',
          'password' => 'required|string|min:6|confirmed',
          'mobile' => 'required|string|min:11',
          'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
          'subject' => 'required',
          'description' => 'nullable|string|max:255',
          'cover' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ],
        [
          'username.unique' => 'The username has already been taken.',
          'mobile.unique' => 'The mobile number has already been taken.',
          'mobile.min' => 'The mobile number must be at least 11 digits.',
          'password.confirmed' => 'The password confirmation does not match.',
          'subject.required' => 'The subject is required.',
          'name.required' => 'The name is required.',
          'username.required' => 'The username is required.',
          'password.required' => 'The password is required.',
          'mobile.required' => 'The mobile number is required.',
          'profile_pic.required' => 'The profile picture is required.',
          'profile_pic.max' => 'The profile picture must not exceed 5 MB.',
          'profile_pic.mimes' => 'The profile picture must be in jpg or jpeg format.',
          'cover.image' => 'The cover must be an image.',
          'cover.max' => 'The cover must not exceed 2 MB.',
          'cover.mimes' => 'The cover must be in jpeg, png, or jpg format.',
        ],
        [
          'name' => 'Name',
          'username' => 'Username',
          'password' => 'Password',
          'mobile' => 'Mobile',
          'profile_pic' => 'Profile Picture',
          'subject' => 'Subject',
          'description' => 'Description',
          'cover' => 'Cover',
        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      if (!empty($request->profile_pic)) {
        $newimgname = time() . '-' . rand(111, 999) . '.' .
          $request->profile_pic->extension();
        $request->profile_pic->move(public_path('uploads/profile_picture'), $newimgname);
      }

      $path = null;
      if ($request->hasFile('cover')) {
        list($width, $height) = getimagesize($request->file('cover')->getPathname());
        if ($width != 532 || $height != 325) {
          return response()->json([
            'status'  => false,
            'message' => "Image dimensions must be exactly 532x325 pixels.",
          ], 422);
        }

        $file     = $request->file('cover');
        $ext      = $file->getClientOriginalExtension();
        $filename = uniqid('teacher_', true) . '.' . $ext;
        $path     = 'uploads/covers/' . $filename;

        $file->move(public_path('uploads/covers'), $filename);
      }

      Teacher::create([
        'name'        => $request->name,
        'username'    => $request->username,
        'password'    => Hash::make($request->password),
        'mobile'      => $request->mobile,
        'profile_pic' => $newimgname,
        'subject'     => $request->subject,
        'description' => $request->description,
        'cover_path'  => $path
      ]);

      return response()->json([
        'status' => true,
        'message' => 'Account created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => 500,
        'message' => $th->getMessage()
      ], 500);
    }
  }

  public function users()
  {

    $n_users = Teacher::count();
    if ($n_users > 0) {
      $users = Teacher::all();
      $assistants = [];
      $i = 1;
      foreach ($users as $user) {
        $assistants[] = [
          'n' => $i++,
          'key' => $user->id,
          'name' => $user->name,
          'mobile' => $user->mobile,
          'profile_pic' => $user->profile_pic ? asset("/uploads/profile_picture/" . $user->profile_pic) : null,
          'subject' => $user->subject,
          'description' => $user->description,
          'cover' => $user->cover_path ? asset($user->cover_path) : null
        ];
      }
      $response = [
        'data' => $assistants,
        'n_users' => $n_users,
        'message' => "success"
      ];
      return response($response, 201);
    } else {
      $response = [
        'users' => "We have no users",
        'n_users' => $n_users,
        'message' => "error"
      ];
      return response($response, 200);
    }
  }

  public function teacherinfo($id)
  {

    $n_user = Teacher::where('id', $id)->count();
    if ($n_user > 0) {
      $teacher = Teacher::where('id', $id)->first();

      $data = [

        'key' => $teacher->id,
        'name' => $teacher->name,
        'mobile' => $teacher->mobile,
        'profile_pic' => $teacher->profile_pic ? asset("/uploads/profile_picture/" . $teacher->profile_pic) : null,
        'subject' => $teacher->subject,
        'username' => $teacher->username,

        'description' => $teacher->description,

      ];

      $response = [
        'data' => $data,
        'message' => "success"
      ];
      return response($response, 200);
    } else {
      $response = [
        'message' => "Teacher not found",
        'status' => "error"
      ];
      return response($response, 200);
    }
  }

  public function delete(Request $request)
  {
    $id = $request->id;
    $n_admin = Teacher::where('id', $id)->count();
    if ($n_admin == 0) {
      $response = [
        'message' => "Teacher not found",
        'status' => false,
      ];
      return response($response, 200);
    } else {

      Teacher::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,
      ];
      return response($response, 201);
    }
  }

  public function numbering()
  {
    $requests_count = 0;
    $n_non_students = Student::where('active', 0)->count();
    if ($n_non_students > 0) {
      $requests_count = $n_non_students;
    }

    $data =
      [
        'requests_count' => $requests_count
      ];
    $response = [
      'status' => true,
      'data' => $data

    ];
    return response($response, 201);
  }

  public function editpassword(Request $request)
  {
    $admin = Teacher::where('id', $request->id)->first();
    if ($admin) {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'password' => 'required|string|min:6|confirmed',
          ],
          [
            'password.confirmed' => 'Password does not match',
            'password.required' => 'Password required',

            'password.min' => 'Password must be at least 6 letters',

          ],
          [
            'password' => 'Password',



          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }


        $admin->update(
          [

            'password' => Hash::make($request->password),

          ]
        );


        return response()->json([
          'status' => true,
          'message' => 'Updated successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    } else {
      $response = [
        'message' => "Teacher not found",
        'status' => false,
      ];

      return response($response, 404);
    }
  }

  public function editoinfo(Request $request)
  {
    $teacher = Teacher::find($request->id);
    if (!$teacher) {
      return response([
        'status'  => false,
        'message' => "Teacher not found",
      ], 404);
    }

    try {
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'username' => 'required|string|max:255|unique:teachers,username,' . $teacher->id,
          'mobile' => 'required|string|min:11',
          'subject' => 'required',
          'description' => 'nullable|string|max:255',
          'cover' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ],
        [
          'username.unique' => 'The username has already been taken.',
          'mobile.unique' => 'The mobile number has already been taken.',
          'mobile.min' => 'The mobile number must be at least 11 digits.',
          'subject.required' => 'The subject is required.',
          'name.required' => 'The name is required.',
          'username.required' => 'The username is required.',
          'mobile.required' => 'The mobile number is required.',
          'cover.image' => 'The cover must be an image.',
          'cover.max' => 'The cover must not be greater than 2MB.',
          'cover.mimes' => 'The cover must be a file of type: jpeg, png, jpg.',
        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      if ($request->hasFile('cover')) {
        list($width, $height) = getimagesize($request->file('cover')->getPathname());
        if ($width != 532 || $height != 325) {
          return response()->json([
            'status'  => false,
            'message' => "Image dimensions must be exactly 532x325 pixels.",
          ], 422);
        }

        if ($teacher->cover_path && file_exists(public_path($teacher->cover_path))) {
          @unlink(public_path($teacher->cover_path));
        }

        $file     = $request->file('cover');
        $ext      = $file->getClientOriginalExtension();
        $filename = uniqid('teacher_', true) . '.' . $ext;
        $path     = 'uploads/covers/' . $filename;

        $file->move(public_path('uploads/covers'), $filename);

        $teacher->cover_path = $path;
      }

      $teacher->name        = $request->name;
      $teacher->username    = $request->username;
      $teacher->mobile      = $request->mobile;
      $teacher->subject     = $request->subject;
      $teacher->description = $request->description;

      $teacher->save();

      return response()->json([
        'status'  => true,
        'message' => 'Updated successfully',
        'cover'   => $teacher->cover ? asset($teacher->cover) : null
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status'  => 500,
        'message' => $th->getMessage()
      ], 500);
    }
  }

  public function getpermissions($id)
  {

    $n_user = Admin::where('id', $id)->count();
    if ($n_user > 0) {
      $admin = Admin::where('id', $id)->first();
      // $permissions = $admin->getDirectPermissions();

      $all_permissions = DB::table('permissions')
        ->select('section', DB::raw('count(*) as total'))
        ->groupBy('section')
        ->orderBy('total', 'asc')
        ->get();
      $permissions = [];
      //$usr=$admin->getDirectPermissions();

      //return $usr;
      foreach ($all_permissions as $all_permission) {
        $permissionsections = Permission::where('section', $all_permission->section)->get();
        $user_permissions = [];

        foreach ($permissionsections as $permissionsection) {

          $is_select = $admin->hasPermissionTo($permissionsection->name);
          $user_permissions[] = [
            'public_name' => $permissionsection->public_name,
            'is_selected' => $is_select,
            'name' => $permissionsection->name,

          ];
        }

        $permissions[] = [
          'section' => "Permissions " . $all_permission->section,

          'permissions' => $user_permissions
        ];
      }





      $response = [
        'data' => $permissions,
        'message' => "success"
      ];
      return response($response, 200);
    } else {
      $response = [
        'message' => "Assistant not found",

        'status' => "error"
      ];
      return response($response, 200);
    }
  }

  public function updateuserpermissions(Request $request)
  {
    $n_user = Admin::where('id', $request->id)->count();
    if ($n_user > 0) {
      $admin = Admin::where('id', $request->id)->first();

      $admin = Admin::find($request->id);


      //  foreach($request->permissions as $permission){
      $admin->syncPermissions([$request->permissions]);

      //  }

      $response = [
        'message' => "success"
      ];
      return response($response, 200);
    } else {
      $response = [
        'message' => "Assistant not found",

        'status' => "error"
      ];
      return response($response, 200);
    }
  }


  public function getallpermissions()
  {
    $all_permissions = DB::table('permissions')
      ->select('section', DB::raw('count(*) as total'))
      ->groupBy('section')
      ->orderBy('total', 'asc')
      ->get();
    $permissions = [];

    foreach ($all_permissions as $all_permission) {
      $permissionsections = Permission::where('section', $all_permission->section)->get();
      $user_permissions = [];

      foreach ($permissionsections as $permissionsection) {
        $user_permissions[] = [
          'public_name' => $permissionsection->public_name,
          'name' => $permissionsection->name,
        ];
      }

      $permissions[] = [
        'section' => $all_permission->section . " Permissions",

        'permissions' => $user_permissions
      ];
    }





    $response = [
      'data' => $permissions,
      'message' => "success"
    ];
    return response($response, 200);
  }



  public function editpicture(Request $request)
  {
    $admin = Teacher::where('id', $request->id)->first();
    if ($admin) {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
          ],
          [
            'profile_pic.required' => 'The profile picture is required',
            'profile_pic.max' => 'The profile picture must not exceed 5 MB',
            'profile_pic.mimes' => 'The profile picture must be in jpg or jpeg format',
          ],
          [
            'profile_pic' => 'Profile Picture',

          ]

        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }

        $newimgname = time() . '-' . rand(111, 999) . '.' .
          $request->profile_pic->extension();
        $request->profile_pic->move(public_path('uploads/profile_picture'), $newimgname);


        $file_path = public_path('uploads/profile_picture/' . $admin->profile_pic);
        unlink($file_path);


        $admin->update(
          [

            'profile_pic' => $newimgname,

          ]
        );


        return response()->json([
          'status' => true,
          'message' => 'Updated successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    } else {
      $response = [
        'message' => "User not found",
        'status' => false,
      ];

      return response($response, 404);
    }
  }
  public function myeditpassword(Request $request)
  {
    $admin = Admin::where('id', auth()->user()->id)->first();
    if ($admin) {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [

            'password' => 'required|string|min:6|confirmed',
          ],

          [
            'password.confirmed' => 'Password confirmation does not match',
            'password.required' => 'Password is required',
            'password.min' => 'Password must be at least 6 characters long',
          ],

          [
            'password' => 'Password',



          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }


        $admin->update(
          [

            'password' => Hash::make($request->password),

          ]
        );


        return response()->json([
          'status' => true,
          'message' => 'Updated successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    } else {
      $response = [
        'message' => "User not found",
        'status' => false,

      ];
      return response($response, 404);
    }
  }
}
