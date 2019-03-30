<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mainpage extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	 public function __construct()
 	{
 		parent::__construct();
 		$this->load->model("Model_mainpage","m");
		
 	}
	public function index()
	{
		$page_data['data_configuration'] = $this->m->get_data_configuration()->result();
		$page_data['data_keyword'] = $this->m->get_data_keyword()->result();
		$page_data['data_ads'] = $this->m->get_data_ads()->result();
		$this->load->view('frontend/standart/mainpage',$page_data);
	}

	public function get_rangking() {
        header("Content-type: application/json");
        $res = "";
        try {
            $id_keyword        = $this->input->get("id_keyword");
            
            $hasil = $this->m->get_data_rangking($id_keyword);
            $res = "Berhasil";
            $data = array("status"=>$res, "data_rangking" => $hasil->result());
            echo json_encode($data);
        } catch (Exception $ex) {
            $res = "Gagal -> ".$ex;
            $data = array("status"=>$res);
            echo json_encode($data);
        }
    }

}
