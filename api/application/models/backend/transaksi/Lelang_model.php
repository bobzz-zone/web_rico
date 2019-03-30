<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lelang_model extends CI_model
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
               ->where('a.tipe',2)
               ->where('a.deleted',1);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.kode_item LIKE '%$search' OR a.nama LIKE '%$search%' OR a.harga)");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.id_pengguna,a.nama,a.kode_item,a.kondisi,a.rangkuman,
                        a.tipe,a.harga,a.kelipatan,a.harga_tertinggi,a.pemenang,a.waktu_habis,
                        b.username as username_pemilik,c.username as username_penawar')
               ->from($this->table)
               ->join('pengguna b','a.id_pengguna = b.id')
               ->join('pengguna c','a.pemenang = c.id','LEFT')
               ->where('a.tipe',2)
               ->where('a.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.kode_item LIKE '%$search' OR a.nama LIKE '%$search%' OR a.harga)");
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
