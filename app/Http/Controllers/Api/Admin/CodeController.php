<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Code;
 use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\History;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;


class CodeController extends Controller
{
   public function codes() {
      $Codes=[];
      
        $all_codes = Code::all();
        $n_codes = Code::count();
     
     if($n_codes==0){
        $response = [
            'message' => "We don't have codes",
           'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($all_codes as $code){
         
        
         
           $Codes[]=[
              'n'=> $i++,
     
              'key'=>$code->id,
               'code'=>$code->code,
              'price'=>$code->price,
 
              'created_at'=>date("F j, Y, g:i a",strtotime($code->created_at)),
      
     
           ];
        
        }
        $response = [
           'data' => $Codes,
           'message' => "success",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
       
       
     
     
        
            }
    
   

       public function update(Request $request) {
         $id = $request->id;
         $n_code = Code::where('id',$id)->count();
if($n_code==0){
   $response = [
      'message' => "Code not found",
     'status' => false,
 
   ];
   return response($response, 401);
}
else{
   $Code=Code::find($id);

   $Code->update([
       'code' => $request->code,
       'price'=>$request->price
   ]);

   $response = [
       'message' => "The code has been editted",
      'status' => true,
  
    ];
    return response($response, 201);

 
}
         
       
       }


       public function delete(Request $request) {
         $id = $request->id;
         $n_code = Code::where('id',$id)->count();
if($n_code==0){
   $response = [
      'message' => "The code does not exist",
     'status' => false,
 
   ];
   return response($response, 401);
}
else{
   Code::find($id)->delete();
   $response = [
       'message' => "Deleted successfully",
      'status' => true,
  
    ];
    return response($response, 201);

}
         
       
       }
          


       public function create(Request $request) {
        try {
          //Validated
         $validateUser = Validator::make($request->all(), 
         [
           'type' => 'required|string|max:255',
           'length' => 'required',
           'count' => 'required',
           'price' => 'required',
 
           ],
         [

           'type.required' => 'Code type is required',
           'length.required' => 'Code length required',
           'count.required' => 'Number of codes required',
           'price.required' => 'Code price required',
 
           
            
       ],
       [
           'type' => 'Code type ',
           'length' => 'Code length',
           'count' => 'Number of codes',
           'price' => 'Code price',
 

           
                               
       ]
       );
   
         if($validateUser->fails()){
             return response()->json([
                 'status' => false,
                 'message' => 'validation error',
                 'errors' => $validateUser->errors()
             ], 403);
         }
         if($request->type=="char"){
          $chars = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghkmnpqrstuvwxyz";
          $code=[];
          $res = "";
          for ($k = 0; $k < $request->count; $k++) {
          
       
              for ($i = 0; $i < $request->length; $i++) {
                  $res .= $chars[mt_rand(0, strlen($chars)-1)];
           
              
              }
       
              $new_code=Code::create([
                  'price' =>$request->price,
                  'code' =>$res,

                  
                  'created_at' =>date('Y-m-d H:i:s'),
          
              
              ]);
        
          $codes[]=[
          'id'=>$new_code->id,
          'code'=>$new_code->code,
         ]; 
          }
          $response = [
             'message' => "Created successfully",
             'data' =>$codes,
            'status' => true,
        
          ];
          return response($response, 201);
        }
        elseif($request->type=="numbers"){
          $chars = "123456789";
          $res = "";
          $code=[];
       
          for ($k = 0; $k < $request->count; $k++) {
       
              for ($i = 0; $i < $request->length; $i++) {
                  $res .= $chars[mt_rand(0, strlen($chars)-1)];
           
              
              }
              $new_code=Code::create([
                  'price' =>$request->price,
                  'code' =>$res,

                  'created_at' =>date('Y-m-d H:i:s'),
          
              
              ]);
        
               $codes[]=[
                'id'=>$new_code->id,
                'code'=>$new_code->code,
               ]; 
          }
          $response = [
             'message' => "Created successfully",
             'data' =>$codes,
       
            'status' => true,
        
          ];
          return response($response, 201);
        }
        elseif($request->type=="mixed"){
          $chars = "123456789ABCDEFGHJKMNPQRSTUVWXYZabcdefghkmnpqrstuvwxyz";
          $res = "";
          $code=[];
       
          for ($k = 0; $k < $request->count; $k++) {
            $res=NULL;

              for ($i = 0; $i < $request->length; $i++) {
                  $res .= $chars[mt_rand(0, strlen($chars)-1)];
           
              
              }
              $new_code=Code::create([
                  'price' =>$request->price,
                  'code' =>$res,

                  'created_at' =>date('Y-m-d H:i:s'),
          
              
              ]);
        
              $codes[]=[
                'id'=>$new_code->id,
                'code'=>$new_code->code,
               ]; 
          }
          $response = [
             'message' => "Created successfully",
             'data' =>$codes,
       
            'status' => true,
        
          ];
          return response($response, 201);
        }
       else{
          $response = [
             'message' => "The choice is wrong",
            'status' => false,
        
          ];
          return response($response, 401);
       }
      } catch (\Throwable $th) {
        return response()->json([
            'status' => false,
            'message' => $th->getMessage()
        ], 200);
    }

    
      }
      
      public function codetracker(Request $request) {
    
          $n_code = Code::where('id',$request->code_id)->count();
          if($n_code==1){
            $code = Code::where('id',$request->code_id)->first();
        
            $response = [
              'message' => "The code has not been used before and the code is ".$code->code,
             'status' => false,
         
           ];
           return response($response, 201);
          } 
          else{
            $n_trashcode=Code::withTrashed()->where('id',$request->code_id)->count();
        if($n_trashcode==0){
          $response = [
            'message' => "The code not found",
           'status' => false,
        
         ];
         return response($response, 201);
         
        }
        else{
          $trashcode=Code::withTrashed()->where('id',$request->code_id)->first();
          $n_code_history = History::where('code_id',$trashcode->id)->count();
        
          if($n_code_history==1){
            $code_history = History::where('code_id',$trashcode->id)->first();
        
            $response = [
              'message' => "The code is already used by ".$code_history->student->first_name.' '.$code_history->student->second_name.' '.$code_history->student->third_name." in ".$code_history->lecture->title,              
             'status' => true,
          
           ];
           return response($response, 201);
          }
        
        
        
        }
        
            
          }
         
        
      
      
      
      }     
          }
