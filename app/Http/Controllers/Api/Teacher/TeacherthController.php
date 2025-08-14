<?php

namespace App\Http\Controllers\Api\Teacher;

use App\Models\Teacher;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class TeacherthController extends Controller
{
  public function login(Request $request)
  {
    $fields = $request->validate([
      'username' => 'required|string',
      'password' => 'required|string',
    ]);

    $teacher = Teacher::where('username', $fields['username'])->first();
    if (!$teacher || !Hash::check($fields['password'], $teacher['password'])) {
      return response()->json([
        'error' => 'Username or Password wrong'
      ], 403);
    }

    $token = $teacher->createToken($request['username'], ['teacher'])->plainTextToken;

    return response()->json([
      'status' => true,
      'message' => "You have been logged in successfully",
      'teacher_token' => $token,
    ], 201);
  }
}
