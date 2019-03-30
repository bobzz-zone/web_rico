<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Transactions_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    function get_list($user_id,$progress,$limit,$offset){
      $this->db->select('a.id,a.tanggal,a.tipe,a.item,a.kode,a.grand_total,a.id_penjual,
                         a.id_pembeli,a.progres,b.username as nama_penjual,c.username as nama_pembeli')
                ->from('transaksi a')
                ->join('pengguna b','a.id_penjual = b.id')
                ->join('pengguna c','a.id_pembeli = c.id')
                ->where('a.id_pembeli',$user_id)
                ->order_by('a.id','desc');
      if($progress !== 'completed'){
        $this->db->where_in('a.progres',array(1,2,3,4,5,6,7,8,9));
      }else{
        $this->db->where_in('a.progres',array(10));
      }

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }


      return $this->db->get();
    }

    function get_by_id($id,$user_id){
      $this->db->select('a.*,b.username as nama_penjual,b.image as foto_penjual')
                ->from('transaksi a')
                ->join('pengguna b','a.id_penjual = b.id')
                ->where('a.id',$id)
                ->where('a.id_pembeli',$user_id)
                ->order_by('a.id','desc');

      return $this->db->get();
    }


    /** Get Sales list **/
    function get_sale_list($user_id,$progress,$limit,$offset){
      $this->db->select('a.id,a.tanggal,a.tipe,a.item,a.kode,a.grand_total,a.id_penjual,
                         a.id_pembeli,a.progres,b.username as nama_pembeli,c.username as nama_penjual')
                ->from('transaksi a')
                ->join('pengguna b','a.id_pembeli = b.id')
                ->join('pengguna c','a.id_penjual = c.id')
                ->where('a.id_penjual',$user_id)
                ->order_by('a.id','desc');
      if($progress !== 'completed'){
        $this->db->where_in('a.progres',array(1,2,3,4,5,6,7,8,9,20));
      }else{
        $this->db->where_in('a.progres',array(10));
      }

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }


      return $this->db->get();
    }

    function get_sale_by_id($id,$user_id){
      $this->db->select('a.*,b.username as nama_pembeli,b.image as foto_pembeli')
                ->from('transaksi a')
                ->join('pengguna b','a.id_pembeli = b.id')
                ->where('a.id',$id)
                ->where('a.id_penjual',$user_id)
                ->order_by('a.id','desc');

      return $this->db->get();
    }

}

?>
