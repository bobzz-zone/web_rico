<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Konfirmasi_pembayaran_model extends CI_model
{
    public $table = 'konfirmasi_pembayaran a'; // you MUST mention the table name
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
               ->where('a.deleted',1);
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.tanggal LIKE '%$search' OR a.nama_bank LIKE '%$search%'
                            OR a.cabang_bank LIKE '%$search%' OR a.no_rekening LIKE '%$search%' OR
                            a.atas_nama LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $this->db->select('a.*,b.nama as nama_bank_admin,b.cabang as cabang_bank_admin,
                          b.rekening as rek_admin,b.pemilik as pemilik_admin')
               ->from($this->table)
               ->join('m_bank_admin b','a.bank_admin = b.id')
               ->where('a.deleted',1)
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.tanggal LIKE '%$search' OR a.nama_bank LIKE '%$search%'
                           OR a.cabang_bank LIKE '%$search%' OR a.no_rekening LIKE '%$search%' OR
                           a.atas_nama LIKE '%$search%')");
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
