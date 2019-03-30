<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Items_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_list($where,$search,$order_by,$limit,$offset){

      $this->db->select('a.id, a.nama, a.kode_item, a.kondisi, a.tipe, a.rangkuman,
                         a.harga, a.harga_tertinggi, a.kelipatan, a.pemenang, a.waktu_habis,
                         a.foto, a.viewed, a.liked, a.shared, a.terjual, a.atribut1,
                         a.atribut2, a.atribut3, a.atribut4, a.atribut5, a.id_pengguna,
                         a.stock,a.bintang,a.reviewed, b.username as nama_penjual,b.use_wa,
                         b.telpon,a.deskripsi,a.promoted,a.promoted_end,a.deleted')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);

      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search%' OR a.kode_item LIKE '%$search%')");
      }

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }


      return $this->db->get();

    }

    public function get_list_count($where,$search){

      $this->db->select('a.nama,a.kode_item,a.kondisi,a.tipe,a.rangkuman,
                         a.harga,a.harga_tertinggi,a.kelipatan,a.pemenang,a.waktu_habis,
                         a.foto,a.viewed,a.liked,a.shared,a.terjual,a.atribut1,
                         a.atribut2,a.atribut3,a.atribut4,a.atribut5,a.id_pengguna,
                         b.username as nama_penjual')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where($where);
      if(!empty($search)){
        $this->db->where("(a.nama LIKE '%$search%' OR a.kode_item LIKE '%$search%')");
      }

      return $this->db->count_all_results();

    }

    public function get_by_id($id){
      $this->db->select('a.*,b.username as nama_penjual,b.use_wa,b.telpon')
               ->from('m_item a')
               ->join('pengguna b','a.id_pengguna = b.id')
               ->where('a.id',$id);

      return $this->db->get();
    }
}

?>
