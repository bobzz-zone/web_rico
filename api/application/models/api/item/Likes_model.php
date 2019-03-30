<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Likes_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_data($user_id,$order,$limit,$offset){

      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.last_edited,b.nama as nama_item,b.tipe,
                         b.kode_item,b.kondisi,b.rangkuman,b.berat,b.atribut1,
                         b.atribut2,b.atribut3,b.atribut4,b.atribut5,b.harga,
                         b.kelipatan,b.harga_tertinggi,b.pemenang,b.waktu_habis,b.foto,
                         b.deskripsi,b.viewed,b.liked,b.favorited,b.shared,b.terjual,b.bintang,
                         b.stock,b.reviewed,b.date_add,
                         c.username as username_penjual,c.image as foto_penjual')
               ->from('item_like a')
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','b.id_pengguna = c.id AND c.deleted = 1')
               ->where('a.id_pengguna',$user_id)
               ->where('a.status','1')
               ->order_by($order['field'],$order['direction']);

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();
    }

}

?>
