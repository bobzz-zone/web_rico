<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pengguna_model extends MY_Model
{
    public $table = 'pengguna'; // you MUST mention the table name
    public $primary_key = 'id'; // you MUST mention the primary key

    public function __construct()
    {
        parent::__construct();
        $this->pagination_delimiters = array('','');
		    $this->pagination_arrows = array('&lt;','&gt;');
    }
}
