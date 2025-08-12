<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Code;
use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Models\Admin;
use App\Models\Video;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Homework;
use App\Models\Trialexam;
use App\Models\Attachment;
use App\Models\Historyexam;
use Illuminate\Http\Request;
use App\Models\Studentanswer;
use App\Models\Studentresult;
use App\Models\SetsbankQuestion;
use Spatie\Permission\Models\Role;
use App\Models\QuestionbankCategory;
use App\Models\QuestionbankQuestion;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;



class TrialexamController extends Controller
{

  public function allexams()
  {
    $allexams = [];

    $all_Trialexam = Trialexam::all();
    $n_Trialexam = Trialexam::count();

    if ($n_Trialexam == 0) {
      $response = [
        'message' => "We don't have exams",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($all_Trialexam as $exam) {


        $allexams[] = [
          'n' => $i++,
          'key' => $exam->id,
          'title' => $exam->name,
          'description' => $exam->description,
          'stage' => $exam->stage,
          'visibility' => $exam->visibility,
          'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $exam->img,
          'price' => $exam->price,
          'duration' => $exam->duration,
          'edu_type' => $exam->edu_type,




        ];
      }

      $response = [
        'data' => $allexams,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function addexam(Request $request)
  {
    // return $request;
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'stage' => 'required|string|max:2',
          'price' => 'required|string',
          'img' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',
          'duration' => 'required|numeric|min:0',
          'success_rate' => 'required|numeric|min:1',

        ],

        [

          'name.required' => 'Name is required',
          'stage.required' => 'Grade is required',
          'price.required' => 'Price is required',
          'img.required' => 'Image is required',
          'img.max' => 'The image size must not exceed 5 MB',
          'img.mimes' => 'The image must be in jpg or jpeg format',
          'duration.required' => 'Duration is required',
          'success_rate.required' => 'Success rate is required',


        ],

        [
          'name' => 'Name',
          'stage' => 'Grade',
          'price' => 'Price',
          'description' => 'Description',
          'img' => 'Image',

        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      if (!empty($request->img)) {
        $newimgname = time() . '-' . rand(111, 999) . '.' .
          $request->img->extension();
        $request->img->move(public_path('uploads/lectures/images'), $newimgname);
      }

      $section = NULL;
      if ($request->stage == 2) {
        $section = $request->section;
      }
      if ($request->nextlecture == 0) {
        $trialexam = Trialexam::create(
          [
            'name' => $request->name,
            'stage' => $request->stage,
            'description' => $request->description,
            'price' => $request->price,
            'nextlecture' => NULL,
            'img' => $newimgname,
            'duration' => $request->duration,
            'success_rate' => $request->success_rate,
            'section' => $section,
            'edu_type' => $request->edu_type,




          ]
        );
      } else {
        $trialexam = Trialexam::create(
          [
            'name' => $request->name,
            'stage' => $request->stage,
            'description' => $request->description,
            'price' => $request->price,
            'nextlecture' => $request->nextlecture,
            'img' => $newimgname,
            'duration' => $request->duration,
            'success_rate' => $request->success_rate,
            'section' => $section,
            'edu_type' => $request->edu_type,



          ]
        );
      }





      return response()->json([
        'status' => true,
        'message' => 'Test created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => false,
        'message' => $th->getMessage()
      ], 200);
    }
  }




  public function deleteexam(Request $request)
  {
    $id = $request->id;
    $n_exam = Trialexam::where('id', $id)->count();
    if ($n_exam == 0) {
      $response = [
        'message' => "Exam not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      Trialexam::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }




  public function geteaxm($id)
  {
    $getexam = [];

    $exam = Trialexam::where('id', $id)->first();
    $n_exam = Trialexam::where('id', $id)->count();

    if ($n_exam == 0) {
      $response = [
        'message' => "Exam not found",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $getexam = [
        'key' => $exam->id,
        'name' => $exam->name,
        'description' => $exam->description,
        'stage' => $exam->stage,
        'visibility' => $exam->visibility,
        'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $exam->img,
        'price' => $exam->price,
        'v_model' => $exam->v_model,
        'is_buying' => $exam->is_buying,
        'nextlecture' => $exam->nextlecture,
        'duration' => $exam->duration,
        'success_rate' => $exam->success_rate,
        'section' => $exam->section,

        'edu_type' => $exam->edu_type,


      ];


      $response = [
        'data' => $getexam,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function updateexam(Request $request)
  {
    $id = $request->id;
    $n_exam = Trialexam::where('id', $id)->count();
    if ($n_exam == 0) {
      $response = [
        'message' => "Exam not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $exam = Trialexam::find($id);
      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'name' => 'required|string|max:255',
            'stage' => 'required|string|max:2',
            'price' => 'required|string',
            'v_model' => 'required',
            'is_buying' => 'required',
            'visibility' => 'required',
            'duration' => 'required|numeric|min:0',
            'success_rate' => 'required|numeric|min:0|max:100',


          ],
          [

            'name.required' => 'The name is required',
            'stage.required' => 'The grade is required',
            'price.required' => 'The price is required',
            'visibility.required' => 'Visibility is required',
            'v_model.required' => 'Answer visibility is required',
            'is_buying.required' => 'Availability for purchase is required',



          ],

          [

            'name' => 'Name',
            'stage' => 'Grade',
            'description' => 'Description',
            'img' => 'Image',

          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }
        $img = $exam->img;
        if (!empty($request->img)) {
          $newimgname = time() . '-' . rand(111, 999) . '.' .
            $request->img->extension();
          $request->img->move(public_path('uploads/lectures/images'), $newimgname);
          $img = $newimgname;
        }
        $nextlecture = NULL;
        if ($request->nextlecture != 0) {
          $nextlecture = $request->nextlecture;
        }
        $section = NULL;
        if ($request->stage == 2) {
          $section = $request->section;
        }
        $exam->update([
          'name' => $request->name,
          'description' => $request->description,
          'stage' => $request->stage,
          'visibility' => $request->visibility,
          'img' => $img,
          'price' => $request->price,
          'v_model' => $request->v_model,
          'nextlecture' => $nextlecture,
          'is_buying' => $request->is_buying,
          'duration' => $request->duration,
          'success_rate' => $request->success_rate,
          'section' => $section,
          'edu_type' => $exam->edu_type,




        ]);




        $response = [
          'message' => "Exam has been updated",
          'status' => true,

        ];
        return response($response, 201);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => false,
          'message' => $th->getMessage()
        ], 200);
      }
    }
  }

  public function alllectures()
  {
    $alllectures = [];

    $all_Lectures = Lecture::all();

    $n_Lectures = Lecture::count();

    if ($n_Lectures == 0) {
      $response = [
        'message' => "We don't have any lectures",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($all_Lectures as $chapter) {


        $alllectures[] = [
          'n' => $i++,
          'key' => $chapter->id,
          'name' => $chapter->title,
          'stage' => $chapter->stage,

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
  public function addsets(Request $request)
  {

    foreach ($request->sets as  $item) {

      $n_content_item_exam = Trialexam::where('id', $item['exam_id'])->count();
      if ($n_content_item_exam == 1) {
        $exam = Trialexam::where('id', $item['exam_id'])->first();

        SetsbankQuestion::create(
          [
            'category_id' => $item['category_id'],
            'easy' => $item['easy'],
            'medium' => $item['medium'],
            'hard' => $item['hard'],
            'exam_id' => $exam->id,



          ]
        );
      } else {
        return response()->json([
          'status' => true,
          'message' => "There is no exam"
        ], 403);
      }

      return response()->json([
        'status' => true,
        'message' => "Added successfully"
      ], 200);
    }
  }

  public function getexaminfo($id)
  {
    $n_exam = Trialexam::where('id', $id)->count();
    if ($n_exam == 0) {
      $response = [
        'message' => "The test does not exist",
        'status' => false,

      ];
      return response($response, 200);
    } else {



      $exam = Trialexam::where('id', $id)->first();

      $quiz_info[] = [
        'key' => $exam->id,
        'success_rate' => $exam->success_rate,
        'visibility' => $exam->visibility,
        'duration' => $exam->duration,
      ];





      $SetsbankQuestion = SetsbankQuestion::where('exam_id', $id)->get();
      $sets = [];
      foreach ($SetsbankQuestion as  $SetbankQuestion) {
        $sets[] = [
          'key' => $SetbankQuestion->id,
          'category_id' => $SetbankQuestion->category_id,
          'easy' => $SetbankQuestion->easy,
          'medium' => $SetbankQuestion->medium,
          'hard' => $SetbankQuestion->hard,
        ];
      }
      $Questions = [];
      $Questionsbank = QuestionbankQuestion::where('exam_id', $id)->get();
      $i = 1;
      foreach ($Questionsbank as  $Questionbank) {
        $Questions[] = [
          'n' => $i++,
          'key' => $Questionbank->id,
          'question' => $Questionbank->question,
          'answer1' => $Questionbank->answer1,
          'answer2' => $Questionbank->answer2,
          'answer3' => $Questionbank->answer3,
          'answer4' => $Questionbank->answer4,
          'correct_answer' => $Questionbank->correct_answer,
          'is_essay' => $Questionbank->is_essay,

          'degree' => $Questionbank->degree,
          'difficulty' => $Questionbank->difficulty,

        ];
      }
      $data = [
        'quiz_info' => $quiz_info,
        'Questions' => $Questions,
        'sets' => $sets,

      ];

      $response = [
        'data' => $data,
        'message' => "success",
        'status' => true,
        'is_found' => 1,

      ];
      return response($response, 201);
    }
  }


  public function addchoosequestionexam(Request $request)
  {
    $n_exam = Trialexam::where('id', $request->exam_id)->count();

    if ($n_exam == 0) {
      $response = [
        'message' => "  The test does not exist  ",
        'status' => false,

      ];
      return response($response, 200);
    } else {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'question' => 'required|string',
            'answer1' => 'required|string',
            'answer2' => 'required|string',
            'answer3' => 'required|string',
            'answer4' => 'required|string',
            'correct_answer' => 'required|string',
            'exam_id' => 'required',

          ],

          [
            'question.required' => 'Question is required',
            'answer1.required' => 'Answer 1 is required',
            'answer2.required' => 'Answer 2 is required',
            'answer3.required' => 'Answer 3 is required',
            'answer4.required' => 'Answer 4 is required',
            'correct_answer.required' => 'Correct answer is required',
            'exam_id.required' => 'Selected exam is required',

          ],

          [

            'question' => 'Question',
            'answer1' => 'Answer 1',
            'answer2' => 'Answer 2',
            'answer3' => 'Answer 3',
            'answer4' => 'Answer 4',
            'correct_answer' => 'Correct Answer',
            'exam_id' => 'Selected Exam',
          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }


        $QuestionbankQuestion = QuestionbankQuestion::create(
          [
            'question' => $request->question,
            'is_essay' => 0,
            'exam_id' => $request->exam_id,
            'answer1' => $request->answer1,
            'answer2' => $request->answer2,
            'answer3' => $request->answer3,
            'answer4' => $request->answer4,
            'correct_answer' => $request->correct_answer,
            'degree' => $request->degree,


          ]
        );



        return response()->json([
          'status' => true,
          'message' => 'The question has been created successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    }
  }



  public function allsetsexam($id)
  {
    $sets = [];
    $QuestionbankCategory = SetsbankQuestion::where("exam_id", $id)->get();
    $n_QuestionbankCategory = SetsbankQuestion::where("exam_id", $id)->count();
    if ($n_QuestionbankCategory == 0) {
      $response = [
        'message' => "There are no categories",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($QuestionbankCategory as $set) {
        $sets[] = [
          'n' => $i++,
          'key' => $set->id,
          'easy' => $set->easy,
          'medium' => $set->medium,
          'hard' => $set->hard,
          'category_id' => $set->category_id,
          'category_name' => $set->categroy->name,

        ];
      }

      $response = [
        'data' => $sets,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }


  public function allsetshomework($id)
  {
    $sets = [];
    $QuestionbankCategory = SetsbankQuestion::where("homework_id", $id)->get();
    $n_QuestionbankCategory = SetsbankQuestion::where("homework_id", $id)->count();
    if ($n_QuestionbankCategory == 0) {
      $response = [
        'message' => "There are no categories",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($QuestionbankCategory as $set) {
        $sets[] = [
          'n' => $i++,
          'key' => $set->id,
          'easy' => $set->easy,
          'medium' => $set->medium,
          'hard' => $set->hard,
          'category_id' => $set->category_id,
          'category_name' => $set->categroy->name,

        ];
      }

      $response = [
        'data' => $sets,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }



  public function deleteset(Request $request)
  {
    $id = $request->id;
    $n_set = SetsbankQuestion::where('id', $id)->count();
    if ($n_set == 0) {
      $response = [
        'message' => "The category does not exist",
        'status' => false,
      ];
      return response($response, 404);
    } else {
      SetsbankQuestion::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,
      ];
      return response($response, 201);
    }
  }
  public function updateset(Request $request)
  {

    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'easy' => 'required|min:1',
          'medium' => 'required|min:1',
          'hard' => 'required|min:1',


        ],
        [

          'easy.required' => 'Easy questions are required',
          'medium.required' => 'Medium questions are required',
          'hard.required' => 'Hard questions are required',


        ],
        [
          'easy' => 'Easy',
          'medium' => 'Medium',
          'hard' => 'Hard',



        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }
      $id = $request->id;
      $n_set = SetsbankQuestion::where('id', $id)->count();
      if ($n_set == 0) {
        $response = [
          'message' => " The category does not exist ",
          'status' => false,

        ];
        return response($response, 404);
      } else {
        $SetsbankQuestion = SetsbankQuestion::find($id);

        $SetsbankQuestion->update([
          'easy' => $request->easy,
          'medium' => $request->medium,
          'hard' => $request->hard

        ]);

        $response = [
          'message' => "Successfully updated",
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


  public function allstudents($id)
  {
    $students = [];
    $n_hisories = History::where("lecture_id", $id)->count();

    $n_QuestionbankCategory = SetsbankQuestion::where("homework_id", $id)->count();
    if ($n_hisories == 0) {
      $response = [
        'message' => "There are no students who purchased this lecture",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $hisories = History::where("lecture_id", $id)->get();

      $i = 1;
      $students = [];
      foreach ($hisories as $hisory) {

        $bought_by = "Code";
        if ($hisory->code_id == null) {
          $bought_by = "Assistant";
        }

        $quiz_degree = NULL;
        $std_quiz_degree = NULL;
        $homework_degree = NULL;
        $std_homework_degree = NULL;
        $n_quiz = Quiz::where("lecture_id", $id)->count();


        if ($hisory->quiz_done == 1 && $n_quiz == 1) {
          $quiz = Quiz::where("lecture_id", $id)->first();

          $resquiz = Studentresult::where("quiz_id", $quiz->id)->first();
          $quiz_degree = $resquiz->assignment_degree;
          $std_quiz_degree = $resquiz->student_degree;
        }


        $n_homework = Homework::where("lecture_id", $id)->count();


        if ($hisory->hw_done == 1 && $n_homework == 1) {
          $homework = Homework::where("lecture_id", $id)->first();

          $reshomework = Studentresult::where("homework_id", $homework->id)->first();
          $homework_degree = $reshomework->assignment_degree;
          $std_homework_degree = $reshomework->student_degree;
        }


        $students[] = [
          'n' => $i++,
          'key' => $hisory->id,
          'student_name' => $hisory->student->first_name . " " . $hisory->student->second_name . " " . $hisory->student->third_name . " " . $hisory->student->fourth_name,
          'mobile' => $hisory->student->mobile,
          'buy_at' => date("F j, Y, g:i a", strtotime($hisory->created_at)),
          'quiz_degree' => $quiz_degree,
          'std_quiz_degree' => $std_quiz_degree,

          'homework_degree' => $homework_degree,
          'std_homework_degree' => $std_homework_degree,
          //    'homework_degree'=>$homework_degree,
          'expire_at' => $hisory->buy_at,
          'views' => $hisory->views,
          'bought_by' => $bought_by,
          //      'code'=>$hisory->code->code,

        ];
      }

      $response = [
        'data' => $students,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }
  public function view($id)
  {
    $getexam = [];
    $exam = Trialexam::where('id', $id)->first();
    $n_exam = Trialexam::where('id', $id)->count();
    if ($n_exam == 0) {
      $response = [
        'message' => "The exam does not exist",
        'status' => false,
      ];
      return response($response, 200);
    } else {
      $n_historyexam = Studentresult::where('exam_id', $id)->count();

      if ($n_historyexam == 0) {
        $response = [
          'message' => "The exam has no students",
          'status' => false,
        ];
        return response($response, 200);
      }
      $students = [];
      // $historyexams = Historyexam::where('exam_id',$id)->get();
      $historyexams = Studentresult::where('exam_id', $id)->get();

      $n = 1;
      foreach ($historyexams as $historyexam) {
        $degree = NULL;
        $percentage = NULL;
        $n_Studentresult = Studentresult::where('exam_id', $id)->where('student_id', $historyexam->student_id)->count();

        $n_Studentresult = Studentresult::where('exam_id', $id)->where('student_id', $historyexam->student_id)->count();
        if ($n_Studentresult == 1) {
          $Studentresult = Studentresult::where('exam_id', $id)->where('student_id', $historyexam->student_id)->first();

          $degree = $Studentresult->student_degree . " / " . $Studentresult->assignment_degree;
          $percentage = round($Studentresult->student_degree / $Studentresult->assignment_degree * 100, 2);
        }

        $n_hisexams = Historyexam::where('exam_id', $id)->where('student_id', $historyexam->student_id)->count();
        $hiscode = NULL;
        if ($n_hisexams > 0) {
          $hisexams = Historyexam::where('exam_id', $id)->where('student_id', $historyexam->student_id)->first();
          $code = Code::withTrashed()->where('id', $hisexams->code_id)->first();
          $hiscode = $code->id;
        }

        $students[] = [
          'n' => $n++,
          'key' => $historyexam->id,
          'student_name' => $historyexam->student->first_name . " " . $historyexam->student->second_name . " " . $historyexam->student->third_name . " " . $historyexam->student->fourth_name,
          'mobile' => $historyexam->student->mobile,
          'parent_mobile' => $historyexam->student->parent_mobile,
          'degree' => $degree,
          'percentage' => $percentage,
          'code' => $hiscode,
          'created_at' => date("F j, Y, g:i a", strtotime($historyexam->created_at)),
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


  public function retake(Request $request)
  {
    $id = $request->id;
    $n_historyexam = Studentresult::where('id', $id)->count();

    if ($n_historyexam == 0) {
      $response = [
        'message' => "  Not found ",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $historyexam = Studentresult::where('id', $id)->first();

      $qexams = Studentanswer::where('student_id', $historyexam->student_id)->where('exam_id', $historyexam->exam_id)->get();
      foreach ($qexams as $qexam) {
        Studentanswer::find($qexam->id)->delete();
      }
      $Studentresult = Studentresult::where('exam_id', $historyexam->exam_id)->where('student_id', $historyexam->student_id)->first();

      Studentresult::find($Studentresult->id)->delete();

      $response = [
        'message' => "Successfully done",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function deletestd(Request $request)
  {
    $id = $request->id;
    $n_historyexam = Historyexam::where('id', $id)->count();

    if ($n_historyexam == 0) {
      $response = [
        'message' => " Not found ",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $historyexam = Historyexam::where('id', $id)->first();

      $qexams = Studentanswer::where('student_id', $historyexam->student_id)->where('exam_id', $historyexam->exam_id)->get();
      foreach ($qexams as $qexam) {
        Studentanswer::find($qexam->id)->delete();
      }
      Historyexam::find($id)->delete();

      $Studentresult = Studentresult::where('exam_id', $historyexam->exam_id)->where('student_id', $historyexam->student_id)->first();

      Studentresult::find($Studentresult->id)->delete();


      $response = [
        'message' => "Successfully done",
        'status' => true,

      ];
      return response($response, 201);
    }
  }
  public function modelanswerstudent($id)
  {
    $n_historyexam = Studentresult::where('id', $id)->count();
    if ($n_historyexam == 0) {
      $response = [
        'message' => "The exam does not exist",
        'status' => true,

      ];
      return response($response, 403);
    } else {

      $historyexam = Studentresult::where('id', $id)->first();

      $answers = Studentanswer::where('exam_id', $historyexam->exam_id)->where('student_id', $historyexam->student_id)->get();

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
      $response = [
        'message' => "success",
        'data' => $questionsans,
        'status' => true,

      ];
      return response($response, 200);
    }
  }
}
