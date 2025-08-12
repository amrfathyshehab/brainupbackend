<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
 use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Session;
use App\Models\Student;
use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Models\Attendancequiz;
use App\Models\Sessionlecture;



use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;


class AttendanceController extends Controller
{
   public function attendance() {
      $allattendance=[];
      
        $all_groups = Group::all();
        $n_group = Group::count();
        $n_lecture = Lecture::count();
     if($n_group==0){
        $response = [
          'message' => "We have no attendance groups",
          'status' => false,

      ];
      return response($response, 200);
      }
      elseif ($n_lecture == 0) {
          $response = [
              'message' => "We have no lectures for attendance",
              'status' => false,

          ];
      
     return response($response, 200);
     }
     else{
        $i=1;
        foreach($all_groups as $group){
          $Lectures = Session::where('group_id',$group->id)->get();
          $sessions=[];
         
        foreach($Lectures as $Lecture){
          $n_attendance = Attendance::where('lecture_id',$Lecture->id)->where('group_id',$group->id)->count();

          $sessions[]=[
            'key'=>$Lecture->id,
             'sessionname'=>$Lecture->name,
            'studentsnum'=>$n_attendance,

          ];
        }
        $stage="1st stage";
         if($group->stage==2){
          $stage="2nd stage";
         }elseif($group->stage==3){
          $stage="3rd stage";
        }elseif($group->stage==22){
          $stage="Second preparatory";
        }elseif($group->stage==33){
          $stage="Third  preparatory";
          
        }elseif($group->stage==9){
          $stage="Grade 9";
        }elseif($group->stage==10){
          $stage="Grade 10";
        }
           $allattendance[]=[
              'n'=> $i++,
              'key'=>$group->id,
              'groupname'=>$group->name,
              'academiclevel'=>$stage,
              'sessions'=>$sessions,
       
     
           ];
        
        }
        $response = [
           'data' => $allattendance,
           'message' => "success",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }

            }
            public function create(Request $request) {
               date_default_timezone_set("Africa/Cairo");

               if($request->type&&$request->value&&$request->lecture_id&&$request->group_id){
                $n_student = Student::where($request->type,$request->value)->where('active',1)->count();
if($n_student==0){
  return response()->json([
    'status' => false,
    'message' => 'Student not found',
 ], 200);

}else{
  $student = Student::where($request->type,$request->value)->where('active',1)->first();
  $n_attendance = Attendance::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->count();
  $n_buying = History::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->count();
   if($n_attendance>0&&$n_buying>0){

  $attendance = Attendance::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->first();
  $buying = History::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->first();

 return response()->json([
    'status' => false,
    'data' => ['student_id' => $student->id],
    'message' => 'The student has already attended the group ' . $attendance->group->name . ' and also attended online on ' . date('Y-m-d', strtotime($buying->created_at)) . '',
], 200);

}elseif($n_buying>0){
  $buying = History::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->first();

  return response()->json([
    'status' => false,
    'data' => ['student_id' => $student->id],
    'message' => 'The student has already attended online on ' . date('Y-m-d', strtotime($buying->created_at)) . '',
], 200);

}elseif($n_attendance>0){
  $attendance = Attendance::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->first();

  return response()->json([
    'status' => false,
    'data' => ['student_id' => $student->id],
    'message' => 'The student has already attended the group ' . $attendance->group->name . '',
], 200);

}
elseif($n_attendance==0&&$n_buying==0){

  $lastseen = Attendance::where('student_id',$student->id)
  ->orderByDesc('attend_at')->first();
  $diff =NULL;
if($lastseen!=Null){
$diff = \Carbon\Carbon::parse($lastseen->attend_at)->diffInDays(\Carbon\Carbon::now());

}

  $attendancedstd = Attendance::where('student_id',$student->id)
  ->orderByDesc('attend_at')->first();

  $n_onhistories = History::where('student_id',$student->id)
  ->orderByDesc('created_at')->count();
  $onhistories = History::where('student_id',$student->id)
  ->orderByDesc('created_at')->get();
$allatend=[];
if($n_onhistories>0){
  foreach($onhistories as $onhistory){
    $allatend[]=[
      'lecture_name'=>$onhistory->lecture->title,
      'location'=>"اون لاين",

      'attend_at'=> date('Y-m-d', strtotime( $onhistory->buy_at)),
    ];
  }
}

$n_centerattends = Attendance::where('student_id',$student->id)
->orderByDesc('attend_at')->count();
if($n_centerattends>0){
  $centerattends = Attendance::where('student_id',$student->id)
  ->orderByDesc('attend_at')->get();
  foreach($centerattends as $centerattend){
    $allatend[]=[
      'lecture_name'=>$centerattend->lecture->title,
      'location'=>"سنتر",
      'attend_at'=> date('Y-m-d', strtotime( $centerattend->created_at)),

     ];
  }
}
if($allatend){
  foreach ($allatend as $key => $part) {
    $sort[$key] = strtotime($part['attend_at']);
  }
  array_multisort($sort, SORT_DESC, $allatend); 
}
 

   Attendance::create([
      'student_id' =>$student->id,
      'group_id' =>$request->group_id,
      'lecture_id' =>$request->lecture_id,
      'attend_by' =>auth()->user()->id,
      'attend_at' =>date('Y-m-d H:i:s'),
  ]);
 $lec= Lecture::where('id',$request->lecture_id)->first();
 $gr= Group::where('id',$request->group_id)->first();

 
  
$date=[
  'student_name'=> $student->first_name." " .$student->second_name. " " .$student->third_name ,
  'last_attendance'=>$diff,
  'history'=>$allatend,
];
  return response()->json([
    'status' => true,
    'data' => $date,
    'message' => 'Attendance was successful',
 ], 200);
}
}
              }else{
    return response()->json([
        'status' => false,
        'message' => 'Invalid selection',
    ], 403);
    
}

 
 
       
          
              }
            public function delete(Request $request) {
              $id = $request->id;
              $n_attendance = Attendance::where('id',$id)->count();
     if($n_attendance==0){
        $response = [
          'message' => "This attendance does not exist",
          'status' => false,

      ];
        return response($response, 401);
     }
     else{
       Attendance::find($id)->delete();
        $response = [
            'message' => "Deleted successfully",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
              
            
            }
               
     
            public function deletesesion(Request $request) {
              $id = $request->id;
              $n_attendance = Session::where('id',$id)->count();
     if($n_attendance==0){
        $response = [
          'message' => "This session does not exist",
          'status' => false,

      ];
        return response($response, 401);
     }
     else{
      Session::find($id)->delete();
        $response = [
            'message' => "Deleted successfully",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
              
            
            }
       

       public function outofquiz(Request $request) {
          $n_group = Group::where('id',$request->group_id)->count();
         $n_lecture = Lecture::where('id',$request->lecture_id)->count();

if($n_group==0){
   $response = [
      'message' => "Group not found",
     'status' => false,
 
   ];
   return response($response, 401);
}elseif($n_lecture==0){
  $response = [
     'message' => "The lecture not found",
    'status' => false,

  ];
  return response($response, 401);
}
else{
  $n_Attendancequiz = Attendancequiz::where('lecture_id',$request->lecture_id)->where('group_id',$request->group_id)->count();
if($n_Attendancequiz==0){
  Attendancequiz::create([
     'group_id' =>$request->group_id,
    'lecture_id' =>$request->lecture_id,
     'degree_quiz' =>$request->degree_quiz,
]);
$response = [
    'message' => "Exam grade has been added",
    'status' => true,

];
return response($response, 201);

}else{
    $Attendancequiz = Attendancequiz::where('lecture_id',$request->lecture_id)->where('group_id',$request->group_id)->first();

  $Attendancequiz=Attendancequiz::find($Attendancequiz->id);

  $Attendancequiz->update([
      'degree_quiz' => $request->degree_quiz,
 
  ]);



  $response = [
    'message' => "Exam grade has been updated",
    'status' => true,

];
   return response($response, 201);

}
  
  
 
}
         
       
       }

       public function updatequiz(Request $request) {
        $id = $request->id;
 
        $n_attendance = Attendance::where('id',$id)->count();

        if($n_attendance==0){
          $response = [
            'message' => "Not found ",
           'status' => false,
       
         ];
         return response($response, 403);
        }else{
          $attendance = Attendance::where('id',$id)->first();

          $n_Attendancequiz = Attendancequiz::where('lecture_id',$attendance->lecture_id)->where('group_id',$attendance->group_id)->count();
          if($n_Attendancequiz==0){
    $response = [
      'message' => "The final grade for the exam must be set",
      'status' => false,
      
  ];
    return response($response, 401);
  }
  $Attendancequiz = Attendancequiz::where('lecture_id', $attendance->lecture_id)
      ->where('group_id', $attendance->group_id)
      ->first();
  
  if ($request->degree > $Attendancequiz->degree_quiz) {
      $response = [
          'message' => "The student's grade cannot be higher than the exam's grade",
          'status' => false,
          
      ];
      return response($response, 401);
  }
  

  if($request->degree==NULL){
    $response = [
      'message' => "Degree is empty ",
     'status' => false,
 
   ];
   return response($response, 401);
  }

          $Attendance=Attendance::find($id);
          $student = Student::where('id',$Attendance->student_id)->where('active',1)->first();

          $Attendance->update([
              'student_quiz' => $request->degree,
          
        
          ]);
          $Attendancequiz = Attendancequiz::where('lecture_id',$attendance->lecture_id)->where('group_id',$attendance->group_id)->first();

        
            
          $response = [
            'message' => "Grade updated successfully",
            'status' => true,
        ]
        ;
           return response($response, 201);
        }

     
      
      }
      public function updatehomework(Request $request) {
        $id = $request->id;
 
        $n_attendance = Attendance::where('id',$id)->count();

        if($n_attendance==0){
          $response = [
            'message' => "Not found",
           'status' => false,
       
         ];
         return response($response, 403);
        }else{
     
          $Attendance=Attendance::find($id);
          $student = Student::where('id',$Attendance->student_id)->where('active',1)->first();

          $Attendance->update([
              'student_homework' => $request->homework,
          
        
          ]);
          $homework=NULL;
          $homeworkstatus=NULL;
          if ($request->homework!=NULL){
            if ($request->homework == "1")
             {
              $homeworkstatus = "Homework submitted";
          } 
          elseif ($request->homework == "0") 
          {
              $homeworkstatus = "Homework not submitted";
          } else 
          {
              $homeworkstatus = "Homework incomplete";
          }
        
          
     
     
            
          }
     

 
          $response = [
              'message' => "The homework has been successfully edited",
             'status' => true,
         
           ];
           return response($response, 201);
        }

     
      
      }

       public function attendancebygroupandlecture($lecture_id,$group_id) {
        $allattendance=[];
        
           $n_group = Group::where('id',$group_id)->count();
          $n_lecture = Lecture::where('id',$lecture_id)->count();
       if($n_group==0){
          $response = [
              'message' => "Group not found",
             'status' => false,
         
           ];
           return response($response, 200);
       }
       elseif($n_lecture==0){
        $response = [
          'message' => "Lecture not found",
         'status' => false,
     
       ];
       return response($response, 200);
       }
       else{
        $n_attendances = Attendance::where('lecture_id',$lecture_id)->where('group_id',$group_id)->count();
if($n_attendances==0){
  $response = [
     'message' => "No attendance",
    'status' => false,

  ];
  return response($response, 201);
}else{
  $i=1;
  $attendances = Attendance::where('lecture_id',$lecture_id)->where('group_id',$group_id)->get();
  $Attendancequiz = Attendancequiz::where('lecture_id',$lecture_id)->where('group_id',$group_id)->first();
  $quiz_dgree=null;
  if($Attendancequiz){
    $quiz_dgree=$Attendancequiz->degree_quiz;

  }

  foreach($attendances as $attendance){
 

     $allattendance[]=[
        'n'=> $i++,
        'key'=>$attendance->id,
        'name'=>$attendance->student->first_name." " .$attendance->student->second_name. " " .$attendance->student->third_name ,
        'mobile'=>$attendance->student->mobile,
        'parent_mobile'=>$attendance->student->parent_mobile,
        'parent_mobile2'=>$attendance->student->parent_mobile2,
        'student_quiz_degree'=>$attendance->student_quiz,
        'quiz_degree'=>$quiz_dgree,
        'homework'=>$attendance->student_homework,
        'attend_at'=>date("F j, Y, g:i a",strtotime($attendance->attend_at)),
        'magnetic_id'=>$attendance->student->magnetic_id,


     ];
  
  }
  $response = [
     'data' => $allattendance,
     'message' => "success",
     'status' => true,
 
   ];
   return response($response, 201);
}
          
       
       }
  
              }

 
           public function absence($group_id,$lecture_id) {
          $n_group = Group::where('id',$group_id)->count();
         $n_lecture = Lecture::where('id',$lecture_id)->count();

if($n_group==0){
   $response = [
      'message' => "Group not found",
     'status' => false,
 
   ];
   return response($response, 401);
}elseif($n_lecture==0){
  $response = [
     'message' => "The lecture not found",
    'status' => false,

  ];
  return response($response, 401);
}
else{
    $n_student = Student::where('group_id',$group_id)->where('active',1)->count();
    if($n_student==0){
 
      $response = [
        'message' => "There are no students in this group",
       'status' => true,
      
      ];
      return response($response, 201);
      
      }
      else{
        $absencestudents=[];
        $students = Student::where('group_id',$group_id)->where('active',1)->get();
        $n=1;
foreach($students as $student){
  $n_Attendance = Attendance::where('lecture_id',$lecture_id)->where('student_id',$student->id)->count();
  $n_history = History::where('lecture_id',$lecture_id)->where('student_id',$student->id)->count();

  if($n_Attendance==0&&$n_history==0){
    $absencestudents[]=[
      'n'=>$n++,
      'key'=>$student->id,
      'name'=>$student->first_name." " .$student->second_name. " " .$student->third_name ,
      'mobile'=>$student->mobile,
      'parent_mobile'=>$student->parent_mobile,
      'parent_mobile2'=>$student->parent_mobile2,

    ];
    
    } 


    
    $response = [
      'message' => "success",
     'status' => true,
     'data'=>$absencestudents
    
    ];
    return response($response, 201);
}

       
      }


  
  
 
}
         
       
       }     
       public function sendabsence(Request $request) {
        
        foreach($request->selected as $student){
          echo $student['name'];
        }
       }  
       public function lecturesbygroup($id) {
        $alllecture=[];
        
           $n_group = Group::where('id',$id)->count();
        if($n_group==0){
          $response = [
              'message' => "Group not found",
             'status' => false,
         
           ];
           return response($response, 200);
       }
     
       else{
        $group = Group::where('id',$id)->first();
        $n_lecture = Lecture::where('stage',$group->stage)->count();
 if($n_lecture==0){
  $response = [
     'message' => "No have lectures",
    'status' => false,

  ];
  return response($response, 201);
}else{
  $i=1;
  $lectures = Lecture::where('stage',$group->stage)->get();


  foreach($lectures as $lecture){
 

     $alllecture[]=[
        'n'=> $i++,
        'key'=>$lecture->id,
        'name'=>$lecture->title ,
 

     ];
  
  }
  $response = [
     'data' => $alllecture,
     'message' => "success",
     'status' => true,
 
   ];
   return response($response, 201);
}
          
       
       }
  
              }
              public function createsession(Request $request) {
                // return $request;
                  try {
                    //Validated
                   $validateUser = Validator::make($request->all(), 
                   [
                     'name' => 'required|string|max:255',
                     'days' => 'required',

                    ],
                   [
          
                     'name.required' => 'Name is required',
                     'days.required' => 'Days is required',

                     
                 ],
                 [
                     'name' => 'Name ',
 
         
             
                 ]
                 );
             
                   if($validateUser->fails()){
                       return response()->json([
                           'status' => false,
                           'message' => 'validation error',
                           'errors' => $validateUser->errors()
                       ], 403);
                   }
                
                
                   $session = Session::create(
                     [
                       'name' => $request->name,
                       'days' => $request->days,

                       'group_id'=>$request->id
                    ]
                     

                 

                   );
                    foreach($request->sessions as $lecture){
                     Sessionlecture::create(
                       [
                         'session_id' => $session->id,
                         'lecture_id' => $lecture['lecture_id'],

                      ]
                       );
                   }
          
           
                   return response()->json([
                       'status' => true,
                       'message' => 'The session has been created successfully',
                    ], 200);
         
               } catch (\Throwable $th) {
                   return response()->json([
                       'status' => 500,
                       'message' => $th->getMessage()
                   ], 500);
               }
                }     
                
                
                public function getsession($id) {
                  $alllecture=[];
                  
                     $n_session = Session::where('id',$id)->count();
                  if($n_session==0){
                    $response = [
                        'message' => "Session not found",
                       'status' => false,
                   
                     ];
                     return response($response, 200);
                 }
               
                 else{
                  $session = Session::where('id',$id)->first();
           
            $i=1;
            $lectures = Sessionlecture::where('session_id',$session->id)->get();
          
          $all_session=[];
            foreach($lectures as $lecture){
              $all_session[]=[
                'n'=> $i++,
                'key'=>$lecture->lecture->id,
                'name'=>$lecture->lecture->title ,
         
        
             ];
                 
            }
               $session=[
                 
                  'key'=>$lecture->id,
                  'name'=>$session->name ,
                  'days'=>$session->days ,

                  'lectures'=>$all_session ,

          
               ];
     
            $response = [
               'data' => $session,
               'message' => "success",
               'status' => true,
           
             ];
             return response($response, 201);
           
                    
                 
                 }
            
                        }



                        public function updateset(Request $request) {

                          try {
                            //Validated
                           $validateUser = Validator::make($request->all(), 
                           [
                             'name' => 'required',
                             'days' => 'required',
                    
                  
                             ],
                           [
                  
                            'name.required' => 'Name is required',
                            'days.required' => 'Days is required',
                   
                             
                         ],
                         [
                             'name' => 'Name ',
                              'days' => 'Days ',
                    
                  
                         ]
                         );
                     
                           if($validateUser->fails()){
                               return response()->json([
                                   'status' => false,
                                   'message' => 'validation error',
                                   'errors' => $validateUser->errors()
                               ], 403);
                           }
                           $id = $request->id;
                           $n_session = Session::where('id',$id)->count();
                              if($n_session==0){
                                 $response = [
                                    'message' => "Session not found",
                                   'status' => false,
                               
                                 ];
                                 return response($response, 404);
                              }
                              else{
                                $session=Session::find($id);
                                     
                                $session->update([
                                    'name' => $request->name,
                                    'days'=>$request->days,
                   
                                ]);
                             
                                $sessions=Sessionlecture::where('session_id',$id)->get();
                                
                                foreach($sessions as $session){
                                  Sessionlecture::find($session->id)->delete();
                              }


                foreach($request->sessions as $lecture){
                     Sessionlecture::create(
                       [
                         'session_id' => $id,
                         'lecture_id' => $lecture['lecture_id'],

                      ]
                       );
                   }
                                $response = [
                                    'message' => "Updated successfully",
                                   'status' => true,
                               
                                 ];
                                 return response($response, 201);
                              }
                   
                  
                       } catch (\Throwable $th) {
                           return response()->json([
                               'status' => false,
                               'message' => $th->getMessage()
                           ], 200);
                       }
                         
                                            
                          }
                          public function allstudentbygroup($group_id) {
                            $group = Group::where('id',$group_id)->first();
                    
                            $students = Student::where('stage',$group->stage)->where('active',1)->get();
                            $n=1;
                            foreach($students as $student){
                              $absencestudents[]=[
                                'n'=>$n++,
                                'key'=>$student->id,
                                'name'=>$student->fname." " .$student->sname. " " .$student->lname ,
                                'mobile'=>$student->mobile,
                                'parent_mobile'=>$student->mobilep1,
                                'parent_mobile2'=>$student->mobilep2,
                                'parent_mobile2'=>$student->mobilep2,
                                'magnetic_id'=>$student->magnetic_id,
                    
                              ];
                            }
                     
                            $response = [
                              'message' => "success",
                             'status' => true,
                             'data'=>$absencestudents
                            
                            ];
                            return response($response, 201);  
                           }
                    
                    
                           public function attendfromsite(Request $request) {
                            date_default_timezone_set("Africa/Cairo");
                    foreach($request->students as $studentattend){
                    
                       $n_student = Student::where('id',$studentattend['id'])->where('active',1)->count();
                      if($n_student==0){
                      return response()->json([
                      'status' => false,
                      'message' => 'Student not found',
                      ], 200);
                      
                      }else{
                      $student = Student::where('id',$studentattend['id'])->where('active',1)->first();
                      $n_attendance = Attendance::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->count();
                      $n_buying = History::where('lecture_id',$request->lecture_id)->where('student_id',$student->id)->count();
                     
                      if($n_attendance==0&&$n_buying==0){
                      
                      $lastseen = Attendance::where('student_id',$student->id)
                      ->orderByDesc('attend_at')->first();
                      $diff =NULL;
                      if($lastseen!=Null){
                      $diff = \Carbon\Carbon::parse($lastseen->attend_at)->diffInDays(\Carbon\Carbon::now());
                      
                      }
                      
                      $attendancedstd = Attendance::where('student_id',$student->id)
                      ->orderByDesc('attend_at')->first();
                      
                      $n_onhistories = History::where('student_id',$student->id)
                      ->orderByDesc('created_at')->count();
                      $onhistories = History::where('student_id',$student->id)
                      ->orderByDesc('created_at')->get();
                      $allatend=[];
                      if($n_onhistories>0){
                      foreach($onhistories as $onhistory){
                      $allatend[]=[
                      'lecture_name'=>$onhistory->lecture->title,
                      'location'=>" Online",
                      
                      'attend_at'=> date('Y-m-d', strtotime( $onhistory->buy_at)),
                      ];
                      }
                      }
                      
                      $n_centerattends = Attendance::where('student_id',$student->id)
                      ->orderByDesc('attend_at')->count();
                      if($n_centerattends>0){
                      $centerattends = Attendance::where('student_id',$student->id)
                      ->orderByDesc('attend_at')->get();
                      foreach($centerattends as $centerattend){
                      $allatend[]=[
                      'lecture_name'=>$centerattend->lecture->title,
                      'location'=>"Center",
                      'attend_at'=> date('Y-m-d', strtotime( $centerattend->created_at)),
                      
                      ];
                      }
                      }
                      if($allatend){
                      foreach ($allatend as $key => $part) {
                      $sort[$key] = strtotime($part['attend_at']);
                      }
                      array_multisort($sort, SORT_DESC, $allatend); 
                      }
                      
                      
                      Attendance::create([
                      'student_id' =>$student->id,
                      'group_id' =>$request->group_id,
                      'lecture_id' =>$request->lecture_id,
                      'attend_by' =>auth()->user()->id,
                      'attend_at' =>$studentattend['attend_at'],
                      ]);
                      $lec= Lecture::where('id',$request->lecture_id)->first();
                      $gr= Group::where('id',$request->group_id)->first();
                      
                      
                       
                      }
                      }
                          
                      
                      
                    }
                    
                    return response()->json([
                      'status' => true,
                       'message' => 'Attendance was successful',
                      ], 200);
                       
                           }
                                  }      
                          
 
        
