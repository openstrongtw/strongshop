<?php

//error_reporting(E_ALL);
$lock = __DIR__ . '/../../' . 'storage/install/installed.lock';
if (file_exists($lock))
{
    exit(json_encode(array(
        'code' => 5001,
        'message' => '<font color="red">您已安装过，请删除 public/install 安装文件夹！</font>',
    )));
}

$cmd = isset($_REQUEST['cmd']) ? $_REQUEST['cmd'] : null;
$log_file = __DIR__ . '/log.txt';

if (!empty($_REQUEST))
{
    foreach ($_REQUEST as &$_rval)
    {
        $_rval = trim($_rval);
    }
}

if ($cmd === 'checkPHP')
{
    checkPHP();
} elseif ($cmd === 'checkDB')
{
    $res = checkDB();
    if ($res)
    {
        exit(json_encode(array(
            'code' => 200,
            'message' => '<font color="green">数据库连接成功！</font>',
        )));
    }
} elseif ($cmd === 'pullLog')
{
    $contents = file_get_contents($log_file);
    exit(json_encode(array('code' => 200, 'message' => '', 'data' => $contents)));
} else
{
    file_put_contents($log_file, "正在安装 ... <br/><br/>\n");
    sleep(2);

    checkPHP(1);
    checkDB();

    try {
        file_put_contents($log_file, "安装产品测试图片 ...<br/>\n", FILE_APPEND);
        sleep(1);
        $imgfile = __DIR__ . '/../../storage/install/products_images.tar';
        $phar = new PharData($imgfile);
        $phar->extractTo(__DIR__ . '/../../storage/app/public', null, true);
        file_put_contents($log_file, "产品测试图片安装成功。<br/><br/>\n", FILE_APPEND);
    } catch (\Exception $exc) {
        file_put_contents($log_file, "<font color='red'>产品测试图片安装失败。" . $exc->getMessage() . "</font><br/><br/>\n", FILE_APPEND);
    }

    if (file_exists(__DIR__ . '/../storage'))
    {
        file_put_contents($log_file, "符号软链接已存在：public/storage。<br/><br/>\n", FILE_APPEND);
    } else
    {
        if (function_exists('symlink'))
        {
            file_put_contents($log_file, "创建符号软链接：public/storage<br/>\n", FILE_APPEND);
            sleep(1);
            $target = dirname(dirname(__DIR__)) . '/storage/app/public';
            $link = dirname(__DIR__) . '/storage';
            @symlink($target, $link);
            file_put_contents($log_file, "符号软链接创建成功<br/><br/>\n", FILE_APPEND);
        } else
        {
            file_put_contents($log_file, "<font color='red'>符号软链接创建失败：public/storage，原因：函数 symlink <font color='red'>已禁用</font>。</font><br/><br/>\n", FILE_APPEND);
        }
    }


    $dbhost = isset($_REQUEST['host']) ? $_REQUEST['host'] : '';
    $dbport = isset($_REQUEST['port']) ? $_REQUEST['port'] : '';
    $dbname = isset($_REQUEST['database']) ? $_REQUEST['database'] : '';
    $dbuser = isset($_REQUEST['username']) ? $_REQUEST['username'] : '';
    $dbpass = isset($_REQUEST['password']) ? $_REQUEST['password'] : '';

    try {
        $pdo = new PDO("mysql:host={$dbhost}:{$dbport}", $dbuser, $dbpass); //创建一个pdo对象
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '{$dbname}'";
        $result = $pdo->query($sql)->fetch();
        if (is_bool($result) && !$result)
        {
            file_put_contents($log_file, "创建数据库：{$dbname}<br/>\n", FILE_APPEND);
            sleep(1);
            $pdo->exec("set names 'utf8mb4'");
            $sql = "CREATE DATABASE {$dbname}";
            $pdo->exec($sql);
            file_put_contents($log_file, "数据库创建成功<br/><br/>\n", FILE_APPEND);
        } else
        {
            file_put_contents($log_file, "数据库已存在：{$dbname}<br/>\n", FILE_APPEND);
        }
    } catch (\Exception $exc) {
        exit(json_encode(array(
            'code' => 4001,
            'message' => '<font color="red">数据库连接失败：' . $exc->getMessage() . '</font>',
            'data' => array($exc->getCode())
        )));
    }

    try {
        file_put_contents($log_file, "安装数据表和测试数据 ...<br/>\n", FILE_APPEND);
        sleep(1);
        $sql = file_get_contents(__DIR__ . '/../../import.sql');
        $pdo = new PDO("mysql:host={$dbhost}:{$dbport};dbname={$dbname}", $dbuser, $dbpass); //创建一个pdo对象
        $pdo->exec($sql);
        file_put_contents($log_file, "数据表和测试数据安装成功。<br/><br/>\n", FILE_APPEND);
    } catch (\Exception $exc) {
        exit(json_encode(array(
            'code' => 4001,
            'message' => '<font color="red">错误：' . $exc->getMessage() . '</font>',
            'data' => array($exc->getCode())
        )));
    }

    $env_file = __DIR__ . '/../../.env';
    if (!file_exists($env_file))
    {
        @copy(__DIR__ . '/../../.env.example', __DIR__ . '/../../.env');
    }
    $env_file_content = file_get_contents($env_file);
    $env_file_content = str_replace('ST_HOST', $dbhost, $env_file_content);
    $env_file_content = str_replace('ST_PORT', $dbport, $env_file_content);
    $env_file_content = str_replace('ST_DB', $dbname, $env_file_content);
    $env_file_content = str_replace('ST_USER', $dbuser, $env_file_content);
    $env_file_content = str_replace('ST_PWD', $dbpass, $env_file_content);
    file_put_contents($env_file, $env_file_content);

    $scheme = isset($_SERVER['REQUEST_SCHEME']) ? $_SERVER['REQUEST_SCHEME'] : 'http';
    $host = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME'];
    $http = $scheme . '://' . $host;
    $done = '<font color="green">安装完毕。</font><br/><br/>';
    $done .= "前台站点：<a href='{$http}' target='_blank'>{$http}</a><br/>";
    $done .= "后台管理：<a href='{$http}:/admin/home' target='_blank'>{$http}/admin/home</a><br/>";
    $done .= "后台账号：admin 密码：123456";
    file_put_contents($log_file, $done, FILE_APPEND);

    $lock_file = __DIR__ . '/../../storage/install/installed.lock';
    file_put_contents($lock_file, date('Y-m-d H:i:s'));

    exit(json_encode(array(
        'code' => 200,
        'message' => '<font color="green">安装完毕。</font>',
    )));
}

