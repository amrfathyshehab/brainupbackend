<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::firstOrCreate([
            'name' => 'superadmin',
            'guard_name' => 'admin',
        ]);

        $permissions = [
            ['name' => 'student_view', 'public_name' => 'View', 'section' => 'Student'],
            ['name' => 'student_edit', 'public_name' => 'Edit', 'section' => 'Student'],
            ['name' => 'student_delete', 'public_name' => 'Delete', 'section' => 'Student'],
            ['name' => 'lecture_add', 'public_name' => 'Add', 'section' => 'Lectures'],
            ['name' => 'lecture_edit', 'public_name' => 'Edit', 'section' => 'Lectures'],
            ['name' => 'lecture_delete', 'public_name' => 'Delete', 'section' => 'Lectures'],
            ['name' => 'lecture_addstudent', 'public_name' => 'Add student on lecture', 'section' => 'Lectures'],
            ['name' => 'lecture_addmatrial', 'public_name' => 'Add attachment', 'section' => 'Lectures'],
            ['name' => 'lecture_addvideos', 'public_name' => 'Add lecture', 'section' => 'Lectures'],
            ['name' => 'lecture_addcustomvideos', 'public_name' => 'Add custom videos', 'section' => 'Lectures'],
            ['name' => 'code_delete', 'public_name' => 'Delete', 'section' => 'Codes'],
            ['name' => 'code_add', 'public_name' => 'Add', 'section' => 'Codes'],
            ['name' => 'request_view', 'public_name' => 'View', 'section' => 'Requests'],
            ['name' => 'request_accept', 'public_name' => 'Accept', 'section' => 'Requests'],
            ['name' => 'request_delete', 'public_name' => 'Delete', 'section' => 'Requests'],
            ['name' => 'analystics_view', 'public_name' => 'View', 'section' => 'Statistics'],
            ['name' => 'attendance_view', 'public_name' => 'View', 'section' => 'Attendance'],
            ['name' => 'attendance_attend', 'public_name' => 'Attend', 'section' => 'Attendance'],
            ['name' => 'attendance_edit', 'public_name' => 'Edit', 'section' => 'Attendance'],
            ['name' => 'attendance_viewnumberofstudent', 'public_name' => 'View number of attendees', 'section' => 'Attendance'],
            ['name' => 'code_update', 'public_name' => 'Edit', 'section' => 'Codes'],
            ['name' => 'group_delete', 'public_name' => 'Delete', 'section' => 'Groups'],
            ['name' => 'group_add', 'public_name' => 'Add', 'section' => 'Groups'],
            ['name' => 'group_views', 'public_name' => 'View', 'section' => 'Groups'],
            ['name' => 'group_update', 'public_name' => 'Edit', 'section' => 'Groups'],
            ['name' => 'questionbank_addcategory', 'public_name' => 'Add Category', 'section' => 'Question Bank'],
            ['name' => 'questionbank_allcategory', 'public_name' => 'View Category', 'section' => 'Question Bank'],
            ['name' => 'questionbank_updatecategory', 'public_name' => 'Edit category', 'section' => 'Question Bank'],
            ['name' => 'questionbank_deletecategory', 'public_name' => 'Delete category', 'section' => 'Question Bank'],
            ['name' => 'questionbank_viewquestionbycategory', 'public_name' => 'View Questions', 'section' => 'Question Bank'],
            ['name' => 'questionbank_addquestion', 'public_name' => 'Add Questions', 'section' => 'Question Bank'],
            ['name' => 'questionbank_deletequestion', 'public_name' => 'Delete Questions', 'section' => 'Question Bank'],
            ['name' => 'questionbank_editquestion', 'public_name' => 'Edit Questions', 'section' => 'Question Bank'],
            ['name' => 'lecture_view', 'public_name' => 'View', 'section' => 'Lectures'],
            ['name' => 'lecture_addquiz', 'public_name' => 'Add Exam', 'section' => 'Lectures'],
            ['name' => 'lecture_addHw', 'public_name' => 'Add homework', 'section' => 'Lectures'],
            ['name' => 'attendance_viewabsence', 'public_name' => 'View Absence', 'section' => 'Attendance'],
            ['name' => 'post_view', 'public_name' => 'View', 'section' => 'Posts'],
            ['name' => 'post_edit', 'public_name' => 'Edit', 'section' => 'Posts'],
            ['name' => 'post_add', 'public_name' => 'Add', 'section' => 'Posts'],
            ['name' => 'post_delete', 'public_name' => 'Delete', 'section' => 'Posts'],
            ['name' => 'whatsapp_show', 'public_name' => 'View', 'section' => 'Whatsapp'],
            ['name' => 'whatsapp_send', 'public_name' => 'Send messages', 'section' => 'Whatsapp'],
            ['name' => 'exam_view', 'public_name' => 'Students', 'section' => 'Exams'],
            ['name' => 'exam_add', 'public_name' => 'Add', 'section' => 'Exams'],
            ['name' => 'exam_edit', 'public_name' => 'Edit', 'section' => 'Exams'],
            ['name' => 'exam_delete', 'public_name' => 'Delete', 'section' => 'Exams'],
            ['name' => 'exam_addquestions', 'public_name' => 'Add Questions', 'section' => 'Exams'],
            ['name' => 'code_tracker', 'public_name' => 'Code tracker', 'section' => 'Codes'],
            ['name' => 'code_views', 'public_name' => 'Codes table', 'section' => 'Codes'],
            ['name' => 'teacher_view', 'public_name' => 'View', 'section' => 'Teachers'],
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(
                ['name' => $permission['name'], 'guard_name' => 'admin'],
                [
                    'public_name' => $permission['public_name'],
                    'section'     => $permission['section']
                ]
            );
        }
    }
}
