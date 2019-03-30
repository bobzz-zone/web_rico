<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pendapatan_model extends CI_model
{
    public $table = 'pendapatan a'; // you MUST mention the table name
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
         $this->db->where("(a.tanggal LIKE '%$search')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.tanggal,a.id_transaksi,a.penjual,a.pembeli,
                          a.total,a.fee,a.angka_unik,a.total_fee,a.status')
               ->from($this->table)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.tanggal LIKE '%$search')");
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
