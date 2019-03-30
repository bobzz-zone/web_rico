
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Keyword      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/m_keyword'); ?>">Keyword</a></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Keyword</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_m_keyword" id="form_m_keyword" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Keyword </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($m_keyword->keyword); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Urutan </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($m_keyword->urutan); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('m_keyword_update', function() use ($m_keyword){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit m_keyword (Ctrl+e)" href="<?= site_url('administrator/m_keyword/edit/'.$m_keyword->id); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Keyword']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/m_keyword/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Keyword']); ?></a>
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
