<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Rangking Controller
*| --------------------------------------------------------------------------
*| Rangking site
*|
*/
class Rangking extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_rangking');
	}

	/**
	* show all Rangkings
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('rangking_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['rangkings'] = $this->model_rangking->get($filter, $field, $this->limit_page, $offset);
		$this->data['rangking_counts'] = $this->model_rangking->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/rangking/index/',
			'total_rows'   => $this->model_rangking->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Rangking List');
		$this->render('backend/standart/administrator/rangking/rangking_list', $this->data);
	}
	
	/**
	* Add new rangkings
	*
	*/
	public function add()
	{
		$this->is_allowed('rangking_add');

		$this->template->title('Rangking New');
		$this->render('backend/standart/administrator/rangking/rangking_add', $this->data);
	}

	/**
	* Add New Rangkings
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('rangking_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('id_keyword', 'Keyword', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('rank', 'Rank', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('website', 'Website', 'trim|required');
		$this->form_validation->set_rules('rating', 'Rating', 'trim|required');
		$this->form_validation->set_rules('viewer', 'Viewer', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'id_keyword' => $this->input->post('id_keyword'),
				'rank' => $this->input->post('rank'),
				'website' => $this->input->post('website'),
				'rating' => $this->input->post('rating'),
				'viewer' => $this->input->post('viewer'),
			];

			
			$save_rangking = $this->model_rangking->store($save_data);

			if ($save_rangking) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_rangking;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/rangking/edit/' . $save_rangking, 'Edit Rangking'),
						anchor('administrator/rangking', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/rangking/edit/' . $save_rangking, 'Edit Rangking')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/rangking');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/rangking');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Rangkings
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('rangking_update');

		$this->data['rangking'] = $this->model_rangking->find($id);

		$this->template->title('Rangking Update');
		$this->render('backend/standart/administrator/rangking/rangking_update', $this->data);
	}

	/**
	* Update Rangkings
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('rangking_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('id_keyword', 'Keyword', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('rank', 'Rank', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('website', 'Website', 'trim|required');
		$this->form_validation->set_rules('rating', 'Rating', 'trim|required');
		$this->form_validation->set_rules('viewer', 'Viewer', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'id_keyword' => $this->input->post('id_keyword'),
				'rank' => $this->input->post('rank'),
				'website' => $this->input->post('website'),
				'rating' => $this->input->post('rating'),
				'viewer' => $this->input->post('viewer'),
			];

			
			$save_rangking = $this->model_rangking->change($id, $save_data);

			if ($save_rangking) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/rangking', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/rangking');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/rangking');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Rangkings
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('rangking_delete');

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
            set_message(cclang('has_been_deleted', 'rangking'), 'success');
        } else {
            set_message(cclang('error_delete', 'rangking'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Rangkings
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('rangking_view');

		$this->data['rangking'] = $this->model_rangking->join_avaiable()->find($id);

		$this->template->title('Rangking Detail');
		$this->render('backend/standart/administrator/rangking/rangking_view', $this->data);
	}
	
	/**
	* delete Rangkings
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$rangking = $this->model_rangking->find($id);

		
		
		return $this->model_rangking->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('rangking_export');

		$this->model_rangking->export('rangking', 'rangking');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('rangking_export');

		$this->model_rangking->pdf('rangking', 'rangking');
	}

	/**
	* Editable rangkings
	*
	*/
	public function editable()
	{
		//$this->is_allowed('rangking_editable');

		$this->template->title('Rangking Editable');
		$this->render('backend/standart/administrator/rangking/rangking_editable', $this->data);
	}

	public function load_data_editable()
	{
		$id_keyword = $this->input->post('id_keyword');

		$get_data = $this->model_rangking->get_data_editable($id_keyword)->result_array();

		$return = array('code' => '1','msg' => 'OK', 'list_data' => $get_data);
      	echo json_encode($return);
	}

	/**
	* Add New Rangkings
	*
	* @return JSON
	*/
	public function editable_save()
	{
		$tampung = $this->input->post();

		$id_rank = $this->input->post('id_rank');
		$rank = $this->input->post('rank');
		$website = $this->input->post('website');
		$rating = $this->input->post('rating');
		$viewer = $this->input->post('viewer');
    	for($i = 0;$i < count($id_rank);$i++){

    		$data_update = array();

    		$data_update['rank'] = $rank[$i];
    		$data_update['website'] = $website[$i];
    		$data_update['rating'] = $rating[$i];
    		$data_update['viewer'] = $viewer[$i];

    		$this->db->where('id',$id_rank[$i]);
    		$this->db->update('rangking',$data_update);

    	}

		// echo json_encode($id_rank);
		// return false;
		
		// $save_data = [
		// 	'id_keyword' => $this->input->post('id_keyword'),
		// 	'rank' => $this->input->post('rank'),
		// 	'website' => $this->input->post('website'),
		// 	'rating' => $this->input->post('rating'),
		// 	'viewer' => $this->input->post('viewer'),
		// ];

		
		// $save_rangking = $this->model_rangking->store($save_data);

		if ($this->input->post('save_type') == 'stay') {
			$this->data['success'] = true;
			$this->data['id'] 	   = "1";
			$this->data['message'] = cclang('success_save_data_stay', [
				anchor('administrator/rangking/editable/', 'Editable Rangking'),
				anchor('administrator/rangking', ' Go back to list')
			]);
		} else {
			set_message(
				cclang('success_save_data_redirect', [
				anchor('administrator/rangking/editable/', 'Editable Rangking')
			]), 'success');

    		$this->data['success'] = true;
			$this->data['redirect'] = base_url('administrator/rangking');
		}


		echo json_encode($this->data);
	}

}


/* End of file rangking.php */
/* Location: ./application/controllers/administrator/Rangking.php */