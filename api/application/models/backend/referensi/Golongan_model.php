<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Golongan_model extends CI_model
{
    public $table = 'm_golongan'; // you MUST mention the table name
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
               ->where('deleted',1);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(nama LIKE '%$search')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('id,nama,image,date_add')
               ->from($this->table)
               ->where('deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(nama LIKE '%$search')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where_in('deleted',1)
               ->where("id",$id);
      return $this->db->get();
    }
}
