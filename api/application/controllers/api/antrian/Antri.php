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
class Antri extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_post()
  {
    $post_data = $this->post();
    if(!empty($post_data))
    {
      $id_poli = $post_data['id_poli'];
      //$id_jenis_layanan = $post_data['id_jenis_layanan'];
      $allday = array(0=>'', 1=>'monday',2=> 'tuesday',3=> 'wednesday',4=> 'thursday', 5=>'friday', 6=>'Saturday',7=>'sunday');
      $hari = $post_data['id_hari'];
         $tanggal = date('Y-m-d');
         if($post_data['id_hari'] == date('N')){
      }else{
          $tanggal = date('Y-m-d', strtotime('next '.$allday[intval($post_data['id_hari'])], strtotime(date('Y-m-d'))));
      }

      $cek = $this->db->query("select id from antrian where status=0 and id_poli=$id_poli and id_dokter=".$post_data['id_dokter']." and id_pasien=".$post_data['id_pasien']." and tanggal = '$tanggal' ");
      if($cek->num_rows() > 0){
        $res = array('code' => 0, 'message' => 'Pasien sudah terdaftar di antrian ini, pilih hari lain', 'result' => array());
        $this->response($res, REST_Controller::HTTP_OK);
      }
      $last_urutan = $this->db->query("select id,nomor_urut from antrian where id_poli='$id_poli' and tanggal = '$tanggal' order by nomor_urut desc limit 0,1");

      $terakhir = 0;
      if($last_urutan->num_rows() > 0){
        $a = $last_urutan->first_row()->nomor_urut;
        $terakhir = intval($a);
      }


      $urutan = $terakhir + 1;
      $waktu_layanan = intval($post_data['waktu_layanan']);
      $waktu = $urutan * $waktu_layanan;
      $kuota = intval($post_data['kuota']);
      $jam_mulai = $post_data['jam_mulai'];

      if($urutan == 1){
        $jamku = $jam_mulai;
      }elseif($waktu <= $kuota){

        $endTime = strtotime("+".(($urutan-1) * $waktu_layanan)." minutes", strtotime($jam_mulai));
        $jamku =  date('h:i:s', $endTime);

      }else{
        $res = array('code' => 0, 'message' => 'Antrian sudah penuh', 'result' => array());
        $this->response($res, REST_Controller::HTTP_OK);
      }

      $tam_lokasi = $this->db->query("select lokasi from m_poli where id = $id_poli and deleted = 1");
      $lokasi = "";
      if($tam_lokasi->num_rows() > 0){
        $lokasi = $tam_lokasi->first_row()->lokasi;
      }

      $inserting['id_poli'] = $id_poli;
      $inserting['lokasi'] = $lokasi;
      $inserting['id_jenis_layanan'] = "0";
      $inserting['id_dokter'] = $post_data['id_dokter'];
      $inserting['id_pasien'] = $post_data['id_pasien'];
      $inserting['id_hari']   = $post_data['id_hari'];
      //$inserting['id_kelas']   = $post_data['id_kelas'];
      $inserting['id_pengguna'] = $this->rest->user_id;
      $inserting['tanggal'] = $tanggal;
      $inserting['perkiraan_jam'] = $jamku;
      $inserting['nomor_urut'] = $urutan;
      $inserting['no_rekam_medis'] = $post_data['no_rekam_medis'];
      $inserting['no_registrasi'] = date('dmy').'1'.rand(10000,99999);
      $inserting['status'] = 0;

      //print_r($inserting);
      //exit();
      $this->db->insert('antrian',$inserting);
      $insert_id = $this->db->insert_id();
      if($insert_id > 0)
      {
        $res = $this->db->query("select a.*,p.nama_poli,p.lokasi,d.nama as nama_dokter, pp.nama_lengkap
                        from antrian a,m_poli p, m_dokter d,pasien pp
                        where a.id_dokter = d.id and a.id_poli = p.id and a.id_pasien = pp.id_pasien and a.id = $insert_id ")->result();
        $res = array('code' => 1, 'message' => 'Success, queuing', 'result' => $res);
        $this->response($res, REST_Controller::HTTP_OK);
      }
      $res = array('code' => 0, 'message' => 'Failed queuing', 'result' => array());
      $this->response($res, REST_Controller::HTTP_OK);
    }
  }

  public function insert_post(){
      $post_data = $this->post();

      if(!empty($post_data)){
        $data_post = array();

        foreach($post_data as $key => $value){
          $data_post[$key] = $value;
        }
        $data_post['id_pengguna'] = $this->rest->user_id;
        $data_post['id_poli'] = "0";

        print_r($data_post);
        exit();
        $this->db->insert('antrian',$data_post);
        $insert_id = $this->db->insert_id();
        if($insert_id > 0){
          $res = array('code' => 1, 'message' => 'New comment added', 'result' => $data_post);
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


    function pasien_get(){
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
        $now = date('Y-m-d');
        $select_notif_telat = $this->db->query("select count(*) as total from notifikasi_keterlambatan where id_pengguna = $id_pengguna and deleted = 1 and tanggal >= '$now'")->first_row()->total;
        
        $res = array('code' => 1, 'message' => 'List pasien', 'result' => $list_data,'notif_telat'=> $select_notif_telat);
        $this->response($res, REST_Controller::HTTP_OK);
      }
      $res = array('code' => 0, 'message' => 'No data available', 'result' => array(),'notif_telat'=>"" );
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

  public function index_get(){

    $id = $this->get('id');
    $limit = 0;
    $page  = 0;
    $where['deleted'] = 1;


    $this->db->select('*')
             ->from('m_poli')
             ->where($where);
    $list_data = $this->db->get()->result_array();
    if($id === NULL){
      if(!empty($list_data)){
        $res = array('code' => 1, 'message' => 'List poli', 'result' => $list_data);
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
      $res = array('code' => 1, 'message' => 'Generating poli detail', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }
    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

}

?>
