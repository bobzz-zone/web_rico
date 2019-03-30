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
class Dashboard extends REST_Controller {

  function __construct()
  {
      parent::__construct();
  }

  public function index_get(){

    $id = $this->get('id');
    $limit = 0;
    $page  = 0;
    $banners    = $this->_get_banner();

    $last_view_notif = $profile->row()->last_view_notif ;
    $last_view_notif = $last_view_notif == NULL ? '0000-00-00 00:00:00' : $last_view_notif;

    $total_notif = $this->db->select('id_notif')
                            ->get_where('notification',array('id_pengguna' => $this->rest->user_id,
                                                              'readed'     => 0,
                                                              'date_add >' => $last_view_notif,
                                                            ))
                            ->num_rows();
    if($id === NULL){

        $ret_data = array(
                          'banner'  => $banner_list,
                          'total_notif' => $total_notif
                          );

        $res = array('code' => 1, 'message' => 'List banner', 'result' => $ret_data);
        $this->response($res, REST_Controller::HTTP_OK);

    }

  }

  function _get_banner(){

    $limit = 0;
    $page  = 0;

    $list_data = $this->db->order_by('id','asc')
                          ->get_where('m_banner',array('tampil' => '1', 'deleted' => '1'));
    return $list_data;
  }




}

?>
