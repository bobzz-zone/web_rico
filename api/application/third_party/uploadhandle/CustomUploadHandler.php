<?php

error_reporting(E_ALL | E_STRICT);
require('UploadHandler.php');

class CustomUploadHandler extends UploadHandler {

    protected function initialize() {
    	$this->db = new mysqli(
    		$this->options['db_host'],
    		$this->options['db_user'],
    		$this->options['db_pass'],
    		$this->options['db_name']
    	);
        parent::initialize();
        $this->db->close();
    }

    protected function handle_form_data($file, $index) {
    	$file->title = @$_REQUEST['title'][$index];
    	$file->description = @$_REQUEST['description'][$index];
    }

    protected function handle_file_upload($uploaded_file, $name, $size, $type, $error,
            $index = null, $content_range = null) {
        $file = parent::handle_file_upload(
        	$uploaded_file, $name, $size, $type, $error, $index, $content_range
        );
        if (empty($file->error)) {

			$sql = 'INSERT INTO `'.$this->options['db_table']
				.'` ( `nama_file`, `path`, `jenis`, `id_file_utama`, `tahun`, `semester`, `id_pengguna`)'
				.' VALUES (?, ?, ?, ?, ?, ?, ?)';
	        $query = $this->db->prepare($sql);
          $path = 'uploads';
          $jenis = 1;
          $id_file_utama = 1;
          $tahun = date('Y');
          $semester = 2;
          $user_id = $_SESSION['id_pengguna'];
          $query->bind_param(
            'ssiiiii',
	        	$file->name,
	        	$path,
	        	$jenis,
	        	$id_file_utama,
	        	$tahun,
	        	$semester,
	        	$user_id
	        );
	        $query->execute();
	        $file->id = $this->db->insert_id;
        }
        return $file;
    }

    protected function set_additional_file_properties($file) {
        parent::set_additional_file_properties($file);
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        	$sql = 'SELECT `id_file_pendukung`, `tanggal`, `nama_file`, `path`,`jenis`,`id_file_utama`,`tahun`,`semester`,`id_pengguna` FROM `'
        		.$this->options['db_table'].'` WHERE `nama_file`= ?';
        	$query = $this->db->prepare($sql);
 	        $query->bind_param('s', $file->name);
	        $query->execute();
	        $query->bind_result(
	        	$id_file_pendukung,
	        	$tanggal,
	        	$nama_file,
	        	$title,
            $jenis,
            $id_file_utama,
            $tahun,
            $semester,
            $id_pengguna
	        );
	        while ($query->fetch()) {
	        	$file->id_file_pendukung = $id_file_pendukung;
        		$file->tanggal = $tanggal;
        		$file->nama_file = $nama_file;
        		$file->title = $title;
        		$file->jenis = $jenis;
        		$file->id_file_utama = $id_file_utama;
        		$file->tahun = $tahun;
        		$file->semester = $tahun;
        		$file->id_pengguna = $id_pengguna;
    		}
        }
    }

    public function delete($print_response = true) {
        $response = parent::delete(false);
        foreach ($response as $name => $deleted) {
        	if ($deleted) {
	        	$sql = 'DELETE FROM `'
	        		.$this->options['db_table'].'` WHERE `nama_file`=?';
	        	$query = $this->db->prepare($sql);
	 	        $query->bind_param('s', $name);
		        $query->execute();
        	}
        }
        return $this->generate_response($response, $print_response);
    }

}
