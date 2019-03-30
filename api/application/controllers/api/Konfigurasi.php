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
class Konfigurasi extends REST_Controller {

  function __construct()
  {
      parent::__construct();

  }

  public function index_get(){
    $id = $this->get('id');

    if(empty($id)){
      $res = array('code' => 0, 'message' => 'Invalid name', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_BAD_REQUEST);
    }

    $data = NULL;
    if(!empty($id)){
      $data = $this->db->select('nama_atribut,nilai_atribut,komentar,penjelasan,nama_label')
                       ->get_where('konfigurasi',array('id_atribut' => $id))->row_array();
    }

    if(!empty($data)){
      $res = array('code' => 1, 'message' => 'Generating konfigurasi info', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'cannot process request', 'result' => array());
    $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
  }

  public function multiple_get()
  {
    $id = $this->get('id');
    if(empty($id)){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_BAD_REQUEST);
    }
    $data = NULL;
    if(!empty($id)){
      //$id_arr = explode(',',$id);
      $dat = $this->db->query('select nama_atribut,nilai_atribut,komentar,penjelasan,nama_label from konfigurasi where id_atribut in ('.$id.')');
      $data = $dat->result();
    }

    if(!empty($data)){
      $res = array('code' => 1, 'message' => 'Generating konfigurasi list', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'cannot process request', 'result' => array());
    $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
  }

}

?>
