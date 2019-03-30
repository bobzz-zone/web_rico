
<!-- Fine Uploader Gallery CSS file
    ====================================================================== -->
<link href="<?= BASE_ASSET; ?>/fine-upload/fine-uploader-gallery.min.css" rel="stylesheet">
<!-- Fine Uploader jQuery JS file
    ====================================================================== -->
<script src="<?= BASE_ASSET; ?>/fine-upload/jquery.fine-uploader.js"></script>
<?php $this->load->view('core_template/fine_upload'); ?>
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Pengguna    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/pengguna'); ?>">Pengguna</a></li>
        <li class="active"><?= cclang('new'); ?></li>
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
                            <h5 class="widget-user-desc" style="margin-left: 0px"><?= cclang('new', ['Pengguna']); ?></h5>
                            <hr>
                        </div>
                        <?= form_open('', [
                            'name'    => 'form_pengguna', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_pengguna', 
                            'enctype' => 'multipart/form-data', 
                            'method'  => 'POST'
                            ]); ?>
                         
                                                <div class="form-group ">
                            <label for="nama" class="col-sm-2 control-label">Nama 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama" value="<?= set_value('nama'); ?>">
                                <small class="info help-block">
                                <b>Input Nama</b> Max Length : 40.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="telpon" class="col-sm-2 control-label">Telpon 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="telpon" id="telpon" placeholder="Telpon" value="<?= set_value('telpon'); ?>">
                                <small class="info help-block">
                                <b>Input Telpon</b> Max Length : 15.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="no_bpjs" class="col-sm-2 control-label">No Bpjs 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_bpjs" id="no_bpjs" placeholder="No Bpjs" value="<?= set_value('no_bpjs'); ?>">
                                <small class="info help-block">
                                <b>Input No Bpjs</b> Max Length : 40.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="email" class="col-sm-2 control-label">Email 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="email" id="email" placeholder="Email" value="<?= set_value('email'); ?>">
                                <small class="info help-block">
                                <b>Input Email</b> Max Length : 30.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="no_ktp" class="col-sm-2 control-label">No Ktp 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_ktp" id="no_ktp" placeholder="No Ktp" value="<?= set_value('no_ktp'); ?>">
                                <small class="info help-block">
                                <b>Input No Ktp</b> Max Length : 18.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="alamat" class="col-sm-2 control-label">Alamat 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="alamat" id="alamat" placeholder="Alamat" value="<?= set_value('alamat'); ?>">
                                <small class="info help-block">
                                <b>Input Alamat</b> Max Length : 100.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="image" class="col-sm-2 control-label">Image 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <div id="pengguna_image_galery"></div>
                                <input class="data_file" name="pengguna_image_uuid" id="pengguna_image_uuid" type="hidden" value="<?= set_value('pengguna_image_uuid'); ?>">
                                <input class="data_file" name="pengguna_image_name" id="pengguna_image_name" type="hidden" value="<?= set_value('pengguna_image_name'); ?>">
                                <small class="info help-block">
                                <b>Input Image</b> Max Length : 30.</small>
                            </div>
                        </div>
                                                
                        <div class="message"></div>
                        <div class="row-fluid col-md-7">
                           <button class="btn btn-flat btn-primary btn_save btn_action" id="btn_save" data-stype='stay' title="<?= cclang('save_button'); ?> (Ctrl+s)">
                            <i class="fa fa-save" ></i> <?= cclang('save_button'); ?>
                            </button>
                            <a class="btn btn-flat btn-info btn_save btn_action btn_save_back" id="btn_save" data-stype='back' title="<?= cclang('save_and_go_the_list_button'); ?> (Ctrl+d)">
                            <i class="ion ion-ios-list-outline" ></i> <?= cclang('save_and_go_the_list_button'); ?>
                            </a>
                            <a class="btn btn-flat btn-default btn_action" id="btn_cancel" title="<?= cclang('cancel_button'); ?> (Ctrl+x)">
                            <i class="fa fa-undo" ></i> <?= cclang('cancel_button'); ?>
                            </a>
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
<script src="<?= BASE_ASSET; ?>ckeditor/ckeditor.js"></script>
<!-- Page script -->
<script>
    $(document).ready(function(){
                               
      $('#btn_cancel').click(function(){
        swal({
            title: "<?= cclang('are_you_sure'); ?>",
            text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
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
              window.location.href = BASE_URL + 'administrator/pengguna';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
                            
        var form_pengguna = $('#form_pengguna');
        var data_post = form_pengguna.serializeArray();
        var save_type = $(this).attr('data-stype');

        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: BASE_URL + '/administrator/pengguna/add_save',
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            var id_image = $('#pengguna_image_galery').find('li').attr('qq-file-id');
            
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            resetForm();
            if (typeof id_image !== 'undefined') {
                    $('#pengguna_image_galery').fineUploader('deleteFile', id_image);
                }
            $('.chosen option').prop('selected', false).trigger('chosen:updated');
                                        
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
      
              var params = {};
       params[csrf] = token;

       $('#pengguna_image_galery').fineUploader({
          template: 'qq-template-gallery',
          request: {
              endpoint: BASE_URL + '/administrator/pengguna/upload_image_file',
              params : params
          },
          deleteFile: {
              enabled: true, 
              endpoint: BASE_URL + '/administrator/pengguna/delete_image_file',
          },
          thumbnails: {
              placeholders: {
                  waitingPath: BASE_URL + '/asset/fine-upload/placeholders/waiting-generic.png',
                  notAvailablePath: BASE_URL + '/asset/fine-upload/placeholders/not_available-generic.png'
              }
          },
          multiple : false,
          validation: {
              allowedExtensions: ["*"],
              sizeLimit : 0,
                        },
          showMessage: function(msg) {
              toastr['error'](msg);
          },
          callbacks: {
              onComplete : function(id, name, xhr) {
                if (xhr.success) {
                   var uuid = $('#pengguna_image_galery').fineUploader('getUuid', id);
                   $('#pengguna_image_uuid').val(uuid);
                   $('#pengguna_image_name').val(xhr.uploadName);
                } else {
                   toastr['error'](xhr.error);
                }
              },
              onSubmit : function(id, name) {
                  var uuid = $('#pengguna_image_uuid').val();
                  $.get(BASE_URL + '/administrator/pengguna/delete_image_file/' + uuid);
              },
              onDeleteComplete : function(id, xhr, isError) {
                if (isError == false) {
                  $('#pengguna_image_uuid').val('');
                  $('#pengguna_image_name').val('');
                }
              }
          }
      }); /*end image galery*/
              
 
       
    
    
    }); /*end doc ready*/
</script>