function checkPHP($return = false)
{
    $_php_version = PHP_VERSION;
    $php_version = floatval(substr(PHP_VERSION, 0, 3));
    $data[] = array(
        'v1' => "php {$_php_version}",
        'v2' => $php_version >= 7.2 ? '<font color="green">可用</font>' : '<font color="red">不可用</font>',
        'v3' => $php_version >= 7.2 ? 1 : 0
    );
    $data[] = array(
        'v1' => 'gd 扩展',
        'v2' => extension_loaded('gd') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
        'v3' => extension_loaded('gd') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'mysqli 扩展',
        'v2' => extension_loaded('mysqli') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
    );
    $data[] = array(
        'v1' => 'pdo_mysql 扩展',
        'v2' => extension_loaded('pdo_mysql') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
        'v3' => extension_loaded('pdo_mysql') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'curl 扩展',
        'v2' => extension_loaded('curl') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
        'v3' => extension_loaded('curl') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'openssl 扩展',
        'v2' => extension_loaded('openssl') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
    );
    $data[] = array(
        'v1' => 'fileinfo 扩展',
        'v2' => extension_loaded('fileinfo') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
        'v3' => extension_loaded('fileinfo') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'symlink 函数',
        'v2' => function_exists('symlink') ? '<font color="green">已启用</font>' : '<font color="red">已禁用</font>',
        'v3' => function_exists('symlink') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'bootstrap 文件夹',
        'v2' => is_writable(dirname(dirname(__DIR__)) . '/bootstrap') ? '<font color="green">可读写</font>' : '<font color="red">不可读写</font>',
        'v3' => is_writable(dirname(dirname(__DIR__)) . '/bootstrap') ? 1 : 0,
    );
    $data[] = array(
        'v1' => 'storage 文件夹',
        'v2' => is_writable(dirname(dirname(__DIR__)) . '/storage') ? '<font color="green">可读写</font>' : '<font color="red">不可读写</font>',
        'v3' => is_writable(dirname(dirname(__DIR__)) . '/storage') ? 1 : 0,
    );

    $error = 0;
    foreach ($data as $val)
    {
        if (isset($val['v3']) && $val['v3'] == 0)
        {
            $error = 1;
            $message = $val['v1'] . ' ' . $val['v2'];
            if ($return)
            {
                exit(json_encode(array('code' => 4001, 'message' => $message)));
            }
        }
    }
    if ($return)
    {
        return true;
    }
    exit(json_encode(array(
        'code' => 200,
        'message' => 'success',
        'data' => array(
            'gd' => $gd,
            'mysqli' => $mysqli,
            'pdo_mysql' => $pdo_mysql,
            'curl' => $curl,
            'openssl' => $openssl,
        ),
        'list' => $data,
        'error' => $error,
    )));
}

function checkDB()
{
    $dbhost = isset($_REQUEST['host']) ? $_REQUEST['host'] : '';
    $dbport = isset($_REQUEST['port']) ? $_REQUEST['port'] : '';
    $dbname = isset($_REQUEST['database']) ? $_REQUEST['database'] : '';
    $dbuser = isset($_REQUEST['username']) ? $_REQUEST['username'] : '';
    $dbpass = isset($_REQUEST['password']) ? $_REQUEST['password'] : '';
    ob_start();
    $link = mysqli_connect($dbhost, $dbuser, $dbpass, null, $dbport);
    if (!$link)
    {
        echo '<br/><br/>连接失败，请检测密码或MySQL 是否启动 ?? ' . mysqli_error();
    }
    $buf = ob_get_contents();
    ob_end_clean();
    if ($buf)
    {
        exit(json_encode(array(
            'code' => 4001,
            'message' => $buf,
        )));
    }
    try {

        $pdo = new PDO("mysql:host={$dbhost}:{$dbport}", $dbuser, $dbpass); //创建一个pdo对象
    } catch (\Exception $exc) {
        exit(json_encode(array(
            'code' => 4001,
            'message' => '<font color="red">数据库连接失败：' . $exc->getMessage() . '</font>',
        )));
    }
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT version();";
    $result = $pdo->query($sql)->fetch();
    if (isset($result[0]))
    {
        $version = floatval($result[0]);
        if ($version < 5.7)
        {
            exit(json_encode(array(
                'code' => 4001,
                'message' => '<font color="red">mysql' . $result[0] . '：版本低于要求，请使用 Mysql5.7+</font>',
            )));
        }
    }
    return $pdo;
}
