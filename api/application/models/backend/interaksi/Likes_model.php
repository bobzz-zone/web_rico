<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Likes_model extends CI_model
{
    public $table = 'item_like a'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('a.id')
               ->from($this->table);

       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(b.nama LIKE '%$search' OR b.kode_item LIKE '%$search%' )");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.last_edited,b.nama as nama_item,b.kode_item,
                         c.username')
               ->from($this->table)
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','a.id_pengguna = c.id AND c.deleted = 1')
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(b.nama LIKE '%$search' OR b.kode_item LIKE '%$search%' )");
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
