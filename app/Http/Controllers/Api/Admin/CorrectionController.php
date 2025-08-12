<?php

namespace App\Http\Controllers\Api\Admin;

use DB;
 use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Models\Admin;
 use Illuminate\Http\Request;
use App\Models\Group;
use App\Models\Message;
use App\Models\Student;
use App\Models\Homework;
use App\Models\Trialexam;
use App\Models\Studentanswer;
use Spatie\Permission\Models\Role;
use App\Models\Essaycorrection;

use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;




class CorrectionController extends Controller
{
   public function index() {

      $countstudents =DB::table('student_answers')
      ->select('student_id','id')
      ->groupBy('student_id')
      ->where('is_correct',0)
      ->count(); 
 if($countstudents==0){
   $response = [
      'message' => "There are no students",
      'status' => false,

  ];
     return response($response, 200);
}else{
   $allstudents=[];

   $students = DB::table('student_answers')
   ->select('student_id')
   ->where('is_correct', 0)
   ->groupBy('student_id')
 
   ->get();
   $i=0;
 foreach($students as $student){
   $n_student = Student::where('id',$student->student_id)->count();
if($n_student==1){
   $student_det = Student::where('id',$student->student_id)->first();
   $i++;
   $allstudents[]=[
      'n'=> $i,
      'id'=>$student->student_id,
       'name'=>$student_det->first_name." ".$student_det->second_name." ".$student_det->third_name ,
       'stage'=>$student_det->stage,

   ];
}
  
}

$response = [
    'status' => true,
    'data'=>$allstudents

  ];
  return response($response, 200);

 
}

  

    
       
     
     
        
            }
     
    
            
