<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StrongAdminMenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        //strongstrongadmin_menu
        $conn = config('strongadmin.storage.database.connection');
        $table_prefix = config("database.connections.{$conn}.prefix");
        \DB::connection($conn)->unprepared(<<<EOL
TRUNCATE TABLE `{$table_prefix}strongadmin_menu`;
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (1, 1, 0, '權限管理', NULL, 1, 2001, 0, '2021-01-06 03:37:40', '2021-05-21 20:10:57', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (2, 2, 1, '選單管理', 'strongadmin/adminMenu/index', 1, 200, 0, '2021-01-06 03:38:18', '2021-09-22 14:47:43', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (3, 3, 2, '列表檢視', 'strongadmin/adminMenu/index', 1, 200, 0, '2021-01-06 04:50:41', '2021-09-22 14:47:43', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (4, 3, 2, '新增', 'strongadmin/adminMenu/create', 1, 200, 0, '2021-01-06 04:51:07', '2021-09-22 14:47:43', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (5, 3, 2, '更新', 'strongadmin/adminMenu/update', 1, 200, 0, '2021-01-06 04:51:24', '2021-09-22 14:47:43', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (6, 3, 2, '刪除', 'strongadmin/adminMenu/destroy', 1, 200, 0, '2021-01-06 04:51:52', '2021-09-22 14:47:43', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (7, 1, 0, '產品管理', NULL, 1, 2000, 0, '2021-01-06 05:05:27', '2021-05-21 20:08:34', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (8, 2, 7, '產品列表', 'strongadmin/product/index', 1, 200, 0, '2021-01-06 05:06:02', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (10, 3, 8, '檢視', 'strongadmin/product/index', 1, 200, 0, '2021-01-06 05:07:49', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (11, 3, 8, '新增', 'strongadmin/product/create', 1, 200, 0, '2021-01-06 05:08:02', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (12, 3, 8, '更新', 'strongadmin/product/update', 1, 200, 0, '2021-01-06 05:08:18', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (13, 3, 8, '刪除', 'strongadmin/product/destroy', 1, 200, 0, '2021-01-06 05:08:37', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (14, 2, 1, '賬號管理', 'strongadmin/adminUser/index', 1, 200, 0, '2021-01-06 05:21:14', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (15, 3, 14, '檢視', 'strongadmin/adminUser/index', 1, 200, 0, '2021-01-06 05:22:05', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (16, 3, 14, '更新', 'strongadmin/adminUser/update', 1, 200, 0, '2021-01-06 05:22:45', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (17, 3, 14, '刪除', 'strongadmin/adminUser/destroy', 1, 200, 0, '2021-01-06 07:08:39', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (18, 2, 1, '角色管理', 'strongadmin/adminRole/index', 1, 200, 0, '2021-01-06 07:09:58', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (19, 3, 18, '檢視', 'strongadmin/adminRole/index', 1, 200, 0, '2021-01-06 07:10:18', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (20, 3, 18, '新增', 'strongadmin/adminRole/create', 1, 200, 0, '2021-01-06 07:10:30', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (21, 3, 18, '更新', 'strongadmin/adminRole/update', 1, 200, 0, '2021-01-06 07:10:48', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (22, 3, 18, '刪除', 'strongadmin/adminRole/destroy', 1, 200, 0, '2021-01-06 07:11:02', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (23, 2, 1, '操作日誌', 'strongadmin/adminLog/index', 1, 200, 0, '2021-01-07 13:40:48', '2021-09-22 14:47:44', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (24, 3, 23, '刪除', 'strongadmin/adminLog/destroy', 1, 200, 0, '2021-01-07 13:41:44', '2021-09-22 14:47:44', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (25, 3, 23, '檢視', 'strongadmin/adminLog/index', 1, 200, 0, '2021-01-08 02:27:07', '2021-09-22 14:47:44', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (26, 3, 18, '分配權限', 'strongadmin/adminRole/assignPermissions', 1, 200, 0, '2021-01-08 13:08:33', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (36, 1, 0, '主頁', NULL, 1, 99999, 0, '2021-01-08 14:59:46', '2021-01-09 13:58:51', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (37, 2, 36, '面板', 'strongadmin/index/panel', 1, 200, 0, '2021-01-08 16:38:33', '2021-09-22 14:47:44', 2);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (38, 3, 14, '建立', 'strongadmin/adminUser/create', 1, 200, 0, '2021-01-13 15:25:40', '2021-09-22 14:47:44', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (41, 2, 1, 'Telescope', 'strongadmin/telescope/requests', 1, 200, 0, '2021-01-19 17:19:57', '2021-09-22 15:32:56', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (42, 2, 7, '產品分類', 'strongadmin/product/category/index', 1, 200, 0, '2021-01-28 15:29:46', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (43, 3, 42, '檢視', 'strongadmin/product/category/index', 1, 200, 0, '2021-01-28 15:30:17', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (44, 3, 42, '建立', 'strongadmin/product/category/create', 1, 200, 0, '2021-01-28 15:30:34', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (45, 3, 42, '更新', 'strongadmin/product/category/update', 1, 200, 0, '2021-01-28 15:30:53', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (46, 3, 42, '刪除', 'strongadmin/product/category/destroy', 1, 200, 0, '2021-01-28 15:31:10', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (47, 1, 0, '文章管理', NULL, 1, 1500, 0, '2021-02-22 11:32:46', '2021-05-21 20:09:33', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (48, 2, 7, '產品規格', 'strongadmin/product/specGroup/index', 1, 200, 0, '2021-02-22 11:35:43', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (49, 3, 48, '規格組檢視', 'strongadmin/product/specGroup/index', 1, 200, 0, '2021-02-22 12:59:16', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (50, 3, 48, '規格組建立', 'strongadmin/product/specGroup/create', 1, 200, 0, '2021-02-22 12:59:39', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (51, 3, 48, '更新規格組', 'strongadmin/product/specGroup/update', 1, 200, 0, '2021-02-22 13:00:04', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (52, 3, 48, '刪除規格組', 'strongadmin/product/specGroup/destroy', 1, 200, 0, '2021-02-22 13:00:26', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (53, 3, 48, '檢視規格', 'strongadmin/product/spec/index', 1, 200, 0, '2021-02-22 13:22:51', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (54, 3, 48, '建立規格', 'strongadmin/product/spec/create', 1, 200, 0, '2021-02-22 13:23:22', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (55, 3, 48, '更新規格', 'strongadmin/product/spec/update', 1, 200, 0, '2021-02-22 13:23:38', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (56, 3, 48, '刪除規格', 'strongadmin/product/spec/destroy', 1, 200, 0, '2021-02-22 13:23:56', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (57, 2, 7, '產品品牌', 'strongadmin/product/brand/index', 1, 200, 0, '2021-03-15 14:38:53', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (58, 3, 57, '列表檢視', 'strongadmin/product/brand/index', 1, 200, 0, '2021-03-15 14:39:18', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (59, 3, 57, '建立', 'strongadmin/product/brand/create', 1, 200, 0, '2021-03-15 14:39:45', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (60, 3, 57, '修改', 'strongadmin/product/brand/update', 1, 200, 0, '2021-03-15 14:40:02', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (61, 3, 57, '刪除', 'strongadmin/product/brand/destroy', 1, 200, 0, '2021-03-15 14:40:50', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (62, 1, 0, '訂單管理', NULL, 1, 1800, 0, '2021-05-20 13:54:11', '2021-05-21 20:09:05', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (63, 2, 62, '訂單列表', 'strongadmin/order/index', 1, 200, 0, '2021-05-20 13:54:36', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (64, 2, 63, '更新訂單', 'strongadmin/order/update', 1, 200, 0, '2021-05-20 13:54:56', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (65, 2, 63, '刪除訂單', 'strongadmin/order/destroy', 1, 200, 0, '2021-05-20 13:55:53', '2021-09-22 14:47:45', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (66, 2, 63, '取消訂單', 'strongadmin/order/cancel', 1, 200, 0, '2021-05-20 13:56:35', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (68, 3, 63, '檢視訂單產品', 'strongadmin/order/products', 1, 200, 0, '2021-05-20 14:00:41', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (69, 3, 63, '檢視列表', 'strongadmin/order/index', 1, 200, 0, '2021-05-20 14:02:49', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (72, 1, 0, '會員管理', NULL, 1, 1900, 0, '2021-05-20 16:44:51', '2021-05-21 20:08:51', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (73, 2, 72, '會員列表', 'strongadmin/user/index', 1, 300, 0, '2021-05-20 16:45:23', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (74, 3, 73, '檢視', 'strongadmin/user/index', 1, 200, 0, '2021-05-20 16:45:45', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (75, 3, 73, '更新', 'strongadmin/user/update', 1, 200, 0, '2021-05-20 16:46:01', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (76, 3, 73, '刪除', 'strongadmin/user/destroy', 1, 200, 0, '2021-05-20 16:46:21', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (77, 2, 47, '文章分類', 'strongadmin/article/category/index', 1, 200, 0, '2021-05-28 16:48:03', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (78, 3, 77, '文章分類檢視', 'strongadmin/article/category/index', 1, 200, 0, '2021-05-28 16:48:46', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (79, 3, 77, '文章分類建立', 'strongadmin/article/category/create', 1, 200, 0, '2021-05-28 16:49:51', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (80, 3, 77, '文章分類更新', 'strongadmin/article/category/update', 1, 200, 0, '2021-05-28 16:50:13', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (81, 3, 77, '文章分類刪除', 'strongadmin/article/category/destroy', 1, 200, 0, '2021-05-28 16:50:33', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (82, 2, 47, '文章列表', 'strongadmin/article/article/index', 1, 200, 0, '2021-05-28 16:53:27', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (83, 3, 82, '檢視文章', 'strongadmin/article/article/index', 1, 200, 0, '2021-05-28 16:54:00', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (84, 3, 82, '建立文章', 'strongadmin/article/article/create', 1, 200, 0, '2021-05-28 16:54:19', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (85, 3, 82, '更新文章', 'strongadmin/article/article/update', 1, 200, 0, '2021-05-28 16:54:32', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (86, 3, 82, '刪除文章', 'strongadmin/article/article/destroy', 1, 200, 0, '2021-05-28 16:54:49', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (87, 2, 72, '意見反饋', 'strongadmin/user/feedback/index', 1, 200, 0, '2021-05-29 10:58:33', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (88, 3, 87, '檢視', 'strongadmin/user/feedback/index', 1, 200, 0, '2021-05-29 10:58:54', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (89, 3, 87, '回覆', 'strongadmin/user/feedback/update', 1, 200, 0, '2021-05-29 10:59:10', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (90, 3, 87, '刪除', 'strongadmin/user/feedback/destroy', 1, 200, 0, '2021-05-29 10:59:41', '2021-09-22 14:47:46', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (91, 2, 72, '會員等級', 'strongadmin/user/userRank/index', 1, 230, 0, '2021-06-01 11:26:43', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (92, 3, 91, '檢視', 'strongadmin/user/userRank/index', 1, 200, 0, '2021-06-01 11:27:27', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (93, 3, 91, '更新', 'strongadmin/user/userRank/update', 1, 200, 0, '2021-06-01 11:27:41', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (94, 3, 91, '刪除', 'strongadmin/user/userRank/desctroy', 1, 200, 0, '2021-06-01 11:28:01', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (95, 3, 91, '建立', 'strongadmin/user/userRank/create', 1, 200, 0, '2021-06-01 11:28:21', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (103, 1, 0, '網站設定', NULL, 1, 200, 0, '2021-08-01 20:43:33', '2021-08-01 20:43:33', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (104, 2, 103, '配送方式', 'strongadmin/shippingOption/index', 1, 200, 0, '2021-08-01 20:44:13', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (105, 2, 103, '支付方式', 'strongadmin/paymentOption/index', 1, 200, 0, '2021-08-02 09:52:12', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (106, 3, 105, '檢視', 'strongadmin/paymentOption/index', 1, 200, 0, '2021-08-02 09:52:26', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (107, 3, 105, '新增', 'strongadmin/paymentOption/create', 1, 200, 0, '2021-08-02 09:52:40', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (108, 3, 105, '更新', 'strongadmin/paymentOption/update', 1, 200, 0, '2021-08-02 09:52:53', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (109, 2, 103, '地區管理', 'strongadmin/region/regionCountry/index', 1, 200, 0, '2021-08-07 10:26:57', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (110, 3, 109, '國家列表', 'strongadmin/region/regionCountry/index', 1, 200, 0, '2021-08-07 11:06:47', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (111, 3, 109, '國家檢視', 'strongadmin/region/regionCountry/show', 1, 200, 0, '2021-08-07 11:07:29', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (112, 3, 109, '國家更新', 'strongadmin/region/regionCountry/update', 1, 200, 0, '2021-08-07 11:07:48', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (113, 3, 109, '國家刪除', 'strongadmin/region/regionCountry/destroy', 1, 200, 0, '2021-08-07 11:08:08', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (114, 3, 109, '大陸列表', 'strongadmin/region/regionContinent/index', 1, 200, 0, '2021-08-07 11:08:29', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (115, 3, 109, '大陸更新', 'strongadmin/region/regionContinent/update', 1, 200, 0, '2021-08-07 11:08:43', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (116, 3, 109, '大陸刪除', 'strongadmin/region/regionContinent/destroy', 1, 200, 0, '2021-08-07 11:09:01', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (117, 3, 109, '大陸新增', 'strongadmin/region/regionContinent/create', 1, 200, 0, '2021-08-07 11:09:21', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (118, 3, 109, '國家新增', 'strongadmin/region/regionCountry/create', 1, 201, 0, '2021-08-07 11:09:38', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (120, 2, 103, '網站設定', 'strongadmin/webconfig/show', 1, 300, 0, '2021-08-07 13:06:43', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (121, 3, 63, '關閉訂單', 'strongadmin/order/confirm/close', 1, 200, 0, '2021-08-08 13:56:21', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (122, 3, 63, '確認訂單付款', 'strongadmin/order/confirm/paid', 1, 200, 0, '2021-08-08 13:56:43', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (123, 3, 63, '確認訂單發貨', 'strongadmin/order/confirm/shipped', 1, 200, 0, '2021-08-08 13:56:52', '2021-09-22 14:47:47', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (124, 3, 63, '確認訂單退貨', 'strongadmin/order/confirm/returned', 1, 200, 0, '2021-08-08 13:57:05', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (125, 3, 63, '確認訂單完成', 'strongadmin/order/confirm/done', 1, 200, 0, '2021-08-08 13:57:14', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (126, 3, 63, '列印訂單', 'strongadmin/order/print', 1, 200, 0, '2021-08-08 13:57:23', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (127, 3, 63, '訂單詳情', 'strongadmin/order/show', 1, 200, 0, '2021-08-08 13:57:31', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (128, 3, 120, '儲存網站配置', 'strongadmin/webconfig/save/config', 1, 200, 0, '2021-08-19 18:16:48', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (129, 3, 120, '設定詳情', 'strongadmin/webconfig/show', 1, 200, 0, '2021-08-19 18:17:49', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (130, 3, 104, '檢視', 'strongadmin/shippingOption/index', 1, 200, 0, '2021-09-07 18:26:28', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (131, 3, 104, '更新', 'strongadmin/shippingOption/update', 1, 200, 0, '2021-09-07 18:27:03', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (132, 3, 104, '配送區域列表', 'strongadmin/shippingOptionConfig/index', 1, 200, 0, '2021-09-07 18:29:55', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (133, 3, 104, '配送區域建立', 'strongadmin/shippingOptionConfig/create', 1, 200, 0, '2021-09-07 18:30:16', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (134, 3, 104, '配送區域更新', 'strongadmin/shippingOptionConfig/update', 1, 200, 0, '2021-09-07 18:30:30', '2021-09-22 14:47:48', 1);
INSERT INTO `{$table_prefix}strongadmin_menu` (`id`, `level`, `parent_id`, `name`, `route_url`, `status`, `sort`, `is_hidden_list`, `created_at`, `updated_at`, `delete_allow`) VALUES (135, 3, 104, '配送區域刪除', 'strongadmin/shippingOptionConfig/destroy', 1, 200, 0, '2021-09-07 18:30:47', '2021-09-22 14:47:48', 1);
EOL);

    }
}
