<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Access
{
	public $user;
	protected $CI;
	/** COnstruktor */

	function __construct()
	{
		$this->CI =& get_instance();
		$auth = $this->CI->config->item('auth');

		$this->CI->load->helper('cookie');
		$this->CI->load->model('Cekin_model');

		$this->Cekin_model =& $this->CI->Cekin_model;
	}

	/*cek Login User*/
	function login($username,$password,$is_bpjs)
	{
		$result = $this->Cekin_model->get_login_info($username,$is_bpjs);
		if($result)
		{
			$password = sha1($password);
			if($password === $result->password)
			{
				/*$this->CI->session->set_userdata('id_pengguna',$result->id);
				$this->CI->session->set_userdata('username',$result->username);
				$this->CI->session->set_userdata('email',$result->email);
				$this->CI->session->set_userdata('name',$result->nama);
				$this->CI->session->set_userdata('role',$result->id_akses);
				$this->CI->session->set_userdata('foto_profil',$result->image);*/
				return TRUE;
			}
		}
		return FALSE;
	}

	/* cek Apakah sudah login atau belum*/
	function is_login()
	{
		return (($this->CI->session->userdata('id_pengguna')) ? TRUE : FALSE);
	}

	/** Logout */
	function logout()
	{
		$this->CI->session->unset_userdata('id_pengguna');
		$this->CI->session->unset_userdata('username');
		$this->CI->session->unset_userdata('email');
		$this->CI->session->unset_userdata('name');
		$this->CI->session->unset_userdata('role');
		$this->CI->session->unset_userdata('menu');
		$this->CI->session->unset_userdata('foto_profil');
	}


}
