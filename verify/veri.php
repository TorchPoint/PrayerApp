<?php
require_once './vendor/autoload.php';
use ReceiptValidator\iTunes\Validator as iTunesValidator;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

if(!isset($_POST['token']) || empty($_POST['token'])){
  echo json_encode(['status'=>0,'message'=>'token Field is Required']);
  exit;
} elseif (!isset($_POST['device_type'])  || empty($_POST['device_type'])){
  echo json_encode(['status'=>0,'message'=>'device_type Field is Required']);
exit;
}
if(isset($_POST['action']) && $_POST['action']=='verify' && $_POST['token']!='' && $_POST['device_type']!=''){
error_reporting(E_ALL | E_STRICT);
ini_set('display_errors', 1);

if ($_POST['device_type']=='ios') {
$validator = new iTunesValidator(iTunesValidator::ENDPOINT_SANDBOX); // Or iTunesValidator::ENDPOINT_SANDBOX if sandbox testing

$receiptBase64Data = $_POST['token'];

try {
  $response = $validator->setReceiptData($receiptBase64Data)->validate();
  $sharedSecret = 'bfc920defe19495ab79348370967584c'; // Generated in iTunes Connect's In-App Purchase menu
   $response = $validator->setSharedSecret($sharedSecret)->setReceiptData($receiptBase64Data)->validate(); // use setSharedSecret() if for recurring subscriptions
} catch (Exception $e) {
  echo 'got error = ' . $e->getMessage() . PHP_EOL;
}

if ($response->isValid()) {
  echo json_encode(['status'=>1,'message'=>"Receipt is Valid...!"]);
  exit;
  // echo 'Receipt is valid.' . PHP_EOL;
  // echo 'Receipt data = ' . print_r($response->getReceipt()) . PHP_EOL;
  
  // foreach ($response->getPurchases() as $purchase) {
  //   echo 'getProductId: ' . $purchase->getProductId() . PHP_EOL;
  //   echo 'getTransactionId: ' . $purchase->getTransactionId() . PHP_EOL;

  //   if ($purchase->getPurchaseDate() != null) {
  //     echo 'getPurchaseDate: ' . $purchase->getPurchaseDate()->toIso8601String() . PHP_EOL;
  //   }
  // }
} else {
  echo json_encode(['status'=>0,'message'=>"Receipt is Invalid...!"]);
exit;
  // echo 'Receipt is not valid.' . PHP_EOL;
  // echo 'Receipt result code = ' . $response->getResultCode() . PHP_EOL;
 }
 }elseif ($_POST['device_type']=='android') {
   echo json_encode(['status'=>1,'message'=>"Receipt is Valid...!"]);
  exit;
 }else{
   echo json_encode(['status'=>1,'message'=>"Invalid Device Type"]);
  exit;
 }
}

?>