<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Items_model extends CI_model
{
    public $table = 'm_item a'; // you MUST mention the table name
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
               ->where('deleted',1);

       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(nama LIKE '%$search' OR kode_item LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.nama,a.kode_item,a.harga,a.foto,a.id_pengguna,b.username')
               ->from($this->table)
               ->join('pengguna b','a.id_pengguna = b.id AND b.deleted = 1')
               ->where('a.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search' OR a.kode_item LIKE '%$search%')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('*')
               ->from($this->table)
               ->where('deleted',1)
               ->where("id",$id);
      return $this->db->get();
    }
}
