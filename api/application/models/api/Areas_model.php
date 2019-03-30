<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Areas_model extends CI_Model{

    function __construct() {
        parent::__construct();
    }

    /* START PROVINCE */
    public function get_province($where,$search,$order_by,$limit,$offset){

      $this->db->select('*')
               ->from('m_provinsi a')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);

      if(!empty($search)){
        $this->db->where($search);
      }
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_province_count($where,$search){

      $this->db->select('*')
               ->from('m_provinsi a')
               ->where($where);

      if(!empty($search)){
        $this->db->where($search);
      }

      return $this->db->count_all_results();

    }

    public function get_province_by_id($id){
      $this->db->select('a.*')
               ->from('m_provinsi a')
               ->where('a.id',$id)
               ->where('a.deleted','1');

      return $this->db->get();
    }

    /* END PROVINCE */

    /* START CITY */
    public function get_city($where,$search,$order_by,$limit,$offset){

      $this->db->select('a.*,b.nama as nama_provinsi')
               ->from('m_kota a')
               ->join('m_provinsi b' , 'a.id_provinsi = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);

      if(!empty($search)){
        $this->db->where($search);
      }
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_city_count($where,$search){

      $this->db->select('a.*,b.nama as nama_provinsi')
               ->from('m_kota a')
               ->join('m_provinsi b' , 'a.id_provinsi = b.id')
               ->where($where);

      if(!empty($search)){
        $this->db->where($search);
      }

      return $this->db->count_all_results();

    }

    public function get_city_by_id($id){
      $this->db->select('a.*,b.nama as nama_provinsi')
               ->from('m_kota a')
               ->join('m_provinsi b', 'a.id_provinsi = b.id')
               ->where('a.id',$id)
               ->where('a.deleted','1');

      return $this->db->get();
    }

    /* END CITY */

    /* START DISTRICT */
    public function get_district($where,$search,$order_by,$limit,$offset){

      $this->db->select('a.*,b.nama as nama_kota')
               ->from('m_kecamatan a')
               ->join('m_kota b' , 'a.id_kota = b.id')
               ->where($where)
               ->order_by($order_by['field'],$order_by['direction']);

      if(!empty($search)){
        $this->db->where($search);
      }
      if($limit > 0){
        $this->db->limit($limit,$offset);
      }

      return $this->db->get();

    }

    public function get_district_count($where,$search){

      $this->db->select('a.*,b.nama as nama_kota')
               ->from('m_kecamatan a')
               ->join('m_kota b' , 'a.id_kota = b.id')
               ->where($where);

      if(!empty($search)){
        $this->db->where($search);
      }

      return $this->db->count_all_results();

    }

    public function get_district_by_id($id){
      $this->db->select('a.*,b.nama as nama_kota')
               ->from('m_kecamatan a')
               ->join('m_kota b', 'a.id_kota = b.id')
               ->where('a.id',$id)
               ->where('a.deleted','1');

      return $this->db->get();
    }

    /* END DISTRICT */


}

?>
