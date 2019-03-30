<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| M Ads Controller
*| --------------------------------------------------------------------------
*| M Ads site
*|
*/
class M_ads extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_m_ads');
	}

	/**
	* show all M Adss
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('m_ads_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['m_adss'] = $this->model_m_ads->get($filter, $field, $this->limit_page, $offset);
		$this->data['m_ads_counts'] = $this->model_m_ads->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/m_ads/index/',
			'total_rows'   => $this->model_m_ads->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Ads List');
		$this->render('backend/standart/administrator/m_ads/m_ads_list', $this->data);
	}
	
	/**
	* Add new m_adss
	*
	*/
	public function add()
	{
		$this->is_allowed('m_ads_add');

		$this->template->title('Ads New');
		$this->render('backend/standart/administrator/m_ads/m_ads_add', $this->data);
	}

	/**
	* Add New M Adss
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('m_ads_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('nama_ads', 'Nama Ads', 'trim|required|max_length[100]');
		$this->form_validation->set_rules('m_ads_foto_name', 'Foto', 'trim|required');
		$this->form_validation->set_rules('url', 'Url', 'trim|required');
		$this->form_validation->set_rules('posisi', 'Posisi', 'trim|required');
		

		if ($this->form_validation->run()) {
			$m_ads_foto_uuid = $this->input->post('m_ads_foto_uuid');
			$m_ads_foto_name = $this->input->post('m_ads_foto_name');
		
			$save_data = [
				'nama_ads' => $this->input->post('nama_ads'),
				'url' => $this->input->post('url'),
				'posisi' => $this->input->post('posisi'),
			];

			if (!is_dir(FCPATH . '/uploads/m_ads/')) {
				mkdir(FCPATH . '/uploads/m_ads/');
			}

			if (!empty($m_ads_foto_name)) {
				$m_ads_foto_name_copy = date('YmdHis') . '-' . $m_ads_foto_name;

				rename(FCPATH . 'uploads/tmp/' . $m_ads_foto_uuid . '/' . $m_ads_foto_name, 
						FCPATH . 'uploads/m_ads/' . $m_ads_foto_name_copy);

				if (!is_file(FCPATH . '/uploads/m_ads/' . $m_ads_foto_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['foto'] = $m_ads_foto_name_copy;
			}
		
			
			$save_m_ads = $this->model_m_ads->store($save_data);

			if ($save_m_ads) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_m_ads;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/m_ads/edit/' . $save_m_ads, 'Edit M Ads'),
						anchor('administrator/m_ads', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/m_ads/edit/' . $save_m_ads, 'Edit M Ads')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/m_ads');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/m_ads');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view M Adss
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('m_ads_update');

		$this->data['m_ads'] = $this->model_m_ads->find($id);

		$this->template->title('Ads Update');
		$this->render('backend/standart/administrator/m_ads/m_ads_update', $this->data);
	}

	/**
	* Update M Adss
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('m_ads_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('nama_ads', 'Nama Ads', 'trim|required|max_length[100]');
		$this->form_validation->set_rules('m_ads_foto_name', 'Foto', 'trim|required');
		$this->form_validation->set_rules('url', 'Url', 'trim|required');
		$this->form_validation->set_rules('posisi', 'Posisi', 'trim|required');
		
		if ($this->form_validation->run()) {
			$m_ads_foto_uuid = $this->input->post('m_ads_foto_uuid');
			$m_ads_foto_name = $this->input->post('m_ads_foto_name');
		
			$save_data = [
				'nama_ads' => $this->input->post('nama_ads'),
				'url' => $this->input->post('url'),
				'posisi' => $this->input->post('posisi'),
			];

			if (!is_dir(FCPATH . '/uploads/m_ads/')) {
				mkdir(FCPATH . '/uploads/m_ads/');
			}

			if (!empty($m_ads_foto_uuid)) {
				$m_ads_foto_name_copy = date('YmdHis') . '-' . $m_ads_foto_name;

				rename(FCPATH . 'uploads/tmp/' . $m_ads_foto_uuid . '/' . $m_ads_foto_name, 
						FCPATH . 'uploads/m_ads/' . $m_ads_foto_name_copy);

				if (!is_file(FCPATH . '/uploads/m_ads/' . $m_ads_foto_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['foto'] = $m_ads_foto_name_copy;
			}
		
			
			$save_m_ads = $this->model_m_ads->change($id, $save_data);

			if ($save_m_ads) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/m_ads', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/m_ads');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/m_ads');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete M Adss
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('m_ads_delete');

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
            set_message(cclang('has_been_deleted', 'm_ads'), 'success');
        } else {
            set_message(cclang('error_delete', 'm_ads'), 'error');
        }

		redirect_back();
	}

		/**
	* View view M Adss
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('m_ads_view');

		$this->data['m_ads'] = $this->model_m_ads->join_avaiable()->find($id);

		$this->template->title('Ads Detail');
		$this->render('backend/standart/administrator/m_ads/m_ads_view', $this->data);
	}
	
	/**
	* delete M Adss
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$m_ads = $this->model_m_ads->find($id);

		if (!empty($m_ads->foto)) {
			$path = FCPATH . '/uploads/m_ads/' . $m_ads->foto;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_m_ads->remove($id);
	}
	
	/**
	* Upload Image M Ads	* 
	* @return JSON
	*/
	public function upload_foto_file()
	{
		if (!$this->is_allowed('m_ads_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'm_ads',
		]);
	}

	/**
	* Delete Image M Ads	* 
	* @return JSON
	*/
	public function delete_foto_file($uuid)
	{
		if (!$this->is_allowed('m_ads_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'foto', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'm_ads',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/m_ads/'
        ]);
	}

	/**
	* Get Image M Ads	* 
	* @return JSON
	*/
	public function get_foto_file($id)
	{
		if (!$this->is_allowed('m_ads_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$m_ads = $this->model_m_ads->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'foto', 
            'table_name'        => 'm_ads',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/m_ads/',
            'delete_endpoint'   => 'administrator/m_ads/delete_foto_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('m_ads_export');

		$this->model_m_ads->export('m_ads', 'm_ads');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('m_ads_export');

		$this->model_m_ads->pdf('m_ads', 'm_ads');
	}
}


/* End of file m_ads.php */
/* Location: ./application/controllers/administrator/M Ads.php */