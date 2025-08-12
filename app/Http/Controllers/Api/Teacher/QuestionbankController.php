<?php

namespace App\Http\Controllers\Api\Teacher;

use App\Models\Admin;
 use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\QuestionbankCategory;
use App\Models\QuestionbankQuestion;


use Illuminate\Http\Request;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class QuestionbankController extends Controller
{
   public function allcategories() {
      $categories=[];
      
        $all_categories = QuestionbankCategory::all();
        $n_categories = QuestionbankCategory::count();
     
     if($n_categories==0){
        $response = [
            'message' => "We don't have category",
           'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($all_categories as $category){
          
          $n_easy = QuestionbankQuestion::where('difficulty','easy')->where('category_id',$category->id)->count();
          $n_medium = QuestionbankQuestion::where('difficulty','medium')->where('category_id',$category->id)->count();
          $n_hard = QuestionbankQuestion::where('difficulty','hard')->where('category_id',$category->id)->count();
          $n_essay = QuestionbankQuestion::where('is_essay',1)->where('category_id',$category->id)->count();
          $total = QuestionbankQuestion::where('category_id',$category->id)->count();

           $categories[]=[
              'n'=> $i++,
              'key'=>$category->id,
              'name'=>$category->name,
              'stage'=>$category->stage,
              'easy'=>$n_easy,
              'medium'=>$n_medium,
              'hard'=>$n_hard,
              'n_essay'=>$n_essay,
              'total'=>$total,
              'edu_type'=>$category->edu_type,
              'section'=>$category->section,

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
    
   

       public function updatecategory(Request $request) {
         $id = $request->id;
         $n_category = QuestionbankCategory::where('id',$id)->count();
if($n_category==0){
   $response = [
      'message' => " Category does not exist ",
     'status' => false,
 
   ];
   return response($response, 404);
}
else{
   $QuestionbankCategory=QuestionbankCategory::find($id);

   $QuestionbankCategory->update([
       'name' => $request->name,
       'stage'=>$request->stage,
       'edu_type'=>$request->edu_type,
       'section'=>$request->section,

       
       
   ]);

   $response = [
       'message' => "The category has been updated  ",
      'status' => true,
  
    ];
    return response($response, 201);

 
}
         
       
       }


       public function deletecategory(Request $request) {
         $id = $request->id;
         $n_category = QuestionbankCategory::where('id',$id)->count();
if($n_category==0){
   $response = [
      'message' => " Category does not exist ",
     'status' => false,
 
   ];
   return response($response, 404);
}
else{
  QuestionbankCategory::find($id)->delete();
   $response = [
       'message' => "Deleted successfully",
      'status' => true,
  
    ];
    return response($response, 201);

}
         
       
       }
          


       public function createcategory(Request $request) {
        // return $request;
          try {
            //Validated
           $validateUser = Validator::make($request->all(), 
           [
             'name' => 'required|string|max:255',
             'stage' => 'required|string',
             ],
           [
  
             'name.required' => 'Name is required',
             'stage.required' => 'Stage is required',
    
             
         ],
         [
             'name' => 'Name ',
             'stage' => 'Stage is required',
     
 
     
         ]
         );
     
           if($validateUser->fails()){
               return response()->json([
                   'status' => false,
                   'message' => 'validation error',
                   'errors' => $validateUser->errors()
               ], 403);
           }
        
        
           $QuestionbankCategory = QuestionbankCategory::create(
             [
               'name' => $request->name,
               'stage' => $request->stage,
                'section' => $request->section,

  
               
  
            ]
           );
   
  
   
           return response()->json([
               'status' => true,
               'message' => 'Category created successfully',
            ], 200);
 
       } catch (\Throwable $th) {
           return response()->json([
               'status' => 500,
               'message' => $th->getMessage()
           ], 500);
       }
        }

        public function questionsbycategory($id) {
          $questions=[];
      
          $all_questions = QuestionbankQuestion::where('category_id',$id)->get();
          $n_questions = QuestionbankQuestion::where('category_id',$id)->count();
       
       if($n_questions==0){
          $response = [
              'message' => "We don't have any questions for this category",
             'status' => false,
         
           ];
           return response($response, 200);
       }else{
          $i=1;
          foreach($all_questions as $question){
            
            $OTP = NULL;
            $playbackInfo = NULL;
          if($question->platform=="vdocipher"){
            $curl = curl_init();
                 
            curl_setopt_array($curl, array(
            CURLOPT_URL => "https://dev.vdocipher.com/api/videos/".$question->vdo_id."/otp",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode([
            'annotate' => json_encode([[
            'type'=>'rtext',
            'text'=> auth()->user()->name,
            'alpha'=>'0.15',
            'color'=>'0xFF0000',
            'size'=>'35',
            'interval'=>'155000'
            ]]),
            ]),
            CURLOPT_HTTPHEADER => array(
            "Accept: application/json",
            "Authorization: Apisecret C1TaATRDzU6xvup4qx3flAMhOt3VVomQfPhKcudskZesxtMUkjTDT2yfuxatrNlD",
            "Content-Type: application/json"
            
            ),
            ));
            
            $response = curl_exec($curl);
            $err = curl_error($curl);
            
            curl_close($curl);
            
            if ($err) {
            echo "cURL Error #:" . $err;
            } else {
            
            //echo $response;
            $OTP = json_decode($response)->otp;
            $playbackInfo = json_decode($response)->playbackInfo;
            }
          }
  
          
             $questions[]=[
                'n'=> $i++,
                'key'=>$question->id,
                'question'=>$question->question,
                'answer1'=>$question->answer1,
                'answer2'=>$question->answer2,
                'answer3'=>$question->answer3,
                'answer4'=>$question->answer4,
                'correct_answer'=>$question->correct_answer,
                'difficulty'=>$question->difficulty,
                'is_essay'=>$question->is_essay,
                'created_at'=>date("F j, Y, g:i a",strtotime($question->created_at)),
        
                'degree'=>$question->degree,
                'OTP'=>$OTP,
                'playbackInfo'=>$playbackInfo,
                'platform'=>$question->platform,
                'vdo_id'=>$question->vdo_id,
                'hint'=>$question->hint,


                
                
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
         
        }

        public function addessayquestion($id,Request $request) {
          $n_category = QuestionbankCategory::where('id',$id)->count();
       
          if($n_category==0){
             $response = [
                 'message' => "This category does not exist",
                'status' => false,
            
              ];
              return response($response, 200);
          }else{

             try {
              //Validated
             $validateUser = Validator::make($request->all(), 
             [
               'question' => 'required|string',
               'difficulty' => 'required|string',
               'degree' => 'required|string',
               'vdo_id' => 'nullable|string',
               'platform' => 'nullable|string',
               ],

               [
                'question.required' => 'Question is required',
                'difficulty.required' => 'Difficulty level is required',
                'degree.required' => 'Question score is required',
            ],

            [
                'question' => 'Question',
                'difficulty' => 'Difficulty level',
                'degree' => 'Question score',

            ]
            
           );
       
             if($validateUser->fails()){
                 return response()->json([
                     'status' => false,
                     'message' => 'validation error',
                     'errors' => $validateUser->errors()
                 ], 403);
             }
          
             if($request->platform=="vdocipher"){
              $curl = curl_init();
                   
              curl_setopt_array($curl, array(
              CURLOPT_URL => "https://dev.vdocipher.com/api/videos/".$request->vdo_id."/otp",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => json_encode([
              'annotate' => json_encode([[
              'type'=>'rtext',
              'text'=> auth()->user()->name,
              'alpha'=>'0.15',
              'color'=>'0xFF0000',
              'size'=>'35',
              'interval'=>'155000'
              ]]),
              ]),
              CURLOPT_HTTPHEADER => array(
              "Accept: application/json",
              "Authorization: Apisecret C1TaATRDzU6xvup4qx3flAMhOt3VVomQfPhKcudskZesxtMUkjTDT2yfuxatrNlD",
              "Content-Type: application/json"
              
              ),
              ));
              
              $response = curl_exec($curl);
              $err = curl_error($curl);
              
              curl_close($curl);
           
              if ($err) {
              echo "cURL Error #:" . $err;
              } else {

                if(!isset(json_decode($response)->otp)){
                  return response()->json([
                   'status' => false,          
                   'message' => "The video is not available on vdocipher !",
                 ], 403);
               
             }

        
          
          
              }
            }
             $QuestionbankQuestion = QuestionbankQuestion::create(
               [
                 'question' => $request->question,
                 'difficulty' => $request->difficulty,
                 'is_essay' => 1,
                 'category_id'=>$id,
                 'degree' => $request->degree,
                 'vdo_id' => $request->vdo_id,
                 'platform' => $request->platform,
                 'hint' => $request->hint,

                 
              ]
             );
     
    
     
         return response()->json([
       'status' => true,
        'message' => 'Question created successfully',
            ], 200);

   
         } catch (\Throwable $th) {
             return response()->json([
                 'status' => 500,
                 'message' => $th->getMessage()
             ], 500);
         }
        }
          }



          public function addchoosequestion($id,Request $request) {
            $n_category = QuestionbankCategory::where('id',$id)->count();
         
            if($n_category==0){
               $response = [
                   'message' => "This category does not exist",
                  'status' => false,
              
                ];
                return response($response, 200);
            }else{
  
               try {
                //Validated
               $validateUser = Validator::make($request->all(), 

               [

                 'question' => 'required|string',
                 'difficulty' => 'required|string',
                 'answer1' => 'required|string',
                 'answer2' => 'required|string',
                 'answer3' => 'required|string',
                 'answer4' => 'required|string',
                 'correct_answer' => 'required|string',
                 'degree' => 'required|string',

                 ],

                 [
                  'question.required' => 'Question is required',
                  'difficulty.required' => 'Difficulty level is required',
                  'answer1.required' => 'First answer is required',
                  'answer2.required' => 'Second answer is required',
                  'answer3.required' => 'Third answer is required',
                  'answer4.required' => 'Fourth answer is required',
                  'correct_answer.required' => 'Correct answer is required',
                  'degree.required' => 'Degree is required',

              ],

              [
                  'question' => 'Question',
                  'difficulty' => 'Difficulty level',
                  'answer1' => 'First answer',
                  'answer2' => 'Second answer',
                  'answer3' => 'Third answer',
                  'answer4' => 'Fourth answer',
                  'correct_answer' => 'Correct answer',
                  'degree' => 'Question degree',

              ]
              
             );
         
               if($validateUser->fails()){
                   return response()->json([
                       'status' => false,
                       'message' => 'validation error',
                       'errors' => $validateUser->errors()
                   ], 403);
               }
               if($request->platform=="vdocipher"){
                $curl = curl_init();
                     
                curl_setopt_array($curl, array(
                CURLOPT_URL => "https://dev.vdocipher.com/api/videos/".$request->vdo_id."/otp",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => json_encode([
                'annotate' => json_encode([[
                'type'=>'rtext',
                'text'=> auth()->user()->name,
                'alpha'=>'0.15',
                'color'=>'0xFF0000',
                'size'=>'35',
                'interval'=>'155000'
                ]]),
                ]),
                CURLOPT_HTTPHEADER => array(
                "Accept: application/json",
                "Authorization: Apisecret C1TaATRDzU6xvup4qx3flAMhOt3VVomQfPhKcudskZesxtMUkjTDT2yfuxatrNlD",
                "Content-Type: application/json"
                
                ),
                ));
                
                $response = curl_exec($curl);
                $err = curl_error($curl);
                
                curl_close($curl);
             
                if ($err) {
                echo "cURL Error #:" . $err;
                } else {
                  if(!isset(json_decode($response)->otp)){
                    return response()->json([
                     'status' => false,          
                     'message' => "The video is not available on vdocipher !",
                   ], 403);
                 
               }
            
            
                }
              }
            
               $QuestionbankQuestion = QuestionbankQuestion::create(
                 [
                   'question' => $request->question,
                   'difficulty' => $request->difficulty,
                   'is_essay' => 0,
                   'category_id'=>$id,
                   'answer1' => $request->answer1,
                   'answer2' => $request->answer2,
                   'answer3' => $request->answer3,
                   'answer4' => $request->answer4,
                   'correct_answer' => $request->correct_answer,
                   'degree' => $request->degree,
                   'vdo_id'=>$request->vdo_id,
                   'platform'=>$request->platform,
                   'hint'=>$request->hint,


                   
                ]
               );
       
      
               
               return response()->json([
                'status' => true,
                'message' => 'Question created successfully',
            ], 200);
            
     
           } catch (\Throwable $th) {
               return response()->json([
                   'status' => 500,
                   'message' => $th->getMessage()
               ], 500);
           }
          }
            }



            public function deletequestion(Request $request) {
              $id = $request->id;
              $n_category = QuestionbankQuestion::where('id',$id)->count();
     if($n_category==0){
        $response = [
           'message' => " Question not found ",
          'status' => false,
      
        ];
        return response($response, 404);
     }
     else{
      QuestionbankQuestion::find($id)->delete();
        $response = [
            'message' => "Deleted successfully",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
              
            
            }




            public function editquestion(Request $request) {
              $id = $request->id;
              $n_question = QuestionbankQuestion::where('id',$id)->count();
     if($n_question==0){
        $response = [
           'message' => " Question not found ",
          'status' => false,
      
        ];
        return response($response, 404);
     }
     else{
        $QuestionbankQuestion=QuestionbankQuestion::find($id);
        if($QuestionbankQuestion->is_essay==1){

          if($request->platform=="vdocipher"){
            $curl = curl_init();
                 
            curl_setopt_array($curl, array(
            CURLOPT_URL => "https://dev.vdocipher.com/api/videos/".$request->vdo_id."/otp",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode([
            'annotate' => json_encode([[
            'type'=>'rtext',
            'text'=> auth()->user()->name,
            'alpha'=>'0.15',
            'color'=>'0xFF0000',
            'size'=>'35',
            'interval'=>'155000'
            ]]),
            ]),
            CURLOPT_HTTPHEADER => array(
            "Accept: application/json",
            "Authorization: Apisecret C1TaATRDzU6xvup4qx3flAMhOt3VVomQfPhKcudskZesxtMUkjTDT2yfuxatrNlD",
            "Content-Type: application/json"
            
            ),
            ));
            
            $response = curl_exec($curl);
            $err = curl_error($curl);
            
            curl_close($curl);
         
            if ($err) {
            echo "cURL Error #:" . $err;
            } else {
              if(!isset(json_decode($response)->otp)){
                return response()->json([
                 'status' => false,          
                 'message' => "The video is not available on vdocipher !",
               ], 403);
             
           }
        
        
            }
          }
          $QuestionbankQuestion->update([
            'question' => $request->question,
            'difficulty'=>$request->difficulty,
            'degree'=>$request->degree,
            'vdo_id'=>$request->vdo_id,
            'platform'=>$request->platform,
            'hint'=>$request->hint,

            
        ]);
        }else{
          if($request->platform=="vdocipher"){
            $curl = curl_init();
                 
            curl_setopt_array($curl, array(
            CURLOPT_URL => "https://dev.vdocipher.com/api/videos/".$request->vdo_id."/otp",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode([
            'annotate' => json_encode([[
            'type'=>'rtext',
            'text'=> auth()->user()->name,
            'alpha'=>'0.15',
            'color'=>'0xFF0000',
            'size'=>'35',
            'interval'=>'155000'
            ]]),
            ]),
            CURLOPT_HTTPHEADER => array(
            "Accept: application/json",
            "Authorization: Apisecret C1TaATRDzU6xvup4qx3flAMhOt3VVomQfPhKcudskZesxtMUkjTDT2yfuxatrNlD",
            "Content-Type: application/json"
            
            ),
            ));
            
            $response = curl_exec($curl);
            $err = curl_error($curl);
            
            curl_close($curl);
         
      //   return json_decode($response);
             if ($err) {
            echo "cURL Error #:" . $err;
            } else {
              if(!isset(json_decode($response)->otp)){
               return response()->json([
                'status' => false,          
                'message' => "The video is not available on vdocipher !",
              ], 403);
            
          }
        
            }
          }
          $QuestionbankQuestion->update([
            'question' => $request->question,
            'answer1'=>$request->answer1,
            'answer2'=>$request->answer2,
            'answer3'=>$request->answer3,
            'answer4'=>$request->answer4,
            'correct_answer'=>$request->correct_answer,
            'difficulty'=>$request->difficulty,
            'degree'=>$request->degree,
            'vdo_id'=>$request->vdo_id,
            'platform'=>$request->platform,
            'hint'=>$request->hint,

            
        ]);
        }
      
     
        $response = [
            'message' => " Question updated successfully ",
           'status' => true,
       
         ];
         return response($response, 201);
     
      
     }
              
            
            }  
            
            

            public function getquestion($id) {
              $question=[];               
                $QuestionbankQuestion = QuestionbankQuestion::where('id',$id)->first();
                $n_QuestionbankQuestion = QuestionbankQuestion::where('id',$id)->count();
             
             if($n_QuestionbankQuestion==0){
                $response = [
                    'message' => " Question not found ",
                   'status' => false,
               
                 ];
                 return response($response, 404);
             }else{
                   $question=[
                       'key'=>$QuestionbankQuestion->id,
                      'question'=>$QuestionbankQuestion->question,
                      'answer1'=>$QuestionbankQuestion->answer1,
                      'answer2'=>$QuestionbankQuestion->answer2,
                      'answer3'=>$QuestionbankQuestion->answer3,
                      'answer4'=>$QuestionbankQuestion->answer4,
                      'correct_answer'=>$QuestionbankQuestion->correct_answer,
                      'difficulty'=>$QuestionbankQuestion->difficulty,
                      'is_essay'=>$QuestionbankQuestion->is_essay,
                      'category_id'=>$QuestionbankQuestion->category_id,
                      'degree'=>$QuestionbankQuestion->degree,

                      'vdo_id'=>$QuestionbankQuestion->vdo_id,
                      'platform'=>$QuestionbankQuestion->platform,
                      'hint'=>$QuestionbankQuestion->hint,

                      'created_at'=>date("F j, Y, g:i a",strtotime($QuestionbankQuestion->created_at)),
              
             
                      
                   ];
                
                 
                $response = [
                   'data' => $question,
                   'message' => "success",
                   'status' => true,
               
                 ];
                 return response($response, 201);
             
             }
               
               
             
             
                
                    }

                    public function categoryinfo($id) {
                      $getexam=[];
                  
                      $category = QuestionbankCategory::where('id',$id)->first();
                      $n_category = QuestionbankCategory::where('id',$id)->count();
                   
                   if($n_category==0){
                      $response = [
                          'message' => "Category not found",
                         'status' => false,
                     
                       ];
                       return response($response, 200);
                   }else{
                         $getexam=[
                          'key'=>$category->id,
                          'name'=>$category->name,
                           'stage'=>$category->stage,
                           'section'=>$category->section,

                          
                   
                         ];
                      
                
                      $response = [
                         'data' => $getexam,
                         'message' => "success",
                         'status' => true,
                     
                       ];
                       return response($response, 201);
                   
                   }
                     
                    }
      
          }
