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
class Dokter extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        //$this->methods['index_get']['limit'] = 500; // 500 requests per hour per user/key
        //$this->methods['index_post']['limit'] = 100; // 100 requests per hour per user/key
        //$this->methods['index_delete']['limit'] = 50; // 50 requests per hour per user/key
    }

    public function index_get($id = NULL){
      //$id    = $this->get('id');
      $limit = $this->get('limit');
      $page  = $this->get('page');
      $poli  = $this->get('id_poli');
      $order_by = $this->get('order_by');
      $order_type = $this->get('order_type');

      //$list_data = $this->db->get_where('m_dokter',array('deleted' => 1))->result_array();
      $list_data = $this->db->query("select d.*,u.nama as nama_univ from
      m_dokter d, m_universitas u where d.id_universitas = u.id and d.deleted=1 and id_poli='$poli' ")->result();
      if($id === NULL){

        if(!empty($list_data)){

          $res = array('code' => 1 , 'message' => 'List of doctors' , 'result' => $list_data);
          $this->response($res, REST_Controller::HTTP_OK);
        }else{
          $res = array('code' => 0, 'message' => 'No data available' , 'result' => array());
          $this->response($res, REST_Controller::HTTP_NOT_FOUND);
        }

      }

      if(intval($id) <= 0){
        $res = array('code' => 0, 'message' =>  'invalid id', 'result' => array());
        $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
      }

      $data = NULL;
      if(!empty($list_data)){
        foreach ($list_data as $key => $value) {
          # code...
          if(isset($value['id']) && $value['id'] == $id){
            $data = $value;
          }
        }
      }

      if (!empty($data))
      {
          $res = array('code' => 1, 'message' => 'Success, generating doctors data', 'result' => $data);
          $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
      }
      else
      {
          $this->set_response([
              'code'  => 0,
              'message' => 'Doctors could not be found',
              'result'  => array()
          ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
      }

    }

}








?>
