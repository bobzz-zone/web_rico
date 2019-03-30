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
class Pantau extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){
    date_default_timezone_set("Asia/Jakarta");
    $id = $this->get('id');
    //$id_jenis_layanan = $this->get('id_jenis_layanan');
    $where['id'] = $id;
    $where['status'] = 0;


    $re = $this->db->query("select a.*,b.nama_poli from antrian a,m_poli b
			where 
			a.id_poli = b.id 
			and 
			a.status=0 
			and 
			a.tanggal >= curdate() 
			and 
			a.id=$id ");
    $list_data = $re->row_array();
	if($list_data['tanggal'] == date("Y-m-d")){
		$list_data["label_waktu"] = "Pukul ".substr($list_data['perkiraan_jam'],0,5);
		$res2 = $this->db->query("select min(nomor_urut) as saat_ini from antrian where 
							status=0 
							and 
							tanggal = '".$list_data['tanggal']."' 
							and 
							id_dokter = '".$list_data['id_dokter']."'
							and 
							id_poli = '".$list_data['id_poli']."'
							");
		$saat_ini = $res2->first_row()->saat_ini;
	}else{
		$originalDate = $list_data['tanggal'];
		$newDate = date("d-M-Y", strtotime($originalDate));
		$list_data["label_waktu"] = "$newDate pukul ".substr($list_data['perkiraan_jam'],0,5);
		$saat_ini = 'Belum dimulai';
	}
	//$this->db->query("select max()");
	
    if(intval($id) <= 0){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
    }

    if(!empty($list_data) || 1==1){
      $res = array('code' => 1, 'message' => 'Last antrian', 'result' => $list_data,'saat_ini'=>$saat_ini);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

  public function list_get(){

    $id_pengguna = $this->rest->user_id;
    //$id_jenis_layanan = $this->get('id_jenis_layanan');
    $where['status'] = 0;
    $where['id_pengguna'] = $id_pengguna;


    $re = $this->db->query("select * from antrian where status=0 and tanggal >= curdate() and id_pengguna='$id_pengguna' ");
    $list_data = $re->result_array();

    if(intval($id_pengguna) <= 0){
      $res = array('code' => 0, 'message' => 'Invalid id', 'result' => array());
      $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);
    }

    if(!empty($list_data) || 1==1){
      $res = array('code' => 1, 'message' => 'List antrian', 'result' => $list_data);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

}

?>
