
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Pengguna      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/pengguna'); ?>">Pengguna</a></li>
      <li class="active"><?= cclang('detail'); ?></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Pengguna</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_pengguna" id="form_pengguna" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Nama </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->nama); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Telpon </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->telpon); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">No Bpjs </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->no_bpjs); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Email </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->email); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">No Ktp </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->no_ktp); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Alamat </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($pengguna->alamat); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> Image </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             <?php if (is_image($pengguna->image)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/pengguna/' . $pengguna->image; ?>">
                                <img src="<?= BASE_URL . 'uploads/pengguna/' . $pengguna->image; ?>" class="image-responsive" alt="image pengguna" title="image pengguna" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/pengguna/' . $pengguna->image; ?>">
                                 <img src="<?= get_icon_file($pengguna->image); ?>" class="image-responsive" alt="image pengguna" title="image <?= $pengguna->image; ?>" width="40px"> 
                               <?= $pengguna->image ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                      
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('pengguna_update', function() use ($pengguna){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit pengguna (Ctrl+e)" href="<?= site_url('administrator/pengguna/edit/'.$pengguna->id); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Pengguna']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/pengguna/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Pengguna']); ?></a>
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
