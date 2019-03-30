<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pengguna_vip_model extends CI_model
{
    public $table = 'pengguna a'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }

    public function get_all_count($where,$search){
      $curr_date = date('Y-m-d H:i:s');
      $this->db->select('a.id')
               ->from($this->table)
               ->where('a.deleted',1)
               ->where("((a.recomended = '1' AND a.recomended_end > '$curr_date') OR (a.trusted = '1' AND a.trusted_end > '$curr_date'))");
       if(!empty($where)){
           $this->db->where($where);
       }

       if(!empty($search)){
         $this->db->where("(a.nama LIKE '%$search' OR a.username LIKE '%$search%')");
       }

      return $this->db->count_all_results();
    }

    public function get_all($where,$search,$order,$limit,$offset){
      $curr_date = date('Y-m-d H:i:s');
      $this->db->select('a.id,a.nama,a.username,a.recomended,a.recomended_end,a.trusted,a.trusted_end')
               ->from($this->table)
               ->where('a.deleted',1)
               ->where("((a.recomended = '1' AND a.recomended_end > '$curr_date') OR (a.trusted = '1' AND a.trusted_end > '$curr_date'))")
               ->order_by($order['field'],$order['sort'])
               ->limit($limit,$offset);
      if(!empty($where)){
          $this->db->where($where);
      }

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search' OR a.username LIKE '%$search%')");
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
