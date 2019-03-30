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
class Rekam_medis extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){

    $id = $this->get('id');
    $id_pengguna = $this->rest->user_id;
    $limit = 0;
    $page  = 0;
    $where['a.deleted'] = 1;
    $where['a.id_pengguna'] = $id_pengguna;

    $this->db->select('a.*, b.nama_lengkap, b.jenis_kelamin, c.nama_poli, d.nama as nama_jenis_layanan, e.nama as nama_dokter')
             ->from('rekam_medis a')
             ->join('pasien b','a.id_pasien = b.id_pasien and b.deleted = 1 ','left')
             ->join('m_poli c','a.id_poli = c.id and c.deleted = 1 ','left')
             ->join('m_jenis_layanan d','a.id_jenis_layanan = d.id and d.deleted = 1 ','left')
             ->join('m_dokter e','a.id_dokter = e.id and e.deleted = 1 ','left')
             ->where($where);
    $list_data = $this->db->get()->result_array();
    if($id === NULL){
      if(!empty($list_data) || 1 == 1){
        $res = array('code' => 1, 'message' => 'List rekam medis', 'result' => $list_data);
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

      $tam_jenlay = "0";
      $tam_kelas = "0";
      foreach($post_data as $key => $value){
        $data_post[$key] = $value;
        if($key == "id_jenis_layanan"){
          $tam_jenlay = $value;
        }
        if($key == "id_kelas"){
          $tam_kelas = $value;
        }
      }

      $tam_id_ruangan = $this->db->query("select id_ruangan from lokasi_kelas where id_jenis_layanan = $tam_jenlay and id_kelas = $tam_kelas and deleted = 1");
      $id_ruangan = "0";
      if($tam_id_ruangan->num_rows() > 0){
        $id_ruangan = $tam_id_ruangan->first_row()->id_ruangan;
      }
      
      $tam_lokasi_ruangan = $this->db->query("select lokasi_ruangan from m_ruangan where id = $id_ruangan and deleted = 1");
      $lokasi_ruangan = "0";
      if($tam_lokasi_ruangan->num_rows() > 0){
        $lokasi_ruangan = $tam_lokasi_ruangan->first_row()->lokasi_ruangan;
      }
      
      $data_post['id_ruangan'] = $id_ruangan;
      $data_post['id_pengguna'] = $this->rest->user_id;
      $data_post['lokasi'] = $lokasi_ruangan;
      $data_post['no_registrasi'] = date('dmy').'1'.rand(10000,99999);

      //print_r($data_post);
      //exit();
      $this->db->insert('layanan',$data_post);
      $insert_id = $this->db->insert_id();
      if($insert_id > 0){
        $res = $this->db->query("select a.*,b.nama as nama_kelas, c.nama as cara_bayar, d.nama_lengkap, e.nama_ruangan
        from layanan a, m_kelas b, m_cara_bayar c, pasien d, m_ruangan e
        where a.id_cara_bayar = c.id and a.id_kelas = b.id and a.id_pasien = d.id_pasien and a.id_ruangan = e.id and a.id_layanan=$insert_id")->result();
        $res = array('code' => 1, 'message' => 'Data tersimpan', 'result' => $res);
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