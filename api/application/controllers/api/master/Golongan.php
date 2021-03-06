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
class Golongan extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){

    $id = $this->get('id');
    $limit = 0;
    $page  = 0;

    $list_data = $this->db->order_by('id','asc')
                          ->get_where('m_golongan',array('deleted' => '1'))
                          ->result_array();
    if($id === NULL){
      /* get jenis */
      $list_jenis = $this->db->order_by('id','asc')
                            ->get_where('m_jenis',array('deleted' => '1'))
                            ->result_array();
      $list_kategori = $this->db->order_by('id','asc')
                            ->get_where('m_kategori',array('deleted' => '1'))
                            ->result_array();

      if(!empty($list_data)){
        $ret = array(
                      'list_jenis'    => $list_jenis,
                      'list_kategori' => $list_kategori,
                      'list_golongan' => $list_data
                    );
        $res = array('code' => 1, 'message' => 'List Data', 'result' => $ret);
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
      $res = array('code' => 1, 'message' => 'Generating detail', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }
    $res = array('code' => 0, 'message' => 'Cannot get data', 'result' => array());
    $this->set_response($res, REST_Controller::HTTP_NOT_FOUND);

  }

}

?>
