<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Fungsi
{
	protected $CI;
	/** COnstruktor */

	function __construct()
	{
		$this->CI =& get_instance();
	}

	/* cek Apakah user sudah verified */
	function is_verified_user($id)
	{
    $cek = $this->CI->db->get_where('pengguna',array('id' => $id, 'deleted' => '1'));
		return $cek->num_rows() > 0 ? TRUE : FALSE;
	}

	/* generate random number and string */
	function random_sring($length = 10) {
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
	}

	function random_sring_num($length = 6) {
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
	}

	function random_pass($length = 8) {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ._,@';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
	}


	function insert_err_log($msg){

		$in_log = array(
			'access_at' => date('Y-m-d H:i:s'),
			'detail' => $msg,
		);
		$this->db->insert('x_err_log',$in_log);

	}

	/* image handling */
	// FILE_UPLOAD
   function _img_thumb($src, $width = '400', $height = '400')
   {
       $this->CI->load->library('image_lib');
       ini_set("memory_limit", "-1");

       $config1['image_library']  = 'gd2';
       $config1['create_thumb']   = TRUE;
       $config1['maintain_ratio'] = TRUE;
       $config1['width']          = $width;
       $config1['height']         = $height;
       $config1['source_image']   = $src;

       $this->CI->image_lib->initialize($config1);
       $this->CI->image_lib->resize();
       $this->CI->image_lib->clear();
   }
	 //image optimization
	function _img_optimization($source, $destination, $quality)
   {

	  $info = getimagesize($source);
	  if ($info['mime'] == 'image/jpeg'){
			$image = imagecreatefromjpeg($source);
			imagejpeg($image, $destination, $quality);
		}elseif ($info['mime'] == 'image/gif'){
			$image = imagecreatefromgif($source);
			imagegif($image, $destination, $quality);
		}elseif ($info['mime'] == 'image/png'){
			$image = imagecreatefrompng($source);
			imagepng($image, $destination);
		}


  	return $destination;

   }

  function _img_resize($src, $width = '730', $height = '1100')
  {
       $this->CI->load->library('image_lib');
       ini_set("memory_limit", "-1");

       $config2['image_library']  = 'gd2';
       $config2['create_thumb']   = FALSE;
       $config2['maintain_ratio'] = FALSE;
       $config2['width']          = $width;
       $config2['height']         = $height;
       $config2['source_image']   = $src;

       $this->CI->image_lib->initialize($config2);
       $this->CI->image_lib->resize();
       $this->CI->image_lib->clear();
   }

	 function cek_ongkir($vendor,$orig,$orig_type,$dest,$dest_type,$weight){
		 $url_api = 'https://pro.rajaongkir.com/api/cost';
		 $key_api = "73e84c446a6adad4d878f7e45d61ce06";
		 $bodyReq = array(
			 								'origin' 					=> $orig,
											'originType' 			=> $orig_type,
											'destination' 		=> $dest,
											'destinationType' => $dest_type,
											'weight'					=> $weight,
											'courier'					=> strtolower($vendor)
		 									);

		 $curl = curl_init();
			curl_setopt_array($curl, array(
			  CURLOPT_URL => $url_api,
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_CUSTOMREQUEST => "POST",
			  CURLOPT_POSTFIELDS => http_build_query($bodyReq),
			  CURLOPT_HTTPHEADER => array(
			    "key: ".$key_api,
			    "Content-Type: application/x-www-form-urlencoded"
			  ),
			));

			$response = curl_exec($curl);
			$err = curl_error($curl);

			curl_close($curl);

			if ($err) {
			  return "cURL Error #:" . $err;
			} else {
			  return $response;
			}

	 }

	 function _operasi_saldo($id_user,$nominal,$tipe = 'tambah'){
		 $curr_saldo = $this->CI->db->select('id,saldo')->get_where('pengguna',array('id' => $id_user,'deleted' => '1'))->row_array();
		 if($tipe == 'kurang'){
			 if(intval($curr_saldo['saldo']) >= $nominal){

				 //$this->CI->db->query("UPDATE pengguna SET saldo = 'saldo' - $nominal WHERE id = '$id_user' ");
				 $saldo_akhir = intval($curr_saldo['saldo']) - intval($nominal);
				 $this->CI->db->where('id',$id_user);
				 $this->CI->db->update('pengguna', array('saldo' => $saldo_akhir));
				 $return = array(
					 								'code' => 1,
													'message' => 'saldo dikurangi',
													'nominal' => $nominal,
													'total_awal' => $curr_saldo['saldo'],
													'total_akhir' => $saldo_akhir,
												);
			 }else{
				 $return = array('code' => 0, 'message' => 'saldo tidak cukup');
			 }
		 }else{
			 //$this->CI->db->query("UPDATE pengguna SET saldo = 'saldo' + $nominal WHERE id = '$id_user' ");
			 $saldo_akhir = intval($curr_saldo['saldo']) + intval($nominal);
			 $this->CI->db->where('id',$id_user);
			 $this->CI->db->update('pengguna', array('saldo' => $saldo_akhir));
			 $return = array(
				 								'code' => 1,
												'message' => 'saldo ditambahkan',
												'nominal' => $nominal,
												'total_awal' => $curr_saldo['saldo'],
												'total_akhir' => $saldo_akhir
											);
		 }

		 return $return;
	 }

	 function logged_saldo($data){
		 $this->CI->db->insert('history_saldo',$data);
		 $insert_id = $this->CI->db->insert_id();
		 return $insert_id;
	 }

	 function _kode_unik($tipe){
		 //1 -> jual beli, 2 lelang, 3 deposit, 4 request vip, 5 request promote

		 $angka_unik = 1;
		 if ($tipe == 1) {
			 $angka_unik = 101;
		 }elseif ($tipe == 2) {
			 $angka_unik = 303;
		 }elseif ($tipe == 3) {
		 	# code...
			$angka_unik = 403;
		}elseif ($tipe == 4) {
			# code...
			$angka_unik = 502;
		}elseif($tipe == 5){
			$angka_unik = 209;
		}
		return $angka_unik;
	 }

	 function logged_trx($data){
		 $this->CI->db->insert('transaksi_log',$data);
		 $insert_id = $this->CI->db->insert_id();
		 return $insert_id;
	 }

	 function _pendapatan($data){
		 $this->CI->db->insert('pendapatan',$data);
		 $insert_id = $this->CI->db->insert_id();
		 return $insert_id;
	 }

	 function xTimeAgo ($oldTime, $newTime) {
		$timeCalc = strtotime($newTime) - strtotime($oldTime);

		if ($timeCalc > (60*60*24)) {$timeCalc = round($timeCalc/60/60/24) . " days ago ";}
		else if ($timeCalc > (60*60)) {$timeCalc = round($timeCalc/60/60) . " hours ago";}
		else if ($timeCalc > 60) {$timeCalc = round($timeCalc/60) . " minutes ago";}
		else if ($timeCalc > 0) {$timeCalc .= " seconds ago";}

			return $timeCalc;
		}

		function rate_pengguna($user_id,$tipe){
			$this->CI->db->select('sum(bintang) as total_bintang')
									 ->from('rating_pengguna')
									 ->where('id_pengguna',$user_id)
									 ->where('tipe',$tipe);
			$total = $this->CI->db->get()->row()->total_bintang;
			$jumlah_rater = $this->CI->db->select('id')
																	 ->get_where('rating_pengguna',array('id_pengguna' => $user_id, 'tipe' => $tipe))
																	 ->num_rows();
			$rata2 = floatval($total) / intval($jumlah_rater);
			$cols = 'rating';
			if($tipe == '2'){
				$cols = 'buyer_rating';
			}
			$this->CI->db->where('id',$user_id);
			$this->CI->db->update('pengguna',array($cols => $rata2));
		}

		function _send_email($email_to,$subject_to,$message_to){
			//define("EMAIL_ASAL", "");
			//define("EMAIL_PASSWORD", "siakadp0lt3k0m");
			$config = Array(
            //jika di upload ke ada 3 yang di komen. /dev
            'protocol' => 'smtp',
            'smtp_host' => 'ssl://smtp.googlemail.com',
            'smtp_port' => 465,
            'smtp_user' => 'siakad.poltekom@gmail.com', // change it to yours
            'smtp_pass' => 'siakadp0lt3k0m', // change it to yours
            'mailtype' => 'html',
            'charset' => 'iso-8859-1',
            'wordwrap' => TRUE
            );
            $this->CI->load->library('email', $config);
            $this->CI->email->set_newline("\r\n");
            $this->CI->email->from("","ANTRIAN"); // change it to yours
            $this->CI->email->to($email_to); // change it to yours
            $this->CI->email->subject($subject_to);
            $this->CI->email->message($message_to);
            if($this->CI->email->send())
            {

            }
            else
            {
              show_error($this->email->print_debugger());
            }
		}
		
		
		public function send_sms($hp,$isi){


        if(substr( $hp, 0, 2 ) === "08" || substr( $hp, 0, 4 ) === "+628"  ||  substr( $hp, 0, 3 ) === "628" || 1  == 1){
            //echo "yayayay".$isi.$hp;
            $final_isi = "";

            $isi_ar = explode(" ", $isi);

            for($i=0;$i<count($isi_ar);$i++){

                $final_isi = $final_isi .urlencode($isi_ar[$i]." ");
            }



                $userkey = "lkf0ja"; //userkey lihat di zenziva
                $passkey = "smsaptikma"; // set passkey di zenziva
                //$message = "Terima Kasih, pendaftaran atas nama $nama telah berhasil di websiteAnda.com. Silahkan baca dan download petunjuk selanjutnya. Harap Maklum";
                $url = "https://reguler.zenziva.net/apps/smsapi.php";
                //$url = "https://localhost";
                $curlHandle = curl_init();
                curl_setopt($curlHandle, CURLOPT_URL, $url);
                curl_setopt($curlHandle, CURLOPT_POSTFIELDS, 'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$hp.'&pesan='.urlencode($isi));
                curl_setopt($curlHandle, CURLOPT_HEADER, 0);
                curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
                curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
                curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
                curl_setopt($curlHandle, CURLOPT_POST, 1);
                $results = curl_exec($curlHandle);
                curl_close($curlHandle);
                return $results;
        }else{
            return "tidak";
        }
    }


}
