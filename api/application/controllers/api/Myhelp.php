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
class Myhelp extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function form_rekam_medis_get(){

    $id = $this->get('id');
    $id_jenis_layanan = $this->get("id_jenis_layanan");
    $id_pengguna = $this->rest->user_id;
    $limit = 0;
    $page  = 0;
    $where['pasien.deleted'] = 1;
    $where['pasien.id_pengguna'] = $id_pengguna;

    $this->db->select('pasien.*,m_agama.nama as nama_agama,m_status_pernikahan.nama as nama_status_nikah')
             ->from('pasien')
             ->join('m_agama','m_agama.id = pasien.id_agama')
             ->join('m_status_pernikahan','m_status_pernikahan.id = pasien.id_status_pernikahan')
             ->where($where);
    $list_data = $this->db->get()->result_array();
    //$agama     = $this->db->query("select * from m_agama where deleted=1")->result();
    //$nikah     = $this->db->query("select * from m_status_pernikahan where deleted=1")->result();
    $kelas     = $this->db->query("select * from m_kelas where deleted=1 and id in (select id_kelas from lokasi_kelas where id_jenis_layanan=$id_jenis_layanan)")->result();
    $bayar     = $this->db->query("select * from m_cara_bayar where deleted=1 ")->result();

    if($id === NULL){
      if(!empty($list_data) || 1 == 1){
        $res = array('code' => 1, 'message' => 'List pasien',
              'pasien' => $list_data,
              'kelas'=>$kelas,
              'cara_bayar'=>$bayar,
            );
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

  public function form_pasien_get(){

    $id_pengguna = $this->rest->user_id;

    /*
    $where['pasien.deleted'] = 1;
    $where['pasien.id_pengguna'] = $id_pengguna;

    $this->db->select('pasien.*,m_agama.nama as nama_agama,m_status_pernikahan.nama as nama_status_nikah')
             ->from('pasien')
             ->join('m_agama','m_agama.id = pasien.id_agama')
             ->join('m_status_pernikahan','m_status_pernikahan.id = pasien.id_status_pernikahan')
             ->where($where);
    $list_data = $this->db->get()->result_array();
    */
    $agama     = $this->db->query("select * from m_agama where deleted=1")->result();
    $nikah     = $this->db->query("select * from m_status_pernikahan where deleted=1")->result();

    $res = array('code' => 1, 'message' => 'List ',
          'agama'=>$agama,
          'status_pernikahan'=>$nikah,
        );
    $this->response($res, REST_Controller::HTTP_OK);

    
  }

  public function index_post()
  {

  }

  public function index_put()
  {

  }

}

?>
