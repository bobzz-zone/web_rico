<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . '/libraries/REST_Controller.php';

/**
 * Keys Controller
 * This is a basic Key Management REST controller to make and delete keys
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class Auth extends REST_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->library('Access');
    }

    protected $methods = [
            'index_put' => ['level' => 10, 'limit' => 10],
            'index_delete' => ['level' => 10],
            'level_post' => ['level' => 10],
            'regenerate_post' => ['level' => 10],
        ];

    /**
     * Insert a key into the database
     *
     * @access public
     * @return void
     */

	 
	 function test_get(){
	     date_default_timezone_set("Asia/Jakarta");
		 echo date("Y-m-d")."<br>";
		 echo date_default_timezone_get();
	 }
    public function signup_post(){
      $post_data = $this->post();
      $data_in   = array();

      //respon default
      $code = 0;
      $message = 'Couldn\'t register ';
      $phone = '';
      $email = '';
      foreach($post_data as $key => $value){
        $data_in[$key] = $value;
        if($key == 'password'){
          $enc_password = sha1($value);
          $data_in['password'] = $enc_password;
        }
        if($key == 'telpon'){
          $phone = $value;
        }
        if($key == 'email'){
          $email = $value;
        }
      }
      $cek_exist = $this->_cek_exist($data_in);
      if(!$cek_exist ){
        //$data_in['telpon'] = '';
        $data_in['level']  = 1;
        $data_in['image']  = 'no_image.png';
        $data_in['email']  = 'belum diisi';
        $data_in['deleted']    = '3';
        $this->db->insert('pengguna',$data_in);
        $insert_id = $this->db->insert_id();
        $key = $this->_generate_key();
        if($insert_id > 0){
          $kode_aktivasi = $this->fungsi->random_sring_num();
          $this->db->where('id',$insert_id);
          $this->db->update('pengguna',array('kode_aktivasi' => $kode_aktivasi));
          if(!$this->_key_exists($key)){
            $this->_insert_key($key, ['user_id' => $insert_id, 'level' => 1, 'ignore_limits' => 1]);
          }
          $data_token = array(
                          'id_pengguna' => $insert_id,
                          'os' => 'android',
                          'token' => $key,
                          'token_fcm' => '',
                          'device_id' => '',
                          'device_name' => '',
                        );
          if($this->db->insert('pengguna_token',$data_token)){
            $code = 1;
            $message = 'Success, registered, please activate your account, activation code will be sent to phone number';
            unset($data_in['password']);
            $data_in['key'] = $key;
            $data_in['kode_aktivasi'] = $kode_aktivasi;
            //send email konfirmasi
			$isi = "Antriable: PIN Pendaftaran Anda : ".$kode_aktivasi;
			$this->fungsi->send_sms($phone,$isi);
			/*
            $subjek = 'Aktivasi akun anda ';
            $isi = 'Hai,'.$data_in['nama'].'Silahkan masukkan kode: '.$kode_aktivasi.' untuk mengaktivasi akun anda.';
            if(!empty($email))
            {
              $this->fungsi->_send_email($email,$subjek,$isi);
            }
			*/

          }
          //pengguna konfirmasi telpon
          //if(!empty($phone)){
            //$konfirm_telpon = $this->_phone_konfirm($insert_id,$phone);
            //$data_in['telpon_message'] = 'Please verify your phone number';
          //}

        }
      }else{
        $message = $cek_exist.' is already used, please enter new '.$cek_exist;
      }
      $res = array('code' => $code, 'message' => $message, 'result' => $data_in);
      $this->response($res, REST_Controller::HTTP_CREATED);

    }

    public function signin_post()
    {
      $email    = $this->post('username');
      $password = $this->post('password');
      $is_bpjs  = $this->post('is_bpjs');

      $login = $this->access->login($email,$password,$is_bpjs);
      if($login)
      {
        /*$this->db->select('a.*,IFNULL(b.nama,"-") as nama_kota')
                 ->from('pengguna a')
                 ->join('m_kota b','a.id_kota = b.id','LEFT')
                 ->where(array('email' => $email))
                 ->or_where(array('username' => $email));*/
        $get_user = $this->Cekin_model->get_login_info($email,$is_bpjs);

        if(in_array($get_user->deleted,array(1,3))){

          $this->db->where('id',$get_user->id);
          $this->db->update('pengguna',array('status_login' => 1));

          $cek = $this->db->get_where('pengguna_token',array('id_pengguna' => $get_user->id))->row_array();
          if(!empty($cek)){
            $key_details = $this->_get_key($cek['token']);
            if(!empty($key_details)){
              $key = $key_details->key;
            }else{
              // Build a new key
              $new_key = $this->_generate_key();

              // Insert the new key
              if ($this->_insert_key($new_key, ['user_id' => $get_user->id,'level' => 1, 'ignore_limits' => 1]))
              {
                  // Suspend old key
                  //$this->_delete_key($cek_, ['level' => 0]);

                  $key = $new_key;
              }
            }
            $this->db->where('id_pengguna',$get_user->id);
            $this->db->update('pengguna_token',array('token' => $key));
          }else{
            $key = $this->_generate_key();
            $this->_insert_key($key, ['user_id' => $get_user->id , 'level' => 1, 'ignore_limits' => 1]);
            $data_token = array(
                            'id_pengguna' => $get_user->id,
                            'os' => 'android',
                            'token' => $key,
                            'token_fcm' => '',
                            'device_id' => '',
                            'device_name' => '',
                          );
            $this->db->insert('pengguna_token',$data_token);
          }

          unset($get_user->password);
          unset($get_user->kode_aktivasi);
          $message = [
              'code'     => 1,
              'id'       => $get_user->id, // Automatically generated by the model
              'username' => $this->post('username'),
              'password' => $this->post('password'),
              'user_data'=> $get_user,
              'key'    => $key,
              'message'  => 'Login Success',
          ];
        }else{
          $message = [
              'code'     => 0,
              'id'       => 0, // Automatically generated by the model
              'username' => $this->post('username'),
              'password' => $this->post('password'),
              'user_data'=> json_encode(array()),
              'key' => '',
              'message'  => 'Opps, you no longer have access to this account',
          ];
        }

      }
      else
      {
        $message = [
            'code'      => 0,
            'id'        => 0, // Automatically generated by the model
            'email'     => $email,
            'password'  => $password,
            'user_data' => json_encode(array()),
            'message'   => 'Oops, we couldn\'t find your account',
        ];
      }

      $this->response($message, REST_Controller::HTTP_OK);
    }

    public function signin_fb_post(){
      $user = $this->post('fb_response');
      $code = '';
      $messages = '';
      $key = '';
      if(!empty($user)){
        $user = json_decode($user,true);
        $data['email'] = $user['email'];
        $cek_exist = $this->_cek_exist($data);
        if($cek_exist == 'email'){
          $fb_id = $this->db->select('fb_id')->get_where('pengguna',array('fb_id' => $user['id']))->row()->fb_id;
          if($fb_id !== $user['id']){
            $res = array('code' => 0, 'message' => 'Email address for this accounts already registered, please use another account', 'result' => $user);
            $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
          }elseif($fb_id === $user['id']){
            $code = 1;
            $message = 'Logged in user';
          }
        }else{
          /*register new account */
          $data_in['fb_id'] = $user['id'];
          $data_in['nama']  = $user['name'];
          $data_in['email'] = $user['email'];
          $data_in['level'] = 1;
          $this->db->insert('pengguna',$data_in);
          $insert_id = $this->db->insert_id();
          $key = $this->_generate_key();
          if($insert_id > 0){
            $kode_aktivasi = $this->fungsi->random_sring_num();
            $this->db->where('id',$insert_id);
            $this->db->update('pengguna',array('kode_aktivasi' => $kode_aktivasi));
            if(!$this->_key_exists($key)){
              $this->_insert_key($key, ['user_id' => $insert_id, 'level' => 1, 'ignore_limits' => 1]);
            }
            $data_token = array(
                            'id_pengguna' => $insert_id,
                            'os' => 'android',
                            'token' => $key,
                            'token_fcm' => '',
                            'device_id' => '',
                            'device_name' => '',
                          );
            if($this->db->insert('pengguna_token',$data_token)){
              $code = 1;
              $message = 'Success, registered, please activate your account';

              $data_in['id']  = $insert_id;
              $data_in['key'] = $key;
              $data_in['kode_aktivasi'] = $kode_aktivasi;
            }

          }
        }

        $this->db->select('a.*,IFNULL(b.nama,"-") as nama_kota')
                 ->from('pengguna a')
                 ->join('m_kota b','a.id_kota = b.id','LEFT')
                 ->where('a.fb_id',$user['id'])
                 ->where("a.deleted IN (1,3)");
        $get_user = $this->db->get()->row_array();
        unset($get_user['password']);

        if($get_user['deleted'] == '1'){
          $get_user['kode_aktivasi'] = '';
        }

        if(!empty($get_user)){
          $this->db->where('id',$get_user['id']);
          $this->db->update('pengguna',array('status_login' => 1));

          $cek = $this->db->get_where('pengguna_token',array('id_pengguna' => $get_user['id']))->row_array();
          if(!empty($cek)){
            $key_details = $this->_get_key($cek['token']);
            if(!empty($key_details)){
              $key = $key_details->key;
            }else{
              // Build a new key
              $new_key = $this->_generate_key();

              // Insert the new key
              if ($this->_insert_key($new_key, ['user_id' => $get_user['id'],'level' => 1, 'ignore_limits' => 1]))
              {
                  // Suspend old key
                  //$this->_delete_key($cek_, ['level' => 0]);

                  $key = $new_key;
              }
            }
            $this->db->where('id_pengguna',$get_user['id']);
            $this->db->update('pengguna_token',array('token' => $key));
          }else{
            $key = $this->_generate_key();
            $this->_insert_key($key, ['user_id' => $get_user['id'] , 'level' => 1, 'ignore_limits' => 1]);
            $data_token = array(
                            'id_pengguna' => $get_user['id'],
                            'os' => 'android',
                            'token' => $key,
                            'token_fcm' => '',
                            'device_id' => '',
                            'device_name' => '',
                          );
            $this->db->insert('pengguna_token',$data_token);
          }

        }


        $res = array('code' => $code, 'message' => $message, 'id' => $get_user['id'],'key' => $key ,'user_data' => $get_user);
        $this->response($res, REST_Controller::HTTP_CREATED);
      }
    }

    public function signin_google_post(){
      $user = $this->post();
      $code = 0;
      $message = '';
      $key = '';
      if(!empty($user)){
        //$user = json_decode($user,true);
        $data['email'] = $user['email'];
        $cek_exist = $this->_cek_exist($data);
        if($cek_exist == 'email'){
          $g_id = $this->db->select('g_id')->get_where('pengguna',array('g_id' => $user['id']))->row()->g_id;
          if($g_id !== $user['id']){
            $res = array('code' => 0, 'message' => 'Email address for this accounts already registered, please use another account', 'result' => $user);
            $this->response($res, REST_Controller::HTTP_OK);
          }elseif($g_id === $user['id']){
            $code = 1;
            $message = 'Logged in user';
          }
        }else{
          /*register new account */
          $data_in['g_id'] = $user['id'];
          $data_in['nama']  = $user['name'];
          $data_in['email'] = $user['email'];
          $data_in['level'] = 1;
          $this->db->insert('pengguna',$data_in);
          $insert_id = $this->db->insert_id();
          $key = $this->_generate_key();
          if($insert_id > 0){
            $kode_aktivasi = $this->fungsi->random_sring_num();
            $this->db->where('id',$insert_id);
            $this->db->update('pengguna',array('kode_aktivasi' => $kode_aktivasi));
            if(!$this->_key_exists($key)){
              $this->_insert_key($key, ['user_id' => $insert_id, 'level' => 1, 'ignore_limits' => 1]);
            }
            $data_token = array(
                            'id_pengguna' => $insert_id,
                            'os' => 'android',
                            'token' => $key,
                            'token_fcm' => '',
                            'device_id' => '',
                            'device_name' => '',
                          );
            if($this->db->insert('pengguna_token',$data_token)){
              $code = 1;
              $message = 'Success, registered, please activate your account';

              $data_in['id']  = $insert_id;
              $data_in['key'] = $key;
              $data_in['kode_aktivasi'] = $kode_aktivasi;
            }

          }
        }

        $this->db->select('a.*,IFNULL(b.nama,"-") as nama_kota')
                 ->from('pengguna a')
                 ->join('m_kota b','a.id_kota = b.id','LEFT')
                 ->where('a.g_id',$user['id'])
                 ->where("a.deleted IN (1,3)");
        $get_user = $this->db->get()->row_array();

        unset($get_user['password']);

        if($get_user['deleted'] == '1'){
          $get_user['kode_aktivasi'] = '';
        }

        if(!empty($get_user)){
          $this->db->where('id',$get_user['id']);
          $this->db->update('pengguna',array('status_login' => 1));

          $cek = $this->db->get_where('pengguna_token',array('id_pengguna' => $get_user['id']))->row_array();
          if(!empty($cek)){
            $key_details = $this->_get_key($cek['token']);
            if(!empty($key_details)){
              $key = $key_details->key;
            }else{
              // Build a new key
              $new_key = $this->_generate_key();

              // Insert the new key
              if ($this->_insert_key($new_key, ['user_id' => $get_user['id'],'level' => 1, 'ignore_limits' => 1]))
              {
                  // Suspend old key
                  //$this->_delete_key($cek_, ['level' => 0]);

                  $key = $new_key;
              }
            }
            $this->db->where('id_pengguna',$get_user['id']);
            $this->db->update('pengguna_token',array('token' => $key));
          }else{
            $key = $this->_generate_key();
            $this->_insert_key($key, ['user_id' => $get_user['id'] , 'level' => 1, 'ignore_limits' => 1]);
            $data_token = array(
                            'id_pengguna' => $get_user['id'],
                            'os' => 'android',
                            'token' => $key,
                            'token_fcm' => '',
                            'device_id' => '',
                            'device_name' => '',
                          );
            $this->db->insert('pengguna_token',$data_token);
          }

        }

        $res = array('code' => $code, 'message' => $message,'id' => $get_user['id'],'key' => $key ,'user_data' => $get_user);
        $this->response($res, REST_Controller::HTTP_CREATED);
      }
    }

    public function signout_get(){
      $key = $this->rest->key;
      $key_details = $this->_get_key($key);

      $code = 0;
      $message = 'Cannot logged out';

      if($key_details){
        $this->db->where('id',$key_details->user_id);
        $this->db->update('pengguna',array('status_login' => 0));
        if($this->db->affected_rows() > 0){
          $this->_delete_key($key_details->key);
          $code = 1;
          $message = 'User logged out';
        }
      }

      $res = array('code' => $code, 'message' => $message);
      $this->response($res, REST_Controller::HTTP_OK);
    }

    public function forgot_password_post(){
      $email = $this->post('email');
      $phone = $this->post('phone');
      if(!empty($email)){
        $data['email'] = $email;
        $cek_exist = $this->_cek_exist($data);
        if($cek_exist == 'email'){
          /* email forgot password */
          $new_password = $this->fungsi->random_pass();

          $res = array('code' => 1, 'message' => 'new password sent to email', 'result' => $data);
          $this->response($res, REST_Controller::HTTP_OK);
        }
        $res = array('code' => 0, 'message' => 'Email or phone number not found','result' => array());
        $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
      }
      $res = array('code' => 0, 'message' => 'Please fill email or phone number', 'result' => array());
      $this->response($res, REST_Controller::HTTP_BAD_REQUEST);
    }


    /**
     * Remove a key from the database to stop it working
     *
     * @access public
     * @return void
     */

    /**
     * Change the level
     *
     * @access public
     * @return void
     */
    public function level_post()
    {
        $key = $this->post('key');
        $new_level = $this->post('level');

        // Does this key exist?
        if (!$this->_key_exists($key))
        {
            // It doesn't appear the key exists
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API key'
            ], REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // Update the key level
        if ($this->_update_key($key, ['level' => $new_level]))
        {
            $this->response([
                'status' => TRUE,
                'message' => 'API key was updated'
            ], REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->response([
                'status' => FALSE,
                'message' => 'Could not update the key level'
            ], REST_Controller::HTTP_INTERNAL_SERVER_ERROR); // INTERNAL_SERVER_ERROR (500) being the HTTP response code
        }
    }

    /**
     * Suspend a key
     *
     * @access public
     * @return void
     */
    public function suspend_post()
    {
        $key = $this->post('key');

        // Does this key exist?
        if (!$this->_key_exists($key))
        {
            // It doesn't appear the key exists
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API key'
            ], REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // Update the key level
        if ($this->_update_key($key, ['level' => 0]))
        {
            $this->response([
                'status' => TRUE,
                'message' => 'Key was suspended'
            ], REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->response([
                'status' => FALSE,
                'message' => 'Could not suspend the user'
            ], REST_Controller::HTTP_INTERNAL_SERVER_ERROR); // INTERNAL_SERVER_ERROR (500) being the HTTP response code
        }
    }

    /**
     * Regenerate a key
     *
     * @access public
     * @return void
     */
    public function regenerate_post()
    {
        $old_key = $this->post('key');
        $key_details = $this->_get_key($old_key);

        // Does this key exist?
        if (!$key_details)
        {
            // It doesn't appear the key exists
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API key'
            ], REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // Build a new key
        $new_key = $this->_generate_key();

        // Insert the new key
        if ($this->_insert_key($new_key, ['level' => $key_details->level, 'ignore_limits' => $key_details->ignore_limits]))
        {
            // Suspend old key
            $this->_update_key($old_key, ['level' => 0]);

            $this->response([
                'status' => TRUE,
                'key' => $new_key
            ], REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
        }
        else
        {
            $this->response([
                'status' => FALSE,
                'message' => 'Could not save the key'
            ], REST_Controller::HTTP_INTERNAL_SERVER_ERROR); // INTERNAL_SERVER_ERROR (500) being the HTTP response code
        }
    }

    /* Helper Methods */

    private function _generate_key()
    {
        do
        {
            // Generate a random salt
            $salt = base_convert(bin2hex($this->security->get_random_bytes(64)), 16, 36);

            // If an error occurred, then fall back to the previous method
            if ($salt === FALSE)
            {
                $salt = hash('sha256', time() . mt_rand());
            }

            $new_key = substr($salt, 0, config_item('rest_key_length'));
        }
        while ($this->_key_exists($new_key));

        return $new_key;
    }

    /* Private Data Methods */

    private function _get_key($key)
    {
        return $this->rest->db
            ->where(config_item('rest_key_column'), $key)
            ->get(config_item('rest_keys_table'))
            ->row();
    }

    private function _key_exists($key)
    {
        return $this->rest->db
            ->where(config_item('rest_key_column'), $key)
            ->count_all_results(config_item('rest_keys_table')) > 0;
    }

    private function _insert_key($key, $data)
    {
        $data[config_item('rest_key_column')] = $key;
        $data['date_created'] = function_exists('now') ? now() : time();

        return $this->rest->db
            ->set($data)
            ->insert(config_item('rest_keys_table'));
    }

    private function _update_key($key, $data)
    {
        return $this->rest->db
            ->where(config_item('rest_key_column'), $key)
            ->update(config_item('rest_keys_table'), $data);
    }

    private function _delete_key($key)
    {
        return $this->rest->db
            ->where(config_item('rest_key_column'), $key)
            ->delete(config_item('rest_keys_table'));
    }

    private function _cek_exist($data){
      $username_used = 0;
      $email_used = 0;
      $telpon_used = 0;
      
      $mytelp = "";
      $myemail = "";
      $mybpjs = "";
      if(array_key_exists('telpon',$data)){
        if(!empty($data['telpon'])){
          $mytelp = $data['telpon'];
        }

      }
      
      if(array_key_exists('no_bpjs',$data)){
        if(!empty($data['no_bpjs']))
        {
          $mybpjs = $data['no_bpjs'];
        }
      }
      if(array_key_exists('email',$data)){
        if(!empty($data['email'])){
          $myemail = $data['email'];
        }

      }
      
      $this->db->query("delete from pengguna where (telpon='".$mytelp."'  || no_bpjs='".$mybpjs."' ) and deleted=3 ");
      
      if(array_key_exists('telpon',$data)){
        if(!empty($data['telpon'])){
          $cek_telpon = $this->db->select('id,nama,email,telpon')
                        ->from('pengguna')
                        ->where('telpon',$data['telpon'])
                        ->get();
          $telpon_used = $cek_telpon->num_rows();
        }

      }
      
      if(array_key_exists('no_bpjs',$data)){
        if(!empty($data['no_bpjs']))
        {
          $cek_username = $this->db->select('id')
                          ->from('pengguna')
                          ->where('no_bpjs',$data['no_bpjs'])
                          ->get();
          $username_used = $cek_username->num_rows();
        }
      }
      if(array_key_exists('email',$data)){
        if(!empty($data['email'])){
          $cek_email = $this->db->select('id')
                          ->from('pengguna')
                          ->where('email',$data['email'])
                          ->get();
          $email_used = $cek_email->num_rows();
        }

      }
      
      if($username_used == 0 && $email_used == 0 && $telpon_used == 0){
        return FALSE;
      }


      if($telpon_used > 0){
        return 'telpon';
      }
        
      if($username_used > 0){
        return 'no_bpjs';
      }

      if($email_used > 0){
        return 'email';
      }

      

    }

    public function activation_post(){
      $kode = $this->post('code');
      $this->db->select('a.*')
               ->from('pengguna a')
               ->where('a.deleted',3)
               ->where('a.kode_aktivasi',$kode);
      $get = $this->db->get();
      if($get->num_rows() > 0){
        $data = $get->row_array();
        $this->db->where('id',$data['id']);
        $this->db->update('pengguna',array('deleted' => 1, 'kode_aktivasi' => 'DONE','status_login' => 1));
        /* cek key */

        $cek = $this->db->get_where('pengguna_token',array('id_pengguna' => $data['id']))->row_array();
        if(!empty($cek)){
          $key_details = $this->_get_key($cek['token']);
          if(!empty($key_details)){
            $key = $key_details->key;
          }else{
            // Build a new key
            $new_key = $this->_generate_key();

            // Insert the new key
            if ($this->_insert_key($new_key, ['user_id' => $get_user['id'],'level' => 1, 'ignore_limits' => 1]))
            {
                // Suspend old key
                //$this->_delete_key($cek_, ['level' => 0]);

                $key = $new_key;
            }
          }
          $this->db->where('id_pengguna',$data['id']);
          $this->db->update('pengguna_token',array('token' => $key));
        }else{
          $key = $this->_generate_key();
          $this->_insert_key($key, ['user_id' => $data['id'] , 'level' => 1, 'ignore_limits' => 1]);
          $data_token = array(
                          'id_pengguna' => $data['id'],
                          'os' => 'android',
                          'token' => $key,
                          'token_fcm' => '',
                          'device_id' => '',
                          'device_name' => '',
                        );
          $this->db->insert('pengguna_token',$data_token);
        }
        unset($data['password']);
        unset($data['kode_aktivasi']);
        $data['deleted'] = 1;
        $res = array('code' => 1, 'message' => 'Account activated, thank you','user_data' => $data, 'key' => $key);
      }else{
        $res = array('code' => 0, 'message' => 'Opps, please check again your activation code');
      }
      $this->response($res, REST_Controller::HTTP_OK);
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

      return $kode_konfirm;
    }

}
