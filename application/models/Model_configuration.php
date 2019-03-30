<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_configuration extends MY_Model {

	private $primary_key 	= 'id_configuration';
	private $table_name 	= 'configuration';
	private $field_search 	= ['bg_color', 'banner_image', 'logo', 'bg_color_box_menu', 'bg_color_box_list'];

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
	                $where .= "configuration.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "configuration.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "configuration.".$field . " LIKE '%" . $q . "%' )";
        }
			$where .= ' AND configuration.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
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
	                $where .= "configuration.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "configuration.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "configuration.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
			$where .= ' AND configuration.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('configuration.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);

		return $query->result();
	}

	public function join_avaiable() {
		
    	return $this;
	}

}

/* End of file Model_configuration.php */
/* Location: ./application/models/Model_configuration.php */