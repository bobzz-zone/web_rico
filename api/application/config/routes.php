<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
| example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
| https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
| $route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
| $route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
| $route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples: my-controller/index -> my_controller/index
|   my-controller/my-method -> my_controller/my_method
*/
$route['default_controller'] = 'dashboard';
$route['404_override'] = '';
$route['translate_uri_dashes'] = TRUE;
/* Web Routes */
$route['sign-in'] = 'login';
$route['signed-in'] = 'login/login';
$route['sign-out'] = 'login/logout';

/*
| -------------------------------------------------------------------------
| Sample REST API Routes
| -------------------------------------------------------------------------
*/
$route['api/example/users/(:num)'] = 'api/example/users/id/$1'; // Example 4
$route['api/example/users/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/example/users/id/$1/format/$3$4'; // Example 8

/* REST API Routes */
//bank
$route['api/master/banks/(:num)'] = 'api/master/banks/index/id/$1'; // Example 4
$route['api/master/banks/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/master/banks/index/id/$1/format/$3$4'; // Example 8

$route['api/master/groups/(:num)'] = 'api/master/groups/index/id/$1'; // Example 4
$route['api/master/groups/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/master/groups/index/id/$1/format/$3$4'; // Example 8

$route['api/master/jenis/(:num)'] = 'api/master/jenis/index/id/$1'; // Example 4
$route['api/master/jenis/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/master/jenis/index/id/$1/format/$3$4'; // Example 8

$route['api/master/golongan/(:num)'] = 'api/master/golongan/index/id/$1'; // Example 4
$route['api/master/golongan/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/master/golongan/index/id/$1/format/$3$4'; // Example 8

$route['api/master/kelompok/(:num)'] = 'api/master/kelompok/index/id/$1'; // Example 4
$route['api/master/kelompok/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/master/kelompok/index/id/$1/format/$3$4'; // Example 8

$route['api/transactions/(:num)'] = 'api/transactions/index/id/$1'; // Example 4
$route['api/transactions/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/transactions/index/id/$1/format/$3$4'; // Example 8

//$route['api/transactions/(:any)'] = 'api/transactions/index/progress/$1'; // Example 4
//$route['api/transactions/(:any)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/transactions/index/progress/$1/format/$3$4'; // Example 8

$route['api/items/(:num)'] = 'api/items/index/id/$1'; // Example 4
$route['api/items/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/items/index/id/$1/format/$3$4'; // Example 8

$route['api/items/mine/(:num)'] = 'api/items/mine/id/$1'; // Example 4
$route['api/items/mine/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/items/mine/id/$1/format/$3$4'; // Example 8

$route['api/lelang/(:num)'] = 'api/lelang/index/id/$1'; // Example 4
$route['api/lelang/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/lelang/index/id/$1/format/$3$4'; // Example 8

$route['api/lelang/mine/(:num)'] = 'api/lelang/mine/id/$1'; // Example 4
$route['api/lelang/mine/(:num)(\.)([a-zA-Z0-9_-]+)(.*)'] = 'api/lelang/mine/id/$1/format/$3$4'; // Example 8
