
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Rangking    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/rangking'); ?>">Rangking</a></li>
        <li class="active">Editable</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row" >
        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-body ">
                    <!-- Widget: user widget style 1 -->
                    <div class="box box-widget widget-user-2">
                        <!-- Add the bg color to the header using any of the bg-* classes -->
                        <div class="widget-user-header ">
                            <h5 class="widget-user-desc" style="margin-left: 0px">Editable Rangking</h5>
                            <hr>
                        </div>
                        <?= form_open(base_url('administrator/rangking/editable_save/'.$this->uri->segment(4)), [
                            'name'    => 'form_rangking', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_rangking', 
                            'method'  => 'POST'
                            ]); ?>
                         
                                                <div class="form-group ">
                            <label for="id_keyword" class="col-sm-3 control-label">Keyword 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-6">
                                <select  class="form-control chosen chosen-select-deselect" name="id_keyword" id="id_keyword" data-placeholder="Select Id Keyword" onchange="get_data_keyword(this.value)">
                                    <option value="">Pilih Keyword</option>
                                    <?php foreach (db_get_all_data('m_keyword') as $row): ?>
                                    <option value="<?= $row->id ?>"><?= $row->keyword; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                            </div>
                        </div>
                        <div class="table-responsive"> 
                            <table class="table table-hover table-striped table-bordered table-condensed table-baru" id="tbl-data">
                                <thead>
                                    <tr>
                                        <th>
                                            Rank
                                        </th>
                                        <th>
                                            Website
                                        </th>
                                        <th>
                                            Rating
                                        </th>
                                        <th>
                                            Viewer
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="tbody-data">
                                    <!-- <php
                                    $this->db->where('deleted', "1");
                                    $this->db->where('aktif', "1");
                                    $this->db->limit(0,1);
                                    $this->db->order_by('urutan', 'ASC');
                                    $res = $this->db->get("m_anggota")->result();

                                    foreach($res as $row){ ?>
                                        <tr>
                                            <td>
                                                <= $row->kode_anggota; ?>
                                            </td>
                                            <td>
                                                <= $row->nama_anggota; ?>
                                            </td>
                                            <td>
                                                <= $row->no_setor; ?>
                                            </td>
                                            <= $input ?>
                                        </tr>
                                    <php } ?> -->

                                </tbody>
                            </table>
                        </div>

                        <div class="message text-center"></div>

                        <div class="row-fluid text-center">
                            <button class="btn btn-flat btn-primary btn_save btn_action" id="btn_save" data-stype='stay' title="<?= cclang('save_button'); ?> (Ctrl+s)">
                            <i class="fa fa-save" ></i> <?= cclang('save_button'); ?>
                            </button>
                            <!-- <a class="btn btn-flat btn-info btn_save btn_action btn_save_back" id="btn_save" data-stype='back' title="<?= cclang('save_and_go_the_list_button'); ?> (Ctrl+d)">
                            <i class="ion ion-ios-list-outline" ></i> <?= cclang('save_and_go_the_list_button'); ?>
                            </a>
                            <a class="btn btn-flat btn-default btn_action" id="btn_cancel" title="<?= cclang('cancel_button'); ?> (Ctrl+x)">
                            <i class="fa fa-undo" ></i> <?= cclang('cancel_button'); ?>
                            </a> -->
                            <span class="loading loading-hide">
                            <img src="<?= BASE_ASSET; ?>/img/loading-spin-primary.svg"> 
                            <i><?= cclang('loading_saving_data'); ?></i>
                            </span>
                        </div>
                        <?= form_close(); ?>
                    </div>
                </div>
                <!--/box body -->
            </div>
            <!--/box -->
        </div>
    </div>
</section>
<!-- /.content -->
<!-- Page script -->
<script>
    $(document).ready(function(){
      
             
      $('#btn_cancel').click(function(){
        swal({
            title: "Are you sure?",
            text: "the data that you have created will be in the exhaust!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes!",
            cancelButtonText: "No!",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
              window.location.href = BASE_URL + 'administrator/rangking';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
            
        var form_rangking = $('#form_rangking');
        var data_post = form_rangking.serializeArray();
        var save_type = $(this).attr('data-stype');
        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: form_rangking.attr('action'),
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            //var id = $('#rangking_image_galery').find('li').attr('qq-file-id');
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
            $('.message').html(res.message);
            //$('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            $('.data_file_uuid').val('');
    
          } else {
            $('.message').printMessage({message : res.message, type : 'warning'});
          }
    
        })
        .fail(function() {
          $('.message').printMessage({message : 'Error save data', type : 'warning'});
        })
        .always(function() {
          $('.loading').hide();
          $('html, body').animate({ scrollTop: $(document).height() }, 2000);
        });
    
        return false;
      }); /*end btn save*/
      
       
       
           
    
    }); /*end doc ready*/

    function get_data_keyword(id_keyword){

        $('#tbody-data').html('<tr><td colspan="4" align="center">Sedang mengambil data...</td></tr>');
 
             $.ajax({
                url: BASE_URL + 'administrator/rangking/load_data_editable', //'<php echo base_url().'administrator/rangking/load_data_editable';?>',
                data: {
                    <?php echo $this->security->get_csrf_token_name();?> : '<?php  echo $this->security->get_csrf_hash();?>',
                    id_keyword: id_keyword,
                },
                type: 'post',
                dataType: 'json',
                cache: false,
                success: function(data, textStatus, jqXHR){
                    if(data.code == '1'){
                        result = data.list_data;
 
                        $('#tbody-data').html('');
                        if(result.length > 0){
                            for(var i = 0;i < result.length;i++){
                                var tr_html ='';
                                tr_html = '<tr data-index="'+i+'">'
                                                         + '<td style="display: none;"><input type="hidden" name="id_rank[]" value="'+result[i].id+'"></td>'
                                                         + '<td style="width: 5%;"><input class="form-control" name="rank[]" value="'+result[i].rank+'"></td>'
                                                         + '<td><input class="form-control" name="website[]" value="'+result[i].website+'"></td>'
                                                         + '<td style="width: 5%;"><input class="form-control" name="rating[]" value="'+result[i].rating+'"></td>'
                                                         + '<td style="width: 8%;"><input class="form-control" name="viewer[]" value="'+result[i].viewer+'"></td></tr>';
                                                        
                                //tr_html    +='';
     
                                $('#tbody-data').append(tr_html);
                            }
                        }else{
                            $('#tbody-data').html('<tr class="danger"><td colspan="4" align="center">Data Kosong ...</td></tr>');
                        }
                        
                     }
                 },
                 error: function(jqXHR, textStatus, errorThrown){
                     $('#tbody-data').html('<tr class="danger"><td colspan="4" align="center">Kesalahan saat mengambil data, coba lagi.</td></tr>');
                 }
 
             }).done(function(){
                 // $('#btn-load-data').html('Load Data');
                 // $('#btn-load-data').removeClass('disabled');
             });

    }

</script>