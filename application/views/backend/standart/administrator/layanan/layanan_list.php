
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Layanan   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Layanan</li>
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
                     <div class="row pull-right">
                        <?php is_allowed('layanan_add', function(){?>
                        <a class="btn btn-flat btn-success btn_add_new" id="btn_add_new" title="<?= cclang('add_new_button', ['Layanan']); ?>  (Ctrl+a)" href="<?=  site_url('administrator/layanan/add'); ?>"><i class="fa fa-plus-square-o" ></i> </a>
                        <?php }) ?>
                                             </div>
                     
                     <!-- /.widget-user-image -->
                    
                     <h5 class="widget-user-desc" style="margin-left: 0px"><?= cclang('list_all', ['Layanan']); ?>  <i class="label bg-yellow"><?= $layanan_counts; ?>  <?= cclang('items'); ?></i></h5>
                  </div>

                  <form name="form_layanan" id="form_layanan" action="<?= base_url('administrator/layanan/index'); ?>">
                  

                  <div class="table-responsive"> 
                  <table class="table table-bordered table-striped dataTable">
                     <thead>
                        <tr class="">
                           <th>
                            <input type="checkbox" class="flat-red toltip" id="check_all" name="check_all" title="check all">
                           </th>
                           <th>Pasien</th>
                           <th>Jenis Layanan</th>
                           <th>Cara Bayar</th>
                           <th>No Registrasi</th>
                           <th>No Rekam Medis</th>
                           <th>Action</th>
                        </tr>
                     </thead>
                     <tbody id="tbody_layanan">
                     <?php foreach($layanans as $layanan): ?>
                        <tr>
                           <td width="5">
                              <input type="checkbox" class="flat-red check" name="id[]" value="<?= $layanan->id_layanan; ?>">
                           </td>
                           
                           <td><?= _ent($layanan->id_pasien); ?></td> 
                           <td><?= _ent($layanan->nama); ?></td>
                             
                           <td><?= _ent($layanan->nama); ?></td>
                             
                           <td><?= _ent($layanan->no_registrasi); ?></td> 
                           <td><?= _ent($layanan->no_rekam_medis); ?></td> 
                           <td width="200">
                              <?php is_allowed('layanan_view', function() use ($layanan){?>
                              <a href="<?= site_url('administrator/layanan/view/' . $layanan->id_layanan); ?>" class="label-default"><i class="fa fa-newspaper-o"></i> </a>
                              <?php }) ?>
                              <?php is_allowed('layanan_update', function() use ($layanan){?>
                              <a href="<?= site_url('administrator/layanan/edit/' . $layanan->id_layanan); ?>" class="label-default"><i class="fa fa-edit "></i> </a>
                              <?php }) ?>
                              <?php is_allowed('layanan_delete', function() use ($layanan){?>
                              <a href="javascript:void(0);" data-href="<?= site_url('administrator/layanan/delete/' . $layanan->id_layanan); ?>" class="label-default remove-data"><i class="fa fa-close"></i> </a>
                               <?php }) ?>
                               <?php is_allowed('layanan_rekam_medis', function() use ($layanan){?>
                              <a href="<?= site_url('administrator/layanan/rekam_medis/' . $layanan->id_layanan); ?>" class="label-default"><i class="fa fa-bullhorn "></i> </a>
                              <?php }) ?>
                           </td>
                        </tr>
                      <?php endforeach; ?>
                      <?php if ($layanan_counts == 0) :?>
                         <tr>
                           <td colspan="100">
                           Layanan data is not available
                           </td>
                         </tr>
                      <?php endif; ?>
                     </tbody>
                  </table>
                  </div>
               </div>
               <hr>
               <!-- /.widget-user -->
               <div class="row">
                  <div class="col-md-8">
                     <div class="col-sm-2 padd-left-0 " >
                        <select type="text" class="form-control chosen chosen-select" name="bulk" id="bulk" placeholder="Site Email" >
                           <option value="">Bulk</option>
                           <option value="delete">Delete</option>
                        </select>
                     </div>
                     <div class="col-sm-2 padd-left-0 ">
                        <button type="button" class="btn btn-flat" name="apply" id="apply" title="<?= cclang('apply_bulk_action'); ?>"><?= cclang('apply_button'); ?></button>
                     </div>
                     <div class="col-sm-3 padd-left-0  " >
                        <input type="text" class="form-control" name="q" id="filter" placeholder="<?= cclang('filter'); ?>" value="<?= $this->input->get('q'); ?>">
                     </div>
                     <div class="col-sm-3 padd-left-0 " >
                        <select type="text" class="form-control chosen chosen-select" name="f" id="field" >
                           <option value=""><?= cclang('all'); ?></option>
                            <option <?= $this->input->get('f') == 'id_pasien' ? 'selected' :''; ?> value="id_pasien">Id Pasien</option>
                           <option <?= $this->input->get('f') == 'id_jenis_layanan' ? 'selected' :''; ?> value="id_jenis_layanan">Id Jenis Layanan</option>
                           <option <?= $this->input->get('f') == 'id_cara_bayar' ? 'selected' :''; ?> value="id_cara_bayar">Id Cara Bayar</option>
                           <option <?= $this->input->get('f') == 'no_registrasi' ? 'selected' :''; ?> value="no_registrasi">No Registrasi</option>
                           <option <?= $this->input->get('f') == 'no_rekam_medis' ? 'selected' :''; ?> value="no_rekam_medis">No Rekam Medis</option>
                          </select>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <button type="submit" class="btn btn-flat" name="sbtn" id="sbtn" value="Apply" title="<?= cclang('filter_search'); ?>">
                        Filter
                        </button>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <a class="btn btn-default btn-flat" name="reset" id="reset" value="Apply" href="<?= base_url('administrator/layanan');?>" title="<?= cclang('reset_filter'); ?>">
                        <i class="fa fa-undo"></i>
                        </a>
                     </div>
                  </div>
                  </form>                  <div class="col-md-4">
                     <div class="dataTables_paginate paging_simple_numbers pull-right" id="example2_paginate" >
                        <?= $pagination; ?>
                     </div>
                  </div>
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
   
    $('.remove-data').click(function(){

      var url = $(this).attr('data-href');

      swal({
          title: "<?= cclang('are_you_sure'); ?>",
          text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "<?= cclang('yes_delete_it'); ?>",
          cancelButtonText: "<?= cclang('no_cancel_plx'); ?>",
          closeOnConfirm: true,
          closeOnCancel: true
        },
        function(isConfirm){
          if (isConfirm) {
            document.location.href = url;            
          }
        });

      return false;
    });


    $('#apply').click(function(){

      var bulk = $('#bulk');
      var serialize_bulk = $('#form_layanan').serialize();

      if (bulk.val() == 'delete') {
         swal({
            title: "<?= cclang('are_you_sure'); ?>",
            text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "<?= cclang('yes_delete_it'); ?>",
            cancelButtonText: "<?= cclang('no_cancel_plx'); ?>",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
               document.location.href = BASE_URL + '/administrator/layanan/delete?' + serialize_bulk;      
            }
          });

        return false;

      } else if(bulk.val() == '')  {
          swal({
            title: "Upss",
            text: "<?= cclang('please_choose_bulk_action_first'); ?>",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Okay!",
            closeOnConfirm: true,
            closeOnCancel: true
          });

        return false;
      }

      return false;

    });/*end appliy click*/


    //check all
    var checkAll = $('#check_all');
    var checkboxes = $('input.check');

    checkAll.on('ifChecked ifUnchecked', function(event) {   
        if (event.type == 'ifChecked') {
            checkboxes.iCheck('check');
        } else {
            checkboxes.iCheck('uncheck');
        }
    });

    checkboxes.on('ifChanged', function(event){
        if(checkboxes.filter(':checked').length == checkboxes.length) {
            checkAll.prop('checked', 'checked');
        } else {
            checkAll.removeProp('checked');
        }
        checkAll.iCheck('update');
    });

  }); /*end doc ready*/
</script>