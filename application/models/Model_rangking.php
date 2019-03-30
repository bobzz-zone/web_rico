<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_rangking extends MY_Model {

	private $primary_key 	= 'id';
	private $table_name 	= 'rangking';
	private $field_search 	= ['id_keyword', 'rank', 'website', 'rating', 'viewer'];

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
	                $where .= "rangking.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "rangking.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "rangking.".$field . " LIKE '%" . $q . "%' )";
        }
			$where .= ' AND rangking.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
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
	                $where .= "rangking.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "rangking.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "rangking.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
			$where .= ' AND rangking.'. COLUMN_REFERENCE.'='.VALUE_ACTIVED;
		$this->db->select("rangking.*,m_keyword.keyword");	
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('rangking.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);
		
		return $query->result();
	}

	public function join_avaiable() {
		$this->db->join('m_keyword', 'm_keyword.id = rangking.id_keyword', 'LEFT');
	    
    	return $this;
	}

	public function get_data_editable($id_keyword){

		$where = array("deleted" => "1", "id_keyword" => $id_keyword);

      	$this->db->select('*')
               ->from('rangking')
               ->where($where);

      	$this->db->order_by('id','asc');

      	return $this->db->get();

    }

}

/* End of file Model_rangking.php */
/* Location: ./application/models/Model_rangking.php */