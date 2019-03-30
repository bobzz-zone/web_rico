
<!DOCTYPE html>
<html class=''>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link href="<php echo base_url();?>assets/css/bootstrap-new.min.css" rel="stylesheet" id="bootstrap-css"> -->
  <link rel="stylesheet" href="<?= BASE_ASSET; ?>admin-lte/bootstrap/css/bootstrap.min.css">

  <!-- Include the above in your HEAD tag -->

<!-- <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'> -->


<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>

<!-- <script src="<php echo base_url();?>assets/js/jquery.min.js"></script> -->
<script src="<?= BASE_ASSET; ?>admin-lte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- <script src="<php echo base_url();?>assets/js/bootstrap.min.js"></script> -->
<script src="<?= BASE_ASSET; ?>admin-lte/bootstrap/js/bootstrap.min.js"></script>
<!--<script type="text/javascript">
  var $ = jQuery.noConflict();
</script>-->
<script>

	var tam_setting = <?php echo json_encode($data_configuration); ?>;
	var tam_keyword = <?php echo json_encode($data_keyword); ?>;
	var tam_ads = <?php echo json_encode($data_ads); ?>;

</script>
<style>
	.jumbotron {
		/*background-image: url("uploads/background.jpg");*/
		height: 250px;
		background-repeat: no-repeat;
	    background-position: center;
	    -webkit-background-size: cover;
	    background-size: cover;
	    padding-top: 30px;
	}

	.fakeimg {
	    height: 200px;
	    background: #aaa;
	}

	.div-ads {
	    height: 75px;
	    background: #defabc;
	    border: 1px solid #fedcba;
	    margin-bottom: 2px;
	    text-align: center;
	}

	.div-ads img {
		width: 100%;
		height: 100%;
	}

	.col-centered {
	    float: none;
	    margin: 0 auto;
	}

	.div-keyword {
		line-height: 1.6;
		white-space: nowrap; 
		width: 100%; 
		overflow: hidden;
		text-overflow: ellipsis; 
	}

	.cus-img {
		margin-left: 5%;
	}

	.mtb-40 {
		margin-top: 40px; 
		margin-bottom: 40px;
	}

	.m-backcol{
		margin: 2px 0px;
	}

	@media screen and (max-width: 480px) {
		.cus-img {
			margin-left: auto; margin-right:auto; display: block;
		}

		.mtb-40{
			margin-top: 0px; 
			margin-bottom: 0px;
		}

		.jumbotron {
			margin-bottom: 0px;
		}

		.col-md-11{
			padding-left: 0px;
			padding-right: 0px;
		}
	}

	@media screen and (max-width: 767px){
		.table-responsive {
			margin-bottom: 0px;
		}
	}

</style>
</head>

<body id="back_col">

<div class="jumbotron">
  <img class="image-responsive cus-img" id="img_logo" alt="logo" width="100"> 
</div>

<div class="container mtb-40">
  	<div class="row">
	    <div class="col-md-11 col-ms-11 col-centered">
	    	<div id="div_ads_atas">
	    		<div class="div-ads" id="aa1">
	      	
		      	</div>
		      	<div class="div-ads" id="aa2">
		      	
		      	</div>
	    	</div>
	      	<div class="row m-backcol">
		      	<div class="col-md-9 col-md-push-3 table-responsive" style="border: 1px solid #999; height: 300px; overflow-y: auto;" id="div_list">
		      	    <img id="load_rangking" src="<?php echo base_url().'uploads/loading.gif'; ?>" style="display:none; margin:auto;">
			      	<table class="table table-striped" id="div_table" style="display: none;">
			      		<thead>
					      <tr>
					        <th>Rank</th>
					        <th>Website</th>
					        <th>Rating</th>
					        <th>Viewer</th>
					      </tr>
					    </thead>
					    <tbody id="tbody_html">
					      
					    </tbody>
			      	</table>
			    </div>
			    <div class="col-md-3 col-md-pull-9 hidden-sm hidden-xs div_key" style="border: 1px solid #000; height: 300px; padding: 10px; overflow-y: auto;">
		      		<!-- <div class="div-keyword">Keyword 1 Keyword 1 Keyword 1 Keyword 1</div>
		      		<div class="div-keyword">Keyword 2</div>
		      		<div class="div-keyword">Keyword 3</div>
		      		<div class="div-keyword">Keyword 4</div>
		      		<div class="div-keyword">Keyword 5</div> -->
		      	</div>
		  	</div>
		  	<div id="div_ads_bawah">
		  		<div class="div-ads" id="ab1">
		      	<p>Bot Ads 1</p>
		      </div>
		      <div class="div-ads" id="ab2">
		      	<p>Bot Ads 1</p>
		      </div>
		  	</div>
	      	<div class="col-sm-12 hidden-md hidden-lg hidden-xlg div_key" style="background-color: #FFFFFF; border: 1px solid #000; height: 150px; max-height: 300px; padding: 10px; overflow-y: auto;">
		  		<!-- <div class="div-keyword">Keyword 1 Keyword 1 Keyword 1 Keyword 1</div>
		  		<div class="div-keyword">Keyword 2</div>
		  		<div class="div-keyword">Keyword 3</div>
		  		<div class="div-keyword">Keyword 4</div>
		      	<div class="div-keyword">Keyword 5</div> -->
	      	</div>
	    </div>
    
  	</div>
