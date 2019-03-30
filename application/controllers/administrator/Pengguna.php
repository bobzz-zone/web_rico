<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Pengguna Controller
*| --------------------------------------------------------------------------
*| Pengguna site
*|
*/
class Pengguna extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_pengguna');
	}

	/**
	* show all Penggunas
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('pengguna_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['penggunas'] = $this->model_pengguna->get($filter, $field, $this->limit_page, $offset);
		$this->data['pengguna_counts'] = $this->model_pengguna->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/pengguna/index/',
			'total_rows'   => $this->model_pengguna->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Pengguna List');
		$this->render('backend/standart/administrator/pengguna/pengguna_list', $this->data);
	}
	
	/**
	* Add new penggunas
	*
	*/
	public function add()
	{
		$this->is_allowed('pengguna_add');

		$this->template->title('Pengguna New');
		$this->render('backend/standart/administrator/pengguna/pengguna_add', $this->data);
	}

	/**
	* Add New Penggunas
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('pengguna_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('nama', 'Nama', 'trim|required|max_length[40]');
		$this->form_validation->set_rules('telpon', 'Telpon', 'trim|required|max_length[15]');
		$this->form_validation->set_rules('no_bpjs', 'No Bpjs', 'trim|required|max_length[40]');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|max_length[30]');
		$this->form_validation->set_rules('no_ktp', 'No Ktp', 'trim|required|max_length[18]');
		$this->form_validation->set_rules('alamat', 'Alamat', 'trim|required|max_length[100]');
		$this->form_validation->set_rules('pengguna_image_name', 'Image', 'trim|required|max_length[30]');
		

		if ($this->form_validation->run()) {
			$pengguna_image_uuid = $this->input->post('pengguna_image_uuid');
			$pengguna_image_name = $this->input->post('pengguna_image_name');
		
			$save_data = [
				'nama' => $this->input->post('nama'),
				'telpon' => $this->input->post('telpon'),
				'no_bpjs' => $this->input->post('no_bpjs'),
				'email' => $this->input->post('email'),
				'no_ktp' => $this->input->post('no_ktp'),
				'alamat' => $this->input->post('alamat'),
			];

			if (!is_dir(FCPATH . '/uploads/pengguna/')) {
				mkdir(FCPATH . '/uploads/pengguna/');
			}

			if (!empty($pengguna_image_name)) {
				$pengguna_image_name_copy = date('YmdHis') . '-' . $pengguna_image_name;

				rename(FCPATH . 'uploads/tmp/' . $pengguna_image_uuid . '/' . $pengguna_image_name, 
						FCPATH . 'uploads/pengguna/' . $pengguna_image_name_copy);

				if (!is_file(FCPATH . '/uploads/pengguna/' . $pengguna_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['image'] = $pengguna_image_name_copy;
			}
		
			
			$save_pengguna = $this->model_pengguna->store($save_data);

			if ($save_pengguna) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_pengguna;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/pengguna/edit/' . $save_pengguna, 'Edit Pengguna'),
						anchor('administrator/pengguna', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/pengguna/edit/' . $save_pengguna, 'Edit Pengguna')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/pengguna');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/pengguna');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Penggunas
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('pengguna_update');

		$this->data['pengguna'] = $this->model_pengguna->find($id);

		$this->template->title('Pengguna Update');
		$this->render('backend/standart/administrator/pengguna/pengguna_update', $this->data);
	}

	/**
	* Update Penggunas
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('pengguna_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required|max_length[40]');
		$this->form_validation->set_rules('telpon', 'Telpon', 'trim|required|max_length[15]');
		$this->form_validation->set_rules('no_bpjs', 'No Bpjs', 'trim|required|max_length[40]');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|max_length[30]');
		$this->form_validation->set_rules('no_ktp', 'No Ktp', 'trim|required|max_length[18]');
		$this->form_validation->set_rules('alamat', 'Alamat', 'trim|required|max_length[100]');
		$this->form_validation->set_rules('pengguna_image_name', 'Image', 'trim|required|max_length[30]');
		
		if ($this->form_validation->run()) {
			$pengguna_image_uuid = $this->input->post('pengguna_image_uuid');
			$pengguna_image_name = $this->input->post('pengguna_image_name');
		
			$save_data = [
				'nama' => $this->input->post('nama'),
				'telpon' => $this->input->post('telpon'),
				'no_bpjs' => $this->input->post('no_bpjs'),
				'email' => $this->input->post('email'),
				'no_ktp' => $this->input->post('no_ktp'),
				'alamat' => $this->input->post('alamat'),
			];

			if (!is_dir(FCPATH . '/uploads/pengguna/')) {
				mkdir(FCPATH . '/uploads/pengguna/');
			}

			if (!empty($pengguna_image_uuid)) {
				$pengguna_image_name_copy = date('YmdHis') . '-' . $pengguna_image_name;

				rename(FCPATH . 'uploads/tmp/' . $pengguna_image_uuid . '/' . $pengguna_image_name, 
						FCPATH . 'uploads/pengguna/' . $pengguna_image_name_copy);

				if (!is_file(FCPATH . '/uploads/pengguna/' . $pengguna_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['image'] = $pengguna_image_name_copy;
			}
		
			
			$save_pengguna = $this->model_pengguna->change($id, $save_data);

			if ($save_pengguna) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/pengguna', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/pengguna');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/pengguna');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Penggunas
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('pengguna_delete');

		$this->load->helper('file');

		$arr_id = $this->input->get('id');
		$remove = false;

		if (!empty($id)) {
			$remove = $this->_remove($id);
		} elseif (count($arr_id) >0) {
			foreach ($arr_id as $id) {
				$remove = $this->_remove($id);
			}
		}

		if ($remove) {
            set_message(cclang('has_been_deleted', 'pengguna'), 'success');
        } else {
            set_message(cclang('error_delete', 'pengguna'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Penggunas
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('pengguna_view');

		$this->data['pengguna'] = $this->model_pengguna->join_avaiable()->find($id);

		$this->template->title('Pengguna Detail');
		$this->render('backend/standart/administrator/pengguna/pengguna_view', $this->data);
	}
	
	/**
	* delete Penggunas
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$pengguna = $this->model_pengguna->find($id);

		if (!empty($pengguna->image)) {
			$path = FCPATH . '/uploads/pengguna/' . $pengguna->image;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_pengguna->remove($id);
	}
	
	/**
	* Upload Image Pengguna	* 
	* @return JSON
	*/
	public function upload_image_file()
	{
		if (!$this->is_allowed('pengguna_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'pengguna',
		]);
	}

	/**
	* Delete Image Pengguna	* 
	* @return JSON
	*/
	public function delete_image_file($uuid)
	{
		if (!$this->is_allowed('pengguna_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'image', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'pengguna',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/pengguna/'
        ]);
	}

	/**
	* Get Image Pengguna	* 
	* @return JSON
	*/
	public function get_image_file($id)
	{
		if (!$this->is_allowed('pengguna_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$pengguna = $this->model_pengguna->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'image', 
            'table_name'        => 'pengguna',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/pengguna/',
            'delete_endpoint'   => 'administrator/pengguna/delete_image_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('pengguna_export');

		$this->model_pengguna->export('pengguna', 'pengguna');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('pengguna_export');

		$this->model_pengguna->pdf('pengguna', 'pengguna');
	}
}


/* End of file pengguna.php */
/* Location: ./application/controllers/administrator/Pengguna.php */