<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| M Keyword Controller
*| --------------------------------------------------------------------------
*| M Keyword site
*|
*/
class M_keyword extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_m_keyword');
	}

	/**
	* show all M Keywords
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('m_keyword_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['m_keywords'] = $this->model_m_keyword->get($filter, $field, $this->limit_page, $offset);
		$this->data['m_keyword_counts'] = $this->model_m_keyword->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/m_keyword/index/',
			'total_rows'   => $this->model_m_keyword->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Keyword List');
		$this->render('backend/standart/administrator/m_keyword/m_keyword_list', $this->data);
	}
	
	/**
	* Add new m_keywords
	*
	*/
	public function add()
	{
		$this->is_allowed('m_keyword_add');

		$this->template->title('Keyword New');
		$this->render('backend/standart/administrator/m_keyword/m_keyword_add', $this->data);
	}

	/**
	* Add New M Keywords
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('m_keyword_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('keyword', 'Keyword', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('urutan', 'Urutan', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'keyword' => $this->input->post('keyword'),
				'urutan' => $this->input->post('urutan'),
			];

			
			$save_m_keyword = $this->model_m_keyword->store($save_data);

			if ($save_m_keyword) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_m_keyword;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/m_keyword/edit/' . $save_m_keyword, 'Edit M Keyword'),
						anchor('administrator/m_keyword', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/m_keyword/edit/' . $save_m_keyword, 'Edit M Keyword')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/m_keyword');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/m_keyword');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view M Keywords
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('m_keyword_update');

		$this->data['m_keyword'] = $this->model_m_keyword->find($id);

		$this->template->title('Keyword Update');
		$this->render('backend/standart/administrator/m_keyword/m_keyword_update', $this->data);
	}

	/**
	* Update M Keywords
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('m_keyword_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('keyword', 'Keyword', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('urutan', 'Urutan', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'keyword' => $this->input->post('keyword'),
				'urutan' => $this->input->post('urutan'),
			];

			
			$save_m_keyword = $this->model_m_keyword->change($id, $save_data);

			if ($save_m_keyword) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/m_keyword', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/m_keyword');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/m_keyword');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete M Keywords
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('m_keyword_delete');

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
            set_message(cclang('has_been_deleted', 'm_keyword'), 'success');
        } else {
            set_message(cclang('error_delete', 'm_keyword'), 'error');
        }

		redirect_back();
	}

		/**
	* View view M Keywords
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('m_keyword_view');

		$this->data['m_keyword'] = $this->model_m_keyword->join_avaiable()->find($id);

		$this->template->title('Keyword Detail');
		$this->render('backend/standart/administrator/m_keyword/m_keyword_view', $this->data);
	}
	
	/**
	* delete M Keywords
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$m_keyword = $this->model_m_keyword->find($id);

		
		
		return $this->model_m_keyword->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('m_keyword_export');

		$this->model_m_keyword->export('m_keyword', 'm_keyword');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('m_keyword_export');

		$this->model_m_keyword->pdf('m_keyword', 'm_keyword');
	}
}


/* End of file m_keyword.php */
/* Location: ./application/controllers/administrator/M Keyword.php */