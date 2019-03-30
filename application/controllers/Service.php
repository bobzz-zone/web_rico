<?php 

class Service extends CI_Controller	
{
	
	public function __construct()
	{
		parent::__construct();
        $this->load->database();
		
	}
	
	
	function load_about(){
	    header('Content-Type: application/json; charset=utf-8');
	    $a = $this->db->query("select * from p_about where deleted=1")->result();
	    echo json_encode($a,JSON_PRETTY_PRINT);
	}
	
	function load_plant(){
	    header('Content-Type: application/json; charset=utf-8');
	    $a = $this->db->query("select * from p_plant where deleted=1")->result();
	    echo json_encode($a,JSON_PRETTY_PRINT);
	}
}