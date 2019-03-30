
<script src="{php_open_tag_echo} BASE_ASSET; {php_close_tag}/js/jquery.hotkeys.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      <?= ucwords($subject); ?>
      
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="{php_open_tag_echo} site_url('administrator/{table_name}'); {php_close_tag}"><?= ucwords($subject); ?></a></li>
      <li class="active">{php_open_tag_echo} cclang('detail'); {php_close_tag}</li>
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
                     <h5 class="widget-user-desc" style="margin-left: 0px">Detail <?= ucwords($subject); ?></h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_{table_name}" id="form_{table_name}" >
                  <?php foreach ($this->crud_builder->getFieldShowInDetailPage(true) as $input => $option): 
                    $relation = $this->crud_builder->getFieldRelation($input);
                  ?> 
                  <?php if ($this->crud_builder->getFieldFile($input)) {?>  <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> <?= ucwords(clean_snake_case($option['label'])); ?> </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             {php_open_tag} if (is_image($<?= $table_name; ?>-><?= $input; ?>)): {php_close_tag}
                              <a class="fancybox" rel="group" href="{php_open_tag_echo} BASE_URL . 'uploads/<?= $table_name; ?>/' . $<?= $table_name; ?>-><?= $input;?>; {php_close_tag}">
                                <img src="{php_open_tag_echo} BASE_URL . 'uploads/<?= $table_name; ?>/' . $<?= $table_name; ?>-><?= $input;?>; {php_close_tag}" class="image-responsive" alt="image <?= $table_name; ?>" title="<?= $input; ?> <?= $table_name; ?>" width="40px">
                              </a>
                              {php_open_tag} else: {php_close_tag}
                              <label>
                                <a href="{php_open_tag_echo} BASE_URL . 'administrator/file/download/<?= $table_name; ?>/' . $<?= $table_name; ?>-><?= $input;?>; {php_close_tag}">
                                 <img src="{php_open_tag_echo} get_icon_file($<?= $table_name; ?>-><?= $input; ?>); {php_close_tag}" class="image-responsive" alt="image <?= $table_name; ?>" title="<?= $input; ?> {php_open_tag_echo} $<?= $table_name; ?>-><?= $input; ?>; {php_close_tag}" width="40px"> 
                               {php_open_tag_echo} $<?= $table_name; ?>-><?= $input; ?> {php_close_tag}
                               </a>
                               </label>
                              {php_open_tag} endif; {php_close_tag}
                        </div>
                    </div>
                  <?php } elseif ($this->crud_builder->getFieldFileMultiple($input)) {?>  <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> <?= ucwords(clean_snake_case($option['label'])); ?> </label>
                        <div class="col-sm-8"  style="padding-top:7px;">
                             {php_open_tag} if (!empty($<?= $table_name; ?>-><?= $input; ?>)): {php_close_tag}
                             {php_open_tag} foreach (explode(',', $<?= $table_name; ?>-><?= $input; ?>) as $filename): {php_close_tag}
                               {php_open_tag} if (is_image($<?= $table_name; ?>-><?= $input; ?>)): {php_close_tag}
                                <a class="fancybox" rel="group" href="{php_open_tag_echo} BASE_URL . 'uploads/<?= $table_name; ?>/' . $filename; {php_close_tag}">
                                  <img src="{php_open_tag_echo} BASE_URL . 'uploads/<?= $table_name; ?>/' . $filename; {php_close_tag}" class="image-responsive" alt="image <?= $table_name; ?>" title="<?= $input; ?> <?= $table_name; ?>" width="40px">
                                </a>
                                {php_open_tag} else: {php_close_tag}
                                <label>
                                  <a href="{php_open_tag_echo} BASE_URL . 'administrator/file/download/<?= $table_name; ?>/' . $filename; {php_close_tag}">
                                   <img src="{php_open_tag_echo} get_icon_file($filename); {php_close_tag}" class="image-responsive" alt="image <?= $table_name; ?>" title="<?= $input; ?> {php_open_tag_echo} $filename; {php_close_tag}" width="40px"> 
                                 {php_open_tag_echo} $filename {php_close_tag}
                               </a>
                               </label>
                              {php_open_tag} endif; {php_close_tag}
                            {php_open_tag} endforeach; {php_close_tag}
                          {php_open_tag} endif; {php_close_tag}
                        </div>
                    </div>
                  <?php } elseif ($relation) {?>  <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"><?= ucwords(clean_snake_case($option['label'])); ?> </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           {php_open_tag_echo} _ent(${table_name}-><?= $relation['relation_label']; ?>); {php_close_tag}
                        </div>
                    </div>
				  <?php } elseif ($option['input_type'] == "editor_wysiwyg") {?>	
						
					<div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"><?= ucwords(clean_snake_case($input)); ?> </label>

                        <div class="col-sm-8" style="padding-top:7px;">
                           {php_open_tag_echo} ${table_name}-><?= $input; ?>; {php_close_tag}
                        </div>
                    </div>
					<?php } else {?>  <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"><?= ucwords(clean_snake_case($option['label'])); ?> </label>

                        <div class="col-sm-8"  style="padding-top:7px;">
                           {php_open_tag_echo} _ent(${table_name}-><?= $input; ?>); {php_close_tag}
                        </div>
                    </div>
                    <?php } ?>
                    <?php endforeach; ?>

                    <br>
                    <br>

                    <div class="view-nav">
                        {php_open_tag} is_allowed('{table_name}_update', function() use (${table_name}){{php_close_tag}
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit {table_name} (Ctrl+e)" href="{php_open_tag_echo} site_url('administrator/{table_name}/edit/'.${table_name}->{primary_key}); {php_close_tag}"><i class="fa fa-edit" ></i> {php_open_tag_echo} cclang('update', ['<?= ucwords(clean_snake_case($subject)); ?>']); {php_close_tag} </a>
                        {php_open_tag} }) {php_close_tag}
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="{php_open_tag_echo} site_url('administrator/{table_name}/'); {php_close_tag}"><i class="fa fa-undo" ></i> {php_open_tag_echo} cclang('go_list_button', ['<?= ucwords(clean_snake_case($subject)); ?>']); {php_close_tag}</a>
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
