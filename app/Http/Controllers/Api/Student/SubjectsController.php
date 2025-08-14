<?php

namespace App\Http\Controllers\Api\Student;

use App\Http\Controllers\Controller;
use App\Models\Teacher;
use Illuminate\Http\Request;

class SubjectsController extends Controller
{

    public function getTeachers($subject)
    {
        $teachers = Teacher::where('subject', $subject)->count();
        if ($teachers < 0) {
            return response()->json([
                'message' => "Teachers not found",
                'status' => "error"
            ], 200);
        }

        $teachers = Teacher::where('subject', $subject)->get();
        $all_teachers = [];
        $n = 1;
        foreach ($teachers as $teacher) {
            $all_teachers[] = [
                'n' => $n,
                'key' => $teacher->id,
                'name' => $teacher->name,
                'image' => $teacher->profile_pic ? asset('/uploads/profile_picture/' . $teacher->profile_pic) : null
            ];
        }
        return response()->json([
            'message' => "success",
            'teachers' => $all_teachers
        ], 200);
    }
}
