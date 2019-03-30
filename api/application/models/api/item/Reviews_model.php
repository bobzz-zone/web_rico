<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Reviews_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_reviews($id_item,$order,$limit,$offset){

      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.komentar,a.bintang,a.foto,a.last_edited,b.nama as nama_item,
                         c.username,c.image as foto_pengguna')
               ->from('item_review a')
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','a.id_pengguna = c.id AND c.deleted = 1')
               ->where('a.id_item',$id_item)
               ->order_by($order['field'],$order['direction']);

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();
    }

    public function get_reviews_count($id_item){

      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.komentar,a.foto,a.last_edited,b.nama as nama_item,
                         c.username')
               ->from('item_review a')
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','a.id_pengguna = c.id AND c.deleted = 1')
               ->where('a.id_item',$id_item);

      return $this->db->count_all_results();
    }

}

?>
