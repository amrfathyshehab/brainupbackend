<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
 use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Review;
use Illuminate\Http\Request;
 
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;




class ReviewController extends Controller
{
   public function reviews() {
      $Reviews=[];
      
        $all_Review = Review::all();
        $n_Review = Review::count();
     
     if($n_Review==0){
        $response = [
          'message' => " No student images found  ",
          'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($all_Review as $review){
         
        
         
           $Reviews[]=[
              'n'=> $i++,
     
              'key'=>$review->id,
               'src'=>"https://api.yallafrench.com/uploads/reviews/".$review->img,

       
     
           ];
        
        }
        $response = [
           'data' => $Reviews,
           'message' => "success",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
       
       
     
     
        
            }
    
   

      


       public function delete(Request $request) {
         $id = $request->id;
         $n_Review = Review::where('id',$id)->count();
if($n_Review==0){
   $response = [
    'message' => "Image not found",
    'status' => false,
 
   ];
   return response($response, 401);
}
else{
 
 
 Review::find($id)->delete();
   $response = [
    'message' => "Deleted successfully",
    'status' => true,
  
    ];
    return response($response, 201);

}
         
       
       }
          


       public function addreview(Request $request) {
       
        try {
                   //Validated
         $validateUser = Validator::make($request->all(), 
         [
          'img' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',

 
           ],
         [
 
          'img.required' => 'Image required',
          'img.max' => 'Image must be less 5 MB',
          'img.mimes' => 'Image must be jpg , jpeg',
            
       ],
       [
        'img' => 'Image ',

         
                               
       ]
       );
   
         if($validateUser->fails()){
             return response()->json([
                 'status' => false,
                 'message' => 'validation error',
                 'errors' => $validateUser->errors()
             ], 403);
         }
         $newimgname=time(). '-' . rand(111,999).'.'.
         $request->img->extension();
         $request->img->move(public_path('uploads/reviews'),$newimgname);
     
         
         review::create([
     
             'img' =>$newimgname,
         ]);
   
          $response = [
             'message' => "Added successfully",
             'status' => true,
        
          ];
          return response($response, 201);
         
        }
        catch (\Throwable $th) {
          return response()->json([
              'status' => false,
              'message' => $th->getMessage()
          ], 200);
        }
        

  }
          

    }
