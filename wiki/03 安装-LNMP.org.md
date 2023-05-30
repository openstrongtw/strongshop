> Gitee 倉庫地址：<a href="https://gitee.com/openstrong/strongshop" target="_blank">https://gitee.com/openstrong/strongshop</a>

> 本次安裝環境是 Windows 虛擬機器 CentOS7
> lnpm.org 官方安裝教程請參考：https://lnmp.org/install.html
> Web環境要求： `MySql 5.7+`,`Nginx 1.10+`,`PHP >= 7.2.5`
> 解除禁用函式 `proc_open`，`symlink`，`proc_get_status`

- 下載並解壓 lnmp 安裝包
```
cd /usr/local/src
wget http://soft.vpser.net/lnmp/lnmp1.8.tar.gz -cO lnmp1.8.tar.gz
tar zxf lnmp1.8.tar.gz
cd lnmp1.8
```

- 執行 shell 安裝指令碼
```
./install.sh lnmp
```

- 安裝 mysql
```
You have 11 options for your DataBase install.
1: Install MySQL 5.1.73
2: Install MySQL 5.5.62 (Default)
3: Install MySQL 5.6.51
4: Install MySQL 5.7.34
5: Install MySQL 8.0.25
6: Install MariaDB 5.5.68
7: Install MariaDB 10.1.48
8: Install MariaDB 10.2.38
9: Install MariaDB 10.3.29
10: Install MariaDB 10.4.19
0: DO NOT Install MySQL/MariaDB
Enter your choice (1, 2, 3, 4, 5, 6, 7, 8, 9, 10 or 0): 4
You will install MySQL 5.7.34
===========================
Please setup root password of MySQL.
Please enter: 123456
```
選擇4（安裝 Mysql 5.7.34）

設定mysql密碼：123456

- 啟用 Mysql InnoDB 儲存引擎

```
Do you want to enable or disable the InnoDB Storage Engine?
Default enable,Enter your choice [Y/n]:
```
選擇 Y，啟用

- 安裝 php
```
You have 9 options for your PHP install.
1: Install PHP 5.2.17
2: Install PHP 5.3.29
3: Install PHP 5.4.45
4: Install PHP 5.5.38
5: Install PHP 5.6.40 (Default)
6: Install PHP 7.0.33
7: Install PHP 7.1.33
8: Install PHP 7.2.34
9: Install PHP 7.3.29
10: Install PHP 7.4.21
11: Install PHP 8.0.8
Enter your choice (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11): 9
```
選擇9，Install PHP 7.3.29

- 安裝記憶體分配器
```
1: Don't install Memory Allocator. (Default)
2: Install Jemalloc
3: Install TCMalloc
Enter your choice (1, 2 or 3): 1
```
選擇 1，不安裝

- 回車進行安裝
```
Press any key to install...or Press Ctrl+c to cancel
```
安裝時長取決於機器效能，本虛擬機器配置為4核4G記憶體，安裝時長大約15分鐘。

- 執行環境安裝成功后檢查埠（80，3306）是否正常啟動
```
netstat -lpnt
```
輸出
```
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      75582/nginx: master 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1073/sshd           
tcp6       0      0 :::3306                 :::*                    LISTEN      76156/mysqld        
tcp6       0      0 :::22                   :::*                    LISTEN      1073/sshd
```

- 或者瀏覽器直接訪問 ip 地址
```
恭喜您，LNMP一鍵安裝包安裝成功！
```

- 解除 PHP 禁用函式
刪除禁用函式：`proc_open`，`symlink`，`proc_get_status`
```
vi /usr/local/php/etc/php.ini
```
修改爲：
```
disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,popen,ini_alter,ini_restore,dl,openlog,syslog,readlink,popepassthru,stream_socket_server
```

- 解除 NGINX open_basedir 限制
找到檔案 /usr/local/nginx/conf/fastcgi.conf，註釋以下：
```
#fastcgi_param PHP_ADMIN_VALUE "open_basedir=$document_root/:/tmp/:/proc/";
```

- 重啟服務
```
lnmp restart
```

---------------------------
### 下面開始下載並安裝 strongshop
- 建立目錄
```
mkdir -p /www/wwwroot
cd /www/wwwroot
```

- 下載專案
    - 通過 Git 克隆
    ```
    #安裝 git
    yum install git
    #安裝 compsoer
    yum install composer
    #設定 composer 使用阿里云 composer 映象
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
    #克隆專案
    git clone https://gitee.com/openstrong/strongshop.git
    #進入專案目錄
    cd strongshop
    #安裝 composer 包
    composer install
    ```
    > Tip
    > composer 包安裝完畢后，檢查 strongshop/vendor 目錄，如果存在說明包安裝成功，否則專案無法執行
    
    - 下載完整安裝包（如果無法通過git完成下載和安裝，可以使用此方式）
    <a href="/download" target="_blank">點選下載</a>

- 修改專案目錄權限
```
chmod 777 -R /www/wwwroot/strongshop/bootstrap
chmod 777 -R /www/wwwroot/strongshop/storage
```

- 建立站點

```
[root@192 strongshop]# lnmp vhost add
+-------------------------------------------+
|    Manager for LNMP, Written by Licess    |
+-------------------------------------------+
|              https://lnmp.org             |
+-------------------------------------------+
Please enter domain(example: www.lnmp.org): www.strongshop.test
 Your domain: www.strongshop.test
Enter more domain name(example: lnmp.org *.lnmp.org): 
Please enter the directory for the domain: www.strongshop.test
Default directory: /home/wwwroot/www.strongshop.test: /www/wwwroot/strongshop/public
Virtual Host Directory: /www/wwwroot/strongshop/public
Allow Rewrite rule? (y/n) y
Please enter the rewrite of programme, 
wordpress,discuzx,typecho,thinkphp,laravel,codeigniter,yii2 rewrite was exist.
(Default rewrite: other): laravel
You choose rewrite: laravel
Enable PHP Pathinfo? (y/n) y
Enable pathinfo.
Allow access log? (y/n) y
Enter access log filename(Default:www.strongshop.test.log): 
You access log filename: www.strongshop.test.log
Create database and MySQL user with same name (y/n) 
Add SSL Certificate (y/n) n

Press any key to start create virtul host...

Create Virtul Host directory......
set permissions of Virtual Host directory......
You select the exist rewrite rule:/usr/local/nginx/conf/rewrite/laravel.conf
Test Nginx configure file......
nginx: the configuration file /usr/local/nginx/conf/nginx.conf syntax is ok
nginx: configuration file /usr/local/nginx/conf/nginx.conf test is successful
Reload Nginx......
Reload service php-fpm  done
================================================
Virtualhost infomation:
Your domain: www.strongshop.test
Home Directory: /www/wwwroot/strongshop/public
Rewrite: laravel
Enable log: yes
Create database: no
Create ftp account: no
================================================
```

- 刪除檔案 `.user.ini`
```
cd /www/wwwroot/strongshop/public
chattr -i .user.ini
rm -f .user.ini
```

- 進入安裝頁面 http://www.strongshop.local/install
 <hr/>
 <img style="max-width:500px;" src="/images/install01.jpg" />

> Tip
> 如果無法安裝成功，請嘗試 <a href="/wiki/installHand">手動安裝</a>

- 安裝成功
1. 訪問站點首頁 http://www.strongshop.test
2. 訪問站點後臺 http://www.strongshop.test/admin/home <br>
超級管理員：`admin` 密碼：`123456`

- 配置計劃任務（建議一定要配置此項，否則會產生日誌爆滿問題）
請檢視  文件 - 功能&配置 - 計劃任務