
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
        Configuration    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/configuration'); ?>">Configuration</a></li>
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
                            <h5 class="widget-user-desc" style="margin-left: 0px"><?= cclang('new', ['Configuration']); ?></h5>
                            <hr>
                        </div>
                        <?= form_open('', [
                            'name'    => 'form_configuration', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_configuration', 
                            'enctype' => 'multipart/form-data', 
                            'method'  => 'POST'
                            ]); ?>
                         
                                                <div class="form-group ">
                            <label for="bg_color" class="col-sm-2 control-label">Bg Color 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="bg_color" id="bg_color" placeholder="Bg Color" value="<?= set_value('bg_color'); ?>">
                                <small class="info help-block">
                                <b>Input Bg Color</b> Max Length : 10.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="banner_image" class="col-sm-2 control-label">Banner Image 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <div id="configuration_banner_image_galery"></div>
                                <input class="data_file" name="configuration_banner_image_uuid" id="configuration_banner_image_uuid" type="hidden" value="<?= set_value('configuration_banner_image_uuid'); ?>">
                                <input class="data_file" name="configuration_banner_image_name" id="configuration_banner_image_name" type="hidden" value="<?= set_value('configuration_banner_image_name'); ?>">
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="logo" class="col-sm-2 control-label">Logo 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <div id="configuration_logo_galery"></div>
                                <input class="data_file" name="configuration_logo_uuid" id="configuration_logo_uuid" type="hidden" value="<?= set_value('configuration_logo_uuid'); ?>">
                                <input class="data_file" name="configuration_logo_name" id="configuration_logo_name" type="hidden" value="<?= set_value('configuration_logo_name'); ?>">
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="bg_color_box_menu" class="col-sm-2 control-label">Bg Color Box Menu 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="bg_color_box_menu" id="bg_color_box_menu" placeholder="Bg Color Box Menu" value="<?= set_value('bg_color_box_menu'); ?>">
                                <small class="info help-block">
                                <b>Input Bg Color Box Menu</b> Max Length : 10.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="bg_color_box_list" class="col-sm-2 control-label">Bg Color Box List 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="bg_color_box_list" id="bg_color_box_list" placeholder="Bg Color Box List" value="<?= set_value('bg_color_box_list'); ?>">
                                <small class="info help-block">
                                <b>Input Bg Color Box List</b> Max Length : 10.</small>
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
              window.location.href = BASE_URL + 'administrator/configuration';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
            
        var form_configuration = $('#form_configuration');
        var data_post = form_configuration.serializeArray();
        var save_type = $(this).attr('data-stype');

        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: BASE_URL + '/administrator/configuration/add_save',
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            var id_banner_image = $('#configuration_banner_image_galery').find('li').attr('qq-file-id');
            var id_logo = $('#configuration_logo_galery').find('li').attr('qq-file-id');
            
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            resetForm();
            if (typeof id_banner_image !== 'undefined') {
                    $('#configuration_banner_image_galery').fineUploader('deleteFile', id_banner_image);
                }
            if (typeof id_logo !== 'undefined') {
                    $('#configuration_logo_galery').fineUploader('deleteFile', id_logo);
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

       $('#configuration_banner_image_galery').fineUploader({
          template: 'qq-template-gallery',
          request: {
              endpoint: BASE_URL + '/administrator/configuration/upload_banner_image_file',
              params : params
          },
          deleteFile: {
              enabled: true, 
              endpoint: BASE_URL + '/administrator/configuration/delete_banner_image_file',
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
                   var uuid = $('#configuration_banner_image_galery').fineUploader('getUuid', id);
                   $('#configuration_banner_image_uuid').val(uuid);
                   $('#configuration_banner_image_name').val(xhr.uploadName);
                } else {
                   toastr['error'](xhr.error);
                }
              },
              onSubmit : function(id, name) {
                  var uuid = $('#configuration_banner_image_uuid').val();
                  $.get(BASE_URL + '/administrator/configuration/delete_banner_image_file/' + uuid);
              },
              onDeleteComplete : function(id, xhr, isError) {
                if (isError == false) {
                  $('#configuration_banner_image_uuid').val('');
                  $('#configuration_banner_image_name').val('');
                }
              }
          }
      }); /*end banner_image galery*/
                     var params = {};
       params[csrf] = token;

       $('#configuration_logo_galery').fineUploader({
          template: 'qq-template-gallery',
          request: {
              endpoint: BASE_URL + '/administrator/configuration/upload_logo_file',
              params : params
          },
          deleteFile: {
              enabled: true, 
              endpoint: BASE_URL + '/administrator/configuration/delete_logo_file',
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
                   var uuid = $('#configuration_logo_galery').fineUploader('getUuid', id);
                   $('#configuration_logo_uuid').val(uuid);
                   $('#configuration_logo_name').val(xhr.uploadName);
                } else {
                   toastr['error'](xhr.error);
                }
              },
              onSubmit : function(id, name) {
                  var uuid = $('#configuration_logo_uuid').val();
                  $.get(BASE_URL + '/administrator/configuration/delete_logo_file/' + uuid);
              },
              onDeleteComplete : function(id, xhr, isError) {
                if (isError == false) {
                  $('#configuration_logo_uuid').val('');
                  $('#configuration_logo_name').val('');
                }
              }
          }
      }); /*end logo galery*/
              
 
       
    
    
    }); /*end doc ready*/
</script>