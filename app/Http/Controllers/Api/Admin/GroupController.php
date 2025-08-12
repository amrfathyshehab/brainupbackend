<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Group;
use Illuminate\Http\Request;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class GroupController extends Controller
{
  public function groups()
  {
    $groups = [];

    $all_groups = Group::all();
    $n_group = Group::count();

    if ($n_group == 0) {
      $response = [
        'message' => "we don't have  groups",
        'status' => false,

      ];
      return response($response, 200);
    } else {
      $i = 1;
      foreach ($all_groups as $group) {

        $stage = match (true) {
          $group->stage == 1 => "اولي ثانوي",
          $group->stage == 2 => "تانية ثانوي",
          $group->stage == 3 => "ثالثة ثانوي",
          $group->stage == 11 => "أولي اعدادي",
          $group->stage == 22 => "تانية اعدادي",
          $group->stage == 33 => "ثالثة اعدادي",
          default => "غير معروف",
        };

        $groups[] = [
          'n' => $i++,

          'key' => $group->id,
          'name' => $group->name,
          'description' => $group->description,
          'stage' => $stage,

          'created_at' => date("F j, Y, g:i a", strtotime($group->created_at)),


        ];
      }
      $response = [
        'data' => $groups,
        'message' => "success",
        'status' => true,

      ];
      return response($response, 201);
    }
  }



  public function update(Request $request)
  {
    $id = $request->id;
    $n_group = Group::where('id', $id)->count();
    if ($n_group == 0) {
      $response = [
        'message' => "Group not found",
        'status' => false,

      ];
      return response($response, 401);
    } else {
      $Group = Group::find($id);

      $Group->update([
        'name' => $request->name,
        'description' => $request->description,
        'stage' => $request->stage

      ]);

      $response = [
        'message' => "The group has been edited",
        'status' => true,

      ];
      return response($response, 201);
    }
  }


  public function delete(Request $request)
  {
    $id = $request->id;
    $n_group = Group::where('id', $id)->count();
    if ($n_group == 0) {
      $response = [
        'message' => "Group not found",
        'status' => false,

      ];
      return response($response, 401);
    } else {
      Group::find($id)->delete();
      $response = [
        'message' => "Deleted successfully",
        'status' => true,

      ];
      return response($response, 201);
    }
  }



  public function create(Request $request)
  {
    // return $request;
    try {
      //Validated
      $validateUser = Validator::make(
        $request->all(),
        [
          'name' => 'required|string|max:255',
          'stage' => 'required|string|max:2',
          'description' => 'string',
        ],
        [

          'name.required' => 'Name is required',
          'stage.required' => 'Stage is required',


        ],
        [
          'name' => 'Name ',
          'stage' => 'Stage is required',
          'description' => 'Description ',



        ]
      );

      if ($validateUser->fails()) {
        return response()->json([
          'status' => false,
          'message' => 'validation error',
          'errors' => $validateUser->errors()
        ], 403);
      }


      $group = Group::create(
        [
          'name' => $request->name,
          'stage' => $request->stage,
          'description' => $request->description,



        ]
      );



      return response()->json([
        'status' => true,
        'message' => 'The group has been created successfully',
      ], 200);
    } catch (\Throwable $th) {
      return response()->json([
        'status' => 500,
        'message' => $th->getMessage()
      ], 500);
    }
  }
}
