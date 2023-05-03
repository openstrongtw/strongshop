<?php

//$mysql_conf = array(
//    'host' => '127.0.0.1:3306',
//    'db' => 'test',
//    'db_user' => 'root',
//    'db_pwd' => 'joshua317',
//);
//try {
//    $pdo = new PDO("mysql:host=" . $mysql_conf['host'] . ";dbname=" . $mysql_conf['db'], $mysql_conf['db_user'], $mysql_conf['db_pwd']); //创建一个pdo对象
//    $pdo->exec("set names 'utf8mb4'");
//} catch (Exception $exc) {
//    exit("aaaa:" .$exc->getMessage());
//}

$servername = "localhost:3306";
$username = "root";
$password = "123456";
try {
    $conn = new PDO("mysql:host=$servername", $username, $password);
    // 设置 PDO 错误模式为异常
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "CREATE DATABASE myDBPDO1";
    // 使用 exec() ，因为没有结果返回
    $conn->exec($sql);
    echo "数据库创建成功<br>";
} catch (Exception $e) {
    echo $sql . "<br>" . $e->getMessage();
}
$conn = null;
