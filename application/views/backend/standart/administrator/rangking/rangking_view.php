
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Rangking      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/rangking'); ?>">Rangking</a></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Rangking</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_rangking" id="form_rangking" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Keyword </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($rangking->keyword); ?>
                        </div>
                    </div>
				                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Rank </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($rangking->rank); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Website </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($rangking->website); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Rating </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($rangking->rating); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Viewer </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($rangking->viewer); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('rangking_update', function() use ($rangking){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit rangking (Ctrl+e)" href="<?= site_url('administrator/rangking/edit/'.$rangking->id); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Rangking']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/rangking/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Rangking']); ?></a>
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
