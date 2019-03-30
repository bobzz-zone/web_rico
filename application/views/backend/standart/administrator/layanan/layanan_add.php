
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Layanan    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/layanan'); ?>">Layanan</a></li>
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
                            <h5 class="widget-user-desc" style="margin-left: 0px"><?= cclang('new', ['Layanan']); ?></h5>
                            <hr>
                        </div>
                        <?= form_open('', [
                            'name'    => 'form_layanan', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_layanan', 
                            'enctype' => 'multipart/form-data', 
                            'method'  => 'POST'
                            ]); ?>
                         
                                                <div class="form-group ">
                            <label for="id_pasien" class="col-sm-2 control-label">Pasien 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="id_pasien" id="id_pasien" placeholder="Pasien" value="<?= set_value('id_pasien'); ?>">
                                <small class="info help-block">
                                <b>Input Id Pasien</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="id_jenis_layanan" class="col-sm-2 control-label">Jenis Layanan 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_jenis_layanan" id="id_jenis_layanan" data-placeholder="Select Id Jenis Layanan" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('m_jenis_layanan') as $row): ?>
                                    <option value="<?= $row->id ?>"><?= $row->nama; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Jenis Layanan</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                                                <div class="form-group ">
                            <label for="id_kelas" class="col-sm-2 control-label">Kelas 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_kelas" id="id_kelas" data-placeholder="Select Id Kelas" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('m_kelas') as $row): ?>
                                    <option value="<?= $row->id ?>"><?= $row->nama; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Kelas</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                                                <div class="form-group ">
                            <label for="lokasi" class="col-sm-2 control-label">Lokasi 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="lokasi" id="lokasi" placeholder="Lokasi" value="<?= set_value('lokasi'); ?>">
                                <small class="info help-block">
                                <b>Input Lokasi</b> Max Length : 30.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="id_cara_bayar" class="col-sm-2 control-label">Cara Bayar 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_cara_bayar" id="id_cara_bayar" data-placeholder="Select Id Cara Bayar" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('m_cara_bayar') as $row): ?>
                                    <option value="<?= $row->id ?>"><?= $row->nama; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Cara Bayar</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                                                <div class="form-group ">
                            <label for="no_registrasi" class="col-sm-2 control-label">No Registrasi 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_registrasi" id="no_registrasi" placeholder="No Registrasi" value="<?= set_value('no_registrasi'); ?>">
                                <small class="info help-block">
                                <b>Input No Registrasi</b> Max Length : 20.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="no_rekam_medis" class="col-sm-2 control-label">No Rekam Medis 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_rekam_medis" id="no_rekam_medis" placeholder="No Rekam Medis" value="<?= set_value('no_rekam_medis'); ?>">
                                <small class="info help-block">
                                <b>Input No Rekam Medis</b> Max Length : 20.</small>
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
              window.location.href = BASE_URL + 'administrator/layanan';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
            
        var form_layanan = $('#form_layanan');
        var data_post = form_layanan.serializeArray();
        var save_type = $(this).attr('data-stype');

        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: BASE_URL + '/administrator/layanan/add_save',
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            resetForm();
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
      
       
 
       
    
    
    }); /*end doc ready*/
</script>