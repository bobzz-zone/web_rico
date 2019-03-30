
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Ads      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/m_ads'); ?>">Ads</a></li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail Ads</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_m_ads" id="form_m_ads" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Nama Ads </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($m_ads->nama_ads); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> Foto </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             <?php if (is_image($m_ads->foto)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/m_ads/' . $m_ads->foto; ?>">
                                <img src="<?= BASE_URL . 'uploads/m_ads/' . $m_ads->foto; ?>" class="image-responsive" alt="image m_ads" title="foto m_ads" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/m_ads/' . $m_ads->foto; ?>">
                                 <img src="<?= get_icon_file($m_ads->foto); ?>" class="image-responsive" alt="image m_ads" title="foto <?= $m_ads->foto; ?>" width="40px"> 
                               <?= $m_ads->foto ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                       
                  	
						
					<div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Url </label>

                        <div class="col-sm-8" style="padding-top:7px;">
                           <?= $m_ads->url; ?>
                        </div>
                    </div>
					                     
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">Posisi </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           <?= _ent($m_ads->posisi); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('m_ads_update', function() use ($m_ads){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit m_ads (Ctrl+e)" href="<?= site_url('administrator/m_ads/edit/'.$m_ads->id); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Ads']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/m_ads/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Ads']); ?></a>
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
