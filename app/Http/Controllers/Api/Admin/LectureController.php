<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Quiz;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Video;
use App\Models\Chapter;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\Homework;
use App\Models\Attachment;
use Illuminate\Http\Request;
use App\Models\Studentresult;
use App\Models\SetsbankQuestion;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use App\Models\QuestionbankCategory;
use App\Models\QuestionbankQuestion;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;



class LectureController extends Controller
{

  public function alllecture($id)
  {
    $alllectures = [];

    $all_Lectures = Lecture::whereNull('chapter_id')->where('teacher_id', $id)->get();
    $all_Chapter = Chapter::where('teacher_id', $id)->get();

    $n_Lectures = Lecture::where('teacher_id', $id)->count();
    $n_Chapter = Chapter::where('teacher_id', $id)->count();

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

  public function addlecture(Request $request)
  {
    // return $request;
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'title' => 'required|string|max:255',
          'stage' => 'required',
          'description' => 'string|max:255',
          'price' => 'required|string',
          'views' => 'required|string',
          'expired_at' => 'required|string',
          'img' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120',

        ],
        [

          'title.required' => 'Name is required',
          'stage.required' => 'Stage is required',
          'price.required' => 'Price is required',
          'views.required' => 'Number of views is required',
          'expired_at.required' => 'The number of days until the lecture expires is required',
          'img.required' => 'Image is required',
          'img.max' => 'Image must not exceed 50 MB',
          'img.mimes' => 'Image must be in jpg, jpeg format',

        ],

        [
          'title' => 'Name',
          'stage' => 'Stage is required',
          'price' => 'Price',
          'description' => 'Description',
          'views' => 'Number of views',
          'expired_at' => 'Number of days until the lecture expires',
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
      if ($request->stage == 2 || $request->stage == 3) {
        $section = $request->section;
      }

      $Lecture = Lecture::create(
        [
          'title' => $request->title,
          'stage' => $request->stage,
          'description' => $request->description,
          'chapter_id' => $request->chapter_id,
          'price' => $request->price,
          'views' => $request->views,
          'expired_at' => $request->expired_at,
          'teacher_id' => $request->teacher_id,
          'img' => $newimgname,
          'edu_type' => $request->edu_type,
          'section' => $section,



        ]
      );



      return response()->json([
        'status' => true,
        'message' => 'Lecture created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => false,
        'message' => $th->getMessage()
      ], 200);
    }
  }

  public function addchapter(Request $request)
  {
    // return $request;
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'stage' => 'required',
          'description' => 'nullable|string|max:255',
          'img' => 'required|file|mimes:jpg,jpeg,png|max:50120',
          'section' => 'nullable|string|max:255',


        ],

        [
          'name.required' => 'Name is required',
          'stage.required' => 'Stage is required',
          'img.required' => 'Image is required',
          'img.max' => 'Image must not exceed 50 MB',
          'img.mimes' => 'Image must be in jpg, jpeg format',
          'img.file' => 'The file must be an image',
        ],

