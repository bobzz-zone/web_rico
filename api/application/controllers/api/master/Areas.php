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
class Areas extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

        $this->load->model('api/Areas_model','model');
    }


    public function province_get(){
      $id         = $this->get('id');
      $limit      = 0;
      $offset     = 0;
      $order_by   = 'a.nama';
      $order_type = 'asc';
      $search     = '';

      $where = array('a.deleted' => '1');

      if(!empty($this->get('q'))){
        $q      = $this->get('q');
        $search = "(a.nama LIKE '%$q%')";
      }

      $order = array('field' => $order_by, 'direction' => $order_type);

      if($id === NULL){
        $list_data = $this->model->get_province($where,$search,$order,$limit,$offset);
        if(!empty($list_data->result_array())){

          $res = array(
                        'code' => 1,
                        'message' => 'List data',
                        'total_data' => $this->model->get_province_count($where,$search),
                        'draws' => $list_data->num_rows(),
                        'result'  => $list_data->result_array()
                      );

          $this->response($res, REST_Controller::HTTP_OK);

        }

        $res = array('code' => 0, 'message' => 'No data available', 'result' => array());
        $this->response($res, REST_Controller::HTTP_NOT_FOUND);
      }

      $id = (int) $id;

      // Validate the id.
      if ($id <= 0)
      {
          // Invalid id, set the response and exit.
          $res = array('code' => 0, 'message' => 'Invalid id type');
          $this->response($res, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
      }

      $data = $this->model->get_province_by_id($id);

      if (!empty($data->row_array()))
      {
          $res = array('code' => 1, 'message' => 'Generating detail data', 'result' => $data->row_array());
          $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
      }
      else
      {
          $this->set_response([
              'code' => 0,
              'message' => 'Data could not be found',
              'result'  => array()
          ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
      }
    }

    public function city_get(){
      $id         = $this->get('id');
      $limit      = 0;
      $offset     = 0;
      $order_by   = 'a.nama';
      $order_type = 'asc';
      $search     = '';

      $where = array('a.deleted' => '1');

      if(!empty($this->get('id_prov'))){
        $where['a.id_provinsi'] = $this->get('id_prov');
      }

      if(!empty($this->get('q'))){
        $q      = $this->get('q');
        $search = "(a.nama LIKE '%$q%' OR b.nama LIKE '%$q%')";
      }

      $order = array('field' => $order_by, 'direction' => $order_type);

      if($id === NULL){
        $list_data = $this->model->get_city($where,$search,$order,$limit,$offset);
        if(!empty($list_data->result_array())){

          $res = array(
                        'code' => 1,
                        'message' => 'List data',
                        'total_data' => $this->model->get_city_count($where,$search),
                        'draws' => $list_data->num_rows(),
                        'result'  => $list_data->result_array()
                      );

          $this->response($res, REST_Controller::HTTP_OK);

        }

        $res = array('code' => 0, 'message' => 'No data available', 'result' => array());
        $this->response($res, REST_Controller::HTTP_NOT_FOUND);
      }

      $id = (int) $id;

      // Validate the id.
      if ($id <= 0)
      {
          // Invalid id, set the response and exit.
          $res = array('code' => 0, 'message' => 'Invalid id type');
          $this->response($res, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
      }

      $data = $this->model->get_city_by_id($id);

      if (!empty($data->row_array()))
      {
          $res = array('code' => 1, 'message' => 'Generating detail data', 'result' => $data->row_array());
          $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
      }
      else
      {
          $this->set_response([
              'code' => 0,
              'message' => 'Data could not be found',
              'result'  => array()
          ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
      }
    }

    public function district_get(){
      $id         = $this->get('id');
      $limit      = 0;
      $offset     = 0;
      $order_by   = 'a.nama';
      $order_type = 'asc';
      $search     = '';

      $where = array('a.deleted' => '1');

      if(!empty($this->get('id_city'))){
        $where['a.id_kota'] = $this->get('id_city');
      }

      if(!empty($this->get('q'))){
        $q      = $this->get('q');
        $search = "(a.nama LIKE '%$q%' OR b.nama LIKE '%$q%')";
      }

      $order = array('field' => $order_by, 'direction' => $order_type);

      if($id === NULL){
        $list_data = $this->model->get_district($where,$search,$order,$limit,$offset);
        if(!empty($list_data->result_array())){

          $res = array(
                        'code' => 1,
                        'message' => 'List data',
                        'total_data' => $this->model->get_district_count($where,$search),
                        'draws' => $list_data->num_rows(),
                        'result'  => $list_data->result_array()
                      );

          $this->response($res, REST_Controller::HTTP_OK);

        }

        $res = array('code' => 0, 'message' => 'No data available', 'result' => array());
        $this->response($res, REST_Controller::HTTP_NOT_FOUND);
      }

      $id = (int) $id;

      // Validate the id.
      if ($id <= 0)
      {
          // Invalid id, set the response and exit.
          $res = array('code' => 0, 'message' => 'Invalid id type');
          $this->response($res, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
      }

      $data = $this->model->get_district_by_id($id);

      if (!empty($data->row_array()))
      {
          $res = array('code' => 1, 'message' => 'Generating detail data', 'result' => $data->row_array());
          $this->set_response($res, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
      }
      else
      {
          $this->set_response([
              'code' => 0,
              'message' => 'Data could not be found',
              'result'  => array()
          ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
      }
    }

}

?>
