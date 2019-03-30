<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_pasien extends MY_Model {

	private $primary_key 	= 'id_pasien';
	private $table_name 	= 'pasien';
	private $field_search 	= ['nama_lengkap', 'no_rekam_medis', 'no_bpjs'];

	public function __construct()
	{
		$config = array(
			'primary_key' 	=> $this->primary_key,
		 	'table_name' 	=> $this->table_name,
		 	'field_search' 	=> $this->field_search,
		 );

		parent::__construct($config);
	}

	public function count_all($q = null, $field = null)
	{
		$iterasi = 1;
        $num = count($this->field_search);
        $where = NULL;
        $q = $this->scurity($q);
		$field = $this->scurity($field);

        if (empty($field)) {
	        foreach ($this->field_search as $field) {
	            if ($iterasi == 1) {
	                $where .= "pasien.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "pasien.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "pasien.".$field . " LIKE '%" . $q . "%' )";
        }
			$where .= ' AND pasien.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
		$this->join_avaiable();
        $this->db->where($where);
		$query = $this->db->get($this->table_name);

		return $query->num_rows();
	}

	public function get($q = null, $field = null, $limit = 0, $offset = 0, $select_field = [])
	{
		$iterasi = 1;
        $num = count($this->field_search);
        $where = NULL;
        $q = $this->scurity($q);
		$field = $this->scurity($field);

        if (empty($field)) {
	        foreach ($this->field_search as $field) {
	            if ($iterasi == 1) {
	                $where .= "pasien.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "pasien.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "pasien.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
			$where .= ' AND pasien.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('pasien.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);

		return $query->result();
	}

	public function join_avaiable() {
		$this->db->join('m_jenis_kelamin', 'm_jenis_kelamin.id = pasien.jenis_kelamin', 'LEFT');
	    $this->db->join('m_agama', 'm_agama.id = pasien.id_agama', 'LEFT');
	    $this->db->join('pengguna', 'pengguna.id = pasien.id_pengguna', 'LEFT');
	    $this->db->join('m_status_pernikahan', 'm_status_pernikahan.id = pasien.id_status_pernikahan', 'LEFT');
	    
    	return $this;
	}

}

/* End of file Model_pasien.php */
/* Location: ./application/models/Model_pasien.php */