<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Governorates;
use App\Models\Cities;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Student;
use DB;



class AdminController extends Controller
{
  
    public function login(Request $request) {
    
      $fields = $request->validate([
        'username' => 'required|string',
        'password' => 'required|string',
      ]);
      
      $admin = Admin::where('username', $fields['username'])->first();
        if (!$admin || !Hash::check($fields['password'], $admin['password'])) {
        return response([
          'error' => 'Username or Password wrong'
        ],500);
      }else{
        $user_permissions = [];
   
        $roles = $admin->getRoleNames();
         $permissions = $admin->getDirectPermissions();
         $token = $admin->createToken($request['username'], ['admin'])->plainTextToken;
        
 

         $response = [
          'admin' => $admin,
          'admin_token' => $token,
          
         ];
        
        return response($response, 201);
      }
      
      }
      public function allpermission() {
 
   $permissions = Permission::all();

   $response = [
    'permissions' => $permissions,
    'message' => "success"
  ];
  

   return response($response, 201);

   
       }

      public function create(Request $request) {
       // return $request;
         try {
           //Validated
          $validateUser = Validator::make($request->all(), 
          [
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:admins',
            'password' => 'required|string|min:6|confirmed',
            'mobile' => 'required|string|min:11',
             'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
          ],
          ['username.unique' => 'The username has already been taken.',
          'mobile.unique' => 'The mobile number has already been taken.',
          'mobile.min' => 'The mobile number must be at least 11 digits.',
          'password.confirmed' => 'The password confirmation does not match.',
          
          'name.required' => 'The name is required.',
          'username.required' => 'The username is required.',
          'password.required' => 'The password is required.',
          'mobile.required' => 'The mobile number is required.',
          'profile_pic.required' => 'The profile picture is required.',
          'profile_pic.max' => 'The profile picture must not exceed 5 MB.',
          'profile_pic.mimes' => 'The profile picture must be in jpg or jpeg format.',
          
            
        ],
        [
          'name' => 'Name',
        'username' => 'Username',
        'password' => 'Password',
        'mobile' => 'Mobile',
        'profile_pic' => 'Profile Picture',
        
        ]
        );
    
          if($validateUser->fails()){
              return response()->json([
                  'status' => false,
                  'message' => 'validation error',
                  'errors' => $validateUser->errors()
              ], 403);
          }
          if(!empty($request->profile_pic)){
            $newimgname=time(). '-' . rand(111,999).'.'.
            $request->profile_pic->extension();
            $request->profile_pic->move(public_path('uploads/profile_picture'),$newimgname);
 
          }
       
          $admin = Admin::create(
            [
              'name' => $request->name,
              'username' => $request->username,
              'password' => Hash::make($request->password),
               'mobile' => $request->mobile,
               'profile_pic' => $newimgname,
 
 
           ]
          );
          $user = Admin::where('username',$request->username)->first();

          foreach($request->permissions as $permission){
            $user->givePermissionTo($permission);

          }

 
  
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


       public function users() {
 
         $n_users = Admin::all()->except(auth()->user()->id)->count();
         if($n_users>0){
          $users = Admin::all()->except(auth()->user()->id);
          $assistants=[];
          $i=1;
          foreach($users as $user){
            $assistants[]=[
              'n'=> $i++,
  
              'key'=>$user->id,
              'name'=>$user->name,
                'mobile'=>$user->mobile,
              'profile_pic'=>"https://api.prodigy-online.com/uploads/profile_picture/".$user->profile_pic,
             ];
          }
           $response = [
            'data' => $assistants,
             'n_users' => $n_users,
            'message' => "success"
          ];
          return response($response, 201);

         }
      else{
        $response = [
            'users' => "We have no users",
            'n_users' => $n_users,
            'message' => "error"
        ];
        return response($response, 200);
    }
    
     
     
        
            }


            public function userinfo($id) {

              $n_user = Admin::where('id',$id)->count();
              if($n_user>0){
                $admin= Admin::where('id',$id)->first();
   
  $data=[
  'id'=>$admin->id,
  'name'=>$admin->name,
  'username'=>$admin->username,
  'mobile'=>$admin->mobile,
  'profile_pic'=>"https://api.prodigy-online.com/uploads/profile_picture/".$admin->profile_pic,
  
   ];
 
                $response = [
                 'data' => $data,
                   'message' => "success"
               ];
                return response($response, 200);

              }
           else{
            $response = [
                'message' => "Assistant not found",
                'status' => "error"
            ];
            return response($response, 200);
        }
        
          
          
            }
            
            public function getallpermissions() {
              $all_permissions = DB::table('permissions')
              ->select('section', DB::raw('count(*) as total'))
              ->groupBy('section')
              ->orderBy('total', 'asc')
              ->get();
              $permissions=[];
           
            foreach($all_permissions as $all_permission){
            $permissionsections = Permission::where('section',$all_permission->section)->get();
            $user_permissions=[];
          
             foreach($permissionsections as $permissionsection){
             $user_permissions[]=[
            'public_name'=>$permissionsection->public_name,
             'name'=>$permissionsection->name,
          ];
           
             }
          
            $permissions[]=[
              'section'=>$all_permission->section ." Permissions" ,
           
              'permissions'=>$user_permissions
            ];
          }
              
           
           
           
          
              $response = [
               'data' => $permissions,
                 'message' => "success"
             ];
              return response($response, 200);
          
            
           
          
          
          }
           
       
            public function delete(Request $request) {
              $id = $request->id;
               $n_admin = Admin::where('id',$id)->where('id','!=',auth()->user()->id)->count();
     if($n_admin==0){
        $response = [
          'message' => "Assistant not found",
          'status' => false,
      ] ;
        return response($response, 200);
     }
     else{
      $admin = Admin::where('id',$id)->where('id','!=',auth()->user()->id)->first();

        Admin::find($id)->delete();
        $response = [
          'message' => "Deleted successfully",
          'status' => true,
      ];
         return response($response, 201);
     
     }
              
            
            }   
            
            public function numbering() {
              $requests_count=0;
              $n_non_students = Student::where('active',0)->count();
               if($n_non_students>0){
 $requests_count=$n_non_students;
              }

              $data=
              [
              'requests_count'=>$requests_count
              ];
              $response = [
                'status' => true,
                'data'=>$data
           
             ];
             return response($response, 201); 
}         


 

public function editpassword(Request $request){
  $admin = Admin::where('id',$request->id)->first();
if($admin){

  try {
     //Validated
     $validateUser = Validator::make($request->all(), 
     [
        'password' => 'required|string|min:6|confirmed',
     ],
     [
        'password.confirmed'=>'Password does not match',
        'password.required' => 'Password required',

        'password.min' => 'Password must be at least 6 letters',

   ],
   [
     'password' => 'Password',



   ]
   );

     if($validateUser->fails()){
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
}else{
  $response = [
    'message' => "Assistant not found",
    'status' => false,
];

   return response($response, 404);
}
}  

public function editoinfo(Request $request){
                           
  $n_admin = Admin::where('id',$request->id)->count();
if($n_admin==1){
$id=$request->id;
$admin = Admin::where('id',$request->id)->first();

  try {
     //Validated
     $validateUser = Validator::make($request->all(), 
     [
      'name' => 'required|string|max:255',
      'username' => 'required|string|max:255',
      'mobile' => 'required|string|min:11',
     ],
    [
      'username.unique'=>'Username used before',
      'mobile.unique'=>'Mobile used before',
      'mobile.min'=>'Mobile should be 11 number',

      'name.required' => 'Name required ',

      'username.required' => 'Username required',
      'mobile.required' => 'Mobile required',
 
      
  ],
  [
      'name' => 'Name ',
      'username' => 'Username ',
      'mobile' => 'Mobile',
 


  ]
   );

     if($validateUser->fails()){
         return response()->json([
             'status' => false,
             'message' => 'validation error',
             'errors' => $validateUser->errors()
         ], 403);
     }

     $curstudent=Admin::find($id);

     $curstudent->update(
       [

        'name' => $request->name,
        'username' => $request->username,
         'mobile' => $request->mobile,
  
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
          'message' => "Assistant not found",
          'status' => false,
      ];
      return response($response, 404);
  }
  
}    



public function getpermissions($id) {

  $n_user = Admin::where('id',$id)->count();
  if($n_user>0){
    $admin= Admin::where('id',$id)->first();
    // $permissions = $admin->getDirectPermissions();

    $all_permissions = DB::table('permissions')
    ->select('section', DB::raw('count(*) as total'))
    ->groupBy('section')
    ->orderBy('total', 'asc')
    ->get();
    $permissions=[];
//$usr=$admin->getDirectPermissions();

//return $usr;
 foreach($all_permissions as $all_permission){
  $permissionsections = Permission::where('section',$all_permission->section)->get();
  $user_permissions=[];

   foreach($permissionsections as $permissionsection){

    $is_select=$admin->hasPermissionTo($permissionsection->name);
 $user_permissions[]=[
  'public_name'=>$permissionsection->public_name,
  'is_selected'=>$is_select,
  'name'=>$permissionsection->name,

];
 
   }

  $permissions[]=[
    'section'=>"Permissions " .$all_permission->section,
 
    'permissions'=>$user_permissions
  ];
}
    
 
 
 

    $response = [
     'data' => $permissions,
       'message' => "success"
   ];
    return response($response, 200);

  }
else{
 $response = [
  'message' => "Assistant not found",

     'status' => "error"
 ];
 return response($response, 200);

}


}



public function updateuserpermissions(Request $request) {
   $n_user = Admin::where('id',$request->id)->count();
  if($n_user>0){
    $admin= Admin::where('id',$request->id)->first();
 
    $admin=Admin::find($request->id);

  
  //  foreach($request->permissions as $permission){
      $admin->syncPermissions([$request->permissions]);

  //  }

    $response = [
        'message' => "success"
   ];
    return response($response, 200);

  }
else{
 $response = [
  'message' => "Assistant not found",

     'status' => "error"
 ];
 return response($response, 200);

}


}

 


public function myeditpicture(Request $request){
  $admin = Admin::where('id',auth()->user()->id)->first();
 if($admin){

  try {
     //Validated
     $validateUser = Validator::make($request->all(), 
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

     if($validateUser->fails()){
         return response()->json([
             'status' => false,
             'message' => 'validation error',
             'errors' => $validateUser->errors()
         ], 403);
     }
      
        $newimgname=time(). '-' . rand(111,999).'.'.
        $request->profile_pic->extension();
        $request->profile_pic->move(public_path('uploads/profile_picture'),$newimgname);

      
      $file_path = public_path('uploads/profile_picture/'.$admin->profile_pic)  ; 
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
}else{
  $response = [
    'message' => "User not found",
    'status' => false,
];

   return response($response, 404);
}
}
public function myeditpassword(Request $request){
  $admin = Admin::where('id',auth()->user()->id)->first();
if($admin){

  try {
     //Validated
     $validateUser = Validator::make($request->all(), 
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

     if($validateUser->fails()){
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
}else{
  $response = [
      'message' => "User not found",
     'status' => false,
 
   ];
   return response($response, 404);
}
}  

          }
