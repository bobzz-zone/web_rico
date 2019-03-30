
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Layanan      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/layanan'); ?>">Layanan</a></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Layanan</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_layanan" id="form_layanan" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Pasien </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->id_pasien); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Jenis Layanan </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->nama); ?>
                        </div>
                    </div>
				                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Kelas </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->nama); ?>
                        </div>
                    </div>
				                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Lokasi </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->lokasi); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Cara Bayar </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->nama); ?>
                        </div>
                    </div>
				                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">No Registrasi </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->no_registrasi); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">No Rekam Medis </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($layanan->no_rekam_medis); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('layanan_update', function() use ($layanan){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit layanan (Ctrl+e)" href="<?= site_url('administrator/layanan/edit/'.$layanan->id_layanan); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Layanan']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/layanan/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Layanan']); ?></a>
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
