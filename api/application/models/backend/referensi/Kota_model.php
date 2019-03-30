<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Kota_model extends CI_model
{
    public $table = 'm_kota a'; // you MUST mention the table name
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
               ->join('m_provinsi b','a.id_provinsi = b.id')
               ->where('a.deleted',1);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.nama LIKE '%$search' OR b.nama LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.nama,a.id_provinsi,b.nama as nama_provinsi')
               ->from($this->table)
               ->join('m_provinsi b','a.id_provinsi = b.id')
               ->where('a.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search' OR b.nama LIKE '%$search%')");
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