        [
          'name' => 'Name',
          'stage' => 'Stage',
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


      $Chapter = Chapter::create(
        [
          'name' => $request->name,
          'stage' => $request->stage,
          'description' => $request->description,
          'teacher_id' => $request->teacher_id,
          'img' => $newimgname,
          'edu_type' => $request->edu_type,
          'section' => $request->section,



        ]
      );



      return response()->json([
        'status' => true,
        'message' => 'chapter created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => false,
        'message' => $th->getMessage()
      ], 200);
    }
  }


  public function deletelecture(Request $request)
  {
    $id = $request->id;
    $n_lecture = Lecture::where('id', $id)->count();
    if ($n_lecture == 0) {
      $response = [
        'message' => "Lecture not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      Lecture::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function deletechapter(Request $request)
  {
    $id = $request->id;
    $n_chapter = Chapter::where('id', $id)->count();
    if ($n_chapter == 0) {
      $response = [
        'message' => "chapter not found",
        'status' => false,

      ];

      return response($response, 404);
    } else {
      Chapter::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function getlecture($id)
  {
    $lecture = [];

    $lecture = Lecture::where('id', $id)->first();
    $n_lecture = Lecture::where('id', $id)->count();

    if ($n_lecture == 0) {
      $response = [
        'message' => "Lecture not found",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $lecture = [
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
        'views' => $lecture->views,
        'section' => $lecture->section,

        'edu_type' => $lecture->edu_type,



      ];


      $response = [
        'data' => $lecture,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function getchapter($id)
  {
    $chapter = [];

    $chapter = Chapter::where('id', $id)->first();
    $n_chapter = Chapter::where('id', $id)->count();

    if ($n_chapter == 0) {
      $response = [
        'message' => " Lecture not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $chapter = [
        'key' => $chapter->id,
        'name' => $chapter->name,
        'description' => $chapter->description,
        'stage' => $chapter->stage,
        'visibility' => $chapter->visibility,
        'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $chapter->img,
        'edu_type' => $chapter->edu_type,
        'section' => $chapter->section,



        'created_by' => $chapter->teacher->name,
        'created_at' => date("F j, Y, g:i a", strtotime($chapter->created_at)),

      ];


      $response = [
        'data' => $chapter,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function getlecturebychapter($id)
  {
    $lectures = [];

    $chapter = Chapter::where('id', $id)->first();
    $n_chapter = Chapter::where('id', $id)->count();

    if ($n_chapter == 0) {
      $response = [
        'message' => " chapter not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $alllectures = Lecture::where('chapter_id', $id)->get();
      $i = 1;
      foreach ($alllectures as $lecture) {
        $lectures[] = [
          'n' => $i++,
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
          'edu_type' => $lecture->edu_type,
          'is_center' => $lecture->is_center,

          'section' => $lecture->section,



        ];
      }



      $response = [
        'data' => $lectures,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function updatelecture(Request $request)
  {
    $id = $request->id;
    $n_Lecture = Lecture::where('id', $id)->count();
    if ($n_Lecture == 0) {
      $response = [
        'message' => " Lecture not found ",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $Lecture = Lecture::find($id);
      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'title' => 'required|string|max:255',
            'stage' => 'required',
            'description' => 'nullable|string|max:255',
            'price' => 'required|string',
            'views' => 'required|string',
            'expired_at' => 'required|string',
            'img' => 'file|mimes:jpg,jpeg,png,gif|max:50120',



          ],

          [
            'title.required' => 'Name is required',
            'stage.required' => 'Stage is required',
            'price.required' => 'Price is required',
            'views.required' => 'Number of views is required',
            'expired_at.required' => 'The number of days until the lecture expires is required',
            'img.required' => 'Image is required',
            'img.max' => 'Image must not exceed 50 MB',
            'img.mimes' => 'Image must be in jpg, jpeg format',

          ],

          [
            'title' => 'Name',
            'stage' => 'Stage is required',
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
        $img = $Lecture->img;
        if (!empty($request->img)) {
          $newimgname = time() . '-' . rand(111, 999) . '.' .
            $request->img->extension();
          $request->img->move(public_path('uploads/lectures/images'), $newimgname);
          $img = $newimgname;
        }
        $section = NULL;
        if ($request->stage == 2 || $request->stage == 3) {
          $section = $request->section;
        }
        $Lecture->update([
          'title' => $request->title,
          'description' => $request->description,
          'stage' => $request->stage,
          'visibility' => $request->visibility,
          'img' => $img,
          'price' => $request->price,
          'v_hw' => $request->v_hw,
          'v_quiz' => $request->v_quiz,
          'expired_at' => $request->expired_at,
          'views' => $request->views,
          'section' => $section,
          'edu_type' => $request->edu_type,
          'section' => $request->section,


        ]);




        $response = [
          'message' => "Lecture updated",
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



  public function updatechapter(Request $request)
  {
    $id = $request->id;
    $n_Chapter = Chapter::where('id', $id)->count();

    if ($n_Chapter == 0) {
      return response()->json([
        'message' => "Chapter not found",
        'status' => false
      ], 404);
    } else {
      $Chapter = Chapter::find($id);
      try {
        // Validation
        $validateUser = Validator::make($request->all(), [
          'name' => 'required|string|max:255',
          'stage' => 'required',
          'description' => 'nullable|string|max:255',
          'img' => 'file|mimes:jpg,jpeg,png,gif|max:50120',
          'section' => 'nullable|string|max:255',

        ], [
          'name.required' => 'Name is required',
          'stage.required' => 'Stage is required',
          'img.max' => 'Image must not exceed 50 MB',
          'img.mimes' => 'Image must be in jpg, jpeg, png, or gif format',
        ]);

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'Validation error',
            'errors' => $validateUser->errors()
          ], 422);
        }

        $img = $Chapter->img;
        if (!empty($request->img)) {
          $newimgname = time() . '-' . rand(111, 999) . '.' . $request->img->extension();
          $request->img->move(public_path('uploads/lectures/images'), $newimgname);
          $img = $newimgname;
        }

        $Chapter->update([
          'name' => $request->name,
          'description' => $request->description,
          'stage' => $request->stage,
          'visibility' => $request->visibility,
          'img' => $img,
          'edu_type' => $request->edu_type,
          'section' => $request->section,

        ]);

        return response()->json([
          'message' => "Chapter updated",
          'status' => true
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => false,
          'message' => $th->getMessage()
        ], 500);
      }
    }
  }


  public function getvideos($id)
  {
    $allvideos = [];

    $n_lecture = Lecture::where('id', $id)->count();

    if ($n_lecture == 0) {
      $response = [
        'message' => " Lecture not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $videos = Video::where('lecture_id', $id)->get();
      foreach ($videos as $video) {

        $OTP = NULL;
        $playbackInfo = NULL;
        $status = 0;
        if ($video->platform == "vdocipher") {
          $curl = curl_init();

          curl_setopt_array($curl, array(
            CURLOPT_URL => "https://dev.vdocipher.com/api/videos/" . $video->vdo_id . "/otp",
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
              // Video not found
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
          $status = 1;
        }
        if ($status == 1) {
          $allvideos[] = [
            'key' => $video->id,
            'name' => $video->name,
            'description' => $video->description,
            'lecture_id' => $video->lecture_id,
            'is_public' => $video->is_public,
            'vdo_id' => $video->vdo_id,
            'platform' => $video->platform,
            'created_by' => $video->teacher->name,
            'otp' => $OTP,
            'playbackInfo' => $playbackInfo,

            'created_at' => date("F j, Y, g:i a", strtotime($video->created_at)),

          ];
        }
      }



      $response = [
        'data' => $allvideos,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function addvideo(Request $request)
  {
    // return $request;
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'description' => 'max:255',
          'platform' => 'required|string',
          'vdo_id' => 'required|string',
          'is_public' => 'required|string',

        ],

        [
          'name.required' => 'Name is required',
          'platform.required' => 'Platform is required',
          'vdo_id.required' => 'Video ID is required',
          'is_public.required' => 'Video type is required',
        ],

        [
          'name' => 'Name',
          'platform' => 'Platform',
          'vdo_id' => 'Video ID',
          'description' => 'Description',
          'is_public' => 'Video type',
        ]

      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      $lecture = Lecture::findorfail($request->lecture_id);



      $Video = Video::create(
        [
          'name' => $request->name,
          'description' => $request->description,
          'is_public' => $request->is_public,
          'vdo_id' => $request->vdo_id,
          'platform' => $request->platform,
          'lecture_id' => $request->lecture_id,
          'teacher_id' => $lecture->teacher_id,

        ]
      );



      return response()->json([
        'status' => true,
        'message' => 'Video created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => false,
        'message' => $th->getMessage()
      ], 200);
    }
  }


  public function updatevideo(Request $request)
  {
    $id = $request->id;
    $n_Video = Video::where('id', $id)->count();
    if ($n_Video == 0) {
      $response = [
        'message' => " Video not found ",
        'status' => false,

      ];
      return response($response, 404);
    } else {

      // return $request;
      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'name' => 'required|string|max:255',
            'description' => 'string|max:255',
            'platform' => 'required|string',
            'vdo_id' => 'required|string',
            'is_public' => 'required|string',

          ],

          [
            'name.required' => 'Name is required',
            'platform.required' => 'Platform is required',
            'vdo_id.required' => 'Video ID is required',
            'is_public.required' => 'Video type is required',
          ],

          [
            'name' => 'Name',
            'platform' => 'Platform',
            'vdo_id' => 'Video ID',
            'description' => 'Description',
            'is_public' => 'Video type',
          ]

        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }



        $Video = Video::find($id);



        $Video->update(
          [
            'name' => $request->name,
            'description' => $request->description,
            'is_public' => $request->is_public,
            'vdo_id' => $request->vdo_id,
            'platform' => $request->platform,

          ]
        );



        return response()->json([
          'status' => true,
          'message' => 'Video updated successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => false,
          'message' => $th->getMessage()
        ], 200);
      }
    }
  }



  public function deletevideo(Request $request)
  {
    $id = $request->id;
    $n_video = Video::where('id', $id)->count();
    if ($n_video == 0) {
      $response = [
        'message' => "Video not found  ",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      Video::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }



  public function getvideobyid($id)
  {

    $Video = Video::where('id', $id)->first();
    $n_video = Video::where('id', $id)->count();
    if ($n_video == 0) {
      $response = [
        'message' => " Video not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $video = Video::where('id', $id)->first();

      $video = [
        'key' => $video->id,
        'name' => $video->name,
        'description' => $video->description,
        'is_public' => $video->is_public,
        'platform' => $video->platform,
        'vdo_id' => $video->vdo_id,
        'lecture_id' => $video->lecture_id,
        'created_by' => $video->teacher->name,
        'created_at' => date("F j, Y, g:i a", strtotime($video->created_at)),


      ];




      $response = [
        'data' => $video,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function uploadattachment(Request $request)
  {
    $n_lecture = lecture::where('id', $request->id)->count();
    if ($n_lecture == 0) {
      return response()->json([
        'status' => false,
        'message' => ' Lecture not found ',
      ], 200);
    } else {
      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'address' => 'required|file|mimes:pdf,jpeg,png,jpg,gif,bmp,svg,webp|max:15360',
            'is_public' => 'required',


          ],
          [

            'address.required' => 'The file is required.',
            'address.max' => 'The file must not exceed 15 MB.',
            'address.mimes' => 'The file must be a PDF or images.',
            'address.file' => 'The file must be a valid file or images.',

          ],
          [
            'address' => ' the file ',
          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }
        $newfile = $request->address->getClientOriginalName();

        $lecture = Lecture::findorfail($request->id);


        $Attachment = Attachment::create(
          [
            'lecture_id' => $request->id,
            'teacher_id' => $lecture->teacher_id,
            'address' => $newfile,
            'is_public' => $request->is_public,


          ]
        );

        $request->address->move(public_path('uploads/lectures/attachments'), $newfile);


        return response()->json([
          'status' => true,
          'message' => 'File added successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => false,
          'message' => $th->getMessage()
        ], 200);
      }
    }
  }


  public function getlecturequiz($id)
  {
    $n_lecture = lecture::where('id', $id)->count();
    if ($n_lecture == 0) {
      $response = [
        'message' => " Lecture not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $n_quiz = Quiz::where('lecture_id', $id)->count();

      if ($n_quiz == 0) {
        $response = [
          'message' => " The lecture does not have an exam  ",
          'status' => false,
          'is_found' => 0,

        ];
        return response($response, 200);
      } else {
        $lecture_quiz = Quiz::where('lecture_id', $id)->first();
        $quiz_info[] = [
          'key' => $lecture_quiz->id,
          'visibility' => $lecture_quiz->visibility,
          'success_rate' => $lecture_quiz->success_rate,

          'duration' => $lecture_quiz->duration,
          'lecture_id' => $lecture_quiz->lecture_id,
        ];
      }

      $SetsbankQuestion = SetsbankQuestion::where('quiz_id', $lecture_quiz->id)->get();
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
      $Questionsbank = QuestionbankQuestion::where('quiz_id', $lecture_quiz->id)->get();
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

  public function getquiz($id)
  {

    $n_quiz = Quiz::where('id', $id)->count();

    if ($n_quiz == 0) {
      $response = [
        'message' => " Quiz not found  ",
        'status' => false,
      ];
      return response($response, 200);
    } else {
      $lecture_quiz = Quiz::where('id', $id)->first();
      $quiz = [
        'key' => $lecture_quiz->id,
        'visibility' => $lecture_quiz->visibility,
        'duration' => $lecture_quiz->duration,
        'lecture_id' => $lecture_quiz->lecture_id,
      ];
    }
    $response = [
      'data' => $quiz,
      'message' => "success",
      'status' => true,
    ];
    return response($response, 201);
  }
  public function addquiz(Request $request)
  {

    $n_quiz = Quiz::where('lecture_id', $request->lecture_id)->count();

    if ($n_quiz > 0) {
      $response = [
        'message' => "The exam already exists",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $n_lecture = lecture::where('id', $request->lecture_id)->count();
      if ($n_lecture == 0) {
        $response = [
          'message' => " Lecture not found ",
          'status' => false,
        ];
        return response($response, 200);
      } else {

        try {
          //Validated
          $validateUser = Validator::make(
            $request->all(),
            [
              'duration' => 'required|string|max:255',

            ],

            [
              'duration.required' => 'Exam duration is required',
            ],

            [
              'duration' => 'Exam duration',
            ]

          );

          if ($validateUser->fails()) {
            return response()->json([
              'status' => false,
              'message' => 'validation error',
              'errors' => $validateUser->errors()
            ], 403);
          }
          Quiz::create([
            'duration' => $request->duration,
            'lecture_id' => $request->lecture_id,
            'success_rate' => $request->success_rate,



          ]);
          $response = [
            'message' => "Created successfully",

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
  }


  public function updatequiz(Request $request)
  {

    $n_quiz = Quiz::where('id', $request->quiz_id)->count();

    if ($n_quiz == 0) {
      $response = [
        'message' => "  Quiz not found ",
        'status' => false,
      ];
      return response($response, 200);
    } else {


      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'duration' => 'required|string|max:255',

          ],

          [
            'duration.required' => 'Exam duration is required',
            'success_rate.required' => 'Success rate is required',
          ],

          [
            'duration' => 'Exam duration',
            'success_rate' => 'Success rate',
          ]

        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }
        $quiz = Quiz::where('id', $request->quiz_id)->first();

        $quiz->update([
          'duration' => $request->duration,
          'success_rate' => $request->success_rate,
          'visibility' => $request->visibility,


        ]);
        $response = [
          'message' => "Updated successfully",
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




  public function getlecturehomework($id)
  {
    $n_lecture = lecture::where('id', $id)->count();
    if ($n_lecture == 0) {
      $response = [
        'message' => " Lecture not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $n_homework = Homework::where('lecture_id', $id)->count();
      if ($n_homework == 0) {
        $response = [
          'message' => "The lecture does not have homework",
          'status' => false,
          'is_found' => 0,
        ];


        return response($response, 200);
      } else {
        $lecture_homewrok = Homework::where('lecture_id', $id)->first();
        $homework_info[] = [
          'key' => $lecture_homewrok->id,
          'visibility' => $lecture_homewrok->visibility,
          'success_rate' => $lecture_homewrok->success_rate,

          'title' => $lecture_homewrok->title,
          'lecture_id' => $lecture_homewrok->lecture_id,
        ];
      }

      $SetsbankQuestion = SetsbankQuestion::where('homework_id', $lecture_homewrok->id)->get();
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
      $Questionsbank = QuestionbankQuestion::where('homework_id', $lecture_homewrok->id)->get();
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
        'homework_info' => $homework_info,
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

  public function gethomework($id)
  {

    $n_homework = Homework::where('id', $id)->count();

    if ($n_homework == 0) {
      $response = [
        'message' => " Homework not found ",
        'status' => false,
      ];
      return response($response, 200);
    } else {
      $lecture_homework = homework::where('id', $id)->first();
      $homework = [
        'key' => $lecture_homework->id,
        'visibility' => $lecture_homework->visibility,
        'duration' => $lecture_homework->duration,
        'lecture_id' => $lecture_homework->lecture_id,
      ];
    }
    $response = [
      'data' => $homework,
      'message' => "success",
      'status' => true,
    ];
    return response($response, 201);
  }
  public function addhomework(Request $request)
  {

    $n_homework = homework::where('lecture_id', $request->lecture_id)->count();

    if ($n_homework > 0) {
      $response = [
        'message' => "The homework already exists",
        'status' => false,
      ];
      return response($response, 200);
    } else {
      $n_lecture = lecture::where('id', $request->lecture_id)->count();
      if ($n_lecture == 0) {
        $response = [
          'message' => " Lecture not found ",
          'status' => false,
        ];
        return response($response, 200);
      } else {

        try {
          //Validated
          $validateUser = Validator::make(
            $request->all(),
            [
              'title' => 'required|string|max:255',

            ],
            [

              'title.required' => 'Title is required',


            ],
            [
              'title' => ' Homework title ',


            ]
          );

          if ($validateUser->fails()) {
            return response()->json([
              'status' => false,
              'message' => 'validation error',
              'errors' => $validateUser->errors()
            ], 403);
          }
          Homework::create([
            'title' => $request->title,
            'lecture_id' => $request->lecture_id,
            'success_rate' => $request->success_rate,


          ]);
          $response = [
            'message' => "Created successfully",

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
  }


  public function updatehomework(Request $request)
  {

    $n_homework = homework::where('id', $request->homework_id)->count();

    if ($n_homework == 0) {
      $response = [
        'message' => "  Homework not found ",
        'status' => false,
      ];
      return response($response, 200);
    } else {


      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'title' => 'required|string|max:255',
            'success_rate' => 'required',
            'visibility' => 'required',


          ],
          [

            'title.required' => 'Title is required',
            'visibility.required' => 'prerequisite is required',
            'success_rate.required' => 'Success rate is required',


          ],

          [
            'title' => 'Homework title',
            'visibility' => 'Answer model visibility',
            'success_rate' => 'Success rate',
          ]

        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }
        $homework = homework::where('id', $request->homework_id)->first();

        $homework->update([
          'title' => $request->title,
          'visibility' => $request->visibility,
          'success_rate' => $request->success_rate,



        ]);
        $response = [
          'message' => "Updated successfully",

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

  public function addessayquestionquiz(Request $request)
  {
    $n_quiz = Quiz::where('id', $request->quiz_id)->count();

    if ($n_quiz == 0) {
      $response = [
        'message' => "  Quiz not found ",
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
            'quiz_id' => 'required',
          ],

          [
            'question.required' => 'Question is required',
            'quiz_id.required' => 'Selected quiz is required',
          ],

          [
            'question' => 'Question',
            'quiz_id' => 'Selected quiz',
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
            'is_essay' => 1,
            'quiz_id' => $request->quiz_id,

            'degree' => $request->degree



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


  public function addessayquestionhw(Request $request)
  {
    $n_homework = homework::where('id', $request->homework_id)->count();

    if ($n_homework == 0) {
      $response = [
        'message' => "  Homework not found ",
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
            'homework_id' => 'required',
          ],

          [
            'question.required' => 'Question is required',
            'homework_id.required' => 'Selected homework is required',
          ],

          [
            'question' => 'Question',
            'homework_id' => 'Selected homework',
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
            'is_essay' => 1,
            'homework_id' => $request->homework_id,
            'degree' => $request->degree


          ]
        );



        return response()->json([
          'status' => true,
          'message' => 'تم انشاء السؤال بنجاح',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    }
  }


  public function addchoosequestionquiz(Request $request)
  {
    $n_quiz = quiz::where('id', $request->quiz_id)->count();

    if ($n_quiz == 0) {
      $response = [
        'message' => "  Quiz not found ",
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
            'quiz_id' => 'required',

          ],

          [
            'question.required' => 'Question is required',
            'answer1.required' => 'First answer is required',
            'answer2.required' => 'Second answer is required',
            'answer3.required' => 'Third answer is required',
            'answer4.required' => 'Fourth answer is required',
            'correct_answer.required' => 'Correct answer is required',
            'quiz_id.required' => 'Selected quiz is required',
          ],

          [
            'question' => 'Question',
            'answer1' => 'First answer',
            'answer2' => 'Second answer',
            'answer3' => 'Third answer',
            'answer4' => 'Fourth answer',
            'correct_answer' => 'Correct answer',
            'quiz_id' => 'Selected quiz',
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
            'quiz_id' => $request->quiz_id,
            'answer1' => $request->answer1,
            'answer2' => $request->answer2,
            'answer3' => $request->answer3,
            'answer4' => $request->answer4,
            'correct_answer' => $request->correct_answer,
            'degree' => $request->degree,
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
  public function addchoosequestionhw(Request $request)
  {
    $n_homework = homework::where('id', $request->homework_id)->count();

    if ($n_homework == 0) {
      $response = [
        'message' => "  Homework not found ",
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
            'homework_id' => 'required',

          ],

          [
            'question.required' => 'Question is required',
            'answer1.required' => 'First answer is required',
            'answer2.required' => 'Second answer is required',
            'answer3.required' => 'Third answer is required',
            'answer4.required' => 'Fourth answer is required',
            'correct_answer.required' => 'Correct answer is required',
            'homework_id.required' => 'Selected homework is required',


          ],

          [
            'question' => 'Question',
            'answer1' => 'First answer',
            'answer2' => 'Second answer',
            'answer3' => 'Third answer',
            'answer4' => 'Fourth answer',
            'correct_answer' => 'Correct answer',
            'homework_id' => 'Selected homework',
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
            'homework_id' => $request->homework_id,
            'answer1' => $request->answer1,
            'answer2' => $request->answer2,
            'answer3' => $request->answer3,
            'answer4' => $request->answer4,
            'correct_answer' => $request->correct_answer,

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

  public function getquestionsquiz($id)
  {
    $questions = [];

    $all_questions = QuestionbankQuestion::where('quiz_id', $id)->get();
    $n_questions = QuestionbankQuestion::where('quiz_id', $id)->count();

    if ($n_questions == 0) {
      $response = [
        'message' => "We do not have any questions for this exam",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($all_questions as $question) {


        $questions[] = [
          'n' => $i++,
          'key' => $question->id,
          'question' => $question->question,
          'answer1' => $question->answer1,
          'answer2' => $question->answer2,
          'answer3' => $question->answer3,
          'answer4' => $question->answer4,
          'correct_answer' => $question->correct_answer,
          'is_essay' => $question->is_essay,
          'degree' => $question->degree,
          'vdo_id' => $question->vdo_id,
          'platform' => $question->platform,
          'hint' => $question->hint,

        ];
      }
      $response = [
        'data' => $questions,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function getquestionshomework($id)
  {
    $questions = [];

    $all_questions = QuestionbankQuestion::where('homework_id', $id)->get();
    $n_questions = QuestionbankQuestion::where('homework_id', $id)->count();

    if ($n_questions == 0) {
      $response = [
        'message' => "We do not have any questions for this assignment",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($all_questions as $question) {


        $questions[] = [
          'n' => $i++,
          'key' => $question->id,
          'question' => $question->question,
          'answer1' => $question->answer1,
          'answer2' => $question->answer2,
          'answer3' => $question->answer3,
          'answer4' => $question->answer4,
          'correct_answer' => $question->correct_answer,
          'is_essay' => $question->is_essay,


        ];
      }
      $response = [
        'data' => $questions,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }
  public function getquestionbyid($id)
  {
    $question = [];

    $n_questions = QuestionbankQuestion::where('id', $id)->wherenull('category_id')->count();

    if ($n_questions == 0) {
      $response = [
        'message' => " Question not found ",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $getquestion = QuestionbankQuestion::where('id', $id)->wherenull('category_id')->first();
      $question = [
        'key' => $getquestion->id,
        'question' => $getquestion->question,
        'answer1' => $getquestion->answer1,
        'answer2' => $getquestion->answer2,
        'answer3' => $getquestion->answer3,
        'answer4' => $getquestion->answer4,
        'correct_answer' => $getquestion->correct_answer,
        'is_essay' => $getquestion->is_essay,
        'degree' => $getquestion->degree,
        'vdo_id' => $getquestion->vdo_id,
        'platform' => $getquestion->platform,
        'hint' => $getquestion->hint,

      ];


      $response = [
        'data' => $question,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }
  public function editquestion(Request $request)
  {
    $id = $request->id;
    $n_question = QuestionbankQuestion::where('id', $id)->count();
    if ($n_question == 0) {
      $response = [
        'message' => "Question not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $QuestionbankQuestion = QuestionbankQuestion::find($id);
      if ($QuestionbankQuestion->is_essay == 1) {
        $QuestionbankQuestion->update([
          'question' => $request->question,
          'degree' => $request->degree,

        ]);
      } else {
        $QuestionbankQuestion->update([
          'question' => $request->question,
          'answer1' => $request->answer1,
          'answer2' => $request->answer2,
          'answer3' => $request->answer3,
          'answer4' => $request->answer4,
          'correct_answer' => $request->correct_answer,
          'degree' => $request->degree,

          'degree' => $request->degree,
          'vdo_id' => $request->vdo_id,
          'platform' => $request->platform,
          'hint' => $request->hint,
        ]);
      }


      $response = [
        'message' => "Question updated successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function addsetsquiz(Request $request)
  {

    foreach ($request->sets as  $item) {

      $n_content_item_quiz = Quiz::where('id', $item['quiz_id'])->count();
      if ($n_content_item_quiz == 1) {
        $quiz = Quiz::where('id', $item['quiz_id'])->first();

        SetsbankQuestion::create(
          [
            'category_id' => $item['category_id'],
            'lecture_id' => $item['lecture_id'],
            'easy' => $item['easy'],
            'medium' => $item['medium'],
            'hard' => $item['hard'],
            'quiz_id' => $quiz->id,



          ]
        );
      } else {
        return response()->json([
          'status' => true,
          'message' => "No exam available",
        ], 403);
      }

      return response()->json([
        'status' => true,
        'message' => "Added successfully",
      ], 200);
    }
  }
  public function addsetshomework(Request $request)
  {

    foreach ($request->sets as  $item) {


      $n_content_item_homework = Homework::where('lecture_id', $item['lecture_id'])->count();

      if ($n_content_item_homework == 1) {
        $homework = Homework::where('lecture_id', $item['lecture_id'])->first();

        SetsbankQuestion::create(
          [
            'category_id' => $item['category_id'],
            'easy' => $item['easy'],
            'medium' => $item['medium'],
            'hard' => $item['hard'],
            'hard' => $item['hard'],
            'homework_id' => $homework->id,
            'lecture_id' => $item['lecture_id'],

          ]
        );
      }


      return response()->json([
        'status' => true,
        'message' => "Added successfully",
      ], 200);
    }
  }
  public function deleteattachment(Request $request)
  {
    $id = $request->id;
    $n_lecture = Attachment::where('id', $id)->count();
    if ($n_lecture == 0) {
      $response = [
        'message' => "File not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      $Attachment = Attachment::where('id', $id)->first();

      $file_path = public_path('uploads/lectures/attachments/' . $Attachment->address);

      unlink($file_path);

      Attachment::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }

  public function getallattachment($id)
  {
    $Attachments = [];


    $n_lecture = Lecture::where('id', $id)->count();

    if ($n_lecture == 0) {
      $response = [
        'message' => "Lecture not found",
        'status' => false,

      ];
      return response($response, 403);
    } else {
      $n_Attachmen = Attachment::where('lecture_id', $id)->count();
      if ($n_Attachmen == 0) {
        $response = [
          'message' => "No files available",
          'status' => false,

        ];

        return response($response, 200);
      } else {
        $all_Attachment = Attachment::where('lecture_id', $id)->get();
        $i = 1;
        foreach ($all_Attachment as $attachment) {


          $Attachments[] = [
            'n' => $i++,
            'key' => $attachment->id,
            'address' => "https://api.prodigy-online.com/uploads/lectures/attachments/" . $attachment->address,
            'is_public' => $attachment->is_public,


          ];
        }
        $response = [
          'data' => $Attachments,
          'message' => "success",
          'status' => true,

        ];
        return response($response, 201);
      }
    }
  }
  public function allcategory()
  {

    $categories = [];

    $QuestionbankCategory = QuestionbankCategory::all();
    $n_QuestionbankCategory = QuestionbankCategory::count();

    if ($n_QuestionbankCategory == 0) {
      $response = [
        'message' => "No categories available",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($QuestionbankCategory as $cat) {


        $categories[] = [
          'n' => $i++,
          'key' => $cat->id,
          'title' => $cat->name,
          'stage' => $cat->stage,

        ];
      }

      $response = [
        'data' => $categories,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 200);
    }
  }
  public function allsetsquiz($id)
  {
    $sets = [];
    $QuestionbankCategory = SetsbankQuestion::where("quiz_id", $id)->get();
    $n_QuestionbankCategory = SetsbankQuestion::where("quiz_id", $id)->count();
    if ($n_QuestionbankCategory == 0) {
      $response = [
        'message' => "No categories available",
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
        'message' => "No categories available",
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
          'message' => "The category does not exist",
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
          'message' => "Updated successfully",
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
        'message' => "No students have purchased this lecture",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $hisories = History::where("lecture_id", $id)->get();

      $i = 1;
      $students = [];
      foreach ($hisories as $hisory) {

        $bought_by = $hisory->method;


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
          'student_name' => $hisory->student->name,
          'mobile' => $hisory->student->mobile,
          'buy_at' => date("F j, Y, g:i a", strtotime($hisory->created_at)),
          'quiz_degree' => $quiz_degree,
          'std_quiz_degree' => $std_quiz_degree,

          'homework_degree' => $homework_degree,
          'std_homework_degree' => $std_homework_degree,
          //    'homework_degree'=>$homework_degree,
          'expire_at' => $hisory->expire_at,
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
  public function deletestdfromlecture(Request $request)
  {
    $id = $request->id;
    $n_lecture = History::where('id', $id)->count();
    if ($n_lecture == 0) {
      $response = [
        'message' => "Not found",
        'status' => false,

      ];
      return response($response, 404);
    } else {
      History::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }
  public function editfromlecture(Request $request)
  {
    $student = History::where('id', $request->id)->first();
    if ($student) {

      try {
        //Validated
        $validateUser = Validator::make(
          $request->all(),
          [
            'expire_at' => 'required|date_format:Y-m-d H:i:s',
            'views' => 'required|min:1',

          ],
          [
            'expire_at.required' => 'expire date is required',
            'views.required' => 'Views is required',
            'expire_at.date_format' => 'expire date must be date format',


          ],
          [
            'views' => 'Views',
            'expire_at' => 'Expire date',



          ]
        );

        if ($validateUser->fails()) {
          return response()->json([
            'status' => false,
            'message' => 'validation error',
            'errors' => $validateUser->errors()
          ], 403);
        }


        $student->update(
          [

            'expire_at' => $request->expire_at,
            'views' => $request->views,

          ]
        );

        return response()->json([
          'status' => true,
          'message' => 'updated successfully',
        ], 200);
      } catch (\Throwable $th) {
        return response()->json([
          'status' => 500,
          'message' => $th->getMessage()
        ], 500);
      }
    } else {
      $response = [
        'message' => "Not found",
        'status' => false,

      ];
      return response($response, 404);
    }
  }
  public function addstudentlecture(Request $request)
  {

    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'mobile' => 'required',
          'lecture_id' => 'required',

        ],

        [
          'mobile.required' => 'Mobile number is required',
          'lecture_id.required' => 'Lecture is required',
        ],

        [
          'mobile' => 'Mobile number',
          'lecture_id' => 'Lecture',
        ]

      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }

      $n_student = Student::where('mobile', $request->mobile)->count();
      if ($n_student == 0) {
        $response = [
          'message' => "Student not found",
          'status' => false,

        ];
        return response($response, 404);
      }
      $n_Lecture = Lecture::where('id', $request->lecture_id)->count();
      if ($n_Lecture == 0) {
        $response = [
          'message' => "The lecture does not exist",
          'status' => false,

        ];
        return response($response, 404);
      }
      $student = Student::where('mobile', $request->mobile)->first();

      $n_history = History::where('student_id', $student->id)->where('lecture_id', $request->lecture_id)
        ->where('expire_at', '>=', date('Y-m-d H:i:s'))->count();
      if ($n_history == 1) {
        $response = [
          'message' => "The lecture already exists",
          'status' => false,

        ];
        return response($response, 404);
      } else {
        $lecture = Lecture::where('id', $request->lecture_id)->first();

        DB::beginTransaction();
        try {
          $exp = date("Y-m-d H:i:s", strtotime('+' . $lecture->expired_at . 'days'));

          $History = History::create(
            [
              'lecture_id' => $lecture->id,
              'price' => $lecture->price,
              'buy_at' => date('Y-m-d H:i:s'),
              'student_id' => $student->id,
              'add_to_session_assistant' => auth()->user()->id,
              'expire_at' => $exp,
              'views' => $lecture->views,
            ]
          );
          DB::commit();
        } catch (\Exception $ex) {
          DB::rollback();
          return response()->json(['error' => $ex->getMessage()], 500);
        }
      }

      $response = [
        'message' => "Lecture activated successfully",
        'status' => true,
      ];;
      return response($response, 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => 500,
        'message' => $th->getMessage()
      ], 500);
    }
  }
  public function getteacher($subject)
  {
    $allteachers = [];

    $n_teachers = Teacher::where('subject', $subject)->count();

    if ($n_teachers == 0) {
      $response = [
        'message' => "We do not have teachers",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $teachers = Teacher::where('subject', $subject)->get();

      $i = 1;
      foreach ($teachers as $teacher) {


        $allteachers[] = [

          'key' => $teacher->id,
          'name' => $teacher->name,
          'mobile' => $teacher->mobile,
          'profile_pic' => asset('uploads/profile_picture/' . $teacher->profile_pic),
          'subject' => $teacher->subject,

          'description' => $teacher->description,
        ];
      }


      $response = [
        'data' => $allteachers,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }
}
