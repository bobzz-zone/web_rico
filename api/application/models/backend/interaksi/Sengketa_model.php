<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sengketa_model extends CI_model
{
    public $table = 'transaksi a'; // you MUST mention the table name
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
               ->where('a.progres',20);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.kode LIKE '%$search')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.id,a.tanggal,a.tipe,a.kode,a.grand_total,a.transfer,
                        a.metode_bayar,a.kurir,a.progres,a.id_penjual,a.id_pembeli,
                        b.username as username_penjual,c.username as username_pembeli')
               ->from($this->table)
               ->join('pengguna b','a.id_penjual = b.id')
               ->join('pengguna c','a.id_pembeli = c.id')
               ->where('a.tipe',2)
               ->where('a.progres',20)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(kode LIKE '%$search')");
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
