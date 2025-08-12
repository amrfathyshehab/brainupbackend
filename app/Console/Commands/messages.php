<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
use App\Models\Message;
 

 


class messages extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'user:messages';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send api request for all students every monday';

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
      sleep(rand(2,5));

      $n_messages = Message::where('sent_at',NULL)->count();
if($n_messages>0){
  $messages = Message::where('sent_at',NULL)->limit(1)->get();
foreach($messages as $message){
  $params=array(
    'token' => '7xcoeq2v06t02upc',
    'to' => '+2'.$message->send_to,
    'body' => $message->message,
    'priority' => '10',
    'referenceId' => '',
    'msgId' => '',
    'mentions' => ''
    );
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://api.ultramsg.com/instance71313/messages/chat",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30,
      CURLOPT_SSL_VERIFYHOST => 0,
      CURLOPT_SSL_VERIFYPEER => 0,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => http_build_query($params),
      CURLOPT_HTTPHEADER => array(
        "content-type: application/x-www-form-urlencoded"
      ),
    ));
    
    $response = curl_exec($curl);
    $err = curl_error($curl);
    
    curl_close($curl);
    
    $message->update([
      'sent_at' => date('Y-m-d H:i:s')
  
  
  ]);

   }

}
  
}

   
       
    }
 