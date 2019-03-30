<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Blog_model extends CI_model
{
    public $table = 'c_blog a'; // you MUST mention the table name
    public $primary_key = 'id_blog'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('a.id')
               ->from($this->table)
               ->join('pengguna b','a.penulis = b.id AND b.deleted = 1');

       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.judul LIKE '%$search' OR a.tanggal LIKE '%$search%' )");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.*,b.nama,b.username')
               ->from($this->table)
               ->join('pengguna b','a.penulis = b.id AND b.deleted = 1')
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.judul LIKE '%$search' OR a.tanggal LIKE '%$search%' )");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where($this->primary_key,$id);
      return $this->db->get();
    }
}
