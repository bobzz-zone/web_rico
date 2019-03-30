<?php

  function active_menu($curr_menu,$active_menu){
    if($curr_menu == $active_menu){
      return 'open';
    }
  }

  function active_submenu($curr_menu,$active_menu){
    if($curr_menu == $active_menu){
      return 'active';
    }
  }

 ?>
