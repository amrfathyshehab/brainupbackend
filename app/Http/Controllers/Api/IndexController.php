<?php

namespace App\Http\Controllers\Api;

use App\Models\Group;
use App\Models\Cities;
use App\Models\Governorates;
use App\Models\Teacher;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Lecture;
use App\Models\Countries;


class IndexController extends Controller
{

    public function governorates()
    {
        $governorates = Governorates::all();

        $cities = [];
        $state = [];
        foreach ($governorates as $governorate) {
            $allcities = Cities::where('governorate_id', $governorate->id)->get();

            $state[] = [
                'id' => $governorate->id,
                'state' => $governorate->governorate_name_ar,
                'cities' => $allcities,
            ];
        }
        $groups = Group::all();
        return  response()->json([
            'states' => $state,
            'groups' => $groups,
            'message' => 'success',

            'status' => '200',
        ]);
    }


    public function randomlectures()
    {
        $n_Lectures = Lecture::where('visibility', 1)->count();
        if ($n_Lectures >= 6) {
            $Lectures = Lecture::where('visibility', 1)->get()->random(6);
            $random = [];
            $n = 0;
            foreach ($Lectures as $Lecture) {
                $n++;
                $random[] = [
                    'id' => $Lecture->id,
                    'title' => $Lecture->title,
                    'description' => $Lecture->description,
                    'stage' => $Lecture->stage,
                    'price' => $Lecture->price,
                    'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $Lecture->img,

                ];
            }
            return  response()->json([
                'n' => $n,
                'message' => 'success',
                'data' => $random,
                'status' => true,
            ], 200);
        } else {
            $Lectures = Lecture::where('visibility', 1)->get();
            $random = [];
            $n = 0;
            foreach ($Lectures as $Lecture) {
                $n++;
                $random[] = [
                    'id' => $Lecture->id,
                    'title' => $Lecture->title,
                    'description' => $Lecture->description,
                    'stage' => $Lecture->stage,
                    'price' => $Lecture->price,
                    'img' => "https://api.prodigy-online.com/uploads/lectures/images/" . $Lecture->img,

                ];
            }
            return  response()->json([
                'n' => $n,
                'message' => 'success',
                'data' => $random,
                'status' => true,
            ], 200);
        }
    }



    public function getTeachers()
    {
        $teachers = Teacher::inRandomOrder()->take(10)->get();
        foreach ($teachers as $teacher) {
            $n = 1;
            $data[] = [
                'n' => $n++,
                'name' => $teacher->name,
                'description' => $teacher->description,
                'image' => asset('uploads/profile_picture/' . $teacher->profile_pic)
            ];
        }

        return  response()->json([
            'message' => 'success',
            'data' => $data,
            'status' => true,
        ], 200);
    }
}
