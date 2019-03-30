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
class Darurat extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_post()
  {
    $id = $this->post('id');
    if(intval($id) <= 0){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
    }

    $where['id_atribut'] = $id;
    $this->db->select('*')
             ->from('konfigurasi')
             ->where($where);
    $list_data = $this->db->get()->row_array();

    /*if(intval($id_poli) <= 0){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
    }*/ //tak comment

    if(!empty($list_data)){
      $res = array('code' => 1, 'message' => 'Generating Ambulance data', 'result' => $list_data);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
  }



}

?>
