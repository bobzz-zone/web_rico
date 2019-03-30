<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Saldo_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_list($where,$order_by,$limit,$offset){

      $this->db->select('a.*')
               ->from('history_saldo a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_list_count($where){

      $this->db->select('a.*')
               ->from('history_saldo a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function get_by_id($id,$user_id){
      $this->db->select('a.*,b.username as nama_user')
               ->from('history_saldo a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where('a.id',$id)
               ->where('a.id_pengguna',$user_id);

      return $this->db->get();
    }

    /* deposit */
    public function get_deposit_list($where,$order_by,$limit,$offset){

      $this->db->select('a.id,a.tanggal,a.tanggal_approve,a.id_customer,a.nominal,a.nominal_approve,a.status')
               ->from('deposit a')
               ->join('pengguna b','a.id_customer = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_deposit_list_count($where){

      $this->db->select('a.id')
               ->from('deposit a')
               ->join('pengguna b','a.id_customer = b.id')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function get_deposit_by_id($id,$user_id){
      $this->db->select('a.*,b.username as nama_user,c.nama as nama_bank,c.cabang as cabang_bank,c.rekening as no_rekening')
               ->from('deposit a')
               ->join('pengguna b','a.id_customer = b.id')
               ->join('m_bank_admin c','a.id_bank_admin = c.id')
               ->where('a.id',$id)
               ->where('a.id_customer',$user_id);

      return $this->db->get();
    }

    /* withdrawal */
    public function get_withdrawal_list($where,$order_by,$limit,$offset){

      $this->db->select('a.id,a.tanggal_approve,a.id_customer,a.nominal,a.nominal_approve,a.status')
               ->from('withdrawal a')
               ->join('pengguna b','a.id_customer = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_withdrawal_list_count($where){

      $this->db->select('a.id')
               ->from('withdrawal a')
               ->join('pengguna b','a.id_customer = b.id')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function get_withdrawal_by_id($id,$user_id){
      $this->db->select('a.*,b.username as nama_user,c.nama as nama_bank,c.cabang as cabang_bank,c.rekening as no_rekening')
               ->from('withdrawal a')
               ->join('pengguna b','a.id_customer = b.id')
               ->join('m_bank_admin c','a.id_bank_admin = c.id')
               ->where('a.id',$id)
               ->where('a.id_customer',$user_id);

      return $this->db->get();
    }

}

?>
