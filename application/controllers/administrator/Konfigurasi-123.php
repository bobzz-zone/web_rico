<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Konfigurasi Controller
*| --------------------------------------------------------------------------
*| Konfigurasi site
*|
*/
class Konfigurasi extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_konfigurasi');
	}

	/**
	* show all Konfigurasis
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('konfigurasi_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['konfigurasis'] = $this->model_konfigurasi->get($filter, $field, $this->limit_page, $offset);
		$this->data['konfigurasi_counts'] = $this->model_konfigurasi->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/konfigurasi/index/',
			'total_rows'   => $this->model_konfigurasi->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Konfigurasi List');
		$this->render('backend/standart/administrator/konfigurasi/konfigurasi_list', $this->data);
	}
	
	
		/**
	* Update view Konfigurasis
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('konfigurasi_update');

		$this->data['konfigurasi'] = $this->model_konfigurasi->find($id);

		$this->template->title('Konfigurasi Update');
		$this->render('backend/standart/administrator/konfigurasi/konfigurasi_update', $this->data);
	}

	/**
	* Update Konfigurasis
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('konfigurasi_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('komentar', 'Atribut', 'trim|required');
		$this->form_validation->set_rules('nilai_atribut', 'Nilai', 'trim|required|max_length[50]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'komentar' => $this->input->post('komentar'),
				'nilai_atribut' => $this->input->post('nilai_atribut'),
			];

			
			$save_konfigurasi = $this->model_konfigurasi->change($id, $save_data);

			if ($save_konfigurasi) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/konfigurasi', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/konfigurasi');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/konfigurasi');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Konfigurasis
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('konfigurasi_delete');

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
            set_message(cclang('has_been_deleted', 'konfigurasi'), 'success');
        } else {
            set_message(cclang('error_delete', 'konfigurasi'), 'error');
        }

		redirect_back();
	}

	
	/**
	* delete Konfigurasis
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$konfigurasi = $this->model_konfigurasi->find($id);

		
		
		return $this->model_konfigurasi->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('konfigurasi_export');

		$this->model_konfigurasi->export('konfigurasi', 'konfigurasi');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('konfigurasi_export');

		$this->model_konfigurasi->pdf('konfigurasi', 'konfigurasi');
	}
}


/* End of file konfigurasi.php */
/* Location: ./application/controllers/administrator/Konfigurasi.php */