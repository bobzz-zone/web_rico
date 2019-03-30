<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Withdrawal_model extends CI_model
{
    public $table = 'withdrawal a'; // you MUST mention the table name
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
      $this->db->select('a.id,a.id_customer,a.nama_bank,a.atas_nama,a.rekening,
                         a.nominal,a.nominaL_approve,a.status,
                        a.tanggal_approve,a.id_admin,b.username as username_adm,
                        c.username as username_pembeli')
               ->from($this->table)
               ->join('pengguna b','a.id_admin = b.id AND b.level = 2','LEFT')
               ->join('pengguna c','a.id_customer = c.id AND c.level = 1')
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.tanggal_approve LIKE '%$search')");
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
