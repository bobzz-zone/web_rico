<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Configuration Controller
*| --------------------------------------------------------------------------
*| Configuration site
*|
*/
class Configuration extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_configuration');
	}

	/**
	* show all Configurations
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('configuration_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['configurations'] = $this->model_configuration->get($filter, $field, $this->limit_page, $offset);
		$this->data['configuration_counts'] = $this->model_configuration->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/configuration/index/',
			'total_rows'   => $this->model_configuration->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Configuration List');
		$this->render('backend/standart/administrator/configuration/configuration_list', $this->data);
	}
	
	/**
	* Add new configurations
	*
	*/
	public function add()
	{
		$this->is_allowed('configuration_add');

		$this->template->title('Configuration New');
		$this->render('backend/standart/administrator/configuration/configuration_add', $this->data);
	}

	/**
	* Add New Configurations
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('configuration_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('bg_color', 'Bg Color', 'trim|required|max_length[10]');
		$this->form_validation->set_rules('configuration_banner_image_name', 'Banner Image', 'trim|required');
		$this->form_validation->set_rules('configuration_logo_name', 'Logo', 'trim|required');
		$this->form_validation->set_rules('bg_color_box_menu', 'Bg Color Box Menu', 'trim|required|max_length[10]');
		$this->form_validation->set_rules('bg_color_box_list', 'Bg Color Box List', 'trim|required|max_length[10]');
		

		if ($this->form_validation->run()) {
			$configuration_banner_image_uuid = $this->input->post('configuration_banner_image_uuid');
			$configuration_banner_image_name = $this->input->post('configuration_banner_image_name');
			$configuration_logo_uuid = $this->input->post('configuration_logo_uuid');
			$configuration_logo_name = $this->input->post('configuration_logo_name');
		
			$save_data = [
				'bg_color' => $this->input->post('bg_color'),
				'bg_color_box_menu' => $this->input->post('bg_color_box_menu'),
				'bg_color_box_list' => $this->input->post('bg_color_box_list'),
			];

			if (!is_dir(FCPATH . '/uploads/configuration/')) {
				mkdir(FCPATH . '/uploads/configuration/');
			}

			if (!empty($configuration_banner_image_name)) {
				$configuration_banner_image_name_copy = date('YmdHis') . '-' . $configuration_banner_image_name;

				rename(FCPATH . 'uploads/tmp/' . $configuration_banner_image_uuid . '/' . $configuration_banner_image_name, 
						FCPATH . 'uploads/configuration/' . $configuration_banner_image_name_copy);

				if (!is_file(FCPATH . '/uploads/configuration/' . $configuration_banner_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['banner_image'] = $configuration_banner_image_name_copy;
			}
		
			if (!empty($configuration_logo_name)) {
				$configuration_logo_name_copy = date('YmdHis') . '-' . $configuration_logo_name;

				rename(FCPATH . 'uploads/tmp/' . $configuration_logo_uuid . '/' . $configuration_logo_name, 
						FCPATH . 'uploads/configuration/' . $configuration_logo_name_copy);

				if (!is_file(FCPATH . '/uploads/configuration/' . $configuration_logo_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['logo'] = $configuration_logo_name_copy;
			}
		
			
			$save_configuration = $this->model_configuration->store($save_data);

			if ($save_configuration) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_configuration;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/configuration/edit/' . $save_configuration, 'Edit Configuration'),
						anchor('administrator/configuration', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/configuration/edit/' . $save_configuration, 'Edit Configuration')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/configuration');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/configuration');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Configurations
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('configuration_update');

		$this->data['configuration'] = $this->model_configuration->find($id);

		$this->template->title('Configuration Update');
		$this->render('backend/standart/administrator/configuration/configuration_update', $this->data);
	}

	/**
	* Update Configurations
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('configuration_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('bg_color', 'Bg Color', 'trim|required|max_length[10]');
		$this->form_validation->set_rules('configuration_banner_image_name', 'Banner Image', 'trim|required');
		$this->form_validation->set_rules('configuration_logo_name', 'Logo', 'trim|required');
		$this->form_validation->set_rules('bg_color_box_menu', 'Bg Color Box Menu', 'trim|required|max_length[10]');
		$this->form_validation->set_rules('bg_color_box_list', 'Bg Color Box List', 'trim|required|max_length[10]');
		
		if ($this->form_validation->run()) {
			$configuration_banner_image_uuid = $this->input->post('configuration_banner_image_uuid');
			$configuration_banner_image_name = $this->input->post('configuration_banner_image_name');
			$configuration_logo_uuid = $this->input->post('configuration_logo_uuid');
			$configuration_logo_name = $this->input->post('configuration_logo_name');
		
			$save_data = [
				'bg_color' => $this->input->post('bg_color'),
				'bg_color_box_menu' => $this->input->post('bg_color_box_menu'),
				'bg_color_box_list' => $this->input->post('bg_color_box_list'),
			];

			if (!is_dir(FCPATH . '/uploads/configuration/')) {
				mkdir(FCPATH . '/uploads/configuration/');
			}

			if (!empty($configuration_banner_image_uuid)) {
				$configuration_banner_image_name_copy = date('YmdHis') . '-' . $configuration_banner_image_name;

				rename(FCPATH . 'uploads/tmp/' . $configuration_banner_image_uuid . '/' . $configuration_banner_image_name, 
						FCPATH . 'uploads/configuration/' . $configuration_banner_image_name_copy);

				if (!is_file(FCPATH . '/uploads/configuration/' . $configuration_banner_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['banner_image'] = $configuration_banner_image_name_copy;
			}
		
			if (!empty($configuration_logo_uuid)) {
				$configuration_logo_name_copy = date('YmdHis') . '-' . $configuration_logo_name;

				rename(FCPATH . 'uploads/tmp/' . $configuration_logo_uuid . '/' . $configuration_logo_name, 
						FCPATH . 'uploads/configuration/' . $configuration_logo_name_copy);

				if (!is_file(FCPATH . '/uploads/configuration/' . $configuration_logo_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['logo'] = $configuration_logo_name_copy;
			}
		
			
			$save_configuration = $this->model_configuration->change($id, $save_data);

			if ($save_configuration) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/configuration', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/configuration');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/configuration');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Configurations
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('configuration_delete');

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
            set_message(cclang('has_been_deleted', 'configuration'), 'success');
        } else {
            set_message(cclang('error_delete', 'configuration'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Configurations
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('configuration_view');

		$this->data['configuration'] = $this->model_configuration->join_avaiable()->find($id);

		$this->template->title('Configuration Detail');
		$this->render('backend/standart/administrator/configuration/configuration_view', $this->data);
	}
	
	/**
	* delete Configurations
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$configuration = $this->model_configuration->find($id);

		if (!empty($configuration->banner_image)) {
			$path = FCPATH . '/uploads/configuration/' . $configuration->banner_image;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		if (!empty($configuration->logo)) {
			$path = FCPATH . '/uploads/configuration/' . $configuration->logo;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_configuration->remove($id);
	}
	
	/**
	* Upload Image Configuration	* 
	* @return JSON
	*/
	public function upload_banner_image_file()
	{
		if (!$this->is_allowed('configuration_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'configuration',
		]);
	}

	/**
	* Delete Image Configuration	* 
	* @return JSON
	*/
	public function delete_banner_image_file($uuid)
	{
		if (!$this->is_allowed('configuration_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'banner_image', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'configuration',
            'primary_key'       => 'id_configuration',
            'upload_path'       => 'uploads/configuration/'
        ]);
	}

	/**
	* Get Image Configuration	* 
	* @return JSON
	*/
	public function get_banner_image_file($id)
	{
		if (!$this->is_allowed('configuration_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$configuration = $this->model_configuration->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'banner_image', 
            'table_name'        => 'configuration',
            'primary_key'       => 'id_configuration',
            'upload_path'       => 'uploads/configuration/',
            'delete_endpoint'   => 'administrator/configuration/delete_banner_image_file'
        ]);
	}
	
	/**
	* Upload Image Configuration	* 
	* @return JSON
	*/
	public function upload_logo_file()
	{
		if (!$this->is_allowed('configuration_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'configuration',
		]);
	}

	/**
	* Delete Image Configuration	* 
	* @return JSON
	*/
	public function delete_logo_file($uuid)
	{
		if (!$this->is_allowed('configuration_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'logo', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'configuration',
            'primary_key'       => 'id_configuration',
            'upload_path'       => 'uploads/configuration/'
        ]);
	}

	/**
	* Get Image Configuration	* 
	* @return JSON
	*/
	public function get_logo_file($id)
	{
		if (!$this->is_allowed('configuration_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$configuration = $this->model_configuration->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'logo', 
            'table_name'        => 'configuration',
            'primary_key'       => 'id_configuration',
            'upload_path'       => 'uploads/configuration/',
            'delete_endpoint'   => 'administrator/configuration/delete_logo_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('configuration_export');

		$this->model_configuration->export('configuration', 'configuration');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('configuration_export');

		$this->model_configuration->pdf('configuration', 'configuration');
	}
}


/* End of file configuration.php */
/* Location: ./application/controllers/administrator/Configuration.php */