<?php

/**
 * Extended Controller for Admin
 * Auto Detect user login status
 * if NOT Logged In bring user to login page
 *
 * _$var_name_ => MAIN VIEW DATA
 * __$var_name__ => FLASH DATA
 */
class MY_Controller extends CI_Controller {

    var $userdata;
    //var $_menu_;
    //var $privilege;
    var $point_user;

    protected $_PER_PAGE = 0;

    public function __construct()
    {
        parent::__construct();
        $this->_PER_PAGE = 10;
		    //$lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        //$this->lang->load($lang, $lang);
    		$this->load->library('Access');
        $this->load->helper('menu');
    		//$this->load->library('Fungsi');
    		//$this->setting = $this->db->get('settings')->row();
        //$this->load->model('Global_model','global_model');

		    if(!$this->access->is_login())
        {
            redirect('sign-in');
        }


        $session_id_user = $this->session->userdata('id_pengguna');

        if(!$session_id_user)
        {
            redirect('sign-in');
        }

        $id_akses = $this->session->userdata('role');
        if($id_akses == '0'){
          redirect('sign-in');
        }

        /* set menu */

        $list_menu = $this->db->get_where('c_akses',array('id' => $id_akses))->row()->menu;
        $this->session->set_userdata('menu',$list_menu);
	}


}

?>
