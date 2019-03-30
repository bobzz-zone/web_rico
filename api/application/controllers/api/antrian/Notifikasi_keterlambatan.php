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
class Notifikasi_keterlambatan extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){
    $date = date("Y-m-d");
    $where['id_pengguna'] = $this->rest->user_id;
    $where['deleted'] = "1";
    $where['tanggal >='] = $date;

    $this->db->select("*,'Antrian Anda hari ini' as label_waktu")
             ->from('notifikasi_keterlambatan')
             ->where($where)
             ->order_by('tanggal','desc');
    $list_data = $this->db->get()->result_array();
	
	//$list_data["label_waktu"] = "Antrian Anda hari ini";
    if(!empty($list_data) || 1==1){
      $res = array('code' => 1, 'message' => 'List notifikasi', 'result' => $list_data);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

  public function index_post()
  {
    $post_data = $this->post();
    if(!empty($post_data['notifikasi']))
    {
      $this->db->insert('notifikasi_keterlambatan',$post_data);
      $insert_id = $this->db->insert_id();
      if($insert_id > 0)
      {
        $res = array("code" => 1, "message" => "ok inserted","data" => $post_data);
        $this->response($res, REST_Controller::HTTP_OK);
      }
      $res = array("code" => 2, "message" => "failed inserting data","data" => $post_data);
      $this->response($res, REST_Controller::HTTP_OK);
    }
  }

}

?>