</div>

<!-- <div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div> -->

<script>

	var banner = tam_setting[0].banner_image;
	var logo = tam_setting[0].logo;
	var back_color = tam_setting[0].bg_color;
	var color_div_list = tam_setting[0].bg_color_box_list;
	var color_div_key = tam_setting[0].bg_color_box_menu;
	
	var html_keyword = "";
	for(var i=0;i<tam_keyword.length;i++){
	
		html_keyword += "<div class='div-keyword keyword"+tam_keyword[i].id+"' onclick='get_table("+tam_keyword[i].id+")' style='cursor: pointer;'>"+tam_keyword[i].keyword+"</div>";
	}

	//<a href='"+tam_ads[0].url+"' target='_blank' style='cursor: pointer;'>
	$(".jumbotron").css('background-image', 'url("uploads/configuration/' + banner + '")');
	$("#img_logo").attr("src","uploads/configuration/"+logo);
	$("#back_col").css('background-color', back_color);
	$("#div_list").css('background-color', color_div_list);
	$(".div_key").css('background-color', color_div_key);

	$(".div_key").html(html_keyword);

	var html_ads_atas = "";
	var html_ads_bawah = "";
	for(var i=0;i<tam_ads.length;i++){
		if(tam_ads[i].posisi == "1"){
			html_ads_atas += "<div class='div-ads'>\
							<a href='"+tam_ads[i].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[i].foto+"' alt='"+tam_ads[i].nama_ads+"'></a>\
						</div>";
		}else if(tam_ads[i].posisi == "2"){
			html_ads_bawah += "<div class='div-ads'>\
							<a href='"+tam_ads[i].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[i].foto+"' alt='"+tam_ads[i].nama_ads+"'></a>\
						</div>";
		}
	}

	$("#div_ads_atas").html(html_ads_atas);
	$("#div_ads_bawah").html(html_ads_bawah);

	// $("#aa1").html("<a href='"+tam_ads[0].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[0].foto+"' alt='"+tam_ads[0].nama_ads+"'></a>");
	// $("#aa2").html("<a href='"+tam_ads[1].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[1].foto+"' alt='"+tam_ads[1].nama_ads+"'></a>");
	// $("#ab1").html("<a href='"+tam_ads[2].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[2].foto+"' alt='"+tam_ads[2].nama_ads+"'></a>");
	// $("#ab2").html("<a href='"+tam_ads[3].url+"' target='_blank' style='cursor: pointer;'><img class='image-responsive' src='uploads/m_ads/"+tam_ads[3].foto+"' alt='"+tam_ads[3].nama_ads+"'></a>");
	
	if(tam_keyword.length >= 1){
		get_table(tam_keyword[0].id);
	}

	function get_table(id_keyword){
		$(".div-keyword").css("font-weight","normal");
		$(".keyword"+id_keyword).css("font-weight","bold");
		$("#div_table").hide();
		$("#load_rangking").css("display","block");

		$.ajax({
            url: "<?php echo base_url(); ?>mainpage/get_rangking",
            data: { "id_keyword" : id_keyword
                    },
            type: 'GET',
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
            	$("#load_rangking").fadeOut(1000, function (){
            		load_table(data.data_rangking);
            	});
            },error: function (jqXHR, textStatus, errorThrown) {
            	$("#load_rangking").fadeOut(1000, function (){
            		$("#div_table").show();
            		$("#tbody_html").html("<tr><td colspan='4'>Data tidak ditemukan ...</td></tr>");
            	});
            }
        });

	}

	function load_table(data){

		var html = "";

		if(data == "" || data == []){
			html = "<tr><td colspan='4'>Data tidak ditemukan ...</td></tr>";
		}else{
			for(var i=0;i<data.length;i++){

				html += "<tr>\
				        	<td>"+data[i].rank+"</td>\
				        	<td>"+data[i].website+"</td>\
				        	<td>"+data[i].rating+"</td>\
				        	<td>"+data[i].viewer+"</td>\
				      	</tr>";

			}
		}

		$("#tbody_html").html(html);
		$("#div_table").show();
	}

</script>
</body></html>
