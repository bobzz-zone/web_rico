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
class Pasien extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){

    $id = $this->get('id');
    $id_pengguna = $this->rest->user_id;

    $limit = 0;
    $page  = 0;
    $where['deleted'] = 1;
    $where['id_pengguna'] = $id_pengguna;

    $this->db->select('*')
             ->from('pasien')
             ->where($where);
    $list_data = $this->db->get()->result_array();
    if($id === NULL){
      if(!empty($list_data) || 1 == 1){
        $res = array('code' => 1, 'message' => 'List pasien', 'result' => $list_data);
        $this->response($res, REST_Controller::HTTP_OK);
      }
      $res = array('code' => 0, 'message' => 'No data available', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

    }

    if(intval($id) <= 0){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
    }
    
    $data = NULL;
    if(!empty($list_data)){
      foreach($list_data as $value){
        if(isset($value['id']) && $value['id'] == $id){
          $data = $value;
        }
      }
    }

    if(!empty($data)){
      $res = array('code' => 1, 'message' => 'Generating pasien detail', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }
    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

  public function insert_post()
  {
    $post_data = $this->post();

    if(!empty($post_data)){
      $data_post = array();

      foreach($post_data as $key => $value){
        $data_post[$key] = $value;
      }
      $data_post['id_pengguna'] = $this->rest->user_id;
      //$data_post['no_rekam_medis'] = rand(1000,10000);
      $data_post['no_bpjs'] = "0";
      $data_post['use_bpjs'] = "0";

      //print_r($data_post);
      //exit();
      $this->db->insert('pasien',$data_post);
      $insert_id = $this->db->insert_id();
      if($insert_id > 0){
        //upadte no_rekam_medis
        $no_rekam_medis = $insert_id + 100;
        $this->db->query("update pasien set no_rekam_medis = $no_rekam_medis where id_pasien = $insert_id");
        $res = array('code' => 1, 'message' => 'Data tersimpan', 'result' => array());
        $this->response($res, REST_Controller::HTTP_CREATED);
      }

      $res = array('code' => 0 ,'message' => 'Couldn\'t add the comment' ,'result' => array());
      $this->response($res, REST_Controller::HTTP_NOT_ACCEPTABLE);
    }


      $message = [
          'id' => 0, // Automatically generated by the model
          'message' => 'Cannot save empty data',
          'result' => array()
      ];

      $this->set_response($message, REST_Controller::HTTP_BAD_REQUEST);
  }

  public function update_post()
  {
    $post_data = $this->post();

    if(!empty($post_data)){
      $data_post = array();

      foreach($post_data as $key => $value){
        $data_post[$key] = $value;
      }


      //$data_post['no_bpjs'] = "0";
      //$data_post['use_bpjs'] = "0";

      //print_r($data_post);
      //exit();
      $this->db->where('id_pasien',$data_post['id_pasien']);
      $this->db->update('pasien',$data_post);
      if($this->db->affected_rows() > 0){
        $res = array('code' => 1, 'message' => 'Data tersimpan', 'result' => array());
        $this->response($res, REST_Controller::HTTP_CREATED);
      }

      $res = array('code' => 0 ,'message' => 'Couldn\'t add the comment' ,'result' => array());
      $this->response($res, REST_Controller::HTTP_NOT_ACCEPTABLE);
    }


      $message = [
          'id' => 0, // Automatically generated by the model
          'message' => 'Cannot save empty data',
          'result' => array()
      ];

      $this->set_response($message, REST_Controller::HTTP_BAD_REQUEST);
  }

  public function delete_post()
  {
    $post_data = $this->post();

    if(!empty($post_data)){
      $data_post = array();

      foreach($post_data as $key => $value){
        $data_post[$key] = $value;
      }


      $data_post['deleted'] = "0";


      //print_r($data_post);
      //exit();
      $this->db->where('id_pasien',$data_post['id_pasien']);
      $this->db->update('pasien',$data_post);
      if($this->db->affected_rows() > 0){
        $res = array('code' => 1, 'message' => 'Data terhapus', 'result' => array());
        $this->response($res, REST_Controller::HTTP_CREATED);
      }

      $res = array('code' => 0 ,'message' => 'Couldn\'t add the comment' ,'result' => array());
      $this->response($res, REST_Controller::HTTP_NOT_ACCEPTABLE);
    }


      $message = [
          'id' => 0, // Automatically generated by the model
          'message' => 'Cannot save empty data',
          'result' => array()
      ];

      $this->set_response($message, REST_Controller::HTTP_BAD_REQUEST);
  }

  public function index_put()
  {

  }

}

?>
