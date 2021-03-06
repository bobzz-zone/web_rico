<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pengguna_model extends CI_model
{
    public $table = 'pengguna'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('id')
               ->from($this->table)
               ->where_in('deleted',array(1,3))
               ->where('level','1');

       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(nama LIKE '%$search' OR username LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('id,nama,username,telpon,email,image,status_login,deleted,saldo')
               ->from($this->table)
               ->where_in('deleted',array(1,3))
               ->where('level','1')
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(nama LIKE '%$search' OR username LIKE '%$search%')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where_in('deleted',array(1,3))
               ->where('level','1')
               ->where("id",$id);
      return $this->db->get();
    }
}
