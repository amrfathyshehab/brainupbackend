<?php

namespace App\Console\Commands;

use DB;
use App\Models\Message;
use App\Models\Passwordtoken;
use Illuminate\Console\Command;
 

 


class Otp extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'otp:delete';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
      $otps = Passwordtoken::where('student_id',$std->id)->where('otp',$request->otp)->where('expire_at', '>=', date('Y-m-d H:i:s'))->delete();
        
  
}

   
       
    }
 