<?php

namespace App\Http\Controllers\Api\Student;

use App\Models\Admin;
 use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\QuestionbankCategory;
use App\Models\QuestionbankQuestion;


use Illuminate\Http\Request;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class QuestionbanksdController extends Controller
{
   public function allcategories() {
      $categories=[];
      
        $all_categories = QuestionbankCategory::where('stage',auth()->user()->stage)->get();
        $n_categories = QuestionbankCategory::where('stage',auth()->user()->stage)->count();
     
     if($n_categories==0){
        $response = [
            'message' => "We don't have category",
           'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($all_categories as $category){
 
           $categories[]=[
              'n'=> $i++,
              'key'=>$category->id,
              'name'=>$category->name,
              'created_at'=>date("F j, Y, g:i a",strtotime($category->created_at)),
      
     
           ];
        
        }
        $response = [
           'data' => $categories,
           'message' => "success",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
       
       
     
     
        
            }
    
   
 
 
          

 

        public function questionsbycategory($id) {
          
            $n_all_categories = QuestionbankCategory::where('stage',auth()->user()->stage)->where('id',$id)->count();
if($n_all_categories==1){

  $all_questions = QuestionbankQuestion::where('category_id',$id)->where('is_essay',0)->get();
  $n_questions = QuestionbankQuestion::where('category_id',$id)->where('is_essay',0)->count();

 if($n_questions==0){
  $response = [
      'message' => "We don't have questions for this category",
     'status' => false,
 
   ];
   return response($response, 200);
}else{
  $questions=[];

  $i=1;
  foreach($all_questions as $question){
    
    $correct_ans=null;
    if($question->correct_answer=="answer1"){
       $correct_ans="A";
    }elseif($question->correct_answer=="answer2"){
       $correct_ans="B";
       }elseif($question->correct_answer=="answer3"){
          $correct_ans="C";   
    }elseif($question->correct_answer=="answer4"){
       $correct_ans="D";   
    } 


    $questions[]=[
      'id' => $question->id,
      'n' => $i++,
      'question'=> $question->question,
      'answers'=>[
         [
          'answer' => $question->answer1,
          'order' => "A",
         ],
          [
           'answer' => $question->answer2,
           'order' => "B",
          ],       
         [
          'answer' => $question->answer3,
         'order' => "C",
     ],
   [
     'answer' => $question->answer4,
      'order' => "D",
      ],
   ],
      'correct_answer'=>$correct_ans,
      'difficulty'=>$question->difficulty,
      'is_essay'=>$question->is_essay,

   ];
   

 
  
  }
  
  $QuestionbankCategory = QuestionbankCategory::where('id',$id)->first();

  $response = [
     'data' => $questions,
     'message' => "success",
     'name'=>$QuestionbankCategory->name,
     'status' => true,
 
   ];
   return response($response, 201);

}
}else{
  $response = [
   'message' => "This category does not exist",
   'status' => false,

 ];
 return response($response, 200);

}
    
         
        }
 

 

          }
