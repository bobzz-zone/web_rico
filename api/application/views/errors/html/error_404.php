<!DOCTYPE html>
<?php $base_url = load_class('Config')->config['base_url'];?>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>404 Nothing Found</title>

        <!-- inject:css -->
        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/bower_components/simple-line-icons/css/simple-line-icons.css">
        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/bower_components/weather-icons/css/weather-icons.min.css">
        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/bower_components/themify-icons/css/themify-icons.css">
        <!-- endinject -->

        <link rel="stylesheet" href="<?php echo $base_url;?>assets/backend/dist/css/main.css">

        <script src="<?php echo $base_url;?>assets/backend/js/modernizr-custom.js"></script>
    </head>
    <body>

        <div class="sign-in-wrapper">
            <div class="sign-container lock-bg">
                <div class="text-center">
                    <h1 class="error-txt">404</h1>

                    <h3>Nothing Found!</h3>
                    <p>Something went wrong or what you are looking for doesn’t exist.</p>
                </div>
                
            </div>
        </div>

        <!-- inject:js -->
        <script src="<?php echo $base_url;?>assets/backend/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="<?php echo $base_url;?>assets/backend/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="<?php echo $base_url;?>assets/backend/bower_components/jquery.nicescroll/dist/jquery.nicescroll.min.js"></script>
        <script src="<?php echo $base_url;?>assets/backend/bower_components/autosize/dist/autosize.min.js"></script>
        <!-- endinject -->

        <script src="<?php echo $base_url;?>assets/backend/dist/js/main.js"></script>

    </body>
</html>
