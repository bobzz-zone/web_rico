<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Xsight
{
	protected $CI;
	/** COnstruktor */

	function __construct()
	{
		$this->CI =& get_instance();
    $this->url_api = 'https://api.mainapi.net/';
    $this->api_token = "";

	}

  function _generate_token(){
    $url_api = $this->url_api.'token';

    $bodyReq = array(
                     'grant_type' 					=> 'client_credentials'
                     );

    $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => $url_api,
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_CUSTOMREQUEST => "POST",
       CURLOPT_POSTFIELDS => http_build_query($bodyReq),
       CURLOPT_HTTPHEADER => array(
         "Authorization: Basic MGZhem9jTlBMSmZ5ZmxCNTc3NnRLZUFVSkNzYTpxRkNMX2ZBenJWMG0xYzdwRlVEb25GTWZhWWNh",
       ),
     ));

     $response = curl_exec($curl);
     $err = curl_error($curl);

     curl_close($curl);

     if ($err) {
       return "cURL Error #:" . $err;
     } else {
       $res = json_decode($response,true);
       return $res['access_token'];
     }
  }

  function sms_otp($phone,$content){
    $url_api = $this->url_api.'smsotp/1.0.1/messages';
    $token = $this->_generate_token();
    $bodyReq = array(
                     'msisdn' 					=> $phone,
                     'content' 					=> $content,
                     );

    $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => $url_api,
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_CUSTOMREQUEST => "POST",
       CURLOPT_POSTFIELDS => http_build_query($bodyReq),
       CURLOPT_HTTPHEADER => array(
         "Accept: application/json",
         "Content-Type: application/x-www-form-urlencoded",
         "Authorization: Bearer ".$token,
       ),
     ));

     $response = curl_exec($curl);
     $err = curl_error($curl);

     curl_close($curl);

     if ($err) {
       return "cURL Error #:" . $err;
     } else {
       return $response;
     }
  }

  function sms_notif($phone,$content){
    $url_api = $this->url_api.'smsnotification/1.0.0/messages';
    $token = $this->_generate_token();
    $bodyReq = array(
                     'msisdn' 					=> $phone,
                     'content' 					=> $content,
                     );

    $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => $url_api,
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_CUSTOMREQUEST => "POST",
       CURLOPT_POSTFIELDS => http_build_query($bodyReq),
       CURLOPT_HTTPHEADER => array(
         "Accept: application/json",
         "Content-Type: application/x-www-form-urlencoded",
         "Authorization: Bearer ".$token,
       ),
     ));

     $response = curl_exec($curl);
     $err = curl_error($curl);

     curl_close($curl);

     if ($err) {
       return "cURL Error #:" . $err;
     } else {
       return $response;
     }
  }

  function helio($phone,$content){
    $url_api = $this->url_api.'helio/1.0.1/messages';
    $token = $this->_generate_token();
    $bodyReq = array(
                     'msisdn' 					=> $phone,
                     'content' 					=> $content,
                     );

    $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => $url_api,
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_CUSTOMREQUEST => "POST",
       CURLOPT_POSTFIELDS => http_build_query($bodyReq),
       CURLOPT_HTTPHEADER => array(
         "Accept: application/json",
         "Content-Type: application/x-www-form-urlencoded",
         "Authorization: Bearer ".$token,
       ),
     ));

     $response = curl_exec($curl);
     $err = curl_error($curl);

     curl_close($curl);

     if ($err) {
       return "cURL Error #:" . $err;
     } else {
       return $response;
     }
  }

}?>
