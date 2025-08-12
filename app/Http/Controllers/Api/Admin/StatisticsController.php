<?php

namespace App\Http\Controllers\Api\admin;

use App\Http\Controllers\Controller;
use App\Models\History;
use App\Models\Lecture;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StatisticsController extends Controller
{
    public function teachers(Request $request){
        // Validate input
        $validate = Validator::make($request->all(), [
            'from' => 'required|date',
            'to' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'message' => $validate->errors()->first(),
                'status' => 400,
            ]);
        }

        $from = $request->from;
        $to = $request->to;

        // Fetch teachers with lectures and histories filtered by date range
        $teachers = Teacher::with(['lectures.histories' => function ($query) use ($from, $to) {
            $query->whereBetween('buy_at', [$from, $to]);
        }])->get();


        $data = $teachers->map(function ($teacher) {
            // Calculate total buying history for each teacher
            $buyingHistory = $teacher->lectures->reduce(function ($total, $lecture) {
                return $total + $lecture->histories->count();
            }, 0);


            return [
                'id' => $teacher->id,
                'name' => $teacher->name,
                'username' => $teacher->username,
                'profile_pic' => $teacher->profile_pic,
                'buying_history' => $buyingHistory,
            ];
        });

        return response()->json([
            'data' => $data,
            'message' => 'success',
            'status' => 200,
        ]);
    }


    public function viewTeacher(Request $request){
        $validate = Validator::make($request->all(), [
            'teacher_id' => 'required|',
            'from' => 'required|date',
            'to' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'message' => $validate->errors()->first(),
                'status' => 400,
            ]);
        }

        $teacherId = $request->teacher_id;
        $from = $request->from;
        $to = $request->to;

        $teacher = Teacher::where('id', $teacherId)->with(['lectures.histories' => function ($query) use ($from, $to) {
            $query->whereBetween('buy_at', [$from, $to]);
        }])->first();

        $stages = [];


    foreach ($teacher->lectures as $lecture) {
        $stage = $lecture->stage;
        $buyingHistory = $lecture->histories->count();

        if (isset($stages[$stage])) {
            $stages[$stage] += $buyingHistory;
        } else {
            $stages[$stage] = $buyingHistory;
        }
    }

    $data = [
        'id' => $teacher->id,
        'name' => $teacher->name,
        'username' => $teacher->username,
        'profile_pic' => $teacher->profile_pic,
        'buying_history_per_stage' => $stages,
    ];

    return response()->json([
        'data' => $data,
        'message' => 'success',
        'status' => 200,
    ]);

    }


    public function studentsPerStage(Request $request){
        $validate = Validator::make($request->all(), [
            'from' => 'required|date',
            'to' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'message' => $validate->errors()->first(),
                'status' => 400,
            ]);
        }

        $from = $request->from;
        $to = $request->to;


        $students = Student::with(['histories' => function ($query) use ($from, $to) {
            $query->whereBetween('buy_at', [$from, $to]);
        }])->get();


        $stages = [];

        foreach ($students as $student) {
            $stage = $student->stage;
            $buyingHistory = $student->histories->count();

            if (isset($stages[$stage])) {
                $stages[$stage] += $buyingHistory;
            } else {
                $stages[$stage] = $buyingHistory;
            }
        }

        $data = $stages;

        return response()->json([
            'data' => $data,
            'message' => 'success',
            'status' => 200,
        ]);
    }


    public function topBuyingStudents(Request $request) {
        $validate = Validator::make($request->all(), [
            'from' => 'required|date',
            'to' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'message' => $validate->errors()->first(),
                'status' => 400,
            ]);
        }

        $from = $request->from;
        $to = $request->to;


        $students = Student::withCount(['histories' => function ($query) use ($from, $to) {
            $query->whereBetween('buy_at', [$from, $to]);
        }])
        ->orderByDesc('histories_count')
        ->take(10)
        ->get();

        if($students->isEmpty()){
            return response()->json([
                'data' => [],
                'message' => 'success',
                'status' => 200,
            ]);
        }
        $topStudents = $students->map(function ($student) {
            return [
                'id' => $student->id,
                'name' => $student->name,
                'username' => $student->username,
                'profile_pic' => $student->profile_pic,
                'buying_history_count' => $student->histories_count,
            ];
        });

        return response()->json([
            'data' => $topStudents,
            'message' => 'success',
            'status' => 200,
        ]);
    }

    public function mostBuyingStage(Request $request){
        $validate = Validator::make($request->all(), [
            'from' => 'required|date',
            'to' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'message' => $validate->errors()->first(),
                'status' => 400,
            ]);
        }

        $from = $request->from;
        $to = $request->to;




    $lectures = Lecture::withCount(['histories' => function ($query) use ($from, $to) {
        $query->whereBetween('buy_at', [$from, $to]);
    }])->get();


    $stages = $lectures->groupBy('stage')->map(function ($lectures) {
        return $lectures->sum('histories_count');
    });


    $sortedStages = $stages->sortDesc();


        return response()->json([
            'stage' => $sortedStages,
            'message' => 'success',
            'status' => 200,
        ]);
    }


}
