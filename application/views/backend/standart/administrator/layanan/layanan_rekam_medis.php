
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Layanan    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/layanan'); ?>">Layanan</a></li>
        <li class="active">Insert</li>
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
                            <h5 class="widget-user-desc" style="margin-left: 0px">Insert Rekam Medis</h5>
                            <hr>
                        </div>
                        <?= form_open(base_url('administrator/rekam_medis/add_save/'.$this->uri->segment(4)), [
                            'name'    => 'form_rekam_medis', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_rekam_medis', 
                            'method'  => 'POST'
                            ]); ?>
                         
                                                <div class="form-group ">
                            <label for="tipe_rekam_medis" class="col-sm-2 control-label">Tipe Rekam Medis 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select" name="tipe_rekam_medis" id="tipe_rekam_medis" data-placeholder="Select Tipe Rekam Medis" >
                                    <option value=""></option>
                                    <option value="1">Antrian</option>
                                    <option selected="" value="2">Layanan</option>
                                    </select>
                                <small class="info help-block">
                                </small>
                                <input type="hidden" class="form-control" name="id_pengguna" id="id_pengguna" placeholder="ID Pengguna" value="<?= set_value('id_pengguna', $layanan->id_pengguna); ?>">
                                <input type="hidden" class="form-control" name="referensi" id="referensi" placeholder="Referensi" value="<?= set_value('referensi', $layanan->id_layanan); ?>">
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="no_registrasi" class="col-sm-2 control-label">No Registrasi 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_registrasi" id="no_registrasi" placeholder="No Registrasi" value="<?= set_value('no_registrasi', $layanan->no_registrasi); ?>">
                                <small class="info help-block">
                                <b>Input No Registrasi</b> Max Length : 20.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="no_rekam_medis" class="col-sm-2 control-label">No Rekam Medis 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="no_rekam_medis" id="no_rekam_medis" placeholder="No Rekam Medis" value="<?= set_value('no_rekam_medis', $layanan->no_rekam_medis); ?>">
                                <small class="info help-block">
                                <b>Input No Rekam Medis</b> Max Length : 20.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="id_pasien" class="col-sm-2 control-label">Pasien 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_pasien" id="id_pasien" data-placeholder="Select Id Pasien" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('pasien') as $row): ?>
                                    <option <?=  $row->id_pasien ==  $layanan->id_pasien ? 'selected' : ''; ?> value="<?= $row->id_pasien ?>"><?= $row->nama_lengkap; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Pasien</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                                                <!--<div class="form-group ">
                            <label for="id_poli" class="col-sm-2 control-label">Poli 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_poli" id="id_poli" data-placeholder="Select Id Poli" disabled="">
                                    <option value=""></option>
                                    <php foreach (db_get_all_data('m_poli') as $row): ?>
                                    <option <=  $row->id ==  $layanan->id_poli ? 'selected' : ''; ?> value="<= $row->id ?>"><= $row->nama_poli; ?></option>
                                    <php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Poli</b> Max Length : 11.</small>
                            </div>
                        </div>-->

                                                 
                                                <div class="form-group ">
                            <label for="id_jenis_layanan" class="col-sm-2 control-label">Jenis Layanan 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_jenis_layanan" id="id_jenis_layanan" data-placeholder="Select Id Jenis Layanan" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('m_jenis_layanan') as $row): ?>
                                    <option <?=  $row->id ==  $layanan->id_jenis_layanan ? 'selected' : ''; ?> value="<?= $row->id ?>"><?= $row->nama; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Jenis Layanan</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                                                <div class="form-group ">
                            <label for="id_dokter" class="col-sm-2 control-label">Dokter 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select-deselect" name="id_dokter" id="id_dokter" data-placeholder="Select Id Dokter" >
                                    <option value=""></option>
                                    <?php foreach (db_get_all_data('m_dokter') as $row): ?>
                                    <option value="<?= $row->id ?>"><?= $row->nama; ?></option>
                                    <?php endforeach; ?>  
                                </select>
                                <small class="info help-block">
                                <b>Input Id Dokter</b> Max Length : 11.</small>
                            </div>
                        </div>

                                                 
                         
                                                <div class="form-group ">
                            <label for="keluhan" class="col-sm-2 control-label">Keluhan 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="keluhan" name="keluhan" rows="5" class="textarea"></textarea>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="diagnosa" class="col-sm-2 control-label">Diagnosa 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="diagnosa" name="diagnosa" rows="5" class="textarea"></textarea>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="terapi" class="col-sm-2 control-label">Terapi 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="terapi" name="terapi" rows="5" class="textarea"></textarea>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="solusi" class="col-sm-2 control-label">Solusi 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <table id="tabelku" style="font-size:12px;" class="table table-bordered table-hover table-responsive">
                                    <thead>
                                        <tr>
                                            <th>
                                                Item
                                            </th>
                                            <th>
                                                %
                                            </th>
                                            <th>
                                                <a href="javascript:void(0)" onclick="tabel_add()"> Tambah</a>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="body-tabel">
                                        
                                    <tbody>
                                </table>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="resep" class="col-sm-2 control-label">Resep 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="resep" name="resep" rows="5" class="textarea"></textarea>
                                <small class="info help-block">
                                </small>
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

    function tabel_add(){
        
        var html = '<tr>\n\
                        <td><input type="text" class="form-control solusi_item" placeholder="Item" style="width:400px;" /></td>\n\
                        <td><input type="text" class="form-control solusi_persen" placeholder="Prosentase" style="width:100px;" /></td>\n\
                        <td><a href="javascript:void(0)" onclick="tabel_delete(this)">Hapus</a></td>\n\
                    </tr>';
        $("#body-tabel").append(html);
    }
    
    function tabel_delete(el){
        $(el).closest('tr').remove();
    }

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
              window.location.href = BASE_URL + 'administrator/layanan';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
            
        var form_rekam_medis = $('#form_rekam_medis');
        var data_post = form_rekam_medis.serializeArray();
        var save_type = $(this).attr('data-stype');

        //solusi start
        var arr_solusi_final = [];
        var arr_solusi_item = [];
        var arr_solusi_persen = [];
        
        $('.solusi_item').each(function(index) {
            var $this = $(this);
            value = $this.val();
            arr_solusi_item.push(value);
        });
        $('.solusi_persen').each(function(index) {
            var $this = $(this);
            value = $this.val();
            arr_solusi_persen.push(value);
        });
        
        for( var i = 0 ; i < arr_solusi_item.length ; i++ ){
            
            var obj = new Object;
            
            obj.nama = arr_solusi_item[i];
            obj.prosentase = arr_solusi_persen[i];
            
            arr_solusi_final.push(obj);
        }
        
        var json_solusi_final = JSON.stringify(arr_solusi_final);
        //solusi end

        data_post.push({name: 'save_type', value: save_type});
        data_post.push({name: 'solusi', value: json_solusi_final});
        data_post.push({name: 'id_poli', value: "0"});

    
        $('.loading').show();
    
        $.ajax({
          url: form_rekam_medis.attr('action'),
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            var id = $('#rekam_medis_image_galery').find('li').attr('qq-file-id');
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
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
</script>