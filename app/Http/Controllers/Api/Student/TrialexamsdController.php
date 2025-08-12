<?php

namespace App\Http\Controllers\Api\Student;

use App\Models\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Lecture;
 use App\Models\Historyexam;
use App\Models\Video;
use App\Models\Attachment;
use DB;
use App\Models\Quiz;
use App\Models\QuestionbankCategory;
use App\Models\SetsbankQuestion;
use App\Models\QuestionbankQuestion;
use App\Models\Studentanswer;
use App\Models\Studentresult;
use App\Models\Homework;
use App\Models\Code;
use App\Models\Trialexam;



use Illuminate\Http\Request;
 


class TrialexamsdController extends Controller
{
   public function allexams() {
      $allexams=[];
      
      $exams = Trialexam::where('section',auth()->user()->section)->where('visibility',1)->where('stage',auth()->user()->stage)->get();
      $n_exams = Trialexam::where('section',auth()->user()->section)->where('visibility',1)->where('stage',auth()->user()->stage)->count();

 

     if($n_exams==0){
        $response = [
            'message' => "We don't have exams",
           'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($exams as $exam){
 
         
         $n_Historyexam = Historyexam::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->count();

           $allexams[]=[
              'n'=> $i++,
              'key'=>$exam->id,
              'title'=>$exam->name,
              'description'=>$exam->description,
               'visibility'=>$exam->visibility,
               'img'=>"https://api.prodigy-online.com/uploads/lectures/images/".$exam->img,
               'duration'=>$exam->duration,
               'price'=>$exam->price,
               'is_buy'=>$n_Historyexam,
 
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
    
   

            public function exam($id) {
               $exaam=[];
                  $n_exam = Trialexam::where('section',auth()->user()->section)->where('visibility',1)->where('stage',auth()->user()->stage)->where('id',$id)->count();

              if($n_exam==0){
                 $response = [
                     'message' => "The exam does not exist",
                    'status' => false,
                
                  ];
                  return response($response, 200);
              }else{
               $exam = Trialexam::where('section',auth()->user()->section)->where('visibility',1)->where('stage',auth()->user()->stage)->where('id',$id)->first();
$is_taken=NULL;
$degree=NULL;
$rank=NULL;
$average=NULL;
$percentage=NULL;
$n_Studentresult = Studentresult::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();
if($n_Studentresult==0){
   $is_taken=0;
}elseif($n_Studentresult==1){
   $is_taken=1;
   $Studentresult = Studentresult::where('exam_id',$id)->where('student_id',auth()->user()->id)->first();

   $degree= $Studentresult->assignment_degree." / ".$Studentresult->student_degree;

$percentage=round($Studentresult->student_degree/$Studentresult->assignment_degree*100,1).'% ';

   $ranks=DB::table('student_results')
->select('*',DB::raw('dense_rank() OVER ( partition by `exam_id` order by `student_degree` desc ) AS rank'))
->where('exam_id','=',$id)
 
->get();
$i=0;
 foreach($ranks as $stdrank){
   $i++;
if($stdrank->student_id==auth()->user()->id){
   $rank=$i;
}
}

 

$n_questions= Studentresult::where("exam_id",$id)->sum('assignment_degree');;


$alldgree = Studentresult::where("exam_id",$id)->sum('student_degree');
$n_student=Studentresult::where("exam_id",$id)->count();

 $preall=$alldgree/($n_questions);
      $average=round( $preall*100,1).'% ';
     
     
}
                    $exaam=[
                       'key'=>$exam->id,
                       'title'=>$exam->name,
                       'description'=>$exam->description,
                       'stage'=>$exam->stage,
                       'visibility'=>$exam->visibility,
                       'img'=>"https://api.prodigy-online.com/uploads/lectures/images/".$exam->img,
                       'price'=>$exam->price,
                       'duration'=>$exam->duration,
                       'is_taken'=>$is_taken,
                       'degree' =>$degree,
                       'rank' =>$rank,
                       'average'=>$average,
                       'v_model'=>$exam->v_model,
                       'percentage'=>$percentage,


                   ];
                   $n_History = Historyexam::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();         
   
 $can_buy=0;
if($n_History==0&&$exam->is_buying==1){
   $can_buy=1;

}


                  $data =[
                     'exam_info' =>$exaam,
                     'can_buy'=>$can_buy,
                     'n_History'=>$n_History,


                  ];

           
                 $response = [
                  'data' => $data,

                  'message' => "success",
                    'status' => true,
                
                  ];
                  return response($response, 201);
              
              }
                
                
              
              
                 
                     }
             
      public function buy(Request $request) {
         $n_exam = Trialexam::where('section',auth()->user()->section)->where('visibility',1)->where('stage',auth()->user()->stage)->where('id',$request->id)->count();
 
         if($n_exam==0){
            $response = [
                'message' => "The exam does not exist",
               'status' => false,
           
             ];
             return response($response, 200);
         }else{
            $n_code = Code::where('code',$request->code)->count();
             $exam = Trialexam::where('visibility',1)->where('stage',auth()->user()->stage)->where('id',$request->id)->first();

            if($n_code>0){
               $code = Code::where('code',$request->code)->sharedLock()->first();
               $n_History = Historyexam::where('exam_id',$request->id)->where('student_id',auth()->user()->id)
               ->count();         
 
                 if($n_History>0){
                  $response = [
                     'message' => "The exam already exists",
                    'status' => false,
                
                  ];
                  return response($response, 200);

               }
               else{
                 if($code->price==$exam->price){
                  DB::beginTransaction();
                  try {
              
                     $History = Historyexam::create(
                        [
                          'exam_id' => $request->id,
                           'created_at' => date('Y-m-d H:i:s'),
                          'student_id' => auth()->user()->id,
                           'code_id' => $code->id,
                        ]
                      );
                      Code::find($code->id)->delete();
                      DB::commit();
                  } catch (\Exception $ex) {
                      DB::rollback();
                      return response()->json(['error' => $ex->getMessage()], 500);
                  }
                
                  $response = [
                     'message' => "The exam was successfully activated",
                    'status' => true,
                
                  ];
                  return response($response, 200);
                 }else{
                  $response = [
                     'message' => "You cannot use the code for this exam ",
                    'status' => false,
                
                  ];
                  return response($response, 200);
                 }
               
               
                }
            }
else{
   $response = [
      'message' => "The code is wrong",
     'status' => false,
 
   ];
   return response($response, 200);
}
         }
                     }
                     public function getexamquestion($id) {
                        $n_exam = Trialexam::where('id',$id)->count();
                        $exam=NULL;
                        if($n_exam==0){
                           $response = [
                              'message' => "There is no exam",
                              'status' => false,
                                          ];
                                          return response($response, 200);
                        }else{
                         $exam = Trialexam::where('id',$id)->first();
                        }
       $n_buying = Historyexam::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();
                                 

                             if(($exam->price==0&&$exam->points==0)||($exam->points==0&&$exam->price>0)||($exam->price==0&&$exam->points>0)){
                              $n_result = Studentresult::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();

                              if($n_result==0){
                                  $questions=[];
                                 $setscount = SetsbankQuestion::where('exam_id',$exam->id)->count();
                                  if($setscount>0){
                                     $allsetsquestionbank = SetsbankQuestion::where('exam_id',$exam->id)->get();
                                 foreach($allsetsquestionbank as $allsetquestionbank){
                                  
                                   if($allsetquestionbank->easy!=0){
                                 $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"easy")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->easy)->inRandomOrder()->get();
                                 foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                 $questions[]=[
                                 'id'=>$QuestionbankQuestion->id,
                                 'question'=>$QuestionbankQuestion->question,
                                 'answer1'=>$QuestionbankQuestion->answer1,
                                 'answer2'=>$QuestionbankQuestion->answer2,
                                 'answer3'=>$QuestionbankQuestion->answer3,
                                 'answer4'=>$QuestionbankQuestion->answer4,
                                 'is_essay'=>$QuestionbankQuestion->is_essay,
                                 'degree'=>$QuestionbankQuestion->degree,
                                 
                                 
                                 ]; 
                                 }
                                 } 
                                 
                                  
                                 
                                 if($allsetquestionbank->medium!=0){
                                    $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"medium")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->medium)->inRandomOrder()->get();
                                    foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                    $questions[]=[
                                    'id'=>$QuestionbankQuestion->id,
                                    'question'=>$QuestionbankQuestion->question,
                                    'answer1'=>$QuestionbankQuestion->answer1,
                                    'answer2'=>$QuestionbankQuestion->answer2,
                                    'answer3'=>$QuestionbankQuestion->answer3,
                                    'answer4'=>$QuestionbankQuestion->answer4,
                                    'is_essay'=>$QuestionbankQuestion->is_essay,
                                    'degree'=>$QuestionbankQuestion->degree,
                                 
                                    
                                    ]; 
                                    }
                                    } 
                                    if($allsetquestionbank->hard!=0){
                                       $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"hard")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->medium)->inRandomOrder()->get();
                                       foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                       $questions[]=[
                                       'id'=>$QuestionbankQuestion->id,
                                       'question'=>$QuestionbankQuestion->question,
                                       'answer1'=>$QuestionbankQuestion->answer1,
                                       'answer2'=>$QuestionbankQuestion->answer2,
                                       'answer3'=>$QuestionbankQuestion->answer3,
                                       'answer4'=>$QuestionbankQuestion->answer4,
                                       'is_essay'=>$QuestionbankQuestion->is_essay,
                                       'degree'=>$QuestionbankQuestion->degree,
                                 
                                       
                                       ]; 
                                       }
                                       } 
                                    }
                                    
                                  
                                                 }
                                 
                                     $n_allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('exam_id',$exam->id)->count();
                                         if($n_allnoncategroeyQuestionbankQuestions>0){
                                          $allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('exam_id',$exam->id)->get();
                                 foreach($allnoncategroeyQuestionbankQuestions as $allnoncategroeyQuestionbankQuestion){
                                    $questions[]=[
                                       'id'=>$allnoncategroeyQuestionbankQuestion->id,
                                       'question'=>$allnoncategroeyQuestionbankQuestion->question,
                                       'answer1'=>$allnoncategroeyQuestionbankQuestion->answer1,
                                       'answer2'=>$allnoncategroeyQuestionbankQuestion->answer2,
                                       'answer3'=>$allnoncategroeyQuestionbankQuestion->answer3,
                                       'answer4'=>$allnoncategroeyQuestionbankQuestion->answer4,
                                       'is_essay'=>$allnoncategroeyQuestionbankQuestion->is_essay,
                                       'degree'=>$allnoncategroeyQuestionbankQuestion->degree,
                                 
                                       
                                       ]; 
                                 }
                                         }
                                         $choosequestions = [];
                                         $essayquestions = [];
                                 
                                     $n=1;
                                         foreach($questions as $question){
                                          if($question['is_essay']==0){
                                             $is_selected=0;
                                             
                                             $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->where('q_id',$question['id'])->count();
                                            $ans=NULL;
                                             if($n_stdanswer==1){
                                                $is_selected=1;
                                                $stdanswer = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->where('q_id',$question['id'])->first();
                                                 if($stdanswer->student_answer=="answer1"){
                                                $ans="A";
                                                }elseif($stdanswer->student_answer=="answer2"){
                                                   $ans="B";
                                                }elseif($stdanswer->student_answer=="answer3"){
                                                   $ans="C";
                                                }elseif($stdanswer->student_answer=="answer4"){
                                                   $ans="D";
                                 
                                                }
                                             }
                                             $choosequestions[] = [
                                                'n' => $n++,
                                                'id' => $question['id'],
                                                'question' => $question['question'],
                                                'answers'=>[
                                                    ['answer' => $question['answer1'],
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
                                                  'selected_answer'=>$ans,
                                                  'degree' => $question['degree'],
                                 
                                        
                                            ];
                                          }
                                    else{
                                       $essayquestions[] = [
                                          'id' => $question['id'],
                                          'question' => $question['question'],
                                          'degree' => $question['degree'],
                                 
                                 
                                      ];
                                    }
                                 
                                         }
                                  
                                 
                                         $exam_details = [
                                          'id' => $exam->id,
                                          'title' => $exam->name,
                                          'duration' => $exam->duration,
                                 
                                 
                                      ];
                                         $response = [
                                          'essayquestions' => $essayquestions,
                                          'quiz' => $exam_details,         
                                          'choosequestions' => $choosequestions,         
                                          'message' => "success",
                                          'status' => true,
                                      
                                        ];
                                        return response($response, 201);
                              }else{
                                 $response = [
                                    'message' => 'You have already taken the exam',
                                    'status' => false,
                                
                                  ];
                                  return response($response, 403);
                              }
                     
                                                           }
                                                           elseif($n_buying==0){
                                                            $response = [
                                                           'message' => "You must purchase the exam first",
                                                           'status' => false,
                                                                       ];
                                                                       return response($response, 200);
                                                                                 }
                                      elseif($n_buying==1){
 
                          $n_buying = Studentresult::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();
                          
                          if($n_buying==1){
                             $response = [
                            'message' => "I have already taken the exam",
                            'status' => false,
                                        ];
                                        return response($response, 200);
                                                  }
                          else{
                             
                                
                             $n_exam = Trialexam::where('id',$id)->count();
                             if($n_exam==0){
                                $response = [
                                   'message' => "There is no exam",
                                   'status' => false,
                                               ];
                                               return response($response, 200);
                             }else{
                              $exam = Trialexam::where('id',$id)->first();
               
                               $n_result = Studentresult::where('exam_id',$id)->where('student_id',auth()->user()->id)->count();

                              if($n_result==0){
                                  $questions=[];
                                 $setscount = SetsbankQuestion::where('exam_id',$exam->id)->count();
                                  if($setscount>0){
                                     $allsetsquestionbank = SetsbankQuestion::where('exam_id',$exam->id)->get();
                                 foreach($allsetsquestionbank as $allsetquestionbank){
                                  
                                   if($allsetquestionbank->easy!=0){
                                 $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"easy")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->easy)->inRandomOrder()->get();
                                 foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                 $questions[]=[
                                 'id'=>$QuestionbankQuestion->id,
                                 'question'=>$QuestionbankQuestion->question,
                                 'answer1'=>$QuestionbankQuestion->answer1,
                                 'answer2'=>$QuestionbankQuestion->answer2,
                                 'answer3'=>$QuestionbankQuestion->answer3,
                                 'answer4'=>$QuestionbankQuestion->answer4,
                                 'is_essay'=>$QuestionbankQuestion->is_essay,
                                 'degree'=>$QuestionbankQuestion->degree,
                                 
                                 
                                 ]; 
                                 }
                                 } 
                                 
                                  
                                 
                                 if($allsetquestionbank->medium!=0){
                                    $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"medium")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->medium)->inRandomOrder()->get();
                                    foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                    $questions[]=[
                                    'id'=>$QuestionbankQuestion->id,
                                    'question'=>$QuestionbankQuestion->question,
                                    'answer1'=>$QuestionbankQuestion->answer1,
                                    'answer2'=>$QuestionbankQuestion->answer2,
                                    'answer3'=>$QuestionbankQuestion->answer3,
                                    'answer4'=>$QuestionbankQuestion->answer4,
                                    'is_essay'=>$QuestionbankQuestion->is_essay,
                                    'degree'=>$QuestionbankQuestion->degree,
                                 
                                    
                                    ]; 
                                    }
                                    } 
                                    if($allsetquestionbank->hard!=0){
                                       $QuestionbankQuestions = QuestionbankQuestion::where('difficulty',"hard")->where('category_id',$allsetquestionbank->category_id)->limit($allsetquestionbank->medium)->inRandomOrder()->get();
                                       foreach($QuestionbankQuestions as $QuestionbankQuestion){
                                       $questions[]=[
                                       'id'=>$QuestionbankQuestion->id,
                                       'question'=>$QuestionbankQuestion->question,
                                       'answer1'=>$QuestionbankQuestion->answer1,
                                       'answer2'=>$QuestionbankQuestion->answer2,
                                       'answer3'=>$QuestionbankQuestion->answer3,
                                       'answer4'=>$QuestionbankQuestion->answer4,
                                       'is_essay'=>$QuestionbankQuestion->is_essay,
                                       'degree'=>$QuestionbankQuestion->degree,
                                 
                                       
                                       ]; 
                                       }
                                       } 
                                    }
                                    
                                  
                                                 }
                                 
                                     $n_allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('exam_id',$exam->id)->count();
                                         if($n_allnoncategroeyQuestionbankQuestions>0){
                                          $allnoncategroeyQuestionbankQuestions = QuestionbankQuestion::where('exam_id',$exam->id)->get();
                                 foreach($allnoncategroeyQuestionbankQuestions as $allnoncategroeyQuestionbankQuestion){
                                    $questions[]=[
                                       'id'=>$allnoncategroeyQuestionbankQuestion->id,
                                       'question'=>$allnoncategroeyQuestionbankQuestion->question,
                                       'answer1'=>$allnoncategroeyQuestionbankQuestion->answer1,
                                       'answer2'=>$allnoncategroeyQuestionbankQuestion->answer2,
                                       'answer3'=>$allnoncategroeyQuestionbankQuestion->answer3,
                                       'answer4'=>$allnoncategroeyQuestionbankQuestion->answer4,
                                       'is_essay'=>$allnoncategroeyQuestionbankQuestion->is_essay,
                                       'degree'=>$allnoncategroeyQuestionbankQuestion->degree,
                                 
                                       
                                       ]; 
                                 }
                                         }
                                         $choosequestions = [];
                                         $essayquestions = [];
                                 
                                     $n=1;
                                         foreach($questions as $question){
                                          if($question['is_essay']==0){
                                             $is_selected=0;
                                             
                                             $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->where('q_id',$question['id'])->count();
                                            $ans=NULL;
                                             if($n_stdanswer==1){
                                                $is_selected=1;
                                                $stdanswer = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->where('q_id',$question['id'])->first();
                                                 if($stdanswer->student_answer=="answer1"){
                                                $ans="A";
                                                }elseif($stdanswer->student_answer=="answer2"){
                                                   $ans="B";
                                                }elseif($stdanswer->student_answer=="answer3"){
                                                   $ans="C";
                                                }elseif($stdanswer->student_answer=="answer4"){
                                                   $ans="D";
                                 
                                                }
                                             }
                                             $choosequestions[] = [
                                                'n' => $n++,
                                                'id' => $question['id'],
                                                'question' => $question['question'],
                                                'answers'=>[
                                                    ['answer' => $question['answer1'],
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
                                                  'selected_answer'=>$ans,
                                                  'degree' => $question['degree'],
                                 
                                        
                                            ];
                                          }
                                    else{
                                       $essayquestions[] = [
                                          'id' => $question['id'],
                                          'question' => $question['question'],
                                          'degree' => $question['degree'],
                                 
                                 
                                      ];
                                    }
                                 
                                         }
                                  
                                 
                                         $exam_details = [
                                          'id' => $exam->id,
                                          'title' => $exam->name,
                                          'duration' => $exam->duration,
                                 
                                 
                                      ];
                                         $response = [
                                          'essayquestions' => $essayquestions,
                                          'quiz' => $exam_details,         
                                          'choosequestions' => $choosequestions,         
                                          'message' => "success",
                                          'status' => true,
                                      
                                        ];
                                        return response($response, 201);
                              }else{
                                 $response = [
                                    'message' => 'You have already taken the exam',
                                    'status' => false,
                                
                                  ];
                                  return response($response, 403);
                              }
                
                                         
                             }
               
                     
                           
                          }
               
                                      }
                      
     
                                                      
                                                    
                                                    
                                                       
                                                             
                     }   

                     public function updateanswerexam(Request $request) {
      
                        $n_exam = Trialexam::where('id',$request->lecture_id)->count();
                        if($n_exam==0){
                           $response = [
                              'message' => 'No exam found',
                              'status' => false,
                                          ];
                                          return response($response, 200);
                        }else{
                           $exam = Trialexam::where('id',$request->lecture_id)->first();
if($exam->points==0&&$exam->price==0){
  

$exam = Trialexam::where('id',$request->lecture_id)->first();
$n_Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->count();
if($n_Studentresult==0){
 if($request->id==NULL){
    $response = [
       'message' => "id required",
       'status' => false,
                   ];
      return response($response, 403);             

 }
 if($request->order==NULL){
    $response = [
       'message' => "order required",
       'status' => false,
                   ];   
                   return response($response, 403);             

 }
 $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$request->id)->where('student_id',auth()->user()->id)->count();
if($n_stdanswer==0){
$ans=null;
if($request->order=="A"){
$ans="answer1";
}elseif($request->order=="B"){
$ans="answer2";
}elseif($request->order=="C"){
$ans="answer3";

}elseif($request->order=="D"){
$ans="answer4";

}
$Studentanswer = Studentanswer::create(
[
'q_id' => $request->id,
'student_answer' => $ans,
'student_id' => auth()->user()->id,
'exam_id' =>$exam->id,
'n' => $request->n,



]
);
$response = [
'message' => "The answer has been added successfully",
'status' => true,
    ];
    return response($response, 200);   
}else{
$currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$request->id)->where('student_id',auth()->user()->id)->first();
$ans=null;
if($request->order=="A"){
$ans="answer1";
}elseif($request->order=="B"){
$ans="answer2";
}elseif($request->order=="C"){
$ans="answer3";

}elseif($request->order=="D"){
$ans="answer4";

}
$stdanswer=Studentanswer::find($currstdanswer->id);
     
 $stdanswer->update([
     'student_answer' => $ans,

 ]);
 $response = [
    'message' => "The answer has been successfully edited",
    'status' => true,
                ];
                return response($response, 200);    
}



}
else{
 $response = [
    'message' => "You cannot edit the answer",
    'status' => false,
                ];
                return response($response, 403);             
}

}else{
   $n_buying = Historyexam::where('exam_id',$request->lecture_id)->where('student_id',auth()->user()->id)->count();
   if($n_buying==0){
      $response = [
      'message' => 'You must purchase the exam first',
     'status' => false,
                 ];
                 return response($response, 200);
                           }


$exam = Trialexam::where('id',$request->lecture_id)->first();
$n_Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->count();
if($n_Studentresult==0){
 if($request->id==NULL){
    $response = [
       'message' => "id required",
       'status' => false,
                   ];
      return response($response, 403);             

 }
 if($request->order==NULL){
    $response = [
       'message' => "order required",
       'status' => false,
                   ];   
                   return response($response, 403);             

 }
 $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$request->id)->where('student_id',auth()->user()->id)->count();
if($n_stdanswer==0){
$ans=null;
if($request->order=="A"){
$ans="answer1";
}elseif($request->order=="B"){
$ans="answer2";
}elseif($request->order=="C"){
$ans="answer3";

}elseif($request->order=="D"){
$ans="answer4";

}
$Studentanswer = Studentanswer::create(
[
'q_id' => $request->id,
'student_answer' => $ans,
'student_id' => auth()->user()->id,
'exam_id' =>$exam->id,
'n' => $request->n,



]
);
$response = [
'message' => "The answer has been added successfully",
'status' => true,
    ];
    return response($response, 200);   
}else{
$currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$request->id)->where('student_id',auth()->user()->id)->first();
$ans=null;
if($request->order=="A"){
$ans="answer1";
}elseif($request->order=="B"){
$ans="answer2";
}elseif($request->order=="C"){
$ans="answer3";

}elseif($request->order=="D"){
$ans="answer4";

}
$stdanswer=Studentanswer::find($currstdanswer->id);
     
 $stdanswer->update([
     'student_answer' => $ans,

 ]);
 $response = [
    'message' => "The answer has been successfully edited",
    'status' => true,
                ];
                return response($response, 200);    
}



}
else{
 $response = [
    'message' => "You cannot edit the answer",
    'status' => false,
                ];
                return response($response, 403);             
}

}
                        
                                   
                   
                             }
                            }

 
                                  
              public function submitexam(Request $request) {
               $n_exam = Trialexam::where('id',$request->lecture_id)->count();

               if($n_exam==0){
                  $response = [
                    'message' => "The exam does not exist",
                  'status' => false,
                    ];
                 return response($response, 200);

                         } 
                         else{
                           $exam = Trialexam::where('id',$request->lecture_id)->first();
                        if($exam->price==0&&$exam->points==0){

                           $exam = Trialexam::where('id',$request->lecture_id)->first();
                           $n_Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->count();
                          
                           if($n_Studentresult==0){
                             $correct_dgree = 0;
                 $totalDegree = 0;
     
                 $nfail=0;
     
     
                            foreach($request->answers as $answer){
                             $question = QuestionbankQuestion::where('id',$answer['id'])->first();
                             $totalDegree=$totalDegree+$question->degree;
                             $ans=null;
                             if($answer['order']=="A"){
                                $ans="answer1";
                             }elseif($answer['order']=="B"){
                                $ans="answer2";
                             }elseif($answer['order']=="C"){
                                $ans="answer3";
                             
                             }elseif($answer['order']=="D"){
                                $ans="answer4";
                             
                             }
                             if ($ans == $question->correct_answer) {
                                $correct_dgree=$correct_dgree+$question->degree;
                            }
                         
                             }
                           
                      
        $per=0;
        $per=round($correct_dgree/$totalDegree*100,2);
       
          if($per>=$exam->success_rate){
            foreach($request->answers as $answer){
          
            $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->count();
            if($n_stdanswer==1){
               $currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->first();
               $ans=null;
               if($answer['order']=="A"){
                  $ans="answer1";
               }elseif($answer['order']=="B"){
                  $ans="answer2";
               }elseif($answer['order']=="C"){
                  $ans="answer3";
               
               }elseif($answer['order']=="D"){
                  $ans="answer4";
               
               }
                  $stdanswer=Studentanswer::find($currstdanswer->id);
                                  
                              $stdanswer->update([
                                  'student_answer' => $ans,
                
                              ]);
            }else{
               $ans=null;
               if($answer['order']=="A"){
                  $ans="answer1";
               }elseif($answer['order']=="B"){
                  $ans="answer2";
               }elseif($answer['order']=="C"){
                  $ans="answer3";
               
               }elseif($answer['order']=="D"){
                  $ans="answer4";
               
               }
     
               $is_ex=Studentanswer::where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->where('exam_id',$exam->id)->count();
     if($is_ex==0){
        $Studentanswer = Studentanswer::create(
           [
             'q_id' => $answer['id'],
             'student_answer' => $ans,
             'student_id' => auth()->user()->id,
             'exam_id' =>$exam->id,
             'n' => $answer['n'],
          ]
         );
     }
            
                
            }
           }     
     
           $is_exQuizresult=Studentresult::where('student_id',auth()->user()->id)->where('exam_id',$exam->id)->count();
     if($is_exQuizresult==0){
      
         Studentresult::create(
           [
             'assignment_degree' => $totalDegree,
             'student_degree' => $correct_dgree,
             'student_id' => auth()->user()->id,
             'exam_id' =>$exam->id,
     
           ]
         
         );
     }
        
             }
             else{
              $nfail=0;
              $count_correctfail=0;
              foreach($request->answers as $answer){
                  $currentquestion = QuestionbankQuestion::where('id',$answer['id'])->first();
       
                 $std_ans=null;
                 if($answer['order']=="A"){
                    $std_ans="A";
                 }elseif($answer['order']=="B"){
                    $std_ans="B";
                    }elseif($answer['order']=="C"){
                       $std_ans="C";   
                 }elseif($answer['order']=="D"){
                    $std_ans="D";   
                 }  
                 
                 $correct_ans=null;
                 if($currentquestion->correct_answer=="answer1"){
                    $correct_ans="A";
                 }elseif($currentquestion->correct_answer=="answer2"){
                    $correct_ans="B";
                    }elseif($currentquestion->correct_answer=="answer3"){
                       $correct_ans="C";   
                 }elseif($currentquestion->correct_answer=="answer4"){
                    $correct_ans="D";   
                 } 
              $is_correct=0;
             
              if($correct_ans==$std_ans){
                 $is_correct=1;
                 $count_correctfail++;
              
              }
     
                 $questionsansfail[]=[
                    'id' => $answer['id'],
                    'n' => $nfail,
                    'question'=> $currentquestion->question,
                    'answers'=>[
                       ['answer' => $currentquestion->answer1,
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
          
     
                 $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->count();
                 if($n_stdanswer==1){
                    $currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->first();
                    $ans=null;
                    if($answer['order']=="A"){
                       $ans="answer1";
                    }elseif($answer['order']=="B"){
                       $ans="answer2";
                    }elseif($answer['order']=="C"){
                       $ans="answer3";
                    
                    }elseif($answer['order']=="D"){
                       $ans="answer4";
                    
                    }
                        Studentanswer::find($currstdanswer->id)->delete();
             
                                
                 } 
                 $nfail++;
     
                }    
     
     
             }
     
                          
                           $answers = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->get();
                      
                           $questionsans=[];
                           $n=0;
                           $count_correct=0;
        
        foreach($answers as $answer){
           $ans1=null;
         
           $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();
        
           $std_ans=null;
           if($answer->student_answer=="answer1"){
              $std_ans="A";
           }elseif($answer->student_answer=="answer2"){
              $std_ans="B";
              }elseif($answer->student_answer=="answer3"){
                 $std_ans="C";   
           }elseif($answer->student_answer=="answer4"){
              $std_ans="D";   
           }  
           
           $correct_ans=null;
           if($currentquestion->correct_answer=="answer1"){
              $correct_ans="A";
           }elseif($currentquestion->correct_answer=="answer2"){
              $correct_ans="B";
              }elseif($currentquestion->correct_answer=="answer3"){
                 $correct_ans="C";   
           }elseif($currentquestion->correct_answer=="answer4"){
              $correct_ans="D";   
           } 
        $is_correct=0;
        if($correct_ans==$std_ans){
           $is_correct=1;
           $count_correct=$count_correct+1;
        
        }
         
           $questionsans[]=[
              'id' => $answer->q_id,
              'n' => $answer->n,
              'question'=> $answer->question->question,
              'answers'=>[
                 ['answer' => $answer->question->answer1,
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
              'correct_answer' =>$correct_ans ,
              'degree' => $currentquestion->degree,
              'student_answer' => $std_ans,
              'is_correct' => $is_correct,
        
           ];
       
           
          $n++;
        }
        if($per>=$exam->success_rate){
           $Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->first();
            $count_wrong=$n-$count_correct;
           $data=[
              'questions'=>$questionsans,
               'student_degree' =>$Studentresult->student_degree,
               'degree' =>$Studentresult->assignment_degree,
               'percentage' =>$per ,
               'count_wrong'=>$count_wrong,
               'count_correct'=>$count_correct,
               'number_questions'=>$n,
               'is_faild'=>0
     
           ];
      
           $response = [
              'data' => $data,
              'message' => "Congratulations ",
     
              'status' => false,
                          ];
                          return response($response, 200);    
                              }
                              else{
                                 $count_wrongfail=$nfail-$count_correctfail;
     
                                $data=[
                                   'questions'=>$questionsansfail,
                                    'student_degree' =>$correct_dgree,
                                    'degree' =>$totalDegree,
                                    'percentage' =>$per ,
                                    'number_questions' =>$nfail ,
                                    'count_wrong'=>$count_wrongfail,
                                    'count_correct'=>$count_correctfail,
                                    'is_faild'=>1
                                
                                ];
     
               $response = [
                 'data' => $data,
     
                  'status' => true,
               ];
            return response($response, 200);  
                              }
        }
     
     
                           else{
                              $response = [
                                 'message' => "I have already taken the exam previously",
                                 'status' => false,
                                             ];
                                             return response($response, 403);             
                           }
                      
                        }else{
                           $n_buying = Historyexam::where('exam_id',$request->lecture_id)->where('student_id',auth()->user()->id)->count();
                           if($n_buying==0&&$exam->price>0){
                              $response = [
                             'message' => "You must purchase the exam first.",
                             'status' => false,
                                         ];
                                         return response($response, 200);
                                  } 
                        }
                         }
                         

              
               
                      $exam = Trialexam::where('id',$request->lecture_id)->first();
                      $n_Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->count();
                     
                      if($n_Studentresult==0){
                        $correct_dgree = 0;
            $totalDegree = 0;

            $nfail=0;


                       foreach($request->answers as $answer){
                        $question = QuestionbankQuestion::where('id',$answer['id'])->first();
                        $totalDegree=$totalDegree+$question->degree;
                        $ans=null;
                        if($answer['order']=="A"){
                           $ans="answer1";
                        }elseif($answer['order']=="B"){
                           $ans="answer2";
                        }elseif($answer['order']=="C"){
                           $ans="answer3";
                        
                        }elseif($answer['order']=="D"){
                           $ans="answer4";
                        
                        }
                        if ($ans == $question->correct_answer) {
                           $correct_dgree=$correct_dgree+$question->degree;
                       }
                    
                        }
                      
                 
   $per=0;
   $per=round($correct_dgree/$totalDegree*100,2);
  
     if($per>=$exam->success_rate){
       foreach($request->answers as $answer){
     
       $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->count();
       if($n_stdanswer==1){
          $currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->first();
          $ans=null;
          if($answer['order']=="A"){
             $ans="answer1";
          }elseif($answer['order']=="B"){
             $ans="answer2";
          }elseif($answer['order']=="C"){
             $ans="answer3";
          
          }elseif($answer['order']=="D"){
             $ans="answer4";
          
          }
             $stdanswer=Studentanswer::find($currstdanswer->id);
                             
                         $stdanswer->update([
                             'student_answer' => $ans,
           
                         ]);
       }else{
          $ans=null;
          if($answer['order']=="A"){
             $ans="answer1";
          }elseif($answer['order']=="B"){
             $ans="answer2";
          }elseif($answer['order']=="C"){
             $ans="answer3";
          
          }elseif($answer['order']=="D"){
             $ans="answer4";
          
          }

          $is_ex=Studentanswer::where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->where('exam_id',$exam->id)->count();
if($is_ex==0){
   $Studentanswer = Studentanswer::create(
      [
        'q_id' => $answer['id'],
        'student_answer' => $ans,
        'student_id' => auth()->user()->id,
        'exam_id' =>$exam->id,
        'n' => $answer['n'],
     ]
    );
}
       
           
       }
      }     

      $is_exQuizresult=Studentresult::where('student_id',auth()->user()->id)->where('exam_id',$exam->id)->count();
if($is_exQuizresult==0){
 
    Studentresult::create(
      [
        'assignment_degree' => $totalDegree,
        'student_degree' => $correct_dgree,
        'student_id' => auth()->user()->id,
        'exam_id' =>$exam->id,

      ]
    
    );
}
   
        }
        else{
         $nfail=0;
         $count_correctfail=0;
         foreach($request->answers as $answer){
             $currentquestion = QuestionbankQuestion::where('id',$answer['id'])->first();
  
            $std_ans=null;
            if($answer['order']=="A"){
               $std_ans="A";
            }elseif($answer['order']=="B"){
               $std_ans="B";
               }elseif($answer['order']=="C"){
                  $std_ans="C";   
            }elseif($answer['order']=="D"){
               $std_ans="D";   
            }  
            
            $correct_ans=null;
            if($currentquestion->correct_answer=="answer1"){
               $correct_ans="A";
            }elseif($currentquestion->correct_answer=="answer2"){
               $correct_ans="B";
               }elseif($currentquestion->correct_answer=="answer3"){
                  $correct_ans="C";   
            }elseif($currentquestion->correct_answer=="answer4"){
               $correct_ans="D";   
            } 
         $is_correct=0;
        
         if($correct_ans==$std_ans){
            $is_correct=1;
            $count_correctfail++;
         
         }

            $questionsansfail[]=[
               'id' => $answer['id'],
               'n' => $nfail,
               'question'=> $currentquestion->question,
               'answers'=>[
                  ['answer' => $currentquestion->answer1,
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
     

            $n_stdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->count();
            if($n_stdanswer==1){
               $currstdanswer = Studentanswer::where('exam_id',$exam->id)->where('q_id',$answer['id'])->where('student_id',auth()->user()->id)->first();
               $ans=null;
               if($answer['order']=="A"){
                  $ans="answer1";
               }elseif($answer['order']=="B"){
                  $ans="answer2";
               }elseif($answer['order']=="C"){
                  $ans="answer3";
               
               }elseif($answer['order']=="D"){
                  $ans="answer4";
               
               }
                   Studentanswer::find($currstdanswer->id)->delete();
        
                           
            } 
            $nfail++;

           }    


        }

                     
                      $answers = Studentanswer::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->get();
                 
                      $questionsans=[];
                      $n=0;
                      $count_correct=0;
   
   foreach($answers as $answer){
      $ans1=null;
    
      $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();
   
      $std_ans=null;
      if($answer->student_answer=="answer1"){
         $std_ans="A";
      }elseif($answer->student_answer=="answer2"){
         $std_ans="B";
         }elseif($answer->student_answer=="answer3"){
            $std_ans="C";   
      }elseif($answer->student_answer=="answer4"){
         $std_ans="D";   
      }  
      
      $correct_ans=null;
      if($currentquestion->correct_answer=="answer1"){
         $correct_ans="A";
      }elseif($currentquestion->correct_answer=="answer2"){
         $correct_ans="B";
         }elseif($currentquestion->correct_answer=="answer3"){
            $correct_ans="C";   
      }elseif($currentquestion->correct_answer=="answer4"){
         $correct_ans="D";   
      } 
   $is_correct=0;
   if($correct_ans==$std_ans){
      $is_correct=1;
      $count_correct=$count_correct+1;
   
   }
    
      $questionsans[]=[
         'id' => $answer->q_id,
         'n' => $answer->n,
         'question'=> $answer->question->question,
         'answers'=>[
            ['answer' => $answer->question->answer1,
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
         'correct_answer' =>$correct_ans ,
         'degree' => $currentquestion->degree,
         'student_answer' => $std_ans,
         'is_correct' => $is_correct,
   
      ];
  
      
     $n++;
   }
   if($per>=$exam->success_rate){
      $Studentresult = Studentresult::where('exam_id',$exam->id)->where('student_id',auth()->user()->id)->first();
       $count_wrong=$n-$count_correct;
      $data=[
         'questions'=>$questionsans,
          'student_degree' =>$Studentresult->student_degree,
          'degree' =>$Studentresult->assignment_degree,
          'percentage' =>$per ,
          'count_wrong'=>$count_wrong,
          'count_correct'=>$count_correct,
          'number_questions'=>$n,
          'is_faild'=>0

      ];
 
      $response = [
         'data' => $data,
         'message' => "Congratulations ",

         'status' => false,
                     ];
                     return response($response, 200);    
                         }
                         else{
                            $count_wrongfail=$nfail-$count_correctfail;

                           $data=[
                              'questions'=>$questionsansfail,
                               'student_degree' =>$correct_dgree,
                               'degree' =>$totalDegree,
                               'percentage' =>$per ,
                               'number_questions' =>$nfail ,
                               'count_wrong'=>$count_wrongfail,
                               'count_correct'=>$count_correctfail,
                               'is_faild'=>1
                           
                           ];

          $response = [
            'data' => $data,

             'status' => true,
          ];
       return response($response, 200);  
                         }
   }


                      else{
                         $response = [
                            'message' => "I have already taken the exam previously",
                            'status' => false,
                                        ];
                                        return response($response, 403);             
                      }
                 
                          
          
                    
                   }                              
                   public function getmodelanswer($id){
                     $n_Trialexam = Trialexam::where('id',$id)->count();      
                  if($n_Trialexam==0){
                     $response = [
                        'message' => "The exam does not exist",
                        'status' => true,
                    
                      ];
                      return response($response, 403);
                  }else{
                     $Trialexam = Trialexam::where('id',$id)->first();      
                  if($Trialexam->v_model==0){
                     $response = [
                        'message' => "The model answer  is not available now",
                        'status' => false,
                    
                      ];
                      return response($response, 200);
                  }
               
                     
                        $answers = Studentanswer::where('exam_id',$Trialexam->id)->where('student_id',auth()->user()->id)->get();
                                   
                        $questionsans=[];
                        $n=0;
                        $count_correct=0;
                     
                     foreach($answers as $answer){
                     $ans1=null;
                     
                     $currentquestion = QuestionbankQuestion::where('id', $answer->q_id)->first();
                     
                     $std_ans=null;
                     if($answer->student_answer=="answer1"){
                     $std_ans="A";
                     }elseif($answer->student_answer=="answer2"){
                     $std_ans="B";
                     }elseif($answer->student_answer=="answer3"){
                     $std_ans="C";   
                     }elseif($answer->student_answer=="answer4"){
                     $std_ans="D";   
                     }  
                     
                     $correct_ans=null;
                     if($currentquestion->correct_answer=="answer1"){
                     $correct_ans="A";
                     }elseif($currentquestion->correct_answer=="answer2"){
                     $correct_ans="B";
                     }elseif($currentquestion->correct_answer=="answer3"){
                     $correct_ans="C";   
                     }elseif($currentquestion->correct_answer=="answer4"){
                     $correct_ans="D";   
                     } 
                     $is_correct=0;
                     if($correct_ans==$std_ans){
                     $is_correct=1;
                     $count_correct=$count_correct+1;
                     
                     }
        
                  
            
                     $questionsans[]=[
                     'id' => $answer->q_id,
                     'n' => $answer->n,
                     'question'=> $answer->question->question,
                     'answers'=>[
                     ['answer' => $answer->question->answer1,
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
                     'correct_answer' =>$correct_ans ,
                     'degree' => $currentquestion->degree,
                     'student_answer' => $std_ans,
                     'is_correct' => $is_correct,
 
                  
                   
                     ];
                     
                     
                     $n++;
                     }
                     $response = [
                        'message' => "success",
                        'data'=>$questionsans,
                        'status' => true,
                     
                      ];
                      return response($response, 200);
                      
                     
                  }
                  
                  
                    
                  }
                  }