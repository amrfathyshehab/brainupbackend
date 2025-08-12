<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use App\Models\Cities;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Student;
use App\Models\Attendance;
use App\Models\Governorates;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;
use App\Models\Attendancequiz;
use App\Models\Homework;
use App\Models\Quiz;

use App\Models\Studentresult;

use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;


class StudentadController extends Controller
{


   public function requests()
   {
      $students = [];

      $non_students = Student::where('active', 0)->get();
      $n_non_students = Student::where('active', 0)->count();

      if ($n_non_students == 0) {
         $response = [
            'message' => "We do not have inactive students",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $i = 1;
         foreach ($non_students as $non_student) {
            $type = NULL;
            if ($non_student->is_online == 0) {
               $type = "Center";
            } else {
               $type = "Online ";
            }
            $edu_type = NULL;
            if ($non_student->edu_type == 0) {
               $edu_type = "Natoinal";
            } else {
               $edu_type = "IG";
            }

            $group = NULL;
            if ($non_student->group_id != NULL) {
               $group = $non_student->groups->name;
            }




            $city = Cities::where('id', $non_student->area)->first();

            $students[] = [
               'n' => $i++,

               'key' => $non_student->id,
               'name' => $non_student->name,
               'username' => $non_student->username,

               'parent_mobile' => $non_student->parent_mobile,
               'created_at' => date("F j, Y, g:i a", strtotime($non_student->created_at)),
               'section' => $non_student->section,
               'is_online' => $type,
               'group_id' => $group,
               'mobile' => $non_student->mobile,
               'profile_pic' => "https://api.prodigy-online.com/uploads/profile_picture/" . $non_student->profile_pic,
               'mobile' => $non_student->mobile,
               'stage' => $non_student->stage,
               'area' => $city->city_name_ar,
               'school' => $non_student->school,
               'edu_type' => $edu_type

            ];
         }
         $response = [
            'data' => $students,
            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }

   public function acceptrequest(Request $request)
   {
      $id = $request->id;
      $n_student = Student::where('id', $id)->count();
      if ($n_student == 0) {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $student = student::find($id);
         $det_student = Student::where('id', $id)->first();

         if ($student->active == 1) {
            $response = [
               'message' => "Account is already activated",
               'status' => false,

            ];
            return response($response, 200);
         } else {


            $student->update([
               'active' => 1,
               'approved_by' => auth()->user()->id,

            ]);

            $response = [
               'message' => "Student has been accepted",
               'status' => true,

            ];
            return response($response, 201);
         }
      }
   }


   public function delete(Request $request)
   {
      $id = $request->id;
      $n_student = Student::where('id', $id)->count();
      if ($n_student == 0) {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         student::find($id)->delete();
         $response = [
            'message' => "Deleted successfully",
            'status' => true,

         ];
         return response($response, 201);
      }
   }
   public function studentsbystage($stage,)
   {
      $allstudents = [];

      $students = Student::where('active', 1)->where('stage', $stage)->get();
      $n_students = Student::where('active', 1)->where('stage', $stage)->count();

      if ($n_students == 0) {
         $response = [
            'message' => "We do not have any activated students",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $i = 1;
         foreach ($students as $student) {

            $city = Cities::where('id', $student->area)->first();
            $Governorates = Governorates::where('id', $city->governorate_id)->first();

            $aprovedby = NULL;
            if ($student->approved_by != NULL) {
               $aprovedby = $student->admin->name;
            }

            $type = "Center";
            if ($student->is_online == 1) {
               $type = "Online";
            }

            $group = NULL;
            if ($student->group_id != NULL) {
               $group = $student->groups->name;
            }

            $allstudents[] = [
               'n' => $i++,
               'key' => $student->id,
               'name' => $student->name,
               'username' => $student->username,

               'mobile' => $student->mobile,
               'parent_mobile' => $student->parent_mobile,
               'created_at' => date("F j, Y, g:i a", strtotime($student->created_at)),
               'section' => $student->section,
               'profile_pic' => "https://api.prodigy-online.com/uploads/profile_picture/" . $student->profile_pic,
               'city' => $city->city_name_ar . "( " . $Governorates->governorate_name_ar . " )",
               'Governorates' => $Governorates->id,
               'school' => $student->school,
               'type' => $type,
               'group' => $group,
               'magnetic_id' => $student->magnetic_id,
               'approved_by' => $aprovedby,
               'std_id' => $student->std_id,

            ];
         }
         $response = [
            'data' => $allstudents,
            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }


   public function studentbyid($id)
   {
      $getstudent = [];

      $n_students = Student::where('active', 1)->where('id', $id)->count();

      if ($n_students == 0) {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $student = Student::where('id', $id)->first();




         $city = Cities::where('id', $student->area)->first();
         $Governorates = Governorates::where('id', $city->governorate_id)->first();



         $aprovedby = NULL;
         if ($student->approved_by != NULL) {
            $aprovedby = $student->admin->name;
         }


         $group = NULL;
         if ($student->group_id != NULL) {
            $group = $student->group_id;
         }


         $getstudent[] = [

            'key' => $student->id,
            'name' => $student->name,
            'username' => $student->username,
            'stage' => $student->stage,

            'mobile' => $student->mobile,
            'parent_mobile' => $student->parent_mobile,
            'created_at' => date("F j, Y, g:i a", strtotime($student->created_at)),
            'section' => $student->section,
            'profile_pic' => "https://api.prodigy-online.com/uploads/profile_picture/" . $student->profile_pic,
            'area' => $city->id,
            'governorate' => $Governorates->governorate_name_ar,
            'active' => $student->active,
            'is_online' => $student->is_online,
            'selected_state' => $city->governorate_id,
            'school' => $student->school,
            'group_id' => $group,
            'magnetic_id' => $student->magnetic_id,
            'approved_by' => $aprovedby,
            'amount' => $student->amount,
            'edu_type' => $student->edu_type,
            'account' => $student->account,
            'std_id' => $student->std_id,



         ];




         $response = [
            'data' => $getstudent,
            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }
   public function edit(Request $request)
   {
      $student = Student::where('id', $request->id)->first();
      if ($student) {

         try {
            //Validated
            $validateUser = Validator::make(
               $request->all(),
               [
                  'name' => 'required|string|max:255|regex:/^[A-Za-z\\s]+$/u',
                  'password' => 'required|string|min:6|confirmed',
                  'mobile' => 'required|string|min:11|unique:students,mobile,' . $student->id,
                  'parent_mobile' => 'required|string|min:11',
                  'parent_mobile2' => 'string',
                  'school' => 'string|min:3',
                  'stage' => 'required|string|max:255',
                  'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
                  'section' => 'string',
                  'magnetic_id' => 'max:255',
                  'active' => 'required|string',
                  'amount' => 'required',


               ],
               [
                  'magnetic_id.max' => 'The attendance card must not exceed 255 characters',
                  'active.max' => 'Student account status is required',

                  'mobile.unique' => 'The mobile number has already been used',
                  'mobile.min' => 'The mobile number must be at least 11 digits',
                  'password.confirmed' => 'The password does not match',

                  'name.required' => 'First name is required',
                  'password.required' => 'Password is required',
                  'mobile.required' => 'Mobile number is required',
                  'stage.required' => 'Stage is required',
                  'area.required' => 'Area is required',
                  'parent_mobile.required' => 'Parent’s mobile number is required',
                  'school.required' => 'School is required',
                  'profile_pic.required' => 'Profile picture is required',
                  'profile_pic.max' => 'Profile picture must not exceed 5 MB',
                  'profile_pic.mimes' => 'Profile picture must be in jpg or jpeg format',


               ],
               [
                  'name' => 'First Name',

                  'password' => 'Password',
                  'mobile' => 'Mobile',
                  'stage' => 'Stage',
                  'area' => 'Area',
                  'parent_mobile' => 'Parent’s Mobile',
                  'school' => 'School',
                  'section' => 'Section',
                  'profile_pic' => 'Profile Picture',
                  'active' => 'Account Status',
                  'magnetic_id' => 'Attendance Card',


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

               $validateUser = Validator::make(
                  $request->all(),
                  [
                     'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
                  ],
                  [
                     'profile_pic.required' => 'Profile picture is required',
                     'profile_pic.max' => 'Profile picture must not exceed 5 MB',
                     'profile_pic.mimes' => 'Profile picture must be a jpg or jpeg file',

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

               $newimgname = time() . '-' . rand(111, 999) . '.' .
                  $request->profile_pic->extension();
               $request->profile_pic->move(public_path('uploads/profile_picture'), $newimgname);
            }

            $student->update(
               [
                  'name' => $request->name,
                  'name' => $request->name,
                  'username' => $request->username,
                  'password' => Hash::make($request->password),
                  'stage' => $request->stage,
                  'mobile' => $request->mobile,
                  'parent_mobile' => $request->parent_mobile,
                  'group_id' => $request->group_id,
                  'school' => $request->school,
                  'area' => $request->area,
                  'profile_pic' => $newimgname,
                  'section' => $request->section,
                  'is_online' => $request->is_online,
                  'magnetic_id' => $request->magnetic_id,
                  'active' => $request->active,
                  'edu_type' => $request->edu_type,

                  'account' => $request->account,

               ]
            );


            return response()->json([
               'status' => true,
               'message' => 'Account updated successfully',
            ], 200);
         } catch (\Throwable $th) {
            return response()->json([
               'status' => 500,
               'message' => $th->getMessage()
            ], 500);
         }
      } else {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 404);
      }
   }
   public function editpassword(Request $request)
   {
      $student = Student::where('id', $request->id)->first();
      if ($student) {

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
                  'password' => ' Password ',



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
               'message' => 'Updated successfully  ',
            ], 200);
         } catch (\Throwable $th) {
            return response()->json([
               'status' => 500,
               'message' => $th->getMessage()
            ], 500);
         }
      } else {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 404);
      }
   }

   public function editpicture(Request $request)
   {
      $student = Student::where('id', $request->id)->first();
      if ($student) {

         try {
            //Validated
            $validateUser = Validator::make(
               $request->all(),
               [
                  'profile_pic' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
               ],
               [
                  'profile_pic.required' => 'Profile picture is required',
                  'profile_pic.max' => 'Profile picture must not exceed 5 MB',
                  'profile_pic.mimes' => 'The profile picture must be of type jpg or jpeg',


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
               'message' => 'Updated successfully ',
            ], 200);
         } catch (\Throwable $th) {
            return response()->json([
               'status' => 500,
               'message' => $th->getMessage()
            ], 500);
         }
      } else {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 404);
      }
   }
   public function editoinfo(Request $request)
   {

      $n_student = Student::where('id', $request->id)->count();
      if ($n_student == 1) {
         $id = $request->id;
         $student = Student::where('id', $request->id)->first();

         try {
            //Validated
            $validateUser = Validator::make(
               $request->all(),
               [
                  'magnetic_id.max' => 'Attendance card must not exceed 255 characters',
                  'active.max' => 'Student account status is required',

                  'mobile.unique' => 'Mobile number is already in use',
                  'mobile.min' => 'Mobile number must be at least 11 digits',

                  'name.required' => 'First name is required',
                  'mobile.required' => 'Mobile number is required',
                  'stage.required' => 'Stage is required',
                  'area.required' => 'Area is required',
                  'parent_mobile.required' => 'Parent mobile number is required',
                  'parent_mobile2.required' => 'Second parent mobile number is required',
                  'school.required' => 'School is required',

               ],

               [
                  'name' => 'First Name',
                  'mobile' => 'Mobile Number',
                  'stage' => 'Stage',
                  'area' => 'Area',
                  'parent_mobile' => 'Parent Mobile Number',
                  'parent_mobile2' => 'Second Parent Mobile Number',
                  'school' => 'School',
                  'section' => 'Section',
                  'active' => 'Account Status',
                  'magnetic_id' => 'Attendance Card',


               ]
            );

            if ($validateUser->fails()) {
               return response()->json([
                  'status' => false,
                  'message' => 'validation error',
                  'errors' => $validateUser->errors()
               ], 403);
            }

            $curstudent = student::find($id);

            $curstudent->update(
               [

                  'name' => $request->name,
                  'username' => $request->username,
                  'stage' => $request->stage,
                  'mobile' => $request->mobile,
                  'parent_mobile' => $request->parent_mobile,
                  'group_id' => $request->group_id,
                  'school' => $request->school,
                  'area' => $request->area,
                  'section' => $request->section,
                  'is_online' => $request->is_online,
                  'magnetic_id' => $request->magnetic_id,
                  'active' => $request->active,
                  'edu_type' => $request->edu_type,

                  'account' => $request->account,
                  'amount' => $request->amount,
                  'std_id' => $request->std_id,



               ]
            );


            return response()->json([
               'status' => true,
               'message' => 'updated successfully',
            ], 200);
         } catch (\Throwable $th) {
            return response()->json([
               'status' => 500,
               'message' => $th->getMessage()
            ], 500);
         }
      } else {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 404);
      }
   }

   public function lecturebystudent($id)
   {
      $getstudent = [];

      $n_students = Student::where('active', 1)->where('id', $id)->count();

      if ($n_students == 0) {
         $response = [
            'message' => "Student not found",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $student = Student::where('id', $id)->first();

         $lectures = Lecture::where('stage', $student->stage)->get();


         foreach ($lectures as $lecture) {
            $n_Attendance = Attendance::where('student_id', $student->id)->where('lecture_id', $lecture->id)->count();
            $n_History = History::where('student_id', $student->id)->where('lecture_id', $lecture->id)->count();
            $status_hw_center = NULL;
            if ($n_Attendance == 1) {
               $Attendance = Attendance::where('student_id', $student->id)->where('lecture_id', $lecture->id)->first();

               if ($Attendance->student_homework != NULL) {
                  if ($Attendance->student_homework == 1) {
                     $status_hw_center = "Compeleted";
                  } elseif ($student_homework = 2) {
                     $status_hw_center = "Not compeleted ";
                  } else {
                     $status_hw_center = "No";
                  }
               }
               if ($Attendance->student_quiz != NULL) {

                  $Attendancequiz = Attendancequiz::where('group_id', $Attendance->group_id)->where('lecture_id', $lecture->id)->first();
               }
               $getstudent[] = [

                  'key' => $lecture->id,
                  'lecture_name' => $lecture->title,
                  'student_quiz' => $Attendance->student_quiz,
                  'homework_student' => $status_hw_center,
                  'homework_degree' => NULL,

                  'quiz_degree' => $Attendancequiz->degree_quiz,
                  'location' => "Center",
                  'time' => date("F j, Y, g:i a", strtotime($Attendance->created_at)),
                  'is_center' => 1
               ];
            }
            ///online
            elseif ($n_History == 1) {
               $History = History::where('student_id', $student->id)->where('lecture_id', $lecture->id)->first();
               $n_quizzes = Quiz::where('lecture_id', $lecture->id)->count();
               $n_homeworks = Homework::where('lecture_id', $lecture->id)->count();
               $std_degree_quiz = null;
               $degree_quiz = null;

               $std_degree_hw = null;
               $degree_hw = null;

               if ($n_quizzes > 0) {
                  $quiz = Quiz::where('lecture_id', $lecture->id)->first();
                  $n_Studentresultquiz = Studentresult::where('student_id', $student->id)->where('quiz_id', $quiz->id)->count();

                  if ($n_Studentresultquiz > 0) {
                     $Studentresultquiz = Studentresult::where('student_id', $student->id)->where('quiz_id', $quiz->id)->first();
                     $std_degree_quiz = $Studentresultquiz->student_degree;
                     $degree_quiz = $Studentresultquiz->assignment_degree;
                  }
               }
               if ($n_homeworks > 0) {
                  $homework = Homework::where('lecture_id', $lecture->id)->first();
                  $n_Studentresulthomework = Studentresult::where('student_id', $student->id)->where('homework_id', $homework->id)->count();
                  if ($n_Studentresulthomework > 0) {
                     $Studentresulthomework = Studentresult::where('student_id', $student->id)->where('homework_id', $homework->id)->first();

                     $std_degree_hw = $Studentresulthomework->student_degree;
                     $degree_hw = $Studentresulthomework->assignment_degree;
                  }
               }



               $getstudent[] = [

                  'key' => $lecture->id,
                  'lecture_name' => $lecture->title,
                  'student_quiz' => $std_degree_quiz,
                  'homework_student' => $std_degree_hw,
                  'quiz_degree' => $degree_quiz,
                  'location' => "اون لاين",
                  'time' => date("F j, Y, g:i a", strtotime($History->created_at)),
                  'is_center' => 0,
                  'homework_degree' => $degree_hw,

               ];
            }
         }









         $response = [
            'data' => $getstudent,
            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }
}
