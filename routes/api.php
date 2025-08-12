<?php

use App\Http\Controllers\Api\Student\SubjectsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\IndexController;
use App\Http\Controllers\Api\Admin\CodeController;
use App\Http\Controllers\Api\Admin\PostController;
use App\Http\Controllers\Api\Admin\AdminController;
use App\Http\Controllers\Api\Admin\GroupController;
use App\Http\Controllers\Api\Admin\LectureController;
use App\Http\Controllers\Api\Admin\TeacherController;
use App\Http\Controllers\Api\Admin\WhatsappController;
use App\Http\Controllers\Api\Teacher\LecturethController;
use App\Http\Controllers\Api\Admin\StudentadController;
use App\Http\Controllers\Api\Admin\TrialexamController;
use App\Http\Controllers\Api\Student\StudentController;
use App\Http\Controllers\Api\Admin\CorrectionController;
use App\Http\Controllers\Api\Admin\StatisticsController;
use App\Http\Controllers\Api\Student\LecturesdController;
use App\Http\Controllers\Api\Teacher\TeacherthController;
use App\Http\Controllers\Api\Teacher\QuestionbankController;
use App\Http\Controllers\Api\Student\TrialexamsdController;
use App\Http\Controllers\Api\Student\QuestionbanksdController;
use App\Http\Controllers\Api\Student\SubjectsContoller;

Route::get('/governorates', [IndexController::class,'governorates']);
Route::get('/getTeachers', [IndexController::class,'getTeachers']);
Route::post('/cities/', [IndexController::class,'cities']);
Route::post('/register/', [StudentController::class,'register']);
Route::get('/randomlecture', [IndexController::class,'randomlectures']);
Route::post('/forgetpassword', [StudentController::class,'sendotp']);
Route::post('/changepassword', [StudentController::class,'otp']);
Route::post('/change', [StudentController::class,'changepassword']);





