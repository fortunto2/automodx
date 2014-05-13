<?php
/**
 * MODx Configuration file
 */
$database_type = 'mysql';
$database_server = 'localhost';
$database_user = 'tester5_pevm_ru';
$database_password = '***';
$database_connection_charset = 'utf8';
$database_connection_method = 'SET CHARACTER SET';
$dbase = '`tester5_pevm_ru`';
$table_prefix = 'modx_';
error_reporting(E_ALL & ~E_NOTICE);

$lastInstallTime = 1361394910;

$site_sessionname = 'SN51253cdea1930';
$https_port = '443';

include_once(dirname(__FILE__)."/../../assets/cache/siteManager.php");

// automatically assign base_path and base_url
if(empty($base_path)||empty($base_url)||$_REQUEST['base_path']||$_REQUEST['base_url']) {
    $sapi= 'undefined';
    if (!strstr($_SERVER['PHP_SELF'], $_SERVER['SCRIPT_NAME']) && ($sapi= @ php_sapi_name()) == 'cgi') {
        $script_name= $_SERVER['PHP_SELF'];
    } else {
        $script_name= $_SERVER['SCRIPT_NAME'];
    }
    $a= explode("/".MGR_DIR, str_replace("\\", "/", dirname($script_name)));
    if (count($a) > 1)
        array_pop($a);
    $url= implode(MGR_DIR, $a);
    reset($a);
    $a= explode(MGR_DIR, str_replace("\\", "/", dirname(__FILE__)));
    if (count($a) > 1)
        array_pop($a);
    $pth= implode(MGR_DIR, $a);
    unset ($a);
    $base_url= $url . (substr($url, -1) != "/" ? "/" : "");
    $base_path= $pth . (substr($pth, -1) != "/" && substr($pth, -1) != "\\" ? "/" : "");
}
// assign site_url
$site_url= ((isset ($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') || $_SERVER['SERVER_PORT'] == $https_port) ? 'https://' : 'http://';
$site_url .= $_SERVER['HTTP_HOST'];
if ($_SERVER['SERVER_PORT'] != 80)
    $site_url= str_replace(':' . $_SERVER['SERVER_PORT'], '', $site_url); // remove port from HTTP_HOST  
$site_url .= ($_SERVER['SERVER_PORT'] == 80 || (isset ($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') || $_SERVER['SERVER_PORT'] == $https_port) ? '' : ':' . $_SERVER['SERVER_PORT'];
$site_url .= $base_url;

if (!defined('MODX_BASE_PATH')) define('MODX_BASE_PATH', $base_path);
if (!defined('MODX_BASE_URL')) define('MODX_BASE_URL', $base_url);
if (!defined('MODX_SITE_URL')) define('MODX_SITE_URL', $site_url);
if (!defined('MODX_MANAGER_PATH')) define('MODX_MANAGER_PATH', $base_path.MGR_DIR.'/');
if (!defined('MODX_MANAGER_URL')) define('MODX_MANAGER_URL', $site_url.MGR_DIR.'/');

// start cms session
if(!function_exists('startCMSSession')) {
    function startCMSSession(){
        global $site_sessionname;
        session_name($site_sessionname);
        session_start();
        $cookieExpiration= 0;
        if (isset ($_SESSION['mgrValidated']) || isset ($_SESSION['webValidated'])) {
            $contextKey= isset ($_SESSION['mgrValidated']) ? 'mgr' : 'web';
            if (isset ($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime']) && is_numeric($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime'])) {
                $cookieLifetime= intval($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime']);
            }
            if ($cookieLifetime) {
                $cookieExpiration= time() + $cookieLifetime;
            }
            if (!isset($_SESSION['modx.session.created.time'])) {
              $_SESSION['modx.session.created.time'] = time();
            }
        }
        setcookie(session_name(), session_id(), $cookieExpiration, MODX_BASE_URL);
    }
}
?>