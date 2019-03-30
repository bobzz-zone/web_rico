<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admins_model extends CI_model
{
    public $table = 'pengguna a'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('a.id')
               ->from($this->table)
               ->join('c_akses b','a.id_akses = b.id')
               ->where_in('deleted',array(1,3))
               ->where_in('level',array(2,3));

       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.nama LIKE '%$search' OR a.username LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.nama,a.username,a.email,a.level,id_akses,nama_akses')
               ->from($this->table)
               ->join('c_akses b','a.id_akses = b.id')
               ->where_in('a.deleted',array(1,3))
               ->where_in('a.level',array(2,3))
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search' OR a.username LIKE '%$search%')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where_in('deleted',array(1,3))
               ->where_in('level',array(2,3))
               ->where("id",$id);
      return $this->db->get();
    }
}
