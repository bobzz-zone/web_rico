<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . 'libraries/REST_Controller.php';

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class Contact_us extends REST_Controller {

  function __construct()
  {
      parent::__construct();
      //$this->load->model('api/Saldo_model','model');
  }

  public function index_get(){

  }

  public function index_post(){
    $post_data = $this->post();
    if(!empty($post_data)){
      $data_post = array();
      foreach($post_data as $key => $value){
        $data_post[$key] = $value;
      }
      $this->db->insert('contact_us',$data_post);
      $insert_id = $this->db->insert_id();
      if($insert_id > 0){
        $ret = array('id' => $insert_id, 'title' => $data_post[$key]);
        $res = array('code' => 1, 'message' => 'You\'re message was sent','result' => $ret);
        $this->response($res, REST_Controller::HTTP_CREATED);
      }
      $res = array('code' => 0, 'message' => 'Opps, cannot send the message', 'result' => array());
      $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
    }
    $res = array('code' => 0, 'message' => 'Cannor process your request', 'result' => array());
    $this->response($res, REST_Controller::HTTP_BAD_REQUEST);

  }

}
?>
