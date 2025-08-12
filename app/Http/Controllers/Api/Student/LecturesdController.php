<?php

namespace App\Http\Controllers\Api\Student;

use App\Models\Code;
use App\Models\Quiz;
use App\Models\Video;
use App\Models\Chapter;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Student;
use App\Models\Homework;
use App\Models\Trialexam;
use App\Models\Attachment;
use Illuminate\Http\Request;
use App\Models\Studentanswer;
use App\Models\Studentresult;
use App\Models\SetsbankQuestion;
use App\Http\Controllers\Controller;
use App\Models\QuestionbankQuestion;
use Illuminate\Support\Facades\DB;

class LecturesdController extends Controller
{
   public function alllecture($id)
   {
      $alllectures = [];
      $all_Lectures = Lecture::where('teacher_id', $id)->where('section', auth()->user()->section)->where('visibility', 1)->where('chapter_id', NULL)->where('stage', auth()->user()->stage)->get();
      $all_Chapter = Chapter::where('teacher_id', $id)->where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->get();

      $n_Lectures = Lecture::where('teacher_id', $id)->where('section', auth()->user()->section)->where('visibility', 1)->where('chapter_id', NULL)->where('stage', auth()->user()->stage)->count();
      $n_Chapter = Chapter::where('teacher_id', $id)->where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->count();

      if ($n_Chapter == 0 && $n_Lectures == 0) {
         $response = [
            'message' => "We do not have lectures or chapters",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $i = 1;
         foreach ($all_Chapter as $chapter) {


            $alllectures[] = [
               'n' => $i++,
               'key' => $chapter->id,
               'name' => $chapter->name,
               'description' => $chapter->description,
               'stage' => $chapter->stage,
               'visibility' => $chapter->visibility,
               'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $chapter->img,
               'created_by' => $chapter->teacher->name,
               'is_chapter' => 1,
               'created_at' => date("F j, Y, g:i a", strtotime($chapter->created_at)),
            ];
         }

         foreach ($all_Lectures as $lecture) {


            $alllectures[] = [
               'n' => $i++,
               'key' => $lecture->id,
               'title' => $lecture->title,
               'description' => $lecture->description,
               'is_chapter' => 0,
               'stage' => $lecture->stage,
               'visibility' => $lecture->visibility,
               'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $lecture->img,
               'created_by' => $lecture->teacher->name,
               'chapter_id' => $lecture->chapter_id,
               'price' => $lecture->price,
               'v_hw' => $lecture->v_hw,
               'v_quiz' => $lecture->v_quiz,
               'expired_at' => $lecture->expired_at,
               'created_at' => date("F j, Y, g:i a", strtotime($lecture->created_at)),


            ];
         }
         $response = [
            'data' => $alllectures,
            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }



   public function session($id)
   {
      $session = [];
      $n_lecture = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $lecture = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $id)->first();

         $lecture_details = [];
         $history = [];
         $lecture_details = [
            'key' => $lecture->id,
            'title' => $lecture->title,
            'description' => $lecture->description,
            'stage' => $lecture->stage,
            'visibility' => $lecture->visibility,
            'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $lecture->img,
            'created_by' => $lecture->teacher->name,
            'chapter_id' => $lecture->chapter_id,
            'price' => $lecture->price,
            'v_hw' => $lecture->v_hw,
            'v_quiz' => $lecture->v_quiz,
            'expired_at' => $lecture->expired_at,
            'created_at' => date("F j, Y, g:i a", strtotime($lecture->created_at)),


         ];
         $n_History = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)
            ->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         $buyingHistory = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)
            ->where('expire_at', '>=', date('Y-m-d H:i:s'))->first();

         $lecture_details = [
            'key' => $lecture->id,
            'title' => $lecture->title,
            'description' => $lecture->description,
            'stage' => $lecture->stage,
            'visibility' => $lecture->visibility,
            'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $lecture->img,
            'created_by' => $lecture->teacher->name,
            'chapter_id' => $lecture->chapter_id,
            'price' => $lecture->price,
            'v_hw' => $lecture->v_hw,
            'v_quiz' => $lecture->v_quiz,
            'expired_at' => $lecture->expired_at,
            'created_at' => date("F j, Y, g:i a", strtotime($lecture->created_at)),
            'is_buy' => $n_History,
            'amount' => auth()->user()->amount,


         ];
         if ($n_History == 1) {

            $teacher = NULL;
            if ($buyingHistory->add_to_session_assistant = !NULL) {
               $teacher = $buyingHistory->assistant->name;
            }
            $is_quiz = 0;
            $is_quiz_result = 0;

            $n_getquiz = Quiz::where('lecture_id', $id)->where('visibility', 1)->count();
            if ($n_getquiz > 0) {
               $is_quiz = 1;
               $getquiz = Quiz::where('lecture_id', $id)->first();
               $n_getreust = Studentresult::where('quiz_id', $getquiz->id)->where('student_id', auth()->user()->id)->count();
               if ($n_getreust > 0) {
                  $is_quiz_result = 1;
               }
            }


            $is_hw = 0;
            $is_hw_result = 0;

            $n_gethw = Homework::where('lecture_id', $id)->count();
            if ($n_gethw > 0 && $lecture->v_hw == 1) {
               $is_hw = 1;
               $gethw = Homework::where('lecture_id', $id)->first();
               $n_getreust = Studentresult::where('homework_id', $gethw->id)->where('student_id', auth()->user()->id)->count();
               if ($n_getreust > 0) {
                  $is_hw_result = 1;
               }
            }


            $history = [
               'key' => $buyingHistory->id,
               'lecture_id' => $buyingHistory->lecture_id,
               'price' => $buyingHistory->description,
               'buy_at' => date("F j, Y, g:i a", strtotime($buyingHistory->buy_at)),
               'code' => $buyingHistory->visibility,
               'quiz_done' => $buyingHistory->quiz_done,
               'homework_done' => $buyingHistory->homework_done,
               'views' => $buyingHistory->views,
               'v_quiz' => $lecture->v_quiz,
               'v_hw' => $lecture->v_hw,
               'add_to_session_assistant' => $teacher,
               'expire_at' => date("F j, Y, g:i a", strtotime($buyingHistory->expire_at)),
               'is_quiz' => $is_quiz,
               'is_hw' => $is_hw,
               'is_quiz_result' => $is_quiz_result,
               'is_hw_result' => $is_hw_result

            ];
         }
         $videos = [];
         $attachments = [];

         if ($n_History == 0) {
            $n_veds = Video::where('lecture_id', $id)->where('is_public', 1)->count();
            $n_attachs = Attachment::where('lecture_id', $id)->where('is_public', 1)->count();

            if ($n_veds > 0) {
               $veds = Video::where('lecture_id', $id)->get();
               foreach ($veds as $vod) {

                  $OTP = NULL;
                  $playbackInfo = NULL;
                  $vdo_id = NULL;
                  $status = 0;

                  if ($vod->platform == "vdocipher") {
                     $curl = curl_init();

                     curl_setopt_array($curl, array(
                        CURLOPT_URL => "https://dev.vdocipher.com/api/videos/" . $vod->vdo_id . "/otp",
                        CURLOPT_RETURNTRANSFER => true,
                        CURLOPT_ENCODING => "",
                        CURLOPT_MAXREDIRS => 10,
                        CURLOPT_TIMEOUT => 30,
                        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                        CURLOPT_CUSTOMREQUEST => "POST",
                        CURLOPT_POSTFIELDS => json_encode([
                           'annotate' => json_encode([[
                              'type' => 'rtext',
                              'text' => auth()->user()->name,
                              'alpha' => '0.15',
                              'color' => '0xFF0000',
                              'size' => '35',
                              'interval' => '155000'
                           ]]),
                        ]),
                        CURLOPT_HTTPHEADER => array(
                           "Accept: application/json",
                           "Authorization: Apisecret kmVzH7Ixh7mY7Y1KXDp8cdV8zTmkJV15jukk1olrN7o2aq0Z17ijZ2m2LfEUhAlS",
                           "Content-Type: application/json"

                        ),
                     ));

                     $response = curl_exec($curl);
                     $err = curl_error($curl);

                     curl_close($curl);

                     if ($err) {
                        echo "cURL Error #:" . $err;
                     } else {

                        $response_data = json_decode($response, true); // Decode JSON response

                        if (isset($response_data['message']) && $response_data['message'] === 'video not found') {
                           $status = 0;
                        } else {
                           // Video found, proceed with playback info extraction
                           $OTP = $response_data['otp'];
                           $playbackInfo = $response_data['playbackInfo'];
                           $status = 1;

                           // Continue with your code for playback info handling
                        }
                     }
                  } else {
                     $vdo_id = $vod->vdo_id;
                     $status = 1;
                  }
                  if ($status == 1) {


                     $videos[] = [
                        'key' => $vod->id,
                        'name' => $vod->name,
                        'description' => $vod->description,
                        'is_public' => $vod->is_public,
                        'vdo_id' => $vod->vdo_id,
                        'platform' => $vod->platform,
                        'OTP' => $OTP,
                        'playbackInfo' => $playbackInfo,

                     ];
                  }
               }
            }
            if ($n_attachs > 0) {
               $Attachmentslc = Attachment::where('lecture_id', $id)->get();
               foreach ($Attachmentslc as $Attachment) {
                  $attachments[] = [
                     'key' => $Attachment->id,
                     'name' => $Attachment->address,

                     'is_public' => $Attachment->is_public,
                     'address' => "https://api.prodigy-online.com/uploads/lectures/attachments/" . $Attachment->address,

                  ];
               }
            }
         } else {
            $veds = Video::where('lecture_id', $id)->get();
            $n_veds = Video::where('lecture_id', $id)->count();
            $n_attachs = Attachment::where('lecture_id', $id)->count();

            if ($n_veds > 0) {
               $veds = Video::where('lecture_id', $id)->get();
               $videos = [];

               foreach ($veds as $vod) {
                  $OTP = NULL;
                  $playbackInfo = NULL;
                  $vdo_id = NULL;
                  $status = 0;

                  if ($vod->platform == "vdocipher") {
                     $curl = curl_init();

                     curl_setopt_array($curl, array(
                        CURLOPT_URL => "https://dev.vdocipher.com/api/videos/" . $vod->vdo_id . "/otp",
                        CURLOPT_RETURNTRANSFER => true,
                        CURLOPT_ENCODING => "",
                        CURLOPT_MAXREDIRS => 10,
                        CURLOPT_TIMEOUT => 30,
                        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                        CURLOPT_CUSTOMREQUEST => "POST",
                        CURLOPT_POSTFIELDS => json_encode([
                           'annotate' => json_encode([[
                              'type' => 'rtext',
                              'text' => auth()->user()->name,
                              'alpha' => '0.15',
                              'color' => '0xFF0000',
                              'size' => '35',
                              'interval' => '155000'
                           ]]),
                        ]),
                        CURLOPT_HTTPHEADER => array(
                           "Accept: application/json",
                           "Authorization: Apisecret kmVzH7Ixh7mY7Y1KXDp8cdV8zTmkJV15jukk1olrN7o2aq0Z17ijZ2m2LfEUhAlS",
                           "Content-Type: application/json"

                        ),
                     ));

                     $response = curl_exec($curl);
                     $err = curl_error($curl);

                     curl_close($curl);

                     if ($err) {
                        echo "cURL Error #:" . $err;
                     } else {


                        $response_data = json_decode($response, true); // Decode JSON response

                        if (isset($response_data['message']) && $response_data['message'] === 'video not found') {
                           $status = 0;
                        } else {
                           // Video found, proceed with playback info extraction
                           $OTP = $response_data['otp'];
                           $playbackInfo = $response_data['playbackInfo'];
                           $status = 1;

                           // Continue with your code for playback info handling
                        }
                     }
                  } else {
                     $vdo_id = $vod->vdo_id;
                     $status = 1;
                  }
                  if ($status == 1) {
                     $vdo_id = $vod->vdo_id;
                     if ($buyingHistory->views == 0) {
                        $vdo_id = NULL;
                     }
                     $videos[] = [
                        'key' => $vod->id,
                        'name' => $vod->name,
                        'description' => $vod->description,
                        'is_public' => $vod->is_public,
                        'vdo_id' => $vdo_id,
                        'platform' => $vod->platform,
                        'OTP' => $OTP,
                        'playbackInfo' => $playbackInfo,
                     ];
                  }
               }
            }
            if ($n_attachs > 0) {
               $Attachmentslc = Attachment::where('lecture_id', $id)->get();
               foreach ($Attachmentslc as $Attachment) {
                  $attachments[] = [
                     'key' => $Attachment->id,
                     'is_public' => $Attachment->is_public,
                     'name' => $Attachment->address,

                     'address' => "https://api.prodigy-online.com/uploads/lectures/attachments/" . $Attachment->address,

                  ];
               }
            }
         }


         $session = [
            'session_info' => $lecture_details,
            'session_history' => $history,
            'videos' => $videos,
            'attachments' => $attachments,

         ];


         $response = [
            'data' => $session,

            'message' => "success",
            'status' => true,

         ];
         return response($response, 201);
      }
   }

   public function buy(Request $request)
   {
      $n_lecture = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,

         ];
         return response($response, 200);
      } else {

         $exams = Trialexam::where('visibility', 1)->where('stage', auth()->user()->stage)->where('nextlecture', $request->id)->get();
         $n_res = 0;
         foreach ($exams as $exam) {

            $n_Studentresult = Studentresult::where('exam_id', $exam->id)->where('student_id', auth()->user()->id)->count();
            if ($n_Studentresult == 0) {
               $n_res++;
            }
         }
         if ($n_res > 0) {
            $response = [
               'message' => "you can't buy please complete exam",
               'status' => false,

            ];
            return response($response, 200);
         }
         $n_code = Code::where('code', $request->code)->count();
         $lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->id)->first();

         if ($n_code > 0) {
            $code = Code::where('code', $request->code)->sharedLock()->first();
            $n_buyingHistory = History::where('lecture_id', $request->id)->where('student_id', auth()->user()->id)
               ->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
            if ($n_buyingHistory > 0) {
               $response = [
                  'message' => "The lecture already exists",
                  'status' => false,

               ];
               return response($response, 200);
            } else {
               if ($code->price == $lecture->price) {
                  DB::beginTransaction();
                  try {
                     $ex = date("Y-m-d H:i:s", strtotime('+' . $lecture->expired_at . 'days'));

                     $History = History::create(
                        [
                           'lecture_id' => $request->id,
                           'price' => $lecture->price,
                           'buy_at' => date('Y-m-d H:i:s'),
                           'student_id' => auth()->user()->id,
                           'code_id' => $code->id,
                           'expire_at' => $ex,
                           'views' => $lecture->views,
                        ]
                     );
                     Code::find($code->id)->delete();
                     DB::commit();
                  } catch (\Exception $ex) {
                     DB::rollback();
                     return response()->json(['error' => $ex->getMessage()], 500);
                  }

                  $response = [
                     'message' => "The lecture has been activated successfully",
                     'status' => true,

                  ];
                  return response($response, 200);
               } else {
                  $response = [
                     'message' => "You cannot use the code for this lecture",
                     'status' => false,

                  ];
                  return response($response, 200);
               }
            }
         } else {
            $response = [
               'message' => "The code is incorrect",
               'status' => false,

            ];
            return response($response, 200);
         }
      }
   }


   public function getlecturebychapter($id)
   {
      $alllectures = [];
      $n_Chapter = Chapter::where('id', $id)->count();

      if ($n_Chapter == 0) {
         $response = [
            'message' => "The chapter does not exist",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $n_Lectures = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('chapter_id', $id)->count();
         if ($n_Lectures == 0) {
            $response = [
               'message' => "There are no lectures",
               'status' => false,

            ];
            return response($response, 200);
         } else {
            $i = 1;

            $all_Lectures = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('chapter_id', $id)->get();

            foreach ($all_Lectures as $lecture) {


               $alllectures[] = [
                  'n' => $i++,
                  'key' => $lecture->id,
                  'title' => $lecture->title,
                  'description' => $lecture->description,
                  'is_chapter' => 0,
                  'stage' => $lecture->stage,
                  'visibility' => $lecture->visibility,
                  'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $lecture->img,
                  'created_by' => $lecture->teacher->name,
                  'chapter_id' => $lecture->chapter_id,
                  'price' => $lecture->price,
                  'v_hw' => $lecture->v_hw,
                  'v_quiz' => $lecture->v_quiz,
                  'expired_at' => $lecture->expired_at,
                  'created_at' => date("F j, Y, g:i a", strtotime($lecture->created_at)),


               ];
            }
            $response = [
               'data' => $alllectures,
               'message' => "success",
               'status' => true,

            ];
            return response($response, 201);
         }
      }
   }


   public function getquizquestion($id)
   {
      $n_lecture = Lecture::where('section', auth()->user()->section)->where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {

         $n_buying = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $Lecture = Lecture::where('id', $id)->first();
            $n_quiz = Quiz::where('lecture_id', $id)->where('visibility', 1)->count();

            if ($n_quiz === 0) {
               $response = [
                  'message' => "There is no exam for this lecture",
                  'status' => false,
               ];
               return response($response, 200);
            }
            $buying = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->first();

            if ($buying->quiz_done == 1) {
               $response = [
                  'message' => "You have already taken the exam",
                  'status' => false,
               ];
               return response($response, 200);
            } else {


               $n_quiz = Quiz::where('lecture_id', $id)->where('visibility', 1)->count();
               if ($n_quiz == 0) {
                  $response = [
                     'message' => "No exam available",
                     'status' => false,
                  ];
                  return response($response, 200);
               } else {
                  $quiz = Quiz::where('lecture_id', $id)->first();

                  $n_result = Studentresult::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->count();

                  if ($n_result == 0) {
                     $quiz = Quiz::where('lecture_id', $id)->first();
                     $questions = [];
                     $setscount = SetsbankQuestion::where('lecture_id', $id)->where('quiz_id', $quiz->id)->count();
                     if ($setscount > 0) {
                        $allsetsquestionbank = SetsbankQuestion::where('lecture_id', $id)->where('quiz_id', $quiz->id)->get();
                        foreach ($allsetsquestionbank as $allsetquestionbank) {

                           if ($allsetquestionbank->easy != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "easy")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->easy)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }



                           if ($allsetquestionbank->medium != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "medium")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->medium)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }
                           if ($allsetquestionbank->hard != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "hard")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->medium)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }
                        }
                     }

                     $n_allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('quiz_id', $quiz->id)->count();
                     if ($n_allnoncategroeyQuestionbankQuestions > 0) {
                        $allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('quiz_id', $quiz->id)->get();
                        foreach ($allnoncategroeyQuestionbankQuestions as $allnoncategroeyQuestionbankQuestion) {
                           $questions[] = [
                              'id' => $allnoncategroeyQuestionbankQuestion->id,
                              'question' => $allnoncategroeyQuestionbankQuestion->question,
                              'answer1' => $allnoncategroeyQuestionbankQuestion->answer1,
                              'answer2' => $allnoncategroeyQuestionbankQuestion->answer2,
                              'answer3' => $allnoncategroeyQuestionbankQuestion->answer3,
                              'answer4' => $allnoncategroeyQuestionbankQuestion->answer4,
                              'is_essay' => $allnoncategroeyQuestionbankQuestion->is_essay,
                              'degree' => $allnoncategroeyQuestionbankQuestion->degree,


                           ];
                        }
                     }
                     $choosequestions = [];
                     $essayquestions = [];

                     $n = 1;
                     foreach ($questions as $question) {
                        if ($question['is_essay'] == 0) {
                           $is_selected = 0;

                           $n_stdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->count();
                           $ans = NULL;
                           if ($n_stdanswer == 1) {
                              $is_selected = 1;
                              $stdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->first();
                              if ($stdanswer->student_answer == "answer1") {
                                 $ans = "A";
                              } elseif ($stdanswer->student_answer == "answer2") {
                                 $ans = "B";
                              } elseif ($stdanswer->student_answer == "answer3") {
                                 $ans = "C";
                              } elseif ($stdanswer->student_answer == "answer4") {
                                 $ans = "D";
                              }
                           }
                           $choosequestions[] = [
                              'n' => $n++,
                              'id' => $question['id'],
                              'question' => $question['question'],
                              'answers' => [
                                 [
                                    'answer' => $question['answer1'],
                                    'order' => "A"
                                 ],
                                 [
                                    'answer' => $question['answer2'],
                                    'order' => "B"
                                 ],
                                 [
                                    'answer' => $question['answer3'],
                                    'order' => "C"
                                 ],
                                 [
                                    'answer' => $question['answer4'],
                                    'order' => "D"
                                 ],
                              ],
                              'is_selected' => $is_selected,
                              'selected_answer' => $ans,
                              'degree' => $question['degree'],


                           ];
                        } else {
                           $n_essayanswer = Studentanswer::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->count();
                           $stdessayans = NULL;
                           $stdessaydraft = NULL;

                           if ($n_essayanswer > 0) {
                              $essayanswer = Studentanswer::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->first();


                              $stdessayans = $essayanswer->student_answer;
                              $stdessaydraft = "https://api.prodigy-online.com/uploads/drafts/" . $essayanswer->draft;
                           }
                           $essayquestions[] = [
                              'id' => $question['id'],
                              'question' => $question['question'],
                              'degree' => $question['degree'],
                              'answer' => $stdessayans,
                              'draft' => $stdessaydraft,


                           ];
                        }
                     }
                     $Lecture = Lecture::where('id', $id)->first();


                     $quiz_details = [
                        'id' => $quiz->id,
                        'title' => $Lecture->title,
                        'duration' => $quiz->duration,


                     ];
                     $response = [
                        'essayquestions' => $essayquestions,
                        'quiz' => $quiz_details,
                        'choosequestions' => $choosequestions,
                        'message' => "success",
                        'status' => true,

                     ];
                     return response($response, 201);
                  } else {
                     $response = [
                        'message' => "You have already taken the exam",
                        'status' => false,

                     ];
                     return response($response, 403);
                  }
               }
            }
         }
      }
   }

   public function postanswerquiz(Request $request)
   {
      if ($request->lecture_id == NULL) {
         $response = [
            'message' => "lecture id required",
            'status' => false,
         ];
         return response($response, 403);
      }
      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->lecture_id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {

         $n_buying = History::where('lecture_id', $request->lecture_id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         }
         $n_quiz = Quiz::where('lecture_id', $request->lecture_id)->count();
         if ($n_quiz == 0) {
            $response = [
               'message' => "There is no exam for this lecture",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $quiz = Quiz::where('lecture_id', $request->lecture_id)->first();
            $n_Studentresult = Studentresult::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->count();
            if ($n_Studentresult == 0) {
               if ($request->id == NULL) {
                  $response = [
                     'message' => "id required",
                     'status' => false,
                  ];
                  return response($response, 403);
               }

               $n_stdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $request->id)->where('student_id', auth()->user()->id)->count();
               if ($n_stdanswer == 0) {
                  $ans = null;
                  if ($request->order == "A") {
                     $ans = "answer1";
                  } elseif ($request->order == "B") {
                     $ans = "answer2";
                  } elseif ($request->order == "C") {
                     $ans = "answer3";
                  } elseif ($request->order == "D") {
                     $ans = "answer4";
                  } else {
                     $ans = $request->order;
                  }
                  $newimgname = NULL;
                  if (!empty($request->file)) {
                     $newimgname = time() . '-' . rand(111, 999) . '.' .
                        $request->file->extension();
                     $request->file->move(public_path('uploads/drafts'), $newimgname);
                  }
                  $Studentanswer = Studentanswer::create(
                     [
                        'q_id' => $request->id,
                        'student_answer' => $ans,
                        'student_id' => auth()->user()->id,
                        'quiz_id' => $quiz->id,
                        'n' => $request->n,
                        'draft' => $newimgname



                     ]
                  );

                  $response = [
                     'message' => "The answer has been added successfully",
                     'status' => true,
                  ];
                  return response($response, 200);
               } else {
                  $currstdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $request->id)->where('student_id', auth()->user()->id)->first();
                  $ans = null;
                  if ($request->order == "A") {
                     $ans = "answer1";
                  } elseif ($request->order == "B") {
                     $ans = "answer2";
                  } elseif ($request->order == "C") {
                     $ans = "answer3";
                  } elseif ($request->order == "D") {
                     $ans = "answer4";
                  } else {
                     $ans = $request->order;
                  }
                  $stdanswer = Studentanswer::find($currstdanswer->id);
                  $newimgname = $stdanswer->draft;
                  if (!empty($request->file)) {
                     $newimgname = time() . '-' . rand(111, 999) . '.' .
                        $request->file->extension();
                     $request->file->move(public_path('uploads/drafts'), $newimgname);
                  }
                  $stdanswer->update([
                     'student_answer' => $ans,

                  ]);
                  $response = [
                     'message' => "The answer has been updated successfully",
                     'status' => true,
                  ];
                  return response($response, 200);
               }
            } else {
               $response = [
                  'message' => "You cannot edit the answer",
                  'status' => false,
               ];
               return response($response, 403);
            }
         }
      }
   }


   public function gethomeworkquestion($id)
   {
      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {

         $n_buying = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $Lecture = Lecture::where('id', $id)->first();
            if ($Lecture->v_quiz == 0) {
               $response = [
                  'message' => "There is no homework for this lecture",
                  'status' => false,
               ];
               return response($response, 200);
            }
            $buying = History::where('lecture_id', $id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->first();

            if ($buying->quiz_done == 1) {
               $response = [
                  'message' => "You have already submitted the homework",
                  'status' => false,
               ];
               return response($response, 200);
            } else {


               $n_homework = Homework::where('lecture_id', $id)->count();
               if ($n_homework == 0) {
                  $response = [
                     'message' => "No homework available",
                     'status' => false,
                  ];
                  return response($response, 200);
               } else {
                  $homework = Homework::where('lecture_id', $id)->first();

                  $n_result = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->count();

                  if ($n_result == 0) {
                     $homework = Homework::where('lecture_id', $id)->first();
                     $questions = [];
                     $setscount = SetsbankQuestion::where('lecture_id', $id)->where('homework_id', $homework->id)->count();
                     if ($setscount > 0) {
                        $allsetsquestionbank = SetsbankQuestion::where('lecture_id', $id)->where('homework_id', $homework->id)->get();
                        foreach ($allsetsquestionbank as $allsetquestionbank) {

                           if ($allsetquestionbank->easy != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "easy")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->easy)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }



                           if ($allsetquestionbank->medium != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "medium")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->medium)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }
                           if ($allsetquestionbank->hard != 0) {
                              $QuestionbankQuestions = QuestionbankQuestion::where('difficulty', "hard")->where('category_id', $allsetquestionbank->category_id)->inRandomOrder()->limit($allsetquestionbank->medium)->get();
                              foreach ($QuestionbankQuestions as $QuestionbankQuestion) {
                                 $questions[] = [
                                    'id' => $QuestionbankQuestion->id,
                                    'question' => $QuestionbankQuestion->question,
                                    'answer1' => $QuestionbankQuestion->answer1,
                                    'answer2' => $QuestionbankQuestion->answer2,
                                    'answer3' => $QuestionbankQuestion->answer3,
                                    'answer4' => $QuestionbankQuestion->answer4,
                                    'is_essay' => $QuestionbankQuestion->is_essay,
                                    'degree' => $QuestionbankQuestion->degree,


                                 ];
                              }
                           }
                        }
                     }

                     $n_allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('homework_id', $homework->id)->count();
                     if ($n_allnoncategroeyQuestionbankQuestions > 0) {
                        $allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('homework_id', $homework->id)->get();
                        foreach ($allnoncategroeyQuestionbankQuestions as $allnoncategroeyQuestionbankQuestion) {
                           $questions[] = [
                              'id' => $allnoncategroeyQuestionbankQuestion->id,
                              'question' => $allnoncategroeyQuestionbankQuestion->question,
                              'answer1' => $allnoncategroeyQuestionbankQuestion->answer1,
                              'answer2' => $allnoncategroeyQuestionbankQuestion->answer2,
                              'answer3' => $allnoncategroeyQuestionbankQuestion->answer3,
                              'answer4' => $allnoncategroeyQuestionbankQuestion->answer4,
                              'is_essay' => $allnoncategroeyQuestionbankQuestion->is_essay,
                              'degree' => $allnoncategroeyQuestionbankQuestion->degree,


                           ];
                        }
                     }
                     $choosequestions = [];
                     $essayquestions = [];

                     $n = 1;
                     foreach ($questions as $question) {
                        if ($question['is_essay'] == 0) {
                           $is_selected = 0;

                           $n_stdanswer = Studentanswer::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->count();
                           $ans = NULL;
                           if ($n_stdanswer == 1) {
                              $is_selected = 1;
                              $stdanswer = Studentanswer::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->where('q_id', $question['id'])->first();
                              if ($stdanswer->student_answer == "answer1") {
                                 $ans = "A";
                              } elseif ($stdanswer->student_answer == "answer2") {
                                 $ans = "A";
                              } elseif ($stdanswer->student_answer == "answer3") {
                                 $ans = "A";
                              } elseif ($stdanswer->student_answer == "answer4") {
                                 $ans = "D";
                              }
                           }
                           $choosequestions[] = [
                              'n' => $n++,
                              'id' => $question['id'],
                              'question' => $question['question'],
                              'answers' => [
                                 [
                                    'answer' => $question['answer1'],
                                    'order' => "A"
                                 ],
                                 [
                                    'answer' => $question['answer2'],
                                    'order' => "B"
                                 ],
                                 [
                                    'answer' => $question['answer3'],
                                    'order' => "C"
                                 ],
                                 [
                                    'answer' => $question['answer4'],
                                    'order' => "D"
                                 ],
                              ],
                              'is_selected' => $is_selected,
                              'selected_answer' => $ans,
                              'degree' => $question['degree'],


                           ];
                        } else {
                           $essayquestions[] = [
                              'id' => $question['id'],
                              'question' => $question['question'],
                              'degree' => $question['degree'],


                           ];
                        }
                     }
                     $Lecture = Lecture::where('id', $id)->first();


                     $quiz_details = [
                        'id' => $homework->id,
                        'title' => $Lecture->title,
                        'duration' => NULL,


                     ];
                     $response = [
                        'essayquestions' => $essayquestions,
                        'quiz' => $quiz_details,
                        'choosequestions' => $choosequestions,
                        'message' => "success",
                        'status' => true,

                     ];
                     return response($response, 201);
                  } else {
                     $response = [
                        'message' => "You have already taken the exam",
                        'status' => false,

                     ];
                     return response($response, 403);
                  }
               }
            }
         }
      }
   }

   public function postanswerhomework(Request $request)
   {
      if ($request->lecture_id == NULL) {
         $response = [
            'message' => "lecture id required",
            'status' => false,
         ];
         return response($response, 403);
      }
      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->lecture_id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {

         $n_buying = History::where('lecture_id', $request->lecture_id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         }
         $n_homework = Homework::where('lecture_id', $request->lecture_id)->count();
         if ($n_homework == 0) {
            $response = [
               'message' => "There is no homework for this lecture",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $homework = Homework::where('lecture_id', $request->lecture_id)->first();
            $n_Studentresult = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->count();
            if ($n_Studentresult == 0) {
               if ($request->id == NULL) {
                  $response = [
                     'message' => "id required",
                     'status' => false,
                  ];
                  return response($response, 403);
               }
               if ($request->order == NULL) {
                  $response = [
                     'message' => "order required",
                     'status' => false,
                  ];
                  return response($response, 403);
               }
               $n_stdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $request->id)->where('student_id', auth()->user()->id)->count();
               if ($n_stdanswer == 0) {
                  $ans = null;
                  if ($request->order == "A") {
                     $ans = "answer1";
                  } elseif ($request->order == "B") {
                     $ans = "answer2";
                  } elseif ($request->order == "C") {
                     $ans = "answer3";
                  } elseif ($request->order == "D") {
                     $ans = "answer4";
                  }
                  $Studentanswer = Studentanswer::create(
                     [
                        'q_id' => $request->id,
                        'student_answer' => $ans,
                        'student_id' => auth()->user()->id,
                        'homework_id' => $homework->id,
                        'n' => $request->n,



                     ]
                  );
                  $response = [
                     'message' => "Answer added successfully",
                     'status' => true,
                  ];
                  return response($response, 200);
               } else {
                  $currstdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $request->id)->where('student_id', auth()->user()->id)->first();
                  $ans = null;
                  if ($request->order == "A") {
                     $ans = "answer1";
                  } elseif ($request->order == "B") {
                     $ans = "answer2";
                  } elseif ($request->order == "C") {
                     $ans = "answer3";
                  } elseif ($request->order == "D") {
                     $ans = "answer4";
                  }
                  $stdanswer = Studentanswer::find($currstdanswer->id);

                  $stdanswer->update([
                     'student_answer' => $ans,

                  ]);
                  $response = [
                     'message' => "Answer updated successfully",
                     'status' => true,
                  ];
                  return response($response, 200);
               }
            } else {
               $response = [
                  'message' => "You cannot edit the answer",
                  'status' => false,
               ];
               return response($response, 403);
            }
         }
      }
   }
   public function submitquiz(Request $request)
   {
      if ($request->lecture_id == NULL) {
         $response = [
            'message' => "Lecutre id required",
            'status' => false,
         ];
         return response($response, 403);
      }


      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->lecture_id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {
         $n_buying = History::where('lecture_id', $request->lecture_id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         }


         $n_quiz = QUiz::where('lecture_id', $request->lecture_id)->count();
         if ($n_quiz == 0) {
            $response = [
               'message' => "No exam available",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $quiz = Quiz::where('lecture_id', $request->lecture_id)->first();
            $n_Studentresult = Studentresult::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->count();

            if ($n_Studentresult == 0) {
               $correct_dgree = 0;
               $totalDegree = 0;

               $nfail = 0;


               foreach ($request->answers as $answer) {
                  $question = QuestionbankQuestion::where('id', $answer['id'])->first();
                  $totalDegree = $totalDegree + $question->degree;
                  $ans = null;
                  if ($answer['order'] == "A") {
                     $ans = "answer1";
                  } elseif ($answer['order'] == "B") {
                     $ans = "answer2";
                  } elseif ($answer['order'] == "C") {
                     $ans = "answer3";
                  } elseif ($answer['order'] == "D") {
                     $ans = "answer4";
                  }
                  if ($ans == $question->correct_answer) {
                     $correct_dgree = $correct_dgree + $question->degree;
                  }
               }


               $per = 0;
               $per = round($correct_dgree / $totalDegree * 100, 2);

               if ($per >= $quiz->success_rate) {
                  foreach ($request->answers as $answer) {

                     $n_stdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->count();
                     if ($n_stdanswer == 1) {
                        $currstdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->first();
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        $stdanswer = Studentanswer::find($currstdanswer->id);

                        $stdanswer->update([
                           'student_answer' => $ans,

                        ]);
                     } else {
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        $Studentanswer = Studentanswer::create(
                           [
                              'q_id' => $answer['id'],
                              'student_answer' => $ans,
                              'student_id' => auth()->user()->id,
                              'quiz_id' => $quiz->id,
                              'n' => $answer['n'],
                           ]
                        );
                     }
                  }



                  Studentresult::create(
                     [
                        'assignment_degree' => $totalDegree,
                        'student_degree' => $correct_dgree,
                        'student_id' => auth()->user()->id,
                        'quiz_id' => $quiz->id,

                     ]

                  );
               } else {
                  foreach ($request->answers as $answer) {
                     $currentquestion = QuestionbankQuestion::where('id', $answer['id'])->first();
                     ///////////////////////المشكلة هنا
                     $std_ans = null;
                     if ($answer['order'] == "A") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "B") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "C") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "D") {
                        $std_ans = "D";
                     }

                     $correct_ans = null;
                     if ($currentquestion->correct_answer == "answer1") {
                        $correct_ans = "A";
                     } elseif ($currentquestion->correct_answer == "answer2") {
                        $correct_ans = "B";
                     } elseif ($currentquestion->correct_answer == "answer3") {
                        $correct_ans = "C";
                     } elseif ($currentquestion->correct_answer == "answer4") {
                        $correct_ans = "D";
                     }
                     $is_correct = 0;
                     $count_correctfail = 0;
                     if ($correct_ans == $std_ans) {
                        $is_correct = 1;
                        $count_correctfail = $count_correctfail + 1;
                     }

                     $questionsansfail[] = [
                        'id' => $answer['id'],
                        'n' => $nfail,
                        'question' => $currentquestion->question,
                        'answers' => [
                           [
                              'answer' => $currentquestion->answer1,
                              'order' => "A"
                           ],
                           [
                              'answer' => $currentquestion->answer2,
                              'order' => "B"
                           ],
                           [
                              'answer' => $currentquestion->answer3,
                              'order' => "C"
                           ],
                           [
                              'answer' => $currentquestion->answer4,
                              'order' => "D"
                           ],
                        ],
                        'degree' => $currentquestion->degree,
                        'student_answer' => $std_ans,
                        'is_correct' => $is_correct,

                     ];

                     $n_stdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->count();
                     if ($n_stdanswer == 1) {
                        $currstdanswer = Studentanswer::where('quiz_id', $quiz->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->first();
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        Studentanswer::find($currstdanswer->id)->delete();
                     }
                     $nfail++;
                  }
               }


               $answers = Studentanswer::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->get();

               $questionsans = [];
               $n = 0;
               $count_correct = 0;

               foreach ($answers as $answer) {
                  $ans1 = null;

                  $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();

                  $std_ans = null;
                  if ($answer->student_answer == "answer1") {
                     $std_ans = "A";
                  } elseif ($answer->student_answer == "answer2") {
                     $std_ans = "B";
                  } elseif ($answer->student_answer == "answer3") {
                     $std_ans = "C";
                  } elseif ($answer->student_answer == "answer4") {
                     $std_ans = "D";
                  }

                  $correct_ans = null;
                  if ($currentquestion->correct_answer == "answer1") {
                     $correct_ans = "A";
                  } elseif ($currentquestion->correct_answer == "answer2") {
                     $correct_ans = "B";
                  } elseif ($currentquestion->correct_answer == "answer3") {
                     $correct_ans = "C";
                  } elseif ($currentquestion->correct_answer == "answer4") {
                     $correct_ans = "D";
                  }
                  $is_correct = 0;
                  if ($correct_ans == $std_ans) {
                     $is_correct = 1;
                     $count_correct = $count_correct + 1;
                  }

                  $questionsans[] = [
                     'id' => $answer->q_id,
                     'n' => $answer->n,
                     'question' => $answer->question->question,
                     'answers' => [
                        [
                           'answer' => $answer->question->answer1,
                           'order' => "A"
                        ],
                        [
                           'answer' => $answer->question->answer2,
                           'order' => "B"
                        ],
                        [
                           'answer' => $answer->question->answer3,
                           'order' => "C"
                        ],
                        [
                           'answer' => $answer->question->answer4,
                           'order' => "D"
                        ],
                     ],
                     'correct_answer' => $correct_ans,
                     'degree' => $currentquestion->degree,
                     'student_answer' => $std_ans,
                     'is_correct' => $is_correct,

                  ];


                  $n++;
               }
               if ($per >= $quiz->success_rate) {
                  $Studentresult = Studentresult::where('quiz_id', $quiz->id)->where('student_id', auth()->user()->id)->first();

                  $count_wrong = $n - $count_correct;
                  $data = [
                     'questions' => $questionsans,
                     'student_degree' => $Studentresult->student_degree,
                     'degree' => $Studentresult->assignment_degree,
                     'percentage' => $per,
                     'count_wrong' => $count_wrong,
                     'count_correct' => $count_correct,
                     'number_questions' => $n,
                     'is_faild' => 0,
                     'lecture_id' => $request->lecture_id


                  ];
                  $response = [
                     'data' => $data,
                     'message' => "Congratulations ",

                     'status' => false,
                  ];
                  return response($response, 200);
               } else {
                  // echo $nfail;
                  //echo $count_correctfail;
                  $count_wrongfail = $nfail - $count_correctfail;
                  $data = [
                     'questions' => $questionsansfail,
                     'student_degree' => $correct_dgree,
                     'degree' => $totalDegree,
                     'percentage' => $per,
                     'number_questions' => $n++,
                     'count_wrong' => $count_wrongfail,
                     'count_correct' => $count_correctfail,
                     'is_faild' => 1,
                     'lecture_id' => $request->lecture_id

                  ];

                  $response = [
                     'data' => $data,

                     'status' => true,
                  ];
                  return response($response, 200);
               }
            } else {
               $response = [
                  'message' => "You have already taken the exam",
                  'status' => false,
               ];
               return response($response, 403);
            }
         }
      }
   }








   public function submithomework(Request $request)
   {
      if ($request->lecture_id == NULL) {
         $response = [
            'message' => "Lecutre id required",
            'status' => false,
         ];
         return response($response, 403);
      }


      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->lecture_id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {
         $n_buying = History::where('lecture_id', $request->lecture_id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         }


         $n_homework = Homework::where('lecture_id', $request->lecture_id)->count();
         if ($n_homework == 0) {
            $response = [
               'message' => "There is no homework",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $homework = Homework::where('lecture_id', $request->lecture_id)->first();
            $n_Studentresult = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->count();

            if ($n_Studentresult == 0) {
               $correct_dgree = 0;
               $totalDegree = 0;

               $nfail = 0;

               foreach ($request->answers as $answer) {
                  $question = QuestionbankQuestion::where('id', $answer['id'])->first();
                  $totalDegree = $totalDegree + $question->degree;
                  $ans = null;
                  if ($answer['order'] == "A") {
                     $ans = "answer1";
                  } elseif ($answer['order'] == "B") {
                     $ans = "answer2";
                  } elseif ($answer['order'] == "C") {
                     $ans = "answer3";
                  } elseif ($answer['order'] == "D") {
                     $ans = "answer4";
                  }
                  if ($ans == $question->correct_answer) {
                     $correct_dgree = $correct_dgree + $question->degree;
                  }
               }


               $per = 0;
               $per = round($correct_dgree / $totalDegree * 100, 2);

               if ($per >= $homework->success_rate) {
                  foreach ($request->answers as $answer) {

                     $n_stdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->count();
                     if ($n_stdanswer == 1) {
                        $currstdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->first();
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        $stdanswer = Studentanswer::find($currstdanswer->id);

                        $stdanswer->update([
                           'student_answer' => $ans,

                        ]);
                     } else {
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        $Studentanswer = Studentanswer::create(
                           [
                              'q_id' => $answer['id'],
                              'student_answer' => $ans,
                              'student_id' => auth()->user()->id,
                              'homework_id' => $homework->id,
                              'n' => $answer['n'],
                           ]
                        );
                     }
                  }



                  Studentresult::create(
                     [
                        'assignment_degree' => $totalDegree,
                        'student_degree' => $correct_dgree,
                        'student_id' => auth()->user()->id,
                        'homework_id' => $homework->id,

                     ]

                  );
               } else {
                  foreach ($request->answers as $answer) {
                     $currentquestion = QuestionbankQuestion::where('id', $answer['id'])->first();

                     $std_ans = null;
                     if ($answer['order'] == "A") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "B") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "C") {
                        $std_ans = "A";
                     } elseif ($answer['order'] == "D") {
                        $std_ans = "D";
                     }

                     $correct_ans = null;
                     if ($currentquestion->correct_answer == "A") {
                        $correct_ans = "A";
                     } elseif ($currentquestion->correct_answer == "A") {
                        $correct_ans = "A";
                     } elseif ($currentquestion->correct_answer == "A") {
                        $correct_ans = "A";
                     } elseif ($currentquestion->correct_answer == "D") {
                        $correct_ans = "D";
                     }
                     $is_correct = 0;
                     $count_correctfail = 0;
                     if ($correct_ans == $std_ans) {
                        $is_correct = 1;
                        $count_correctfail = $count_correctfail + 1;
                     }

                     $questionsansfail[] = [
                        'id' => $answer['id'],
                        'n' => $nfail,
                        'question' => $currentquestion->question,
                        'answers' => [
                           [
                              'answer' => $currentquestion->answer1,
                              'order' => "A"
                           ],
                           [
                              'answer' => $currentquestion->answer2,
                              'order' => "B"
                           ],
                           [
                              'answer' => $currentquestion->answer3,
                              'order' => "C"
                           ],
                           [
                              'answer' => $currentquestion->answer4,
                              'order' => "D"
                           ],
                        ],
                        'degree' => $currentquestion->degree,
                        'student_answer' => $std_ans,
                        'is_correct' => $is_correct,

                     ];

                     $n_stdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->count();
                     if ($n_stdanswer == 1) {
                        $currstdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->first();
                        $ans = null;
                        if ($answer['order'] == "A") {
                           $ans = "answer1";
                        } elseif ($answer['order'] == "B") {
                           $ans = "answer2";
                        } elseif ($answer['order'] == "C") {
                           $ans = "answer3";
                        } elseif ($answer['order'] == "D") {
                           $ans = "answer4";
                        }
                        Studentanswer::find($currstdanswer->id)->delete();
                     }
                     $nfail++;
                  }
               }


               $answers = Studentanswer::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->get();

               $questionsans = [];
               $n = 0;
               $count_correct = 0;

               foreach ($answers as $answer) {
                  $ans1 = null;

                  $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();

                  $std_ans = null;
                  if ($answer->student_answer == "answer1") {
                     $std_ans = "A";
                  } elseif ($answer->student_answer == "answer2") {
                     $std_ans = "B";
                  } elseif ($answer->student_answer == "answer3") {
                     $std_ans = "C";
                  } elseif ($answer->student_answer == "answer4") {
                     $std_ans = "D";
                  }

                  $correct_ans = null;
                  if ($currentquestion->correct_answer == "answer1") {
                     $correct_ans = "A";
                  } elseif ($currentquestion->correct_answer == "answer2") {
                     $correct_ans = "B";
                  } elseif ($currentquestion->correct_answer == "answer3") {
                     $correct_ans = "C";
                  } elseif ($currentquestion->correct_answer == "answer4") {
                     $correct_ans = "D";
                  }
                  $is_correct = 0;
                  if ($correct_ans == $std_ans) {
                     $is_correct = 1;
                     $count_correct = $count_correct + 1;
                  }

                  $questionsans[] = [
                     'id' => $answer->q_id,
                     'n' => $answer->n,
                     'question' => $answer->question->question,
                     'answers' => [
                        [
                           'answer' => $answer->question->answer1,
                           'order' => "A"
                        ],
                        [
                           'answer' => $answer->question->answer2,
                           'order' => "B"
                        ],
                        [
                           'answer' => $answer->question->answer3,
                           'order' => "C"
                        ],
                        [
                           'answer' => $answer->question->answer4,
                           'order' => "D"
                        ],
                     ],
                     'correct_answer' => $correct_ans,
                     'degree' => $currentquestion->degree,
                     'student_answer' => $std_ans,
                     'is_correct' => $is_correct,

                  ];


                  $n++;
               }
               if ($per >= $homework->success_rate) {
                  $Studentresult = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->first();

                  $count_wrong = $n - $count_correct;
                  $data = [
                     'questions' => $questionsans,
                     'student_degree' => $Studentresult->student_degree,
                     'degree' => $Studentresult->assignment_degree,
                     'percentage' => $per,
                     'count_wrong' => $count_wrong,
                     'count_correct' => $count_correct,
                     'number_questions' => $n,
                     'is_faild' => 0,
                     'lecture_id' => $request->lecture_id


                  ];
                  $response = [
                     'data' => $data,
                     'message' => "Congratulations ",

                     'status' => false,
                  ];
                  return response($response, 200);
               } else {
                  $count_wrongfail = $nfail - $count_correctfail;
                  $data = [
                     'questions' => $questionsansfail,
                     'student_degree' => $correct_dgree,
                     'degree' => $totalDegree,
                     'percentage' => $per,
                     'number_questions' => $n++,
                     'count_wrong' => $count_wrongfail,
                     'count_correct' => $count_correctfail,
                     'is_faild' => 1,
                     'lecture_id' => $request->lecture_id

                  ];

                  $response = [
                     'data' => $data,

                     'status' => true,
                  ];
                  return response($response, 200);
               }
            } else {
               $response = [
                  'message' => "Already submitted",
                  'status' => false,
               ];
               return response($response, 403);
            }
         }
      }
   }

   public function submithomework2(Request $request)
   {
      if ($request->lecture_id == NULL) {
         $response = [
            'message' => "lecture id required",
            'status' => false,
         ];
         return response($response, 403);
      }
      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->lecture_id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,
         ];
         return response($response, 200);
      } else {

         $n_buying = History::where('lecture_id', $request->lecture_id)->where('student_id', auth()->user()->id)->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
         if ($n_buying == 0) {
            $response = [
               'message' => "You must purchase the lecture first",
               'status' => false,
            ];
            return response($response, 200);
         }
         $n_homework = Homework::where('lecture_id', $request->lecture_id)->count();
         if ($n_homework == 0) {
            $response = [
               'message' => "There is no homework for this lecture",
               'status' => false,
            ];
            return response($response, 200);
         } else {
            $homework = Homework::where('lecture_id', $request->lecture_id)->first();
            $n_Studentresult = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->count();

            if ($n_Studentresult == 0) {
               $correct_dgree = 0;
               $totalDegree = 0;


               foreach ($request->answers as $answer) {
                  $question = QuestionbankQuestion::where('id', $answer['id'])->first();
                  $totalDegree = $totalDegree + $question->degree;
                  $ans = null;
                  if ($answer['order'] == "A") {
                     $ans = "answer1";
                  } elseif ($answer['order'] == "B") {
                     $ans = "answer2";
                  } elseif ($answer['order'] == "C") {
                     $ans = "answer3";
                  } elseif ($answer['order'] == "D") {
                     $ans = "answer4";
                  }
                  if ($ans == $question->correct_answer) {
                     $correct_dgree = $correct_dgree + $question->degree;
                  }

                  $n_stdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->count();
                  if ($n_stdanswer == 1) {
                     $currstdanswer = Studentanswer::where('homework_id', $homework->id)->where('q_id', $answer['id'])->where('student_id', auth()->user()->id)->first();
                     $ans = null;
                     if ($answer['order'] == "A") {
                        $ans = "answer1";
                     } elseif ($answer['order'] == "B") {
                        $ans = "answer2";
                     } elseif ($answer['order'] == "C") {
                        $ans = "answer3";
                     } elseif ($answer['order'] == "D") {
                        $ans = "answer4";
                     }
                     $stdanswer = Studentanswer::find($currstdanswer->id);

                     $stdanswer->update([
                        'student_answer' => $ans,

                     ]);
                  } else {
                     $ans = null;
                     if ($answer['order'] == "A") {
                        $ans = "answer1";
                     } elseif ($answer['order'] == "B") {
                        $ans = "answer2";
                     } elseif ($answer['order'] == "C") {
                        $ans = "answer3";
                     } elseif ($answer['order'] == "D") {
                        $ans = "answer4";
                     }
                     $Studentanswer = Studentanswer::create(
                        [
                           'q_id' => $answer['id'],
                           'student_answer' => $ans,
                           'student_id' => auth()->user()->id,
                           'homework_id' => $homework->id,
                           'n' => $answer['n'],
                        ]
                     );
                  }
               }

               Studentresult::create(
                  [
                     'assignment_degree' => $totalDegree,
                     'student_degree' => $correct_dgree,
                     'student_id' => auth()->user()->id,
                     'homework_id' => $homework->id,

                  ]

               );

               $answers = Studentanswer::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->get();

               $questionsans = [];
               $n = 0;
               $count_correct = 0;

               foreach ($answers as $answer) {
                  $ans1 = null;

                  $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();

                  $std_ans = null;
                  if ($answer->student_answer == "answer1") {
                     $std_ans = "A";
                  } elseif ($answer->student_answer == "answer2") {
                     $std_ans = "B";
                  } elseif ($answer->student_answer == "answer3") {
                     $std_ans = "C";
                  } elseif ($answer->student_answer == "answer4") {
                     $std_ans = "D";
                  }

                  $correct_ans = null;
                  if ($currentquestion->correct_answer == "answer1") {
                     $correct_ans = "A";
                  } elseif ($currentquestion->correct_answer == "answer2") {
                     $correct_ans = "B";
                  } elseif ($currentquestion->correct_answer == "answer3") {
                     $correct_ans = "C";
                  } elseif ($currentquestion->correct_answer == "answer4") {
                     $correct_ans = "D";
                  }
                  $is_correct = 0;
                  if ($correct_ans == $std_ans) {
                     $is_correct = 1;
                     $count_correct = $count_correct + 1;
                  }

                  $questionsans[] = [
                     'id' => $answer->q_id,
                     'n' => $answer->n,
                     'question' => $answer->question->question,
                     'answers' => [
                        [
                           'answer' => $answer->question->answer1,
                           'order' => "A"
                        ],
                        [
                           'answer' => $answer->question->answer2,
                           'order' => "B"
                        ],
                        [
                           'answer' => $answer->question->answer3,
                           'order' => "C"
                        ],
                        [
                           'answer' => $answer->question->answer4,
                           'order' => "D"
                        ],
                     ],
                     'correct_answer' => $correct_ans,
                     'degree' => $currentquestion->degree,
                     'student_answer' => $std_ans,
                     'is_correct' => $is_correct,

                  ];
                  $n++;
               }
               $Studentresult = Studentresult::where('homework_id', $homework->id)->where('student_id', auth()->user()->id)->first();
               $count_wrong = $n - $count_correct;
               $data = [
                  'questions' => $questionsans,
                  'student_degree' => $Studentresult->student_degree,
                  'degree' => $Studentresult->assignment_degree,
                  'percentage' => round($Studentresult->student_degree / $Studentresult->assignment_degree, 2),
                  'count_wrong' => $count_wrong,
                  'count_correct' => $count_correct,
                  'number_questions' => $n,

               ];
               $response = [
                  'data' => $data,
                  'status' => true,
               ];
               return response($response, 201);
            } else {
               $response = [
                  'message' => "You have already submitted the homework",
                  'status' => false,
               ];
               return response($response, 403);
            }
         }
      }
   }

   public function buyamount(Request $request)
   {
      $n_lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->id)->count();

      if ($n_lecture == 0) {
         $response = [
            'message' => "The lecture does not exist",
            'status' => false,

         ];
         return response($response, 200);
      } else {
         $lecture = Lecture::where('visibility', 1)->where('stage', auth()->user()->stage)->where('id', $request->id)->first();
         $exams = Trialexam::where('visibility', 1)->where('stage', auth()->user()->stage)->where('nextlecture', $request->id)->get();
         $n_res = 0;
         foreach ($exams as $exam) {

            $n_Studentresult = Studentresult::where('exam_id', $exam->id)->where('student_id', auth()->user()->id)->count();
            if ($n_Studentresult == 0) {
               $n_res++;
            }
         }
         if ($n_res > 0) {
            $response = [
               'message' => "you can't buy please complete exam",
               'status' => false,

            ];
            return response($response, 200);
         }
         if (auth()->user()->amount >= $lecture->price) {
            $n_buyingHistory = History::where('lecture_id', $request->id)->where('student_id', auth()->user()->id)
               ->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
            if ($n_buyingHistory > 0) {
               $response = [
                  'message' => "The lecture already exists",
                  'status' => false,

               ];
               return response($response, 200);
            } else {

               DB::beginTransaction();
               try {
                  $ex = date("Y-m-d H:i:s", strtotime('+' . $lecture->expired_at . 'days'));
                  $student = Student::find(auth()->user()->id);

                  $student->update([
                     'amount' => auth()->user()->amount - $lecture->price,

                  ]);

                  $History = History::create(
                     [
                        'lecture_id' => $request->id,
                        'price' => $lecture->price,
                        'buy_at' => date('Y-m-d H:i:s'),
                        'student_id' => auth()->user()->id,
                        'method' => "amount",
                        'expire_at' => $ex,
                        'views' => $lecture->views,
                     ]
                  );
                  DB::commit();
               } catch (\Exception $ex) {
                  DB::rollback();
                  return response()->json(['error' => $ex->getMessage()], 500);
               }

               $response = [
                  'message' => "The lecture has been activated successfully",
                  'status' => true,

               ];
               return response($response, 200);
            }
         } else {
            $response = [
               'message' => "The balance is insufficient ",
               'status' => false,

            ];
            return response($response, 200);
         }
      }
   }


   public function decreaseview(Request $request)
   {


      $n_sub = History::where('id', $request->id)->where('views', '>', 0)->count();
      if ($n_sub == 1) {
         $subs = History::where('id', $request->id)->where('views', '>', 0)->first();
         $sub = History::find($subs->id);

         $sub->update([
            'views' => $sub->views - 1,

         ]);
      }
   }
}
