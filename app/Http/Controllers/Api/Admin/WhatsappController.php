<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Group;
use App\Models\Message;
use App\Models\Student;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;




class WhatsappController extends Controller
{
   public function index()
   {

      $n_group = Group::count();

      if ($n_group == 0) {
         $response = [
            'message' => "We do not have any groups",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $i = 1;
         $all_group = Group::all();
         $groups = [];

         foreach ($all_group as $group) {
            $groups[] = [
               'n' => $i++,
               'key' => $group->id,
               'name' => $group->name,
               'stage' => $group->stage,

            ];
         }
         return  response()->json([
            'groups' => $groups,
            'message' => 'success',

            'status' => '200',
         ]);
      }
   }



   public function send(Request $request)
   {
      try {
         $validateUser = Validator::make(
            $request->all(),
            [
               'message' => 'required',
               'send_to' => 'required',
               'attendance_location' => 'required',

            ],
            [

               'message.required' => 'Message is required',
               'send_to.required' => 'Please select the recipient',
               'attendance_location.required' => 'Please select the attendance location',


            ],
            [

               'message' => 'Message',
               'send_to' => 'Recipient',
               'attendance_location' => 'Attendance location',


            ]
         );




         if ($validateUser->fails()) {
            return response()->json([
               'status' => false,
               'message' => 'validation error',
               'errors' => $validateUser->errors()
            ], 403);
         }

         if ($request->attendance_location == 0) {
            if ($request->group_id == NULL || empty($request->group_id)) {

               $response = [
                  'message' => "Please select the group",
                  'status' => false,
               ];
               return response($response, 403);
            } else {
               $n_students = Student::where('group_id', $request->group_id)->where('active', 1)->where('is_online', 0)->count();
               if ($n_students == 0) {
                  $response = [
                     'message' => "There are no students in this group",
                     'status' => false,
                  ];
                  return response($response, 403);
               } else {
                  $students = Student::where('group_id', $request->group_id)->where('active', 1)->where('is_online', 0)->get();
                  foreach ($students as $student) {

                     $to = $student->mobile;
                     if ($request->send_to == 1) {
                        $to = $student->mobile;
                     } elseif ($request->send_to == 2) {
                        $to = $student->parent_mobile;
                     }

                     Message::create([
                        'message' => $request->message,
                        'student_id' => $student->id,
                        'sent_by' => auth()->user()->id,
                        'send_to' => $to
                     ]);
                  }
                  $response = [
                     'message' => "Sent successfully",
                     'status' => true,

                  ];
                  return response($response, 200);
               }
            }
         } else {
            $n_students = Student::where('active', 1)->where('is_online', 1)->count();
            if ($n_students == 0) {
               $response = [
                  'message' => "No online students available",
                  'status' => false,
               ];
            } else {
               $students = Student::where('active', 1)->where('is_online', 1)->get();
               foreach ($students as $student) {

                  $to = $student->mobile;
                  if ($request->send_to == 1) {
                     $to = $student->mobile;
                  } elseif ($request->send_to == 2) {
                     $to = $student->parent_mobile;
                  }

                  Message::create([
                     'message' => $request->message,
                     'student_id' => $student->id,
                     'sent_by' => auth()->user()->id,
                     'send_to' => $to
                  ]);
               }

               $response = [
                  'message' => "Sent successfully",
                  'status' => true,

               ];
               return response($response, 200);
            }
         }
      } catch (\Throwable $th) {
         return response()->json([
            'status' => false,
            'message' => $th->getMessage()
         ], 200);
      }
   }
}
