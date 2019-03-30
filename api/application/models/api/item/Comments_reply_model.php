<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Comments_reply_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    public function get_comments_reply($id_comment,$order,$limit,$offset){

      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.komentar,a.foto,a.last_edited,b.nama as nama_item,
                         c.username,c.image as foto_pengguna')
               ->from('item_reply a')
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','a.id_pengguna = c.id AND c.deleted = 1')
               ->where('a.id_coment',$id_comment)
               ->order_by($order['field'],$order['direction']);

      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();
    }

    public function get_comments_reply_count($id_comment){

      $this->db->select('a.id,a.tanggal,a.id_pengguna,a.id_item,a.status,
                         a.komentar,a.foto,a.last_edited,b.nama as nama_item,
                         c.username')
               ->from('item_reply a')
               ->join('m_item b','a.id_item = b.id AND b.deleted = 1')
               ->join('pengguna c','a.id_pengguna = c.id AND c.deleted = 1')
               ->where('a.id_coment',$id_comment);

      return $this->db->count_all_results();
    }

}

?>
