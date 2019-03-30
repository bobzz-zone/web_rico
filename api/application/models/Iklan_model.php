<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Iklan_model extends CI_model
{

    public function __construct()
    {
        parent::__construct();

    }

    public function get_ads(){
      $ads = array('id' => 0,
                    'nama' => 'ads',
                    'foto' => 'ads.jpg',
                    'url'  => 'http://google.com'
                  );
      $items_with_ads = array($ads,$ads);

      return $items_with_ads;
    }

    public function get_ads2($offset){
      $this->db->select('id_iklan,nama_iklan,foto,url,deskripsi,prioritas')
               ->from('iklan')
               ->where('tanggal_mulai < ',date('Y-m-d H:i:s'))
               ->where('tanggal_berakhir > ', date('Y-m-d H:i:s'))
               ->limit(4,$offset)
               ->order_by('prioritas','desc')
               ->order_by('tanggal_mulai','asc');
      return $this->db->get();
    }

}
?>
