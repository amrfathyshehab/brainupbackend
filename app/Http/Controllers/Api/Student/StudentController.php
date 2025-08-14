<?php

namespace App\Http\Controllers\Api\Student;

use App\Models\Post;
use App\Models\Student;
use Illuminate\Http\Request;
use App\Models\Passwordtoken;
use App\Http\Controllers\Controller;
use App\Http\Resources\Student\TeacherResource;
use App\Models\Teacher;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class StudentController extends Controller
{
  public function login(Request $request)
  {
    $fields = $request->validate([
      'username' => 'required|string',
      'password' => 'required|string',
    ]);

    $student = Student::where('username', $fields['username'])->first();

    if (!$student || !Hash::check($fields['password'], $student['password'])) {
      return response([
        'error' => 'Username or password is incorrect'
      ], 500);
    } elseif ($student['active'] == 0) {
      return response([
        'error' => 'The account is not activated'
      ], 500);
    }

    $student->tokens()->delete();

    $token = $student->createToken($student->mobile, ['student'])->plainTextToken;
    $student->update(['lastseen' => now()]);

    return response()->json([
      'message' => "You have been logged in successfully",
      'student' => $student,
      'student_token' => $token
    ], 200);
  }

  public function register(Request $request)
  {
    try {
      $validateUser = Validator::make(
        $request->all(),
        [
          'name'          => 'required|string|max:255|regex:/^[A-Za-z\\s]+$/u',
          'username'      => 'required|string|min:4|unique:students,username',
          'password'      => 'required|string|min:6|confirmed',
          'mobile'        => 'required|string|min:11|unique:students,mobile',
          'parent_mobile' => 'required|string|min:11',
          'school'        => 'string|min:3',
          'stage'         => 'required|in:11,22,33,1,2,3',
          'city_id'       => 'required|string|exists:cities,id',
        ],
        [
          'mobile.unique'          => 'The mobile number is already in use',
          'mobile.min'             => 'The mobile number must be at least 11 digits',
          'password.confirmed'     => 'The password confirmation does not match',
          'username.unique'        => 'The username is already in use',
          'name.required'          => 'Name  is required',
          'password.required'      => 'Password is required',
          'mobile.required'        => 'Mobile number is required',
          'stage.required'         => 'Stage is required',
          'city_id.required'       => 'City is required',
          'parent_mobile.required' => 'Parent mobile number is required',
        ],
        [
          'name'          => 'Name',
          'password'      => 'Password',
          'mobile'        => 'Mobile number',
          'stage'         => 'Stage',
          'city_id'       => 'City',
          'parent_mobile' => 'Parent mobile number',
        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      Student::create([
        'name'          => $request->name,
        'username'      => $request->username,
        'password'      => Hash::make($request->password),
        'stage'         => $request->stage,
        'mobile'        => $request->mobile,
        'parent_mobile' => $request->parent_mobile,
        'school'        => $request->school,
        'area'          => $request->city_id, // city_id
        'active'        => true
      ]);

      return response()->json([
        'status' => true,
        'message' => 'Account successfully created'
      ], 201);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => 500,
        'message' => $th->getMessage()
      ], 500);
    }
  }

  public function home()
  {

    $posts = [];

    $n_posts = Post::where('stage', auth()->user()->stage)->count();

    if ($n_posts == 0) {
      $response = [
        'message' => "There are no posts",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $allposts = Post::where('stage', auth()->user()->stage)->orderby('id', 'desc')->get();

      $i = 1;
      foreach ($allposts as $post) {


        $posts[] = [
          'n' => $i++,
          'key' => $post->id,
          'content' => $post->content,
          'stage' => $post->stage,
          'created_at' => date("F j, Y, g:i a", strtotime($post->created_at)),

        ];
      }

      $response = [
        'data' => $posts,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }

  public function editpicture(Request $request)
  {
    $student = Student::where('id', auth()->user()->id)->first();
    if ($student) {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:10120',
          ],
          [
            'profile_pic.required' => 'Profile picture is required',
            'profile_pic.max' => 'The profile picture must not exceed 5MB.',
            'profile_pic.mimes' => 'Profile picture must be jpg, jpeg',

          ],
          [
            'profile_pic' => 'Profile picture',



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
        $file_path = public_path('uploads/profile_picture/' . $student->profile_pic);

        unlink($file_path);


        $student->update(
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

  public function editpassword(Request $request)
  {
    $student = Student::where('id', auth()->user()->id)->first();
    if ($student) {

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


        $student->update(
          [

            'password' => Hash::make($request->password),

          ]
        );


        return response()->json([
          'status' => true,
          'message' => 'Password changed successfully',
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

  public function sendotp(request $request)
  {

    $n_std = Student::where('mobile', $request->mobile)->count();

    if ($n_std == 0) {
      $response = [
        'message' => "The number is incorrect",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $std = Student::where('mobile', $request->mobile)->first();
      $n_otp = Passwordtoken::where('student_id', $std->id)->count();
      if ($n_otp > 0) {
        $delotp = Passwordtoken::where('student_id', $std->id)->delete();
      }
      $otp = mt_rand(100000, 999999);
      $expire_at = date("Y-m-d H:i:s", strtotime('+' . 15 . 'minutes'));

      $Passwordtoken = Passwordtoken::create(
        [
          'student_id' => $std->id,
          'otp' => $otp,
          'expire_at' => $expire_at,

        ]
      );


      $params = array(
        'token' => '7xcoeq2v06t02upc',
        'to' => '+2' . $request->mobile,
        'body' => "Use this code " . $otp . " to change your password (don’t share it with anyone)",
      );
      $curl = curl_init();
      curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.ultramsg.com/instance71313/messages/chat",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_SSL_VERIFYHOST => 0,
        CURLOPT_SSL_VERIFYPEER => 0,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => http_build_query($params),
        CURLOPT_HTTPHEADER => array(
          "content-type: application/x-www-form-urlencoded"
        ),
      ));

      $response = curl_exec($curl);
      $err = curl_error($curl);

      curl_close($curl);




      $response = [
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }

  public function otp(request $request)
  {

    $n_std = Student::where('mobile', $request->mobile)->count();

    if ($n_std == 0) {
      $response = [
        'message' => "The number is incorrect",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $std = Student::where('mobile', $request->mobile)->first();

      $n_otp = Passwordtoken::where('student_id', $std->id)->where('otp', $request->otp)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
      if ($n_otp == 0) {
        $response = [
          'message' => "The code is incorrect",
          'status' => false,

        ];
        return response($response, 200);
      } elseif ($n_otp == 1) {
        // $delotp = Passwordtoken::where('student_id',$std->id)->where('otp',$request->otp)->where('expire_at', '>=', date('Y-m-d H:i:s'))->delete();

        $response = [
          'message' => "The code is correct",
          'status' => true,

        ];
      }

      return response($response, 200);
    }
  }

  public function changepassword(Request $request)
  {
    $n_std = Student::where('mobile', $request->mobile)->count();

    if ($n_std == 0) {
      $response = [
        'message' => "The number is incorrect",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $std = Student::where('mobile', $request->mobile)->first();

      $n_otp = Passwordtoken::where('student_id', $std->id)->where('otp', $request->otp)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
      if ($n_otp == 0) {
        $response = [
          'message' => "The code is incorrect",
          'status' => false,

        ];
        return response($response, 200);
      } elseif ($n_otp == 1) {
        $delotp = Passwordtoken::where('student_id', $std->id)->where('otp', $request->otp)->where('expire_at', '>=', date('Y-m-d H:i:s'))->delete();
        try {
          //Validated
          $validateUser = Validator::make(
            $request->all(),
            [
              'password' => 'required|string|min:6|confirmed',
            ],
            [
              'password.confirmed' => 'The password confirmation does not match',
              'password.required' => 'Password is required',
              'password.min' => 'The password must be at least 6 characters',

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


          $std->update(
            [

              'password' => Hash::make($request->password),

            ]
          );
        } catch (\Throwable $th) {
          return response()->json([
            'status' => 500,
            'message' => $th->getMessage()
          ], 500);
        }
        $response = [
          'message' => 'Password has been successfully changed',
          'status' => true,

        ];
      }

      return response($response, 200);
    }
    if ($admin) {
    }
  }

  public function availableTeachers(Request $request)
  {
    $studentId = Auth::id();

    $status = $request->query('status', 'all');
    $allowedStatuses = ['pending', 'approved', 'rejected', 'not_requested', 'all'];

    if (!in_array($status, $allowedStatuses)) {
      return response()->json([
        'status'  => false,
        'message' => 'Invalid status value',
      ], 422);
    }

    $query = Teacher::query()
      ->leftJoin('student_teacher_requests', function ($join) use ($studentId) {
        $join->on('teachers.id', '=', 'student_teacher_requests.teacher_id')
          ->where('student_teacher_requests.student_id', '=', $studentId);
      })
      ->select(
        'teachers.*',
        'student_teacher_requests.status as request_status'
      );

    switch ($status) {
      case 'not_requested':
        $query->whereNull('student_teacher_requests.teacher_id');
        break;

      case 'all':
        $query->orderByRaw("
                CASE
                    WHEN request_status = 'approved' THEN 1
                    WHEN request_status = 'pending' THEN 2
                    ELSE 3
                END
            ");
        break;

      default:
        $query->where('student_teacher_requests.status', $status);
        break;
    }

    $teachers = $query->get();

    return response()->json([
      'status'  => true,
      'message' => 'success',
      'data'    => TeacherResource::collection($teachers),
    ]);
  }

  public function sendRequest($teacherId)
  {
    $student = Auth::user();

    $teacher = Teacher::find($teacherId);
    if (!$teacher) {
      return response()->json([
        'status'  => false,
        'message' => 'Teacher not found',
      ], 404);
    }

    $existing = $student->teachers()
      ->where('teacher_id', $teacherId)
      ->first();

    if ($existing) {
      return response()->json([
        'status'  => false,
        'message' => 'You have already sent a request to this teacher',
      ], 400);
    }

    $student->teachers()->attach($teacherId, [
      'status'       => 'pending',
      'requested_at' => now(),
    ]);

    return response()->json([
      'status'  => true,
      'message' => 'Request sent successfully',
    ]);
  }
}
