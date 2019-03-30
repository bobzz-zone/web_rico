<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Request_vip_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    /* request VIP */
    public function get_list($where,$order_by,$limit,$offset){

      $this->db->select('a.id_request, a.type,a.tanggal, a.tanggal_action, a.id_pengguna,
                         a.nominal, a.angka_unik, a.total_transfer, a.uang_diterima, a.saldo,
                         a.action, a.action_by, a.keterangan, b.username as username_pengguna,
                         c.username as username_admin')
               ->from('request_vip a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->join('pengguna c','a.action_by = c.id','LEFT')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_list_count($where){

      $this->db->select('a.id_request')
               ->from('request_vip a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function get_by_id($id,$user_id){
      $this->db->select('a.id_request,a.type,a.tanggal,a.tanggal_action,a.id_pengguna,
                         a.nominal,a.angka_unik,a.total_transfer,a.uang_diterima,a.saldo,
                         a.action,a.action_by,a.keterangan,b.username as username_pengguna,
                         c.username as username_admin')
                ->from('request_vip a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->join('pengguna c','a.action_by = c.id','LEFT')
               ->where('a.id_request',$id)
               ->where('a.id_pengguna',$user_id);
      return $this->db->get();
    }

}

?>
