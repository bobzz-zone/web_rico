
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Ads   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Ads</li>
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
                        <?php is_allowed('m_ads_add', function(){?>
                        <a class="btn btn-flat btn-success btn_add_new" id="btn_add_new" title="<?= cclang('add_new_button', ['Ads']); ?>  (Ctrl+a)" href="<?=  site_url('administrator/m_ads/add'); ?>"><i class="fa fa-plus-square-o" ></i> </a>
                        <?php }) ?>
                                             </div>
                     
                     <!-- /.widget-user-image -->
                    
                     <h5 class="widget-user-desc" style="margin-left: 0px"><?= cclang('list_all', ['Ads']); ?>  <i class="label bg-yellow"><?= $m_ads_counts; ?>  <?= cclang('items'); ?></i></h5>
                  </div>

                  <form name="form_m_ads" id="form_m_ads" action="<?= base_url('administrator/m_ads/index'); ?>">
                  

                  <div class="table-responsive"> 
                  <table class="table table-bordered table-striped dataTable">
                     <thead>
                        <tr class="">
                           <th>
                            <input type="checkbox" class="flat-red toltip" id="check_all" name="check_all" title="check all">
                           </th>
                           <th>Nama Ads</th>
                           <th>Foto</th>
                           <th>Url</th>
                           <th>Posisi</th>
                           <th>Action</th>
                        </tr>
                     </thead>
                     <tbody id="tbody_m_ads">
                     <?php foreach($m_adss as $m_ads): ?>
                        <tr>
                           <td width="5">
                              <input type="checkbox" class="flat-red check" name="id[]" value="<?= $m_ads->id; ?>">
                           </td>
                           
                           <td><?= _ent($m_ads->nama_ads); ?></td> 
                           <td>
                              <?php if (!empty($m_ads->foto)): ?>
                                <?php if (is_image($m_ads->foto)): ?>
                                <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/m_ads/' . $m_ads->foto; ?>">
                                  <img src="<?= BASE_URL . 'uploads/m_ads/' . $m_ads->foto; ?>" class="image-responsive" alt="image m_ads" title="foto m_ads" width="40px">
                                </a>
                                <?php else: ?>
                                  <a href="<?= BASE_URL . 'administrator/file/download/m_ads/' . $m_ads->foto; ?>">
                                   <img src="<?= get_icon_file($m_ads->foto); ?>" class="image-responsive image-icon" alt="image m_ads" title="foto <?= $m_ads->foto; ?>" width="40px"> 
                                 </a>
                                <?php endif; ?>
                              <?php endif; ?>
                           </td>
                            
                           <td><?= _ent($m_ads->url); ?></td> 
                           <td>
                            <?php if ($m_ads->posisi == "1") : ?>
                            Atas
                            <?php else: ?>
                            Bawah
                            <?php endif; ?>
                           </td> 
                           <td width="200">
                              <?php is_allowed('m_ads_view', function() use ($m_ads){?>
                              <a href="<?= site_url('administrator/m_ads/view/' . $m_ads->id); ?>" class="label-default"><i class="fa fa-newspaper-o"></i> </a>
                              <?php }) ?>
                              <?php is_allowed('m_ads_update', function() use ($m_ads){?>
                              <a href="<?= site_url('administrator/m_ads/edit/' . $m_ads->id); ?>" class="label-default"><i class="fa fa-edit "></i> </a>
                              <?php }) ?>
                              <?php is_allowed('m_ads_delete', function() use ($m_ads){?>
                              <a href="javascript:void(0);" data-href="<?= site_url('administrator/m_ads/delete/' . $m_ads->id); ?>" class="label-default remove-data"><i class="fa fa-close"></i> </a>
                               <?php }) ?>
                           </td>
                        </tr>
                      <?php endforeach; ?>
                      <?php if ($m_ads_counts == 0) :?>
                         <tr>
                           <td colspan="100">
                           Ads data is not available
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
                            <option <?= $this->input->get('f') == 'nama_ads' ? 'selected' :''; ?> value="nama_ads">Nama Ads</option>
                           <option <?= $this->input->get('f') == 'foto' ? 'selected' :''; ?> value="foto">Foto</option>
                           <option <?= $this->input->get('f') == 'url' ? 'selected' :''; ?> value="url">Url</option>
                           <option <?= $this->input->get('f') == 'posisi' ? 'selected' :''; ?> value="posisi">Posisi</option>
                          </select>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <button type="submit" class="btn btn-flat" name="sbtn" id="sbtn" value="Apply" title="<?= cclang('filter_search'); ?>">
                        Filter
                        </button>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <a class="btn btn-default btn-flat" name="reset" id="reset" value="Apply" href="<?= base_url('administrator/m_ads');?>" title="<?= cclang('reset_filter'); ?>">
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
      var serialize_bulk = $('#form_m_ads').serialize();

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
               document.location.href = BASE_URL + '/administrator/m_ads/delete?' + serialize_bulk;      
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