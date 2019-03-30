<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Promoted_model extends CI_model
{

    public function __construct()
    {
        parent::__construct();

    }

    public function get_promoted($tipe){
      $curr_date = date('Y-m-d H:i:s');
      $this->db->select('a.*,b.id, b.nama, b.kode_item, b.kondisi, b.tipe, b.rangkuman,
                         b.harga, b.harga_tertinggi, b.kelipatan, b.pemenang, b.waktu_habis,
                         b.foto, b.viewed, b.liked, b.shared, b.terjual, b.atribut1,
                         b.atribut2, b.atribut3, b.atribut4, b.atribut5, b.id_pengguna,
                         b.stock,b.bintang,b.reviewed, c.username as nama_penjual,c.use_wa,
                         c.telpon,b.deskripsi,b.promoted,b.promoted_end')
                ->from('promoted_item a')
                ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
                ->join('pengguna c', 'b.id_pengguna = c.id AND c.deleted = 1')
                ->where("a.tanggal_awal <= '$curr_date'" )
                ->where("a.tanggal_akhir >= '$curr_date' ")
                ->where('a.tipe',$tipe)
                ->order_by('tanggal_awal','asc');
      return $this->db->get();
    }


}
?>
