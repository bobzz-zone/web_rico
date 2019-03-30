<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Kecamatan_model extends CI_model
{
    public $table = 'm_kecamatan a'; // you MUST mention the table name
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
               ->join('m_kota b','a.id_kota = b.id')
               ->join('m_provinsi c', 'b.id_provinsi = c.id')
               ->where('a.deleted',1);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.nama LIKE '%$search' OR b.nama LIKE '%$search%' OR c.nama LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.nama,a.id_kota,b.id_provinsi,b.nama as nama_kota,c.nama as nama_provinsi')
               ->from($this->table)
               ->join('m_kota b','a.id_kota = b.id')
               ->join('m_provinsi c', 'b.id_provinsi = c.id')
               ->where('a.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search' OR b.nama LIKE '%$search%' OR c.nama LIKE '%$search%')");
      }

      return $this->db->get();
    }

    public function get_by_id($id){
      $this->db->select('a.*,b.nama as nama_kota,b.id_provinsi,c.nama as nama_provinsi')
               ->from($this->table)
               ->join('m_kota b','a.id_kota = b.id')
               ->join('m_provinsi c','b.id_provinsi = c.id')
               ->where('a.deleted',1)
               ->where("a.id",$id);
      return $this->db->get();
    }
}
