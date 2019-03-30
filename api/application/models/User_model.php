<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class User_model extends CI_Model{
    function __construct() {
        parent::__construct();
    }

    function get_by_id($id){
  		$this->db->select('*')->from('pengguna');
  		$this->db->where('id',$id);
  		$this->db->where_in('deleted',array(1,3));
  		return  $this->db->get();
  	}

    function get_user_by_id($id){
  		$this->db->select('a.id,a.nama,a.username,a.email,a.use_wa,a.telpon,a.trusted,a.recomended,
                        a.rating,a.image,a.trusted_end,a.recomended_end,a.deskripsi,
                        a.date_add,b.nama as nama_kota')
                        ->from('pengguna a');
      $this->db->join('m_kota b','a.id_kota = b.id','LEFT');
  		$this->db->where('a.id',$id);
  		$this->db->where_in('a.deleted',array(1,3));
  		$this->db->where_in('a.level',array(1));
  		return  $this->db->get();
  	}

    function get_info($user_id){
      $user_id = $this->db->escape_str($user_id);
    	$query = $this->db->query("select a.* , b.nama as provinsi ,
                                    c.nama as kota, d.nama as kecamatan
                                    from pengguna a,m_provinsi b,m_kota c,m_kecamatan d
                                    where a.id ='$user_id' and a.id_provinsi = b.id and a.id_kota = c.id and a.id_kecamatan = d.id order by a.id asc");
    	return $query;
    }

    function get_provinsi(){
        $query = $this->db->query("select id,nama from m_provinsi");
        return $query;
    }

    function get_kota($id_provinsi){
        $id_provinsi = $this->db->escape_str($id_provinsi);
        $query = $this->db->query("select id,nama from m_kota where id_provinsi = '$id_provinsi'");
        return $query;
    }

    function get_kecamatan($id_kota){
        $id_kota = $this->db->escape_str($id_kota);
        $query = $this->db->query("select id,nama from m_kecamatan where id_kota = '$id_kota'");
        return $query;
    }

    /*function cek_order($no_order){
        $no_order = $this->db->escape_str($no_order);
        $query = $this->db->query("select * from sale where sale_code='$no_order'");
        return $query;
    }*/

    function cek_email_daftar($email){
        $email = $this->db->escape_str($email);
        $query = $this->db->query("select * from pengguna where email='$email'");
        return $query;
    }

    function get_user($key,$id){
      $this->db->select('a.*,b.token,b.token_fcm,b.device_id')
               ->from('pengguna a')
               ->join('pengguna_token b','a.id = b.id_pengguna')
               ->where('b.token',$key)
               ->where('a.id',$id)
               ->where_in('a.deleted',array(1,3));
      return $this->db->get();
    }

    function get_item_sell($id,$limit,$offset){
      $this->db->select('nama,harga,kode_item,tipe,foto,stock')
               ->from('m_item')
               ->where('id_pengguna',$id)
               ->where('deleted','1')
               ->order_by('terjual','desc');
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }
      return $this->db->get();
    }

    function get_user_rating($id,$type = 1){
      $this->db->select('id')
               ->from('rating_pengguna')
               ->where('id_pengguna',$id)
               ->where('tipe',$type);
      $total_rating = $this->db->count_all_results();
      $rating_cols = 'rating';
      if($type == 2){
        $rating_cols = 'buyer_rating';
      }
      $rating = $this->db->select($rating_cols)->get_where('pengguna',array('id' => $id))->row()->$rating_cols;
      return array('rating' => $rating, 'pemberi_rating' => $total_rating);
    }

    function get_user_transaksi($id,$type){
      $where_col = 'id_penjual';
      $group_col = 'id_pembeli';
      if($type == 2){
        $where_col = 'id_pembeli';
        $group_col = 'id_penjual';
      }
      $this->db->select('id')
               ->from('transaksi a')
               ->where($where_col,$id)
               ->where('progres','10')
               ->group_by($group_col);
      return $this->db->count_all_results();
    }

}
