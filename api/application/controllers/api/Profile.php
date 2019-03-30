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
class Profile extends REST_Controller {

  function __construct()
  {
      parent::__construct();
      $this->load->model('User_model','model');
  }

  public function index_get(){
    $key = $this->rest->key;
    $id  = $this->rest->user_id;
    
    $code = 0;
    $message = 'Couldn\'t find the user info ';
    $result = array();

    $data = $this->model->get_user($key,$id);
	$kunjungan = $this->db->query("select count(id_rekam_medis) as total from rekam_medis 
			where 
			id_pengguna='$id' and MONTH(date_add) = MONTH(CURRENT_DATE()) and deleted = 1")->first_row()->total;
	
	$kunjungan_pertahun = $this->db->query("select count(id_rekam_medis) as total from rekam_medis 
			where 
			id_pengguna='$id' and YEAR(date_add) = YEAR(CURRENT_DATE()) and deleted = 1")->first_row()->total;
	
    if($data->num_rows() > 0){

      $result = $data->row_array();
      $code = 1;
      $message = 'Success, generating user information';
    }
    $res = array('code' => $code, 'message' => $message, 'result' => $result, "kunjungan" => $kunjungan, "kunjungan_tahun" => $kunjungan_pertahun);
    $this->response($res, REST_Controller::HTTP_OK);
  }

  public function index_put(){
    //$key = $this->rest->key;
    $code = 0;
    $message = 'Couldn\'t update user data';

    $post_data = $this->put();
    $data_upd  = array();
    $get_telpon = $this->db->select('id,nama,email,telpon,no_bpjs')->get_where('pengguna',array('id' => $this->rest->user_id))->row_array();
    $telpon = $get_telpon['telpon'];
    //$curr_email = $get_telpon['email'];
    //$curr_username = $get_telpon['username'];
    $telpon_changed = 0;
    $phone = '';
    $telpon_message = '';
    foreach($post_data as $key => $value){
      $data_upd[$key] = $value;
      // if($key == 'telpon'){
      //   $phone = $value;
      //   if($phone !== $telpon){
      //     $telpon_changed = 1;
      //   }
      // }

    }
    $cek = $data_upd;
    $cek['id'] = $this->rest->user_id;
    $konfirm_telpon = '';

    $cek_exist = $this->_cek_exist($cek);
    if(!$cek_exist){
      if($telpon_changed === 1){
        $konfirm_telpon = $this->_phone_konfirm($this->rest->user_id,$phone);
        $telpon_message = 'Please verify your phone number';
      }
      $data_upd['telpon'] = $get_telpon['telpon'];
      $this->db->where('id',$this->rest->user_id);
      $this->db->update('pengguna',$data_upd);
      $data_upd['telpon_changed'] = $telpon_changed;
      $data_upd['telpon_message'] = $telpon_message;
      $data_upd['telpon_new']     = $phone;
      $data_upd['kode']     = $konfirm_telpon;

      //if($this->db->affected_rows() > 0 ){
      $message = 'User data updated';
      $code    = 1;
      //}
    }else{
      $code = 0;
      $message = 'Cannot update your profile because '.$cek_exist.' already exist';
    }
    $res = array('code' => $code , 'message' => $message, 'result' => $data_upd);
    $this->response($res, REST_Controller::HTTP_OK);
  }

 public function upload_img_post(){
	$path_outside = '/home/u5601531/public_html/subdomain/antrian/uploads/pengguna/';
	$url_outside  = "http://antrian.aptikma.com/uploads/pengguna/";
    if(!empty($_FILES['image']['name'])){
      $path_upload = substr(FCPATH, 0, strlen(FCPATH)-4);
      
    
      $temp = explode(".", $_FILES["image"]["name"]);
      $newfilename = 'user_'.$this->rest->user_id.'.'.end($temp);
      move_uploaded_file($_FILES["image"]["tmp_name"], $path_outside . $newfilename);
      $arr_sizing = array('small'    => array(
                                    'width' => '350',
                                    'height' => '450'
                                  ),
                          'medium'  => array(
                                            'width' => '600',
                                            'height' => '750'
                                            ),
                          'big'  => array(
                                            'width' => '800',
                                            'height' => '1200'
                                            ),
                          );
      //change image quality, resizing and create mutiple size
      $newfilepath = $path_outside.$newfilename;
      $this->fungsi->_img_optimization($newfilepath,$newfilepath, 50);
      foreach($arr_sizing as $size => $value){
        $source = $path_outside.$newfilename;
        $tempr  = explode('.',$newfilename);
        $newcopyfile = $path_outside.$tempr[0].'_'.$size.'.'.end($tempr);
        if (!copy($source, $newcopyfile)) {
          $res = array('code' => 0, 'message' => 'Cannot upload your image', 'result' => array());
          $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
        }
        $this->fungsi->_img_resize($newcopyfile,$value['width'],$value['height']);
        $arr_sizing[$size]['file'] = $url_outside.$newcopyfile;
      }


      //primary image handling
      $this->db->where('id',$this->rest->user_id);
      $this->db->update('pengguna',array('image' => $newfilename));
      $insert_id = $this->rest->user_id;


      if(file_exists($path_outside.$newfilename)){
        $img_info = getimagesize($path_outside.$newfilename);
        $img_arr = $arr_sizing;
        $img_arr['original'] = array(
                                      'width' => $img_info[0],
                                      'height' => $img_info[1],
                                      'file'  => $url_outside.$newfilename
                                      );

        $res = array('code' => 1,
                      'message' => 'image successfully uploaded',
                      'result' => array('id' => $insert_id,'img' => $img_arr));
        $this->response($res, REST_Controller::HTTP_CREATED);
      }
      $res = array('code' => 0, 'message' => 'Failed on uploading your image', 'result' => array());
      $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
    }

    $res = array('code' => 0, 'message' => 'Cannot processing your request', 'result' => array());
    $this->response($res, REST_Controller::HTTP_BAD_REQUEST);

  }

  
  public function back_upload_img_post(){

    if(!empty($_FILES['image']['name'])){
      $path_upload = substr(FCPATH, 0, strlen(FCPATH)-4);
      
      if (!is_dir(FCPATH . '/uploads/pengguna/')) {
        mkdir(FCPATH . '/uploads/pengguna/');
      }

      $temp = explode(".", $_FILES["image"]["name"]);
      $newfilename = 'user_'.$this->rest->user_id.'.'.end($temp);
      move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/pengguna/" . $newfilename);
      $arr_sizing = array('small'    => array(
                                    'width' => '350',
                                    'height' => '450'
                                  ),
                          'medium'  => array(
                                            'width' => '600',
                                            'height' => '750'
                                            ),
                          'big'  => array(
                                            'width' => '800',
                                            'height' => '1200'
                                            ),
                          );
      //change image quality, resizing and create mutiple size
      $newfilepath = 'uploads/pengguna/'.$newfilename;
      $this->fungsi->_img_optimization($newfilepath,$newfilepath, 50);
      foreach($arr_sizing as $size => $value){
        $source = 'uploads/pengguna/'.$newfilename;
        $tempr  = explode('.',$newfilename);
        $newcopyfile = 'uploads/pengguna/'.$tempr[0].'_'.$size.'.'.end($tempr);
        if (!copy($source, $newcopyfile)) {
          $res = array('code' => 0, 'message' => 'Cannot upload your image', 'result' => array());
          $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
        }
        $this->fungsi->_img_resize($newcopyfile,$value['width'],$value['height']);
        $arr_sizing[$size]['file'] = base_url().'uploads/pengguna/'.$newcopyfile;
      }


      //primary image handling
      $this->db->where('id',$this->rest->user_id);
      $this->db->update('pengguna',array('image' => $newfilename));
      $insert_id = $this->rest->user_id;


      if(file_exists('uploads/pengguna/'.$newfilename)){
        $img_info = getimagesize('uploads/pengguna/'.$newfilename);
        $img_arr = $arr_sizing;
        $img_arr['original'] = array(
                                      'width' => $img_info[0],
                                      'height' => $img_info[1],
                                      'file'  => base_url().'uploads/pengguna/'.$newfilename
                                      );

        $res = array('code' => 1,
                      'message' => 'image successfully uploaded',
                      'result' => array('id' => $insert_id,'img' => $img_arr));
        $this->response($res, REST_Controller::HTTP_CREATED);
      }
      $res = array('code' => 0, 'message' => 'Failed on uploading your image', 'result' => array());
      $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
    }

    $res = array('code' => 0, 'message' => 'Cannot processing your request', 'result' => array());
    $this->response($res, REST_Controller::HTTP_BAD_REQUEST);

  }

  
  public function upload_img_delete($id){
    //$id = $this->get('id');
    // Validate the id.
    if ($id <= 0)
    {
        // Set the response and exit
        $res = array('code' => 0, 'message' => 'Cannot delete the user image', 'id' => 0);
        $this->response($res, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
    }

    // $this->some_model->delete_something($id);
    $curr_data = $this->db->select('id,image')->get_where('pengguna',array('id' => $id))->row_array();
    $this->db->where('id',$id);
    $this->db->update('pengguna',array('foto' => ' '));
    $arr_size = array('small','medium','big');

    unlink('uploads/pengguna/'.$curr_data['foto']);
    foreach($arr_size as $size){
      $temp = explode('.',$curr_data['foto']);
      $new_f = $temp[0].'_'.$size.'.'.end($temp);
      unlink('uploads/pengguna/'.$new_f);
    }
    $message = [
        'code' => 1,
        'id' => $id,
        'message' => 'user image deleted'
    ];

    $this->set_response($message, REST_Controller::HTTP_OK);
  }

  public function change_password_post(){
    $user_id = $this->rest->user_id;
    $old_pass = $this->post('old_pass');
    $new_pass = $this->post('new_pass');
    $new_pass2 = $this->post('new_pass2');
    $get_data = $this->db->select('id,password,email,username')
                         ->get_where('pengguna',array('id' => $user_id));
    if($get_data->num_rows() > 0){
      $data = $get_data->row_array();
      $enc_old_pass = sha1($old_pass);
      if($data['password'] === $enc_old_pass){
        $enc_new1 = sha1($new_pass);
        $enc_new2 = sha1($new_pass2);
        if($enc_new1 === $enc_new2){
          $this->db->where('id',$user_id);
          $this->db->update('pengguna',array('password' => $enc_new2));
          $res = array('code' => 1, 'message' => 'Password changed','result' => array());
          $this->response($res, REST_Controller::HTTP_OK);
        }
        $res = array('code' => 0, 'message' => 'Please check your new password and retyped new password','result' => array());
        $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
      }
      $res = array('code' => 0, 'message' => 'Your old password not match','result' => array());
      $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
    }
    $res = array('code' => 0, 'message' => 'Cannot process your request','result' => array());
    $this->response($res, REST_Controller::HTTP_NOT_FOUND);
  }

  private function _phone_konfirm($user_id,$telpon){
    $kode_konfirm = $this->fungsi->random_sring_num();
    $cek = $this->db->get_where('pengguna_konfirmasi_telpon',array('id_pengguna' => $user_id));
    $konfirm_telpon = array(
                              'id_pengguna' => $user_id,
                              'telpon'      => $telpon,
                              'kode'        => $kode_konfirm,
                              'status'      => 0,
                            );
    if($cek->num_rows() > 0){
      $this->db->where('id_pengguna',$user_id);
      $this->db->update('pengguna_konfirmasi_telpon',$konfirm_telpon);
    }else{
      $this->db->insert('pengguna_konfirmasi_telpon',$konfirm_telpon);
    }

    $msg = 'kode perubahan nomor anda '.$kode_konfirm;

    $this->notif->send_sms($telpon,$msg);

    return $kode_konfirm;
  }

  private function _cek_exist($data){
    $username_used = 0;
    $email_used = 0;
    $telpon_used = 0;

    if(array_key_exists('no_bpjs',$data)){
      $cek_username = $this->db->select('id')
                      ->from('pengguna')
                      ->where('no_bpjs',$data['no_bpjs'])
                      ->get();
      $username_used = $cek_username->num_rows();
    }
    if(array_key_exists('email',$data)){
      $cek_email = $this->db->select('id')
                      ->from('pengguna')
                      ->where('email',$data['email'])
                      ->get();
      $email_used = $cek_email->num_rows();
    }
    if(array_key_exists('telpon',$data)){
      $cek_telpon = $this->db->select('id')
                    ->from('pengguna')
                    ->where('telpon',$data['telpon'])
                    ->get();
      $telpon_used = $cek_telpon->num_rows();
    }
    if($username_used == 0 && $email_used == 0 && $telpon_used == 0){
      return FALSE;
    }

    if($username_used > 0){
      $row_data = $cek_username->row_array();
      if($row_data['id'] != $data['id']){
        return 'no_bpjs';
      }
    }

    if($email_used > 0){
      $row_data = $cek_email->row_array();
      if($row_data['id'] != $data['id']){
        return 'email';
      }
    }

    if($telpon_used > 0){
      $row_data = $cek_telpon->row_array();
      if($row_data['id'] != $data['id']){
        return 'telpon';
      }
    }

    return FALSE;
  }

  /* verify phone number */
  public function verify_phone_post(){
    $kode = $this->post('code');
    $get_data = $this->db->get_where('pengguna_konfirmasi_telpon',array('kode' => $kode, 'status' => '0'));
    if($get_data->num_rows() > 0){
      $data = $get_data->row_array();
      $cek['id']     = $data['id_pengguna'];
      $cek['telpon'] = $data['telpon'];
      $cek_exist     = $this->_cek_exist($cek);
      if(!$cek_exist){
        $this->db->where('id',$data['id_pengguna']);
        $this->db->update('pengguna',array('telpon' => $data['telpon']));
        /* update terverifikasi */
        $this->db->where('id_pengguna',$data['id_pengguna']);
        $this->db->where('telpon',$data['telpon']);
        $this->db->update('pengguna_konfirmasi_telpon',array('status' => 1));
        $res = array('code' => 1, 'message' => 'Your phone number verified', 'result' => array('telpon' => $data['telpon']));
      }else{
        $res = array('code' => 0, 'message' => 'Your phone number already verified', 'result' => array());
      }
    }else{
      $res = array('code' => 0, 'message' => 'Cannot find your verification code', 'result' => array());
    }
    $this->response($res, REST_Controller::HTTP_OK);
  }


}

?>
