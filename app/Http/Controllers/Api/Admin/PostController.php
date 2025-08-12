<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
 use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Post;
use Illuminate\Http\Request;
 
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;




class PostController extends Controller
{
   public function posts() {
      $posts=[];
      
        $all_Posts = Post::all();
        $n_post = Post::count();
     
     if($n_post==0){
        $response = [
          'message' => "We don't have any posts",
          'status' => false,
       
         ];
         return response($response, 200);
     }else{
        $i=1;
        foreach($all_Posts as $post){
           $posts[]=[
              'n'=> $i++,
              'key'=>$post->id,
               'content'=>$post->content,
               'stage'=>$post->stage,
               'created_at'=>date("F j, Y, g:i a",strtotime($post->created_at)),

           ];

        
        }
        $response = [
           'data' => $posts,
           'message' => "success",
           'status' => true,
       
         ];
         return response($response, 201);
     
     }
       
       
     
     
        
            }
    
   
            public function getpost($id) {
               $post=[];
               
                 $n_post = Post::where('id',$id)->count();
              
              if($n_post==0){
                 $response = [
                   'message' => "Post not found",
                   'status' => false,
                
                  ];
                  return response($response, 200);
              }else{
               $get_post = Post::where('id',$id)->first();
                       $post=[
                        'key'=>$get_post->id,
                        'content'=>$get_post->content,
                        'stage'=>$get_post->stage,
                        'created_at'=>date("F j, Y, g:i a",strtotime($get_post->created_at)),

                    ];
                 
              
                 $response = [
                    'data' => $post,
                    'message' => "success",
                    'status' => true,
                
                  ];
                  return response($response, 201);
              
              }
                
                
              
              
                 
                     }
      


       public function delete(Request $request) {
         $id = $request->id;
         $n_post = Post::where('id',$id)->count();
if($n_post==0){
   $response = [
      'message' => "The post not found",
      'status' => false,
 
   ];
   return response($response, 401);
}
else{
 
 
 Post::find($id)->delete();
   $response = [
    'message' => "Deleted successfully",
    'status' => true,
  
    ];
    return response($response, 201);

}
         
       
       }
          


       public function addpost(Request $request) {
       
        try {
                   //Validated
         $validateUser = Validator::make($request->all(), 
         [
          'content' => 'required',
          'stage' => 'required',

 
           ],

           [
            'content.required' => 'Content is required',
            'stage.required' => 'Academic year is required',
        ],

        [
            'content' => 'Content',
            'stage' => 'Academic year',
        ]
        
       );
   
         if($validateUser->fails()){
             return response()->json([
                 'status' => false,
                 'message' => 'validation error',
                 'errors' => $validateUser->errors()
             ], 403);
         }
    
         Post::create([
            'stage' =>$request->stage,

             'content' =>$request->content,
         ]);
 
         
          $response = [
    'message' => "Post added successfully",
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
          


  public function edit(Request $request) {
   $id = $request->id;
   $n_post = Post::where('id',$id)->count();
if($n_post==0){
   $response =[
    'message' => "The post does not exist",
    'status' => false,

             ];
     return response($response, 401);
}else{
 
   try {
      //Validated
$validateUser = Validator::make($request->all(), 
[
'content' => 'required',
'stage' => 'required',


],

[
   'content.required' => 'Content is required',
   'stage.required' => 'Academic year is required',
],

[
   'content' => 'Content',
   'stage' => 'Academic year',
]

);

if($validateUser->fails()){
return response()->json([
    'status' => false,
    'message' => 'validation error',
    'errors' => $validateUser->errors()
], 403);
}
$post=Post::find($id);

$post->update([
   'stage' => $request->stage,
   'content'=>$request->content,
 
]);

 
$response =[
   'message' => "Successfully updated",
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
     

    }
