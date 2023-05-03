<?php

/**
 * 檢測安裝
 */
function checkInstall()
{
    $lock_file = __DIR__ . '/../../storage/install/installed.lock';
    $install_file = __DIR__ . '/../../public/install';
    if (!file_exists($lock_file) && file_exists($install_file))
    {
        header("Location: /install/index.html");
        exit;
    }
    return true;
}
