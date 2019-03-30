
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Configuration      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/configuration'); ?>">Configuration</a></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Configuration</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_configuration" id="form_configuration" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Bg Color </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($configuration->bg_color); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> Banner Image </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             <?php if (is_image($configuration->banner_image)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/configuration/' . $configuration->banner_image; ?>">
                                <img src="<?= BASE_URL . 'uploads/configuration/' . $configuration->banner_image; ?>" class="image-responsive" alt="image configuration" title="banner_image configuration" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/configuration/' . $configuration->banner_image; ?>">
                                 <img src="<?= get_icon_file($configuration->banner_image); ?>" class="image-responsive" alt="image configuration" title="banner_image <?= $configuration->banner_image; ?>" width="40px"> 
                               <?= $configuration->banner_image ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> Logo </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             <?php if (is_image($configuration->logo)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/configuration/' . $configuration->logo; ?>">
                                <img src="<?= BASE_URL . 'uploads/configuration/' . $configuration->logo; ?>" class="image-responsive" alt="image configuration" title="logo configuration" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/configuration/' . $configuration->logo; ?>">
                                 <img src="<?= get_icon_file($configuration->logo); ?>" class="image-responsive" alt="image configuration" title="logo <?= $configuration->logo; ?>" width="40px"> 
                               <?= $configuration->logo ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Bg Color Box Menu </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($configuration->bg_color_box_menu); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Bg Color Box List </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($configuration->bg_color_box_list); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('configuration_update', function() use ($configuration){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit configuration (Ctrl+e)" href="<?= site_url('administrator/configuration/edit/'.$configuration->id_configuration); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Configuration']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/configuration/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Configuration']); ?></a>
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