Route::prefix('admin')->group(function(){
    Route::middleware(['SetSanctumGuard:admins', 'auth:sanctum',])->group(function () {
         Route::get('/home',[AdminController::class,'home']);
         Route::get('/numbering',[AdminController::class,'numbering'])->middleware(['role_or_permission:superadmin|request_accept']);
         Route::POST('/profile/picture',[AdminController::class,'myeditpicture']);
         Route::POST('/profile/changepassword',[AdminController::class,'myeditpassword']);

         //users
            Route::get('/allpermission',[AdminController::class,'allpermission'])->middleware('role:superadmin');
            Route::post('/Adduser',[AdminController::class,'create'])->middleware('role:superadmin');
            Route::get('/allusers',[AdminController::class,'users'])->middleware(['role_or_permission:superadmin|user_view']);
            Route::get('/user/{id}',[AdminController::class,'userinfo'])->middleware(['role_or_permission:superadmin|user_view']);
           // Route::POST('/user/update/{id}',[AdminController::class,'update'])->middleware(['role_or_permission:superadmin|user_view']);
            Route::POST('/user/delete',[AdminController::class,'delete'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/user/update/profilepicture',[AdminController::class,'editpicture'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/user/update/password',[AdminController::class,'editpassword'])->middleware(['role_or_permission:superadmin']);

            Route::POST('/user/update/info',[AdminController::class,'editoinfo'])->middleware(['role_or_permission:superadmin']);
            Route::GET('/user/getpermissions/{id}',[AdminController::class,'getpermissions'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/user/update/permissions',[AdminController::class,'updateuserpermissions'])->middleware(['role_or_permission:superadmin']);

            Route::get('/getallpermission',[AdminController::class,'getallpermissions'])->middleware('role:superadmin');


            //teachers
            Route::post('/addteacher',[TeacherController::class,'create'])->middleware('role:superadmin');
            Route::get('/allteachers',[TeacherController::class,'users'])->middleware(['role_or_permission:superadmin|user_view']);
            Route::get('/teacher/{id}',[TeacherController::class,'teacherinfo'])->middleware(['role_or_permission:superadmin|user_view']);
            Route::POST('/teacher/delete',[TeacherController::class,'delete'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/teacher/update/info',[TeacherController::class,'editoinfo'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/teacher/update/password',[TeacherController::class,'editpassword'])->middleware(['role_or_permission:superadmin']);
            Route::POST('/teacher/update/profilepicture',[TeacherController::class,'editpicture'])->middleware(['role_or_permission:superadmin']);

         //requests
         Route::GET('/requests/',[StudentadController::class,'requests'])->middleware(['role_or_permission:superadmin|request_accept|request_delete']);
         Route::POST('/requests/accept',[StudentadController::class,'acceptrequest'])->middleware(['role_or_permission:superadmin|request_accept']);
         Route::POST('/requests/delete',[StudentadController::class,'delete'])->middleware(['role_or_permission:superadmin|request_delete']);


         Route::GET('/posts/',[PostController::class,'posts'])->middleware(['role_or_permission:superadmin|post_delete|post_add']);
         Route::POST('/posts/add',[PostController::class,'addpost'])->middleware(['role_or_permission:superadmin|post_add']);
         Route::POST('/posts/delete',[PostController::class,'delete'])->middleware(['role_or_permission:superadmin|post_delete']);
         Route::GET('/posts/view/{id}',[PostController::class,'getpost'])->middleware(['role_or_permission:superadmin|post_edit']);
         Route::POST('/posts/edit',[PostController::class,'edit'])->middleware(['role_or_permission:superadmin|post_edit']);


         //codes
      Route::GET('/codes/',[CodeController::class,'codes'])->middleware(['role_or_permission:superadmin|code_views|code_update|code_delete|code_add']);
      Route::POST('/codes/edit',[CodeController::class,'update'])->middleware(['role_or_permission:superadmin|code_update']);
      Route::POST('/codes/delete',[CodeController::class,'delete'])->middleware(['role_or_permission:superadmin|code_delete']);
      Route::POST('/codes/generate',[CodeController::class,'create'])->middleware(['role_or_permission:superadmin|code_add']);
      Route::POST('/codetracker',[CodeController::class,'codetracker'])->middleware(['role_or_permission:superadmin|code_tracker']);

      //students
      Route::GET('/students/stage/{stage}',[StudentadController::class,'studentsbystage'])->middleware(['role_or_permission:superadmin|student_edit|student_delete']);
      Route::POST('/students/delete',[StudentadController::class,'delete'])->middleware(['role_or_permission:superadmin|student_delete']);
      Route::GET('/students/{id}',[StudentadController::class,'studentbyid'])->middleware(['role_or_permission:superadmin|student_edit']);
      Route::POST('/students/update',[StudentadController::class,'edit'])->middleware(['role_or_permission:superadmin|student_delete']);


      Route::POST('/students/edit/profilepicture',[StudentadController::class,'editpicture'])->middleware(['role_or_permission:superadmin|student_edit']);
      Route::POST('/students/edit/password',[StudentadController::class,'editpassword'])->middleware(['role_or_permission:superadmin|student_edit']);
      Route::POST('/students/edit/info',[StudentadController::class,'editoinfo'])->middleware(['role_or_permission:superadmin|student_edit']);
      Route::GET('/students/view/{id}',[StudentadController::class,'lecturebystudent'])->middleware(['role_or_permission:superadmin|student_view']);

      //group
      Route::GET('/groups/',[GroupController::class,'groups'])->middleware(['role_or_permission:superadmin|group_views']);
      Route::POST('/groups/edit',[GroupController::class,'update'])->middleware(['role_or_permission:superadmin|group_update']);
      Route::POST('/groups/delete',[GroupController::class,'delete'])->middleware(['role_or_permission:superadmin|group_delete']);
      Route::POST('/groups/add',[GroupController::class,'create'])->middleware(['role_or_permission:superadmin|group_add']);

      Route::GET('/subjects/{subject}',[LectureController::class,'getteacher'])->middleware(['role_or_permission:superadmin|lecture_view|lecture_add|lecture_addquiz|lecture_addHw|lecture_addmatrial']);


      //lecture
       Route::GET('/lectures/{id}',[LectureController::class,'alllecture'])->middleware(['role_or_permission:superadmin|lecture_view|lecture_add|lecture_addquiz|lecture_addHw|lecture_addmatrial']);
       Route::POST('/lectures/add',[LectureController::class,'addlecture'])->middleware(['role_or_permission:superadmin|lecture_add']);
       Route::POST('/chapters/add',[LectureController::class,'addchapter'])->middleware(['role_or_permission:superadmin|lecture_add']);
       Route::POST('/lectures/delete',[LectureController::class,'deletelecture'])->middleware(['role_or_permission:superadmin|lecture_delete']);
       Route::POST('/chapters/delete',[LectureController::class,'deletechapter'])->middleware(['role_or_permission:superadmin|lecture_delete']);
       Route::GET('/chapters/view/{id}',[LectureController::class,'getchapter'])->middleware(['role_or_permission:superadmin|lecture_view|lecture_addquiz|lecture_addHw|lecture_addmatrial']);
       Route::GET('/lectures/view/{id}',[LectureController::class,'getlecture'])->middleware(['role_or_permission:superadmin|lecture_view|lecture_addquiz|lecture_addHw|lecture_addmatrial']);
       Route::GET('/chapters/{id}',[LectureController::class,'getlecturebychapter'])->middleware(['role_or_permission:superadmin|lecture_view|lecture_addquiz|lecture_addHw|lecture_addmatrial']);
       Route::POST('/lecture/update',[LectureController::class,'updatelecture'])->middleware(['role_or_permission:superadmin|lecture_edit']);
       Route::POST('/lecture/chapter/update',[LectureController::class,'updatechapter'])->middleware(['role_or_permission:superadmin|lecture_edit']);
       Route::GET('/lecture/vidoes/{id}',[LectureController::class,'getvideos'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::POST('/lecture/addvideos',[LectureController::class,'addvideo'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::POST('/lecture/updatevideo',[LectureController::class,'updatevideo'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::POST('/lecture/updatevideo',[LectureController::class,'updatevideo'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::POST('/lecture/deletevideo',[LectureController::class,'deletevideo'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::GET('/lecture/video/{id}',[LectureController::class,'getvideobyid'])->middleware(['role_or_permission:superadmin|lecture_addvideos']);
       Route::POST('/lecture/uploadfile/',[LectureController::class,'uploadattachment'])->middleware(['role_or_permission:superadmin|lecture_addmatrial']);
      Route::GET('/lecture/quiz/{id}',[LectureController::class,'getlecturequiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
       Route::GET('/lecture/session/quiz/{id}',[LectureController::class,'getquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
      Route::POST('/lecture/session/addquiz',[LectureController::class,'addquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
       Route::POST('/lecture/session/updatequiz',[LectureController::class,'updatequiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);

       Route::POST('/lecture/deletesubscriber',[LectureController::class,'deletestdfromlecture'])->middleware(['role_or_permission:superadmin|code_add|code_update']);
       Route::POST('/lecture/editsubscriber',[LectureController::class,'editfromlecture'])->middleware(['role_or_permission:superadmin|code_add|code_update']);
       Route::POST('/lecture/addstudent',[LectureController::class,'addstudentlecture'])->middleware(['role_or_permission:superadmin|lecture_addstudent']);

       Route::GET('/lecture/homework/{id}',[LectureController::class,'getlecturehomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);
       Route::GET('/lecture/session/homework/{id}',[LectureController::class,'gethomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);
       Route::POST('/lecture/session/addhomework',[LectureController::class,'addhomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);
       Route::POST('/lecture/session/updatehomework',[LectureController::class,'updatehomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);

       Route::POST('/lecture/session/quiz/addessayquestion',[LectureController::class,'addessayquestionquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
       Route::POST('/lecture/session/homework/addessayquestion',[LectureController::class,'addessayquestionhw'])->middleware(['role_or_permission:superadmin|lecture_addHw']);

       Route::POST('/lecture/session/quiz/addchoosequestion',[LectureController::class,'addchoosequestionquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
      Route::POST('/lecture/session/homework/addchoosequestion',[LectureController::class,'addchoosequestionhw'])->middleware(['role_or_permission:superadmin|lecture_addHw']);

       Route::POST('/lecture/quiz/sets/add',[LectureController::class,'addsetsquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
       Route::POST('/lecture/homework/sets/add',[LectureController::class,'addsetshomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);

       Route::GET('/lecture/session/quiz/questions/{id}',[LectureController::class,'getquestionsquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
     Route::GET('/lecture/session/homework/questions/{id}',[LectureController::class,'getquestionshomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);


       Route::GET('/lecture/session/question/{id}',[LectureController::class,'getquestionbyid'])->middleware(['role_or_permission:superadmin|lecture_addquiz|lecture_addHw']);
       Route::POST('/lecture/session/question/update',[LectureController::class,'editquestion'])->middleware(['role_or_permission:superadmin|lecture_addquiz|lecture_addHw']);
       Route::GET('/lecture/session/attachments/{id}',[LectureController::class,'getallattachment'])->middleware(['role_or_permission:superadmin|lecture_addmatrial']);
       Route::POST('/lecture/session/deleteattachemnt',[LectureController::class,'deleteattachment'])->middleware(['role_or_permission:superadmin|lecture_addmatrial']);
       Route::GET('/questionbank/categories',[LectureController::class,'allcategory'])->middleware(['role_or_permission:superadmin|questionbank_viewquestionbycategory']);
       Route::GET('/lecture/session/quiz/allsets/{id}',[LectureController::class,'allsetsquiz'])->middleware(['role_or_permission:superadmin|lecture_addquiz']);
       Route::GET('/lecture/session/homework/allsets/{id}',[LectureController::class,'allsetshomework'])->middleware(['role_or_permission:superadmin|lecture_addHw']);
       Route::POST('/lecture/session/questions/sets/delete',[LectureController::class,'deleteset'])->middleware(['role_or_permission:superadmin|lecture_addquiz|lecture_addHw']);
       Route::POST('/lecture/session/questions/sets/update',[LectureController::class,'updateset'])->middleware(['role_or_permission:superadmin|lecture_addquiz|lecture_addHw']);


       Route::GET('/lecture/view/{id}',[LectureController::class,'allstudents'])->middleware(['role_or_permission:superadmin|lecture_view']);


 //whatsapp
 Route::GET('/whatsapp',[WhatsappController::class,'index'])->middleware(['role_or_permission:superadmin|whatsapp_show']);
 Route::POST('/whatsapp/send',[WhatsappController::class,'send'])->middleware(['role_or_permission:superadmin|whatsapp_send']);


//statistics
Route::POST('/statistics/teachers/',[StatisticsController::class,'teachers'])->middleware(['role_or_permission:superadmin|statistics']);
Route::POST('/statistics/teacher/view',[StatisticsController::class,'viewTeacher'])->middleware(['role_or_permission:superadmin|statistics']);
Route::POST('/statistics/stageStudents/',[StatisticsController::class,'studentsPerStage'])->middleware(['role_or_permission:superadmin|statistics']);
Route::POST('/statistics/buyingStudents/',[StatisticsController::class,'topBuyingStudents'])->middleware(['role_or_permission:superadmin|statistics']);
Route::POST('/statistics/buyingStage/',[StatisticsController::class,'mostBuyingStage'])->middleware(['role_or_permission:superadmin|statistics']);


 //trialexam
Route::GET('/trialexam/alllectures',[TrialexamController::class,'alllectures'])->middleware(['role_or_permission:superadmin|exam_add']);
Route::POST('/trialexam/add',[TrialexamController::class,'addexam'])->middleware(['role_or_permission:superadmin|exam_add']);
Route::GET('/trialexam',[TrialexamController::class,'allexams'])->middleware(['role_or_permission:superadmin|exam_add|exam_edit|exam_delete']);
Route::POST('/trialexam/delete',[TrialexamController::class,'deleteexam'])->middleware(['role_or_permission:superadmin|exam_delete']);
Route::GET('/trialexam/{id}',[TrialexamController::class,'geteaxm'])->middleware(['role_or_permission:superadmin|exam_edit']);
Route::POST('/trialexam/edit',[TrialexamController::class,'updateexam'])->middleware(['role_or_permission:superadmin|exam_edit']);
Route::POST('/trialexam/sets/add',[TrialexamController::class,'addsets'])->middleware(['role_or_permission:superadmin|exam_addquestions']);
Route::GET('/trialexam/allsets/{id}',[TrialexamController::class,'allsetsexam'])->middleware(['role_or_permission:superadmin|exam_addquestions']);
Route::GET('/exam/info/{id}',[TrialexamController::class,'getexaminfo'])->middleware(['role_or_permission:superadmin|exam_add|exam_edit|exam_delete|exam_addquestions']);
Route::POST('/trialexam/addchoosequestion',[TrialexamController::class,'addchoosequestionexam'])->middleware(['role_or_permission:superadmin|exam_addquestions']);
Route::GET('/exam/view/{id}',[TrialexamController::class,'view'])->middleware(['role_or_permission:superadmin|exam_view']);
Route::POST('/trialexam/retake',[TrialexamController::class,'retake'])->middleware(['role_or_permission:superadmin|exam_view']);
Route::POST('/trialexam/stddelete',[TrialexamController::class,'deletestd'])->middleware(['role_or_permission:superadmin|exam_view']);
Route::GET('/trialexam/modelanswer/{id}',[TrialexamController::class,'modelanswerstudent'])->middleware(['role_or_permission:superadmin|exam_view']);


//correction
Route::GET('/correction',[CorrectionController::class,'index'])->middleware(['role_or_permission:superadmin|correction']);
Route::GET('/correction/{id}',[CorrectionController::class,'getquestion'])->middleware(['role_or_permission:superadmin|correction']);
Route::GET('/correction/correct/{student_id}/{type}/{assignment}',[CorrectionController::class,'getallquestions'])->middleware(['role_or_permission:superadmin|correction']);
Route::POST('/correction/correct',[CorrectionController::class,'correct'])->middleware(['role_or_permission:superadmin|correction']);
Route::GET('/correction/question/{id}',[CorrectionController::class,'getquestiondetails'])->middleware(['role_or_permission:superadmin|correction']);



      //question_bank
      Route::GET('/questionbank/',[QuestionbankController::class,'allcategories'])->middleware(['role_or_permission:superadmin|questionbank_allcategory']);
      Route::POST('/questionbank/category/edit',[QuestionbankController::class,'updatecategory'])->middleware(['role_or_permission:superadmin|questionbank_updatecategory']);
      Route::POST('/questionbank/category/delete',[QuestionbankController::class,'deletecategory'])->middleware(['role_or_permission:superadmin|questionbank_deletecategory']);
      Route::POST('/questionbank/category/add',[QuestionbankController::class,'createcategory'])->middleware(['role_or_permission:superadmin|questionbank_addcategory']);
      Route::GET('/questionbank/category/{id}',[QuestionbankController::class,'questionsbycategory'])->middleware(['role_or_permission:superadmin|questionbank_viewquestionbycategory']);
      Route::POST('/questionbank/category/addchoosequestion/{id}',[QuestionbankController::class,'addchoosequestion'])->middleware(['role_or_permission:superadmin|questionbank_addquestion']);
      Route::POST('/questionbank/category/addessayquestion/{id}',[QuestionbankController::class,'addessayquestion'])->middleware(['role_or_permission:superadmin|questionbank_addquestion']);
      Route::POST('/questionbank/category/deletequestion/',[QuestionbankController::class,'deletequestion'])->middleware(['role_or_permission:superadmin|questionbank_deletequestion']);
      Route::POST('/questionbank/category/editquestion/',[QuestionbankController::class,'editquestion'])->middleware(['role_or_permission:superadmin|questionbank_editquestion']);
      Route::GET('/questionbank/category/question/{id}',[QuestionbankController::class,'getquestion'])->middleware(['role_or_permission:superadmin|questionbank_editquestion']);

    });




  Route::post('/login',[AdminController::class,'login']);

});




Route::prefix('teacher')->group(function(){
  Route::middleware(['SetSanctumGuard:teachers', 'auth:sanctum',])->group(function () {
       Route::get('/home',[AdminController::class,'home']);
       Route::get('/numbering',[AdminController::class,'numbering'])->middleware(['role_or_permission:superadmin|request_accept']);
       Route::POST('/profile/picture',[AdminController::class,'myeditpicture']);
       Route::POST('/profile/changepassword',[AdminController::class,'myeditpassword']);




    //question_bank
    Route::GET('/questionbank/',[QuestionbankController::class,'allcategories']);
    Route::POST('/questionbank/category/edit',[QuestionbankController::class,'updatecategory']);
    Route::POST('/questionbank/category/delete',[QuestionbankController::class,'deletecategory']);
    Route::POST('/questionbank/category/add',[QuestionbankController::class,'createcategory']);
    Route::GET('/questionbank/category/{id}',[QuestionbankController::class,'questionsbycategory']);
    Route::GET('/questionbank/categoryinfo/{id}',[QuestionbankController::class,'categoryinfo']);
    Route::POST('/questionbank/category/addchoosequestion/{id}',[QuestionbankController::class,'addchoosequestion']);
    Route::POST('/questionbank/category/addessayquestion/{id}',[QuestionbankController::class,'addessayquestion']);
    Route::POST('/questionbank/category/deletequestion/',[QuestionbankController::class,'deletequestion']);
    Route::POST('/questionbank/category/editquestion/',[QuestionbankController::class,'editquestion']);
    Route::GET('/questionbank/category/question/{id}',[QuestionbankController::class,'getquestion']);

    //lecture
     Route::GET('/lectures/',[LecturethController::class,'alllecture']);
     Route::POST('/lectures/add',[LecturethController::class,'addlecture']);
     Route::POST('/chapters/add',[LecturethController::class,'addchapter']);
     Route::POST('/lectures/delete',[LecturethController::class,'deletelecture']);
     Route::POST('/chapters/delete',[LecturethController::class,'deletechapter']);
     Route::GET('/chapters/view/{id}',[LecturethController::class,'getchapter']);
     Route::GET('/lectures/view/{id}',[LecturethController::class,'getlecture']);
     Route::GET('/chapters/{id}',[LecturethController::class,'getlecturebychapter']);
     Route::POST('/lecture/update',[LecturethController::class,'updatelecture']);
     Route::POST('/lecture/chapter/update',[LecturethController::class,'updatechapter']);
     Route::GET('/lecture/vidoes/{id}',[LecturethController::class,'getvideos']);
     Route::POST('/lecture/addvideos',[LecturethController::class,'addvideo']);
     Route::POST('/lecture/updatevideo',[LecturethController::class,'updatevideo']);
     Route::POST('/lecture/updatevideo',[LecturethController::class,'updatevideo']);
     Route::POST('/lecture/deletevideo',[LecturethController::class,'deletevideo']);
     Route::GET('/lecture/video/{id}',[LecturethController::class,'getvideobyid']);
     Route::POST('/lecture/uploadfile/',[LecturethController::class,'uploadattachment']);
     Route::GET('/lecture/quiz/{id}',[LecturethController::class,'getlecturequiz']);
     Route::GET('/lecture/session/quiz/{id}',[LecturethController::class,'getquiz']);
     Route::POST('/lecture/session/addquiz',[LecturethController::class,'addquiz']);
     Route::POST('/lecture/session/updatequiz',[LecturethController::class,'updatequiz']);
     Route::POST('/lecture/deletesubscriber',[LecturethController::class,'deletestdfromlecture']);
     Route::POST('/lecture/editsubscriber',[LecturethController::class,'editfromlecture']);
     Route::POST('/lecture/addstudent',[LecturethController::class,'addstudentlecture']);
     Route::GET('/lecture/homework/{id}',[LecturethController::class,'getlecturehomework']);
     Route::GET('/lecture/session/homework/{id}',[LecturethController::class,'gethomework']);
     Route::POST('/lecture/session/addhomework',[LecturethController::class,'addhomework']);
     Route::POST('/lecture/session/updatehomework',[LecturethController::class,'updatehomework']);
     Route::POST('/lecture/session/quiz/addessayquestion',[LecturethController::class,'addessayquestionquiz']);
     Route::POST('/lecture/session/homework/addessayquestion',[LecturethController::class,'addessayquestionhw']);
     Route::POST('/lecture/session/quiz/addchoosequestion',[LecturethController::class,'addchoosequestionquiz']);
     Route::POST('/lecture/session/homework/addchoosequestion',[LecturethController::class,'addchoosequestionhw']);
     Route::POST('/lecture/quiz/sets/add',[LecturethController::class,'addsetsquiz']);
     Route::POST('/lecture/homework/sets/add',[LecturethController::class,'addsetshomework']);
     Route::GET('/lecture/session/quiz/questions/{id}',[LecturethController::class,'getquestionsquiz']);
     Route::GET('/lecture/session/homework/questions/{id}',[LecturethController::class,'getquestionshomework']);


     Route::GET('/lecture/session/question/{id}',[LecturethController::class,'getquestionbyid']);
     Route::POST('/lecture/session/question/update',[LecturethController::class,'editquestion']);
     Route::GET('/lecture/session/attachments/{id}',[LecturethController::class,'getallattachment']);
     Route::POST('/lecture/session/deleteattachemnt',[LecturethController::class,'deleteattachment']);
     Route::GET('/questionbank/categories',[LecturethController::class,'allcategory']);
     Route::GET('/lecture/session/quiz/allsets/{id}',[LecturethController::class,'allsetsquiz']);
     Route::GET('/lecture/session/homework/allsets/{id}',[LecturethController::class,'allsetshomework']);
     Route::POST('/lecture/session/questions/sets/delete',[LecturethController::class,'deleteset']);
     Route::POST('/lecture/session/questions/sets/update',[LecturethController::class,'updateset']);


     Route::GET('/lecture/view/{id}',[LecturethController::class,'allstudents']);



  });




Route::post('/login',[TeacherthController::class,'login']);

});



Route::prefix('/')->group(function(){
  Route::middleware(['SetSanctumGuard:students', 'auth:sanctum'])->group(function () {
       Route::get('/home',[StudentController::class,'home']);
       Route::GET('/lectures/{id}',[LecturesdController::class,'alllecture']);
       Route::GET('/lectures/session/{id}',[LecturesdController::class,'session']);
       Route::POST('/lectures/session/buy',[LecturesdController::class,'buy']);
       Route::GET('/lectures/chapter/{id}',[LecturesdController::class,'getlecturebychapter']);
       Route::GET('/lectures/session/quiz/{id}',[LecturesdController::class,'getquizquestion']);
       Route::POST('/lectures/session/updateanswerquiz',[LecturesdController::class,'postanswerquiz']);
       Route::POST('/lectures/session/sumitquiz',[LecturesdController::class,'submitquiz']);
       Route::GET('/lectures/session/homework/{id}',[LecturesdController::class,'gethomeworkquestion']);
       Route::POST('/lectures/homework/updateanswerhomewok',[LecturesdController::class,'postanswerhomework']);
       Route::POST('/lectures/homework/sumithomework',[LecturesdController::class,'submithomework']);
       Route::GET('/questionbank/',[QuestionbanksdController::class,'allcategories']);
       Route::GET('/questionbank/view/{id}',[QuestionbanksdController::class,'questionsbycategory']);
       Route::POST('/profile/picture',[StudentController::class,'editpicture']);
       Route::POST('/profile/changepassword',[StudentController::class,'editpassword']);
       Route::GET('/getamount',[StudentController::class,'getpointsandamount']);
       Route::POST('/rechargeamount',[StudentController::class,'rechargeamount']);
       Route::POST('/buyamount',[LecturesdController::class,'buyamount']);
       Route::POST('/buypoints',[LecturesdController::class,'buypoints']);
       Route::POST('/sendinvitation',[StudentController::class,'sendinvitation']);
       Route::GET('/allinvitation',[StudentController::class,'allinvitation']);
      Route::POST('/lectures/decreaseview',[LecturesdController::class,'decreaseview']);



       Route::GET('/trialexam/',[TrialexamsdController::class,'allexams']);
       Route::GET('/trialexam/{id}',[TrialexamsdController::class,'exam']);
       Route::POST('/trialexam/buy',[TrialexamsdController::class,'buy']);
       Route::GET('/trialexam/questions/{id}',[TrialexamsdController::class,'getexamquestion']);
       Route::POST('/trialexam/buy',[TrialexamsdController::class,'buy']);
       Route::POST('/trialexam/updateanswerexam',[TrialexamsdController::class,'updateanswerexam']);
       Route::POST('/trialexam/submit',[TrialexamsdController::class,'submitexam']);
       Route::GET('/trialexam/modelanswer/{id}',[TrialexamsdController::class,'getmodelanswer']);

       //subjects controller
       Route::GET('/teacher/{subject}',[SubjectsController::class,'getTeachers']);

  });



Route::post('/login',[StudentController::class,'login']);

});
