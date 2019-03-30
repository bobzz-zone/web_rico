<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Iklan_model extends CI_model
{
    public $table = 'iklan a'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('id')
               ->from($this->table);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(nama_iklan LIKE '%$search')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.*,b.username as username_admin')
               ->from($this->table)
               ->join('pengguna b','a.id_admin = b.id AND b.level > 1')
               ->where('b.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(nama_iklan LIKE '%$search')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where("id_iklan",$id);
      return $this->db->get();
    }
}
