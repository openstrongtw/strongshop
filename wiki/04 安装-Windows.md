> Gitee 倉庫地址：<a href="https://gitee.com/openstrong/strongshop" target="_blank">https://gitee.com/openstrong/strongshop</a>

> 這裡以 PhpStudy 整合環境為例，下載安裝 PhpStudy：<a href="http://www.xp.cn" target="_blank">http://www.xp.cn</a>
> Web環境要求： `MySql 5.7+`,`Nginx 1.10+`,`PHP >= 7.2.5`

- 下載專案
    - 通過 Git 克隆（推薦）
    1. 安裝 Git <a href="https://git-scm.com/download/win" target="_blank">https://git-scm.com/download/win</a>
    2. 安裝 Composer <a href="https://getcomposer.org/download" target="_blank">https://getcomposer.org/download</a>
    ```
    #設定 composer 使用阿里云 composer 映象
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
    ```
    > Tip
    > 安裝 composer 時請選擇 >=php7.2.5 的 exe 執行程式

    ```
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

- 建立網站
<hr/>
<img style="max-width:650px;" src="/images/install02.jpg" />
> Tip
> 專案執行目錄為 strongshop/public
> 請勾選 同步hosts，如果 hosts 因為本地電腦許可權問題未同步成功，請手動把 `127.0.0.1 www.strongshop.local` 放入 HOSTS 檔案內

- 偽靜態 （必須配置，否則無法訪問）

    - Nginx 偽靜態
    ```
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    ```

    - Apache 偽靜態
    ```
        Options +FollowSymLinks -Indexes
        RewriteEngine On

        RewriteCond %{HTTP:Authorization} .
        RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^ index.php [L]
    ```

- 進入安裝頁面 http://www.strongshop.local

<hr/>
 <img style="max-width:500px;" src="/images/install01.jpg" />

> Tip
> 如果無法安裝成功，請嘗試 <a href="/wiki/installHand">手動安裝</a>

- 安裝成功
1. 訪問站點首頁 http://www.strongshop.local
2. 訪問站點後臺 http://www.strongshop.local/admin/home <br>
超級管理員：`admin` 密碼：`123456`


