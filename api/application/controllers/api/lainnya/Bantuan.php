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
class Bantuan extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){
    $data = $this->db->get_where('m_bantuan',array('id' => '1'))->row_array();
    $res = array();
    if(!empty($data)){
      $res = array('code' => 1, 'message' => 'bantuan', 'result' => $data);
      $this->response($res, REST_Controller::HTTP_OK);
    }
    $res = array('code' => 0, 'message' => 'Empty data', 'result' => array());
    $this->response($res, REST_Controller::HTTP_OK);
  }

}
?>
