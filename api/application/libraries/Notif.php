<?php if(!defined('BASEPATH'))exit('No direct script acces allowed');

class Notif
{
	protected $CI;
	/** COnstruktor */

	function __construct()
	{
		$this->CI =& get_instance();
	}


  function _send_notif($id,$jenis,$param){
    /*
			$jenis = 1. transaksi,2.lelang menang, 3.req vip, 4. req promote,
							 5. penawaran lelang, 6. ?, 7. komentar item
							 8. share item, 9.review item, 10. like item, 11, favorite item,
							 12. chat, 13. balasan komentar, 14. konfirmasi pembayaran, 15. deposit
							 16. withdrawal
		*/
    $arr_table = array(
                        '1' => array(
                                      'cols'  => 'id,kode,tipe,id_pembeli,id_penjual,progres',
                                      'tbl'   => 'transaksi',
                                      'p_key' => 'id',
                                    ),
												'2' => array(
																			'cols' => 'id,nama,kode_item,foto,id_pengguna,pemenang,harga_tertinggi,waktu_habis,checkout',
																			'tbl'  => 'm_item',
																			'p_key' => 'id'
																		),
                        '3' => array(
                                      'cols' => 'id_request,type,id_pengguna,nominal,action,action_by,tanggal_action,keterangan',
                                      'tbl'  => 'request_vip',
                                      'p_key' => 'id_request'
                                      ),
                        '4' => array(
                                      'cols' => 'id_request,type,id_pengguna,list_item,list_approved,nominal,action,action_by,tanggal_action,keterangan',
                                      'tbl'  => 'request_promote',
                                      'p_key' => 'id_request'
                                      ),
												'14' => array(
																			'cols' => 'id,id_transaksi,jenis_transaksi,nominal,tanggal,status',
																			'tbl'	 => 'konfirmasi_pembayaran',
																			'p_key' => 'id'
																		),
												'15' => array(
																			'cols' => 'id,id_customer,nominal_approve,nominal,tanggal,tanggal_approve,status,id_admin',
																			'tbl'	 => 'deposit',
																			'p_key' => 'id'
																		),
												'16' => array(
																			'cols' => 'id,id_customer,nominal_approve,nominal,tanggal_approve,status,id_admin',
																			'tbl'	 => 'withdrawal',
																			'p_key' => 'id'
																			)
                      );
    $get_query = $this->CI->db->select($arr_table[$jenis]['cols'])
                         ->from($arr_table[$jenis]['tbl'])
                         ->where($arr_table[$jenis]['p_key'],$param)
												 ->get();
    $get_data = $get_query;
		$notif = array();
    if($get_data->num_rows() > 0){
      $row_data = $get_data->row_array();
      if($jenis == '1'){
        /* untuk pembeli */
				$progres = $row_data['progres'];
				$pesan_pbeli = 'Transaksi baru #'.$row_data['kode'];
				$pesan_pjual = 'Transaksi baru #'.$row_data['kode'].', mohon mengisikan ongkos kirim';
				$pesan_padm	 = 'Transaksi baru #'.$row_data['kode'];
				if($progres == '2'){
					$pesan_pbeli = 'Silahkan lakukan pembayaran untuk transaksi #'.$row_data['kode'];
					$pesan_pjual = 'Menunggu pembayaran transaksi #'.$row_data['kode'];
				}elseif($progres == '3'){
					$pesan_pbeli = 'Konfirmasi pembayaran #'.$row_data['kode'].' diterima, menunggu verifikasi admin';
					$pesan_pjual = 'Konfirmasi pembayaran #'.$row_data['kode'].' diterima, menunggu verifikasi admin';
					$pesan_padm  = 'Konfirmasi pembayaran #'.$row_data['kode'].' silahkan lakukan verifikasi';
				}elseif($progres == '4'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' telah dibayar, penjual mempersiapkan barang';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' lunas, silahkan proses pengiriman';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' lunas, barang dalam proses pengiriman';
				}elseif($progres == '5'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' penjual sudah memproses pengiriman';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].', silahkan mengirim barang';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].', barang diproses kirim oleh penjual';
				}elseif($progres == '6'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' barang dalam pengiriman';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' terima kasih, mohon menunggu barang anda sampai';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' menunggu barang sampai';
				}elseif($progres == '7'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' silahkan cek barang anda';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' barang telah diterima oleh pembeli';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' barang diterima pembeli, menunggu pengecekan';
				}elseif($progres == '8'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' terima kasih';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' barang diterima dengan baik oleh pembeli';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' barang telah diterima baik oleh pembeli';
				}elseif($progres == '9'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' selesai, terima kasih';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' selesai, terima kasih';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' selesai';
				}elseif($progres == '20'){
					$pesan_pbeli = 'Transaksi #'.$row_data['kode'].' dalam sengketa, silahkan lakukan mediasi dengan penjual';
					$pesan_pjual = 'Transaksi #'.$row_data['kode'].' dalam sengketa, silahkan lakukan mediasi dengan pembeli';
					$pesan_padm  = 'Transaksi #'.$row_data['kode'].' dalam sengketa, silahkan ambil tindakan';
				}

        $url      = 'transaksi/notif/test';
        $penerima = $row_data['id_pembeli'];
        $notif[]  = array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli , 'ref' => $id);
        /* untuk penjual */
        $url      = 'transaksi/notif/test';
        $penerima = $row_data['id_penjual'];
        $notif[]  = array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pjual, 'ref' => $id);
				/* untuk admin */

      }elseif($jenis == '2'){
				/* menang bid */
				/* untuk pemenang */
				$url 			= 'lelang/notif/test';
				$pesan_pbeli = 'Selamat, anda memenangkan lelang untuk item '.$row_data['nama'].' ('.$row_data['kode_item'].')';
				$penerima = $row_data['pemenang'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);
				/* untuk penjual */
				$pesan_pjual = 'Lelang item '.$row_data['nama'].' ('.$row_data['kode_item'].') telah selesai, silahkan tunggu proses transaksi oleh pemenang';
				$penerima = $row_data['id_pengguna'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pjual, 'ref' => $id);
			}elseif($jenis == '3'){
				/* request vip notif */
				$action = $row_data['action'];
				$type_name = 'Recommended';
				if($row_data['type'] == '2'){
					$type_name = 'Trusted';
				}
				if($action == '1'){
					$pesan_pbeli = 'Request '.$type_name.' anda #'.$row_data['id_request'].' telah diterima';
				}elseif($action == '2'){
					$pesan_pbeli = 'Request '.$type_name.' anda #'.$row_data['id_request'].' telah ditolak';
				}elseif($action == '4'){
					$pesan_pbeli = 'Request '.$type_name.' anda #'.$row_data['id_request'].' telah terverifikasi';
				}
				$url 			= 'request_vip/notif/test';
				$penerima	= $row_data['id_pengguna'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);

			}elseif($jenis == '4'){
				/* request promote notif */

				$action = $row_data['action'];
				if($action == '1'){
					$pesan_pbeli = 'Request Promote anda #'.$row_data['id_request'].' telah diterima';
				}elseif($action == '2'){
					$pesan_pbeli = 'Request Promote anda #'.$row_data['id_request'].' telah ditolak';
				}elseif($action == '4'){
					$pesan_pbeli = 'Request Promote anda #'.$row_data['id_request'].' telah terverifikasi';
				}
				$url 			= 'request_promote/notif/test';
				$penerima	= $row_data['id_pengguna'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);
			}elseif($jenis == '14'){
				$action = $row_data['status'];
				$jenis_transaksi = 'Transaksi';
				$id_pengguna = $this->CI->db->select('id_pembeli')->get_where('transaksi',array('id' => $row_data['id_transaksi']))->row()->id_pembeli;
				if($row_data['jenis_transaksi'] == '2'){
					$jenis_transaksi = 'Request VIP';
					$id_pengguna = $this->CI->db->select('id_pengguna')->get_where('request_vip',array('id_request' => $row_data['id_transaksi']))->row()->id_pengguna;
				}elseif($row_data['jenis_transaksi'] == '3'){
					$jenis_transaksi = 'Request Promote';
					$id_pengguna = $this->CI->db->select('id_pengguna')->get_where('request_promote',array('id_request' => $row_data['id_transaksi']))->row()->id_pengguna;
				}elseif($row_data['jenis_transaksi'] == '4'){
					$jenis_transaksi = 'Deposit';
					$id_pengguna = $this->CI->db->select('id_customer')->get_where('deposit',array('id' => $row_data['id_transaksi']))->row()->id_customer;
				}
				if($action == '2'){
					$pesan_pbeli = 'Konfirmasi pembayaran '.$jenis_transaksi.' anda #'.$row_data['id_transaksi'].' telah diterima';
				}elseif($action == '3'){
					$pesan_pbeli = 'Konfirmasi pembayaran '.$jenis_transaksi.' anda #'.$row_data['id_transaksi'].' telah ditolak';
				}

				$url 			= 'konfirmasi_pembayaran/notif/test';
				$penerima	= $id_pengguna;
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);
			}elseif($jenis == '15'){
				$action = $row_data['status'];
				if($action == '2'){
					$pesan_pbeli = 'Deposit anda #'.$row_data['id'].' telah diterima sejumlah '.number_format($row_data['nominal_approve']);
				}elseif($action == '3'){
					$pesan_pbeli = 'Deposit anda #'.$row_data['id'].' telah ditolak';
				}
				$url 			= 'deposit/notif/test';
				$penerima	= $row_data['id_customer'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);
			}elseif($jenis == '16'){
				$action = $row_data['status'];
				if($action == '2'){
					$pesan_pbeli = 'Withdrawal anda #'.$row_data['id'].' telah diterima sejumlah '.number_format($row_data['nominal_approve']);
				}elseif($action == '3'){
					$pesan_pbeli = 'Withdrawal anda #'.$row_data['id'].' telah ditolak';
				}
				$url 			= 'withdrawal/notif/test';
				$penerima	= $row_data['id_customer'];
				$notif[] 	= array('url' => $url, 'penerima' => $penerima, 'isi' => $pesan_pbeli, 'ref' => $id);
			}

      return $this->_insert_notif($jenis,$notif);
    }
    return FALSE;
  }


  function _insert_notif($jenis,$data){
		$notif_sent = 0;
		foreach ($data as $key => $value) {
			# code...
			$url_web = 'http://web/'.$value['url'];
	    $url_android = 'http://android/'.$value['url'];
	    $url_ios = 'http://ios/'.$value['url'];
	    $url_in = array(
	                    'url_web'     => $url_web,
	                    'url_android' => $url_android,
	                    'url_ios'     => $url_ios,
	                    );
	    $this->CI->db->insert('url',$url_in);
	    $id_url = $this->CI->db->insert_id();
	    if($id_url > 0){
	      $data_in = array(
	                        'id_pengguna' => $value['penerima'],
	                        'jenis'       => $jenis,
	                        'id_url'      => $id_url,
	                        'referensi'   => $value['ref'],
	                        'isi'         => $value['isi']
	                      );
	      $this->CI->db->insert('notification',$data_in);
	      $inserted = $this->CI->db->insert_id();
	      if($inserted > 0){
	        $notif_sent++ ;
	      }
	    }
		}
		return $notif_sent;
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
                //$url = "https://reguler.zenziva.net/apps/smsapi.php";
                $url = "https://localhost";
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


		function send_fcm($token,$msg){

			 $notif = array(
			 'body'  => $msg['message'],
			 'title' => 'JerseyApp notification',
			 "icon" => 'icon',
			 "sound" => 'sound'
	 			);
			 $fields = array
			 (
					'registration_ids'  => $token,
					 'data'          => $msg,
					 'notification' =>$notif
			 );

			 $headers = array
			 (
					 'Authorization: key=AAAAlNSna_8:APA91bFzPg1gWQmVIM3ibYt-OgN2d9cwawQ01PdaxatIzVzlsL97N27jqvFr0A0Jl1lWizLu8Qc7zAQi8cLEkLFCs8BhRVxOixjB1yjPS13ncdSEAYWFj8onaQnCPaPwNciiNyFddTvx',
					 'Content-Type: application/json'
			 );

			 $ch = curl_init();
			 curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
			 curl_setopt( $ch,CURLOPT_POST, true );
			 curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
			 curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
			 curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
			 curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
			 $result = curl_exec($ch );
			 curl_close( $ch );

			 return $result;

	 }
}

?>
