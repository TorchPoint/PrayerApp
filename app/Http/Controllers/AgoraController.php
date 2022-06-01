<?php

namespace App\Http\Controllers;

namespace App\Services\Agora\RtcTokenBuilder;

use Illuminate\Http\Request;

class AgoraController extends Controller
{
    public function __construct(){
       

    }
    
    public function agoraToken(){
        
        //  require_once __DIR__ . '/Agora/src/RtcTokenBuilder.php';
        $appID = "970CA35de60c44645bbae8a215061b33";
        $appCertificate = "5CFd2fd1755d40ecb72977518be15d3b";
        $channelName = "testc";
        $uid = 2882341273;
        $uidStr = "2882341273";
        $role = RtcTokenBuilder::RoleAttendee;
        $expireTimeInSeconds = 3600;
        $currentTimestamp = (new DateTime("now", new DateTimeZone('UTC')))->getTimestamp();
        $privilegeExpiredTs = $currentTimestamp + $expireTimeInSeconds;
        
        $token = RtcTokenBuilder::buildTokenWithUid($appID, $appCertificate, $channelName, $uid, $role, $privilegeExpiredTs);
        echo 'Token with int uid: ' . $token . PHP_EOL;
        
        $token = RtcTokenBuilder::buildTokenWithUserAccount($appID, $appCertificate, $channelName, $uidStr, $role, $privilegeExpiredTs);
        echo 'Token with user account: ' . $token . PHP_EOL;
    }
}
