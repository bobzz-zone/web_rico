<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Request_promote_model extends CI_model
{
    public $table = 'request_promote a'; // you MUST mention the table name
    public $primary_key = 'id_request'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $this->db->select('a.id_request')
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
      $this->db->select('a.id_request,a.tanggal,a.type,a.nominal,a.id_pengguna,a.action,
                        a.tanggal_action,a.action_by,a.keterangan,b.username as username_adm,
                        c.username as username_pembeli,a.uang_diterima')
               ->from($this->table)
               ->join('pengguna b','a.action_by = b.id AND b.level > 1','LEFT')
               ->join('pengguna c','a.id_pengguna = c.id AND c.level = 1')
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
      $this->db->select('a.*,b.username')
               ->from($this->table)
               ->join('pengguna b','a.id_pengguna = b.id AND b.deleted = 1')
               ->where($this->primary_key,$id);
      return $this->db->get();
    }
}
