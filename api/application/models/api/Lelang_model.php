<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Lelang_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_list($where,$search,$order_by,$limit,$offset){

      $this->db->select('a.id, a.nama, a.kode_item, a.kondisi, a.tipe, a.rangkuman,
                         a.harga, a.harga_tertinggi, a.kelipatan, a.pemenang, a.waktu_habis,
                         a.foto, a.viewed, a.liked, a.shared, a.terjual, a.atribut1,
                         a.atribut2, a.atribut3, a.atribut4, a.atribut5, a.id_pengguna,
                         a.stock, b.username as nama_penjual,b.use_wa,b.telpon,a.promoted,a.promoted_end')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_list_count($where){

      $this->db->select('a.nama,a.kode_item,a.kondisi,a.tipe,a.rangkuman,
                         a.harga,a.harga_tertinggi,a.kelipatan,a.pemenang,a.waktu_habis,
                         a.foto,a.viewed,a.liked,a.shared,a.terjual,a.atribut1,
                         a.atribut2,a.atribut3,a.atribut4,a.atribut5,a.id_pengguna,
                         b.username as nama_penjual')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function get_by_id($id){
      $this->db->select('a.*,b.username as nama_penjual,b.use_wa,b.telpon')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where('a.id',$id);

      return $this->db->get();
    }

    public function get_penawaran($id_item){
      $this->db->select('a.*,b.username,b.id_kota,b.image,c.nama as nama_item,c.kode_item,c.berat,
                        c.harga,c.harga_tertinggi,c.foto,c.id_pengguna as id_penjual,c.waktu_habis,
                        d.username as username_penjual,d.id_kota,d.alamat as alamat_penjual,
                        d.nama as nama_penjual')
               ->from('lelang a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->join('m_item c','a.id_item = c.id AND c.deleted= 1')
               ->join('pengguna d','c.id_pengguna = d.id AND d.deleted = 1')
               ->where('a.id_item',$id_item)
               ->order_by('a.nominal', 'desc');
      return $this->db->get();
    }

    public function get_mine($where,$search,$order_by,$limit,$offset){

      $this->db->select('a.id, a.nama, a.kode_item, a.kondisi, a.tipe, a.rangkuman,a.berat,
                         a.harga, a.harga_tertinggi, a.kelipatan, a.pemenang, a.waktu_habis,
                         a.foto, a.viewed, a.liked, a.shared, a.terjual, a.atribut1,
                         a.atribut2, a.atribut3, a.atribut4, a.atribut5, a.id_pengguna,
                         a.stock, b.username as nama_penjual,b.id_kota,d.nama as kota_penjual,b.alamat as alamat_penjual')
               ->from('lelang c')
               ->join('m_item a','c.id_item = a.id')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->join('m_kota d','b.id_kota = d.id')
               ->group_by('c.id_item')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_mine_count($where){

      $this->db->select('a.id, a.nama, a.kode_item, a.kondisi, a.tipe, a.rangkuman,
                         a.harga, a.harga_tertinggi, a.kelipatan, a.pemenang, a.waktu_habis,
                         a.foto, a.viewed, a.liked, a.shared, a.terjual, a.atribut1,
                         a.atribut2, a.atribut3, a.atribut4, a.atribut5, a.id_pengguna,
                         a.stock, b.username as nama_penjual')
               ->from('lelang c')
               ->join('m_item a','c.id_item = a.id')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->group_by('c.id_item')
               ->where($where);

      return $this->db->count_all_results();

    }

    public function cek_batas_waktu($id){
      $data = $this->db->get_where('m_item',array('id' => $id, 'deleted' => '1'))->row_array();
      $ret = FALSE;
      if($data['waktu_habis'] > date('Y-m-d H:i:s')){
        $ret = TRUE;
      }

      return $ret;
    }

    public function cek_kepemilikan($id,$user_id){
      $data = $this->db->select('id,id_pengguna')
                       ->get_where('m_item',array('id' => $id, 'deleted' => '1'))->row_array();
      $ret = FALSE;
      if($data['id_pengguna'] == $user_id){
        $ret = TRUE;
      }

      return $ret;
    }

}

?>
