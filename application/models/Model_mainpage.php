<?php

class Model_mainpage extends CI_Model{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    public function get_data_configuration() {
        return $this->db->query("select * from configuration where deleted = 1");
    }

    public function get_data_keyword() {
        return $this->db->query("select * from m_keyword where deleted = 1 order by urutan");
    }

    public function get_data_ads(){
        return $this->db->query("select * from m_ads where deleted = 1 order by posisi, id");
    }

    public function get_data_rangking($id_keyword){
        $id_keyword = $this->db->escape_str($id_keyword);
        return $this->db->query("select * from rangking where id_keyword='$id_keyword' and deleted = 1 order by rank");
    }
    
}