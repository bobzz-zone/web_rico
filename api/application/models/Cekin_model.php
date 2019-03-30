<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Cekin_model extends CI_Model
{
	public $table       = 'pengguna'; ///nama tabel yg diakses
	public $primary_key = 'id';

	function __construct()
	{
		parent::__construct();
	}

	function get_login_info($username,$is_bpjs)
	{
		if($is_bpjs == "1")
		{
			$sql_query = "SELECT * FROM pengguna a WHERE (a.no_bpjs = '$username') LIMIT 1";
		}
		else
		{
			# code...
			$sql_query = "SELECT * FROM pengguna a WHERE (a.email = '$username' OR a.telpon = '$username') LIMIT 1";

		}

		/*$this->db->from($this->table);
		$this->db->join('n_pengguna_pos','admin.admin_id = n_pengguna_pos.id_pengguna','left');
		$this->db->where('email',$username);
		$this->db->limit(1);*/
		$query = $this->db->query($sql_query);
		return ($query->num_rows() > 0) ? $query->row() : FALSE;
	}

}