            public function getquestion($id) {
 
               $student_found = Studentanswer::where('is_correct',0)->where('student_id',$id)->count();

         if($student_found==0){
            $response =[
    'message' => "There are no questions for the student that need to be graded",
    'status' => false,

];
              return response($response, 200);
         }else{
            $allassignments=[];
            $examsanswers = DB::table('student_answers')
            ->select('student_id', DB::raw('MIN(id) as id'), 'exam_id')
            ->where('is_correct', 0)
            ->whereNotNull('exam_id')
            ->where('student_id', $id)
            ->groupBy('exam_id', 'student_id')
            ->get();
            $i=0;
          foreach($examsanswers as $examsanswer){
            $n_exam = Trialexam::where('id',$examsanswer->exam_id)->count();
         if($n_exam==1){
            $exam_det = Trialexam::where('id',$examsanswer->exam_id)->first();
         
            $i++;
            $allassignments[]=[
               'n'=> $i,
               'id'=>$exam_det->id,
                'name'=>$exam_det->name ,
                'typename'=>'Exam',
                'type'=>'exam'

          
            ];
         }
           
         }
         
         $quizsanswers =DB::table('student_answers')
         ->select('student_id', DB::raw('MIN(id) as id'), 'quiz_id')
         ->where('is_correct', 0)
         ->whereNotNull('quiz_id')
         ->where('student_id', $id)
         ->groupBy('quiz_id', 'student_id')
         ->get();
        
       foreach($quizsanswers as $quizanswer){
         $n_quiz = Quiz::where('id',$quizanswer->quiz_id)->count();
      if($n_quiz==1){
         $quiz_det = Quiz::where('id',$quizanswer->quiz_id)->first();
      
         $i++;
         $allassignments[]=[
            'n'=> $i,
            'id'=>$quiz_det->id,
             'name'=>$quiz_det->lecture->title ,
             'type'=>'quiz',
             'typename'=>'Quiz' ,

         ];
      }
        
      }


      $homeworksanswers =DB::table('student_answers')
      ->select('student_id', DB::raw('MIN(id) as id'), 'homework_id')
      ->where('is_correct', 0)
      ->whereNotNull('homework_id')
      ->where('student_id', $id)
      ->groupBy('homework_id', 'student_id')
      ->get();
    
    foreach($homeworksanswers as $homeworksanswer){
      $n_homework = Homework::where('id',$homeworksanswer->homework_id)->count();
   if($n_homework==1){
      $homework_det = Homework::where('id',$homeworksanswer->homework_id)->first();
   
      $i++;
      $allassignments[]=[
         'n'=> $i,
         'id'=>$homework_det->id,
         'name'=>$homework_det->lecture->title ,
         'type'=>'homework' ,
         'typename'=>'Homework' ,

      ];
   }
     
   }
         $response = [
             'status' => true,
             'data'=>$allassignments
         
           ];
           return response($response, 200);
         
          
         }

                     }
    public function getallquestions($student_id,$type,$assignment) {
 if($type=="exam"){
   $n_examsanswers  = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('exam_id',$assignment)->count();

if($n_examsanswers>0){
   $examsanswers = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('exam_id',$assignment)->get();
$assignments=[];
   foreach($examsanswers as $examsanswer){
   $assignments[]=[
      'id'=>$examsanswer->id,
      'question'=>$examsanswer->question->question,
      'answer'=>$examsanswer->student_answer,
      'degree'=>$examsanswer->question->degree,
      'draft'=>"https://api.prodigy-online.com/uploads/drafts/".$examsanswer->draft,

   ];
}
    $response = [
             'status' => true,
             'data'=>$assignments
         
           ];
           return response($response, 200);
}else{
   $response = [
    'message' => "No questions available",
    'status' => false,

];
     return response($response, 200);
}
 }elseif($type=="homework"){
   $n_examsanswers  = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('homework_id',$assignment)->count();

   if($n_examsanswers>0){
      $examsanswers = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('homework_id',$assignment)->get();
   $assignments=[];
      foreach($examsanswers as $examsanswer){
      $assignments[]=[
         'id'=>$examsanswer->id,
         'question'=>$examsanswer->question->question,
         'answer'=>$examsanswer->student_answer,
         'degree'=>$examsanswer->question->degree,
         'draft'=>"https://api.prodigy-online.com/uploads/drafts/".$examsanswer->draft,

      ];
   }
       $response = [
                'status' => true,
                'data'=>$assignments
            
              ];
              return response($response, 200);
   }else{
      $response = [
         'message' => "No questions available",
         'status' => false,
      
        ];
        return response($response, 200);
   }
 }elseif($type=="quiz"){
   $n_examsanswers  = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('quiz_id',$assignment)->count();

   if($n_examsanswers>0){
      $examsanswers = Studentanswer::where('is_correct',0)->where('student_id',$student_id)->where('quiz_id',$assignment)->get();
   $assignments=[];
      foreach($examsanswers as $examsanswer){
      $assignments[]=[
         'id'=>$examsanswer->id,
         'question'=>$examsanswer->question->question,
         'answer'=>$examsanswer->student_answer,
         'degree'=>$examsanswer->question->degree,
         'draft'=>"https://api.prodigy-online.com/uploads/drafts/".$examsanswer->draft,

      ];
   }
       $response = [
                'status' => true,
                'data'=>$assignments
            
              ];
              return response($response, 200);
   }else{
      $response = [
         'message' => " No questions available",
         'status' => false,
      
        ];
        return response($response, 200);
   }
 }else{
   $response =[
      'message' => "Invalid selection",
      'status' => false,

  ];
     return response($response, 200);
 }
    }
    public function correct(request $request) {
      $n_examsanswers  = Studentanswer::where('is_correct',0)->where('id',$request->id)->count();
if($n_examsanswers==0){
   $response = [
    'message' => "The question does not exist",
    'status' => false,

];
     return response($response, 200);
}else{
   $n_Essaycorrection  = Essaycorrection::where('student_answer_id',$request->id)->count();
if($n_Essaycorrection==0){
   $Studentanswer  = Studentanswer::where('is_correct',0)->where('id',$request->id)->first();

   
   if(!empty($request->draft)){
      $newimgname=time(). '-' . rand(111,9999).'.'.
      $request->draft->extension();
      $request->draft->move(public_path('uploads/drafts'),$newimgname);

    }
   $Essaycorrection = Essaycorrection::create(
      [
        'student_answer_id' => $request->id,
        'degree' => $request->degree,
        'description' => $request->description,
         'comment' => $request->comment,
         'draft' => $newimgname,

     ]
    );

    $Studentanswer->update([
      'is_correct' => 1,
  ]);

  $response = [
    'message' => "Grading completed successfully",
    'status' => true,

];
  return response($response, 200);
}else{
   $response =[
    'message' => "The question has already been graded",
    'status' => false,
    
];
     return response($response, 200);
}
}
      
    }

    public function getquestiondetails($id) {
      $n_studentanswer  = Studentanswer::where('is_correct',0)->where('id',$id)->count();

      if($n_studentanswer==0){
         $response = [
            'message' => "Answer not found",
            'status' => false,
         
           ];
           return response($response, 200);
      }else{
      $Studentanswer  = Studentanswer::where('is_correct',0)->where('id',$id)->first();

      $answers=[
         'id'=>$Studentanswer->id,
         'question'=>$Studentanswer->question->question,
         'answer'=>$Studentanswer->student_answer,
         'degree'=>$Studentanswer->question->degree,
         'draft'=>"https://api.prodigy-online.com/uploads/drafts/".$Studentanswer->draft,

      ];

      $response = [
         'status' => true,
         'data'=>$answers
     
       ];
       return response($response, 200);
    }
   }
    }
