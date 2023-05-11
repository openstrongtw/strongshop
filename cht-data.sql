/*
 Navicat MySQL Data Transfer

 Source Server         : strongshop.testing
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:6306
 Source Schema         : strongshop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 28/09/2021 11:23:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for st_article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '文章分類id',
                            `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '標題',
                            `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面圖',
                            `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '內容',
                            `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作者',
                            `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態 1開啟,2禁用',
                            `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
                            `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                            `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                            `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                            `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 關鍵字',
                            `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 描述',
                            `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '內容來源',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `cate_id`(`category_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌名稱',
                          `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌logo',
                          `more` json NULL COMMENT '更多其他配置',
                          `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態 1開啟,2禁用',
                          `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
                          `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                          `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                          PRIMARY KEY (`id`) USING BTREE,
                          UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, '耐克', '/storage/202103/4BFxWMmCMxQixHbeVWcGC6KMzHqFQJWVei8EopoO.png', NULL, 1, 201, '2021-03-15 15:01:06', '2021-03-15 16:11:24');
INSERT INTO `brand` VALUES (2, '李寧', '/storage/202103/UURNBaYZYI5bVCf46TUTKF9YqNjOhautQbYRZ7lU.png', NULL, 1, 200, '2021-03-15 15:04:42', '2021-03-15 16:11:13');

-- ----------------------------
-- Table structure for st_category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
                             `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分類id',
                             `type` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '型別：1 產品分類，2 文章分類',
                             `level` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等級 1 一級, 2 二級, 3 三級',
                             `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上級id',
                             `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分類名稱',
                             `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態 1開啟,2禁用',
                             `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
                             `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                             `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                             `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                             `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'meta 關鍵字',
                             `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'meta 描述',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分類表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, 1, 0, '{\"en\":\"Electronics\",\"zh-CN\":\"\\u7535\\u5b50\\u4ea7\\u54c1\"}', 1, 100, '2021-03-15 15:24:20', '2022-01-22 11:26:27', NULL, NULL, NULL);
INSERT INTO `category` VALUES (2, 1, 2, 1, '{\"en\":\"Computers\",\"zh-CN\":\"\\u7535\\u8111\"}', 1, 200, '2021-03-15 15:24:29', '2022-01-22 11:33:03', NULL, NULL, NULL);
INSERT INTO `category` VALUES (3, 1, 2, 1, '{\"en\":\"Mobile Phone\",\"zh-CN\":\"\\u624b\\u673a\"}', 1, 200, '2021-03-15 15:24:37', '2022-01-22 11:33:45', NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, 1, 2, 1, '{\"en\":\"Pad\",\"zh-CN\":\"\\u5e73\\u677f\"}', 1, 200, '2021-03-15 15:24:46', '2022-01-22 11:33:57', NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, 1, 1, 0, '{\"en\":\"Women\'s Clothing\",\"zh-CN\":\"\\u5973\\u88c5\"}', 1, 200, '2021-03-15 15:25:07', '2022-01-22 11:24:26', NULL, NULL, NULL);
INSERT INTO `category` VALUES (6, 1, 2, 5, '{\"en\":\"Dress\",\"zh-CN\":\"\\u8fde\\u8863\\u88d9\"}', 1, 200, '2021-03-15 15:25:19', '2022-01-22 12:51:05', NULL, NULL, NULL);
INSERT INTO `category` VALUES (7, 1, 2, 5, '{\"en\":\"Upper\",\"zh-CN\":\"\\u4e0a\\u8863\"}', 1, 200, '2021-03-15 15:25:31', '2022-01-22 12:55:40', NULL, NULL, NULL);
INSERT INTO `category` VALUES (8, 1, 2, 5, '{\"en\":\"Coats\",\"zh-CN\":\"\\u5916\\u5957\"}', 1, 200, '2021-03-15 15:25:39', '2022-01-22 13:09:12', NULL, NULL, NULL);
INSERT INTO `category` VALUES (9, 1, 3, 6, '{\"en\":\"Short Dress\",\"zh-CN\":\"\\u77ed\\u8896\\u8fde\\u8863\\u88d9\"}', 1, 200, '2021-03-15 15:25:50', '2022-01-22 12:51:21', NULL, NULL, NULL);
INSERT INTO `category` VALUES (10, 1, 3, 6, '{\"en\":\"Cowboy Dress\",\"zh-CN\":\"\\u725b\\u4ed4\\u8fde\\u8863\\u88d9\"}', 1, 200, '2021-03-15 15:25:56', '2022-01-22 12:51:47', NULL, NULL, NULL);
INSERT INTO `category` VALUES (11, 1, 3, 7, '{\"en\":\"Sweater\",\"zh-CN\":\"\\u536b\\u8863\"}', 1, 200, '2021-03-15 15:26:02', '2022-01-22 12:56:13', NULL, NULL, NULL);
INSERT INTO `category` VALUES (12, 1, 3, 7, '{\"en\":\"woolen\",\"zh-CN\":\"\\u6bdb\\u8863\"}', 1, 200, '2021-03-15 15:26:13', '2022-01-22 12:56:46', NULL, NULL, NULL);
INSERT INTO `category` VALUES (13, 1, 3, 7, '{\"en\":\"knitwear\",\"zh-CN\":\"\\u9488\\u7ec7\\u886b\"}', 1, 200, '2021-03-15 15:26:21', '2022-01-22 12:57:03', NULL, NULL, NULL);
INSERT INTO `category` VALUES (14, 1, 1, 0, '{\"en\":\"Men\'s Clothing\",\"zh-CN\":\"\\u7537\\u88c5\"}', 1, 200, '2021-03-15 15:26:29', '2022-01-22 11:25:30', NULL, NULL, NULL);
INSERT INTO `category` VALUES (15, 1, 2, 14, 'T恤', 1, 200, '2021-03-15 15:26:39', '2021-03-15 15:26:39', NULL, NULL, NULL);
INSERT INTO `category` VALUES (16, 1, 2, 14, '鞋子', 1, 200, '2021-03-15 15:26:46', '2021-03-15 15:26:46', NULL, NULL, NULL);
INSERT INTO `category` VALUES (17, 1, 2, 14, '牛仔褲', 1, 200, '2021-03-15 15:26:54', '2021-03-15 15:26:54', NULL, NULL, NULL);
INSERT INTO `category` VALUES (18, 1, 2, 14, '羽絨服', 1, 200, '2021-03-15 15:27:01', '2021-03-15 15:27:01', NULL, NULL, NULL);
INSERT INTO `category` VALUES (19, 1, 2, 14, '風衣', 1, 200, '2021-03-15 15:27:07', '2021-03-15 15:27:07', NULL, NULL, NULL);
INSERT INTO `category` VALUES (20, 1, 2, 14, '大衣', 1, 200, '2021-03-15 15:27:14', '2021-03-15 15:27:14', NULL, NULL, NULL);
INSERT INTO `category` VALUES (21, 1, 2, 14, '夾克', 1, 200, '2021-03-15 15:27:21', '2021-03-15 15:27:21', NULL, NULL, NULL);
INSERT INTO `category` VALUES (22, 1, 3, 15, '嘻哈T恤', 1, 200, '2021-03-15 15:27:28', '2021-03-15 15:27:28', NULL, NULL, NULL);
INSERT INTO `category` VALUES (23, 1, 3, 15, '短袖體恤', 1, 200, '2021-03-15 15:27:35', '2021-03-15 15:27:35', NULL, NULL, NULL);
INSERT INTO `category` VALUES (24, 1, 3, 15, '商務T恤', 1, 200, '2021-03-15 15:27:42', '2021-03-15 15:27:42', NULL, NULL, NULL);
INSERT INTO `category` VALUES (25, 1, 3, 15, '條紋T恤', 1, 200, '2021-03-15 15:27:54', '2021-03-15 15:27:54', NULL, NULL, NULL);
INSERT INTO `category` VALUES (26, 1, 3, 16, '運動鞋', 1, 200, '2021-03-15 15:28:28', '2021-03-15 15:28:28', NULL, NULL, NULL);
INSERT INTO `category` VALUES (27, 1, 3, 16, '涼鞋', 1, 200, '2021-03-15 15:28:36', '2021-03-15 15:28:36', NULL, NULL, NULL);
INSERT INTO `category` VALUES (28, 1, 3, 16, '休閒鞋', 1, 200, '2021-03-15 15:28:43', '2021-03-15 15:28:43', NULL, NULL, NULL);
INSERT INTO `category` VALUES (29, 2, 1, 0, '{\"en\":\"System Article\",\"zh-CN\":\"\\u7cfb\\u7edf\\u6587\\u7ae0\"}', 1, 200, '2021-05-28 16:51:06', '2022-01-22 11:08:45', NULL, NULL, NULL);
INSERT INTO `category` VALUES (30, 2, 2, 29, '{\"en\":\"Blogs\",\"zh-CN\":\"\\u535a\\u5ba2\"}', 1, 200, '2021-05-29 08:53:13', '2022-01-22 11:09:09', NULL, NULL, NULL);
INSERT INTO `category` VALUES (31, 2, 1, 0, '{\"en\":\"Trade news\",\"zh-CN\":\"\\u884c\\u4e1a\\u65b0\\u95fb\"}', 1, 200, '2021-05-29 08:53:29', '2022-01-22 11:10:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for st_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
                                `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                                `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
                         `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                         `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `attempts` tinyint(3) UNSIGNED NOT NULL,
                         `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
                         `available_at` int(10) UNSIGNED NOT NULL,
                         `created_at` int(10) UNSIGNED NOT NULL,
                         PRIMARY KEY (`id`) USING BTREE,
                         INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
                                  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
                                  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `read_at` timestamp(0) NULL DEFAULT NULL,
                                  `created_at` timestamp(0) NULL DEFAULT NULL,
                                  `updated_at` timestamp(0) NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
                          `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '訂單id',
                          `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '會員id',
                          `order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '訂單編號',
                          `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '結算貨幣',
                          `currency_rate` decimal(10, 6) UNSIGNED NOT NULL DEFAULT 1.000000 COMMENT '結算貨幣轉換率',
                          `products_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '產品總額',
                          `weight_total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '產品總重量：g',
                          `shipping_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '配送費用',
                          `handling_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '支付費用 （支付手續費）',
                          `tax_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '稅收費用',
                          `discount_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '優惠金額',
                          `used_credits_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '積分金額',
                          `order_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '訂單金額 （應付金額）',
                          `paid_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '已付金額',
                          `order_status` int(11) NOT NULL DEFAULT 0 COMMENT '訂單狀態：10 待支付，12 已支付/待發貨，13 支付失敗，14 支付異常，20 已發貨/待收貨，22 已收貨，24 退貨中，26 已退貨，30 已完成，40 已取消（會員取消），42 已關閉(管理員關閉)',
                          `pay_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付備註',
                          `shipping_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '配送id',
                          `tracking_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流跟蹤單號',
                          `shipping_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配送備註：可填寫具體配送公司等資訊，此資訊在前臺訂單詳情顯示',
                          `payment_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '支付id',
                          `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平臺流水號id',
                          `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '訂單備註',
                          `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名',
                          `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓',
                          `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                          `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '聯繫電話',
                          `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '傳真',
                          `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '國家',
                          `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
                          `state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省',
                          `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
                          `address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1',
                          `address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2',
                          `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '郵編',
                          `billing_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名(賬單)',
                          `billing_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓(賬單)',
                          `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Email(賬單)',
                          `billing_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '聯繫電話(賬單)',
                          `billing_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '傳真(賬單)',
                          `billing_country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '國家(賬單)',
                          `billing_state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省(賬單)',
                          `billing_state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省(賬單)',
                          `billing_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市(賬單)',
                          `billing_address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1(賬單)',
                          `billing_address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2(賬單)',
                          `billing_postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '郵編(賬單)',
                          `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                          `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                          `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                          `paid_at` datetime(0) NULL DEFAULT NULL COMMENT '支付時間',
                          `received_at` datetime(0) NULL DEFAULT NULL COMMENT '確認收貨時間',
                          `canceled_at` datetime(0) NULL DEFAULT NULL COMMENT '取消訂單時間',
                          `returned_at` datetime(0) NULL DEFAULT NULL COMMENT '退貨時間',
                          `shipped_at` datetime(0) NULL DEFAULT NULL COMMENT '發貨時間',
                          `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '來源',
                          `http_referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'HTTP_REFERER',
                          PRIMARY KEY (`id`) USING BTREE,
                          UNIQUE INDEX `order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '訂單表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, '20210808125221504', 'CNY', 6.394500, 997.479, 1000, 40.317, 95.918, 226.743, 0.000, 0.000, 1360.457, 0.000, 42, '', 30, '', '', 1, '', '快點發貨！', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-08 12:52:09', '2021-09-07 08:29:49', NULL, NULL, NULL, '2021-09-07 08:29:49', NULL, NULL, '', '');
INSERT INTO `order` VALUES (2, 1, 'ST20210808125681108', 'CNY', 6.394500, 3254.801, 0, 0.000, 95.918, 670.144, 0.000, 0.000, 4020.863, 4020.863, 20, '', 30, '32311', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-08 12:56:22', '2021-08-13 13:23:59', NULL, '2021-08-13 13:23:22', NULL, NULL, NULL, '2021-08-13 13:23:59', '', '');
INSERT INTO `order` VALUES (3, 2, 'ST20210811134892614', 'USD', 1.000000, 21.995, 1000, 7.754, 15.000, 0.000, 0.000, 0.000, 44.749, 44.749, 30, '', 30, '2323', '', 1, '', '', 'Karen', 'Y', '243424233@qq.com', '342341234123', '', 'US', '', 'xxxxxx', 'xxxx', 'xxxxxxxxx', '', 'xxxxxx', 'Karen', 'Y', '5232382372@qq.com', '342341234123', '', 'US', '', 'xxxxxx', 'xxxx', 'xxxxxxxxx', '', 'xxxxxx', '2021-08-11 13:48:28', '2021-08-20 18:01:26', NULL, '2021-08-13 13:23:01', '2021-08-20 18:01:26', NULL, NULL, '2021-08-13 13:23:12', '', '');
INSERT INTO `order` VALUES (4, 1, 'ST20210813173540624', 'USD', 1.000000, 123.655, 1200, 28.000, 15.000, 33.331, 0.000, 0.000, 199.986, 199.986, 12, '', 13, '', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-13 17:35:58', '2021-08-20 18:09:06', NULL, '2021-08-20 18:09:06', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (5, 1, 'ST20210820180783834', 'USD', 1.000000, 45.000, 400, 20.000, 15.000, 16.000, 0.000, 0.000, 96.000, 96.000, 12, '', 13, '', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-20 18:07:27', '2021-09-01 23:34:51', NULL, '2021-09-01 23:34:51', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (6, 1, 'ST20210820182230583', 'USD', 1.000000, 78.000, 0, 0.000, 15.000, 18.600, 0.000, 0.000, 111.600, 111.600, 12, '', 13, '', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-20 18:22:37', '2021-09-03 16:08:28', NULL, '2021-09-03 16:08:28', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (7, 1, 'ST20210821094661258', 'USD', 1.000000, 78.000, 0, 0.000, 15.000, 18.600, 0.000, 0.000, 111.600, 111.600, 30, '', 13, '534542', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-21 09:46:07', '2021-09-01 17:44:26', NULL, '2021-09-01 13:01:41', '2021-09-01 17:44:26', NULL, NULL, '2021-09-01 13:02:16', '', '');
INSERT INTO `order` VALUES (8, 3, 'ST20210903114967327', 'USD', 1.000000, 21.995, 1000, 24.000, 15.000, 0.000, 0.000, 0.000, 60.995, 0.000, 42, '', 30, '', '', 1, '', '', '測', '試', '345154414@qq.com', '15989995655', '', 'CN', 'GD', '', '深圳市', '深圳市寶安區', '', '44300', '測', '試', '345154414@qq.com', '15989995655', '', 'CN', 'GD', '', '深圳市', '深圳市寶安區', '', '44300', '2021-09-03 11:49:03', '2021-09-03 16:47:58', NULL, NULL, NULL, '2021-09-03 16:08:43', NULL, NULL, '', 'gitee.com');
INSERT INTO `order` VALUES (9, 1, 'ST20210903190433681', 'GBP', 0.700000, 356.300, 0, 0.000, 10.500, 73.360, 0.000, 0.000, 440.160, 440.160, 20, '', 13, '4545', '', 1, '35J16948YJ7994107', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-09-03 19:04:51', '2021-09-05 11:43:25', NULL, '2021-09-03 19:05:35', NULL, NULL, NULL, '2021-09-05 11:43:25', '', 'www.strongshop.cn');
INSERT INTO `order` VALUES (10, 1, 'ST20210903190860930', 'GBP', 0.700000, 31.500, 630, 16.800, 10.500, 11.760, 0.000, 0.000, 70.560, 0.000, 42, '', 13, '', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-09-03 19:08:36', '2021-09-04 14:53:44', NULL, NULL, NULL, '2021-09-04 14:53:44', NULL, NULL, '', 'www.strongshop.cn');
INSERT INTO `order` VALUES (11, 2, 'ST20210904133844357', 'USD', 1.000000, 45.000, 630, 6.052, 15.000, 0.000, 0.000, 0.000, 66.052, 66.052, 26, '', 30, '123', '', 1, '38H53988KT3846837', '', 'Karen', 'Y', '243424233@qq.com', '342341234123', '', 'US', '', 'xxxxxx', 'xxxx', 'xxxxxxxxx', '', 'xxxxxx', 'Karen', 'Y', '243424233@qq.com', '342341234123', '', 'US', '', 'xxxxxx', 'xxxx', 'xxxxxxxxx', '', 'xxxxxx', '2021-09-04 13:38:34', '2021-09-05 11:42:59', NULL, '2021-09-04 13:45:30', NULL, NULL, '2021-09-05 11:42:59', '2021-09-04 17:06:10', '', '');
INSERT INTO `order` VALUES (12, 4, 'ST20210905115236509', 'USD', 1.000000, 21.995, 1000, 24.000, 15.000, 0.000, 0.000, 0.000, 60.995, 60.995, 12, '', 13, '', '', 1, '', '', 'Jacky', 'Fang', 'jacky@fengwoo.cn', '15999617828', '', 'CN', 'GD', '', '深圳', '1B03', '高新技術產業園', '518000', 'Jacky', 'Fang', 'jacky@fengwoo.cn', '15999617828', '', 'CN', 'GD', '', '深圳', '1B03', '高新技術產業園', '518000', '2021-09-05 11:52:34', '2021-09-06 11:07:39', NULL, '2021-09-06 11:07:39', NULL, NULL, NULL, NULL, '', 'www.oschina.net');
INSERT INTO `order` VALUES (13, 3, 'ST20210905230351545', 'USD', 1.000000, 21.995, 1000, 24.000, 15.000, 0.000, 0.000, 0.000, 60.995, 60.995, 20, '', 13, 'fsdfadsfadsfafd', '', 1, '3797559650837931E', '', '測', '試', '345154414@qq.com', '15989995655', '', 'CN', 'GD', '', '深圳市', '深圳市寶安區', '', '44300', '測', '試', '345154414@qq.com', '15989995655', '', 'CN', 'GD', '', '深圳市', '深圳市寶安區', '', '44300', '2021-09-05 23:03:37', '2021-09-16 14:39:11', NULL, '2021-09-05 23:04:33', NULL, NULL, NULL, '2021-09-16 14:39:11', '', '');
INSERT INTO `order` VALUES (14, 6, 'ST20210907082063352', 'USD', 1.000000, 180.000, 2520, 40.000, 15.000, 0.000, 0.000, 0.000, 235.000, 235.000, 12, '', 13, '', '', 1, '8YH14160FB489650R', '', 'aa', 'bb', '123456789@qq.com', '5447863', '', 'CN', 'HEN', '', 'ddfgvcz', 'bbssbtrs', '', '245712', 'aa', 'bb', '123456789@qq.com', '5447863', '', 'CN', 'HEN', '', 'ddfgvcz', 'bbssbtrs', '', '245712', '2021-09-07 08:20:06', '2021-09-07 08:24:23', NULL, '2021-09-07 08:24:23', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (15, 8, 'ST20210916025019856', 'USD', 1.000000, 56.000, 200, 4.074, 15.000, 0.000, 0.000, 0.000, 75.074, 0.000, 10, '', 30, '', '', 1, '', '', 'test', 'user', 'test@test.com', '852655478', '6468', 'US', 'AR', 'hdhd', 'jfjf', 'hfjfbccjfjf', 'jfjfj', '6465', 'test', 'user', 'test@test.com', '852655478', '6468', 'US', 'AR', 'hdhd', 'jfjf', 'hfjfbccjfjf', 'jfjfj', '6465', '2021-09-16 02:50:18', '2021-09-16 02:50:18', NULL, NULL, NULL, NULL, NULL, NULL, '', 'www.strongshop.cn');
INSERT INTO `order` VALUES (16, 9, 'ST20210918141850461', 'CNY', 6.394500, 358.092, 200, 127.890, 95.918, 0.000, 0.000, 0.000, 581.900, 0.000, 10, '', 13, '', '', 1, '', '', 'Jack', 'Derek', '406834061@qq.com', '13807083044', '', 'CN', 'GD', '', 'DSH', 'E的俊峰阿薩德', '', '330000', 'Jack', 'Derek', '406834061@qq.com', '13807083044', '', 'CN', 'GD', '', 'DSH', 'E的俊峰阿薩德', '', '330000', '2021-09-18 14:18:55', '2021-09-18 14:18:55', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (17, 9, 'ST20210918142103850', 'CNY', 6.394500, 291.973, 0, 0.000, 95.918, 0.000, 0.000, 0.000, 387.891, 0.000, 10, '', 13, '', '', 1, '', '', 'Jack', 'Derek', '406834061@qq.com', '13807083044', '', 'CN', 'GD', '', 'DSH', 'E的俊峰阿薩德', '', '330000', 'Jack', 'Derek', '406834061@qq.com', '13807083044', '', 'CN', 'GD', '', 'DSH', 'E的俊峰阿薩德', '', '330000', '2021-09-18 14:21:07', '2021-09-18 14:21:07', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `order` VALUES (18, 10, 'ST20210918200854496', 'USD', 1.000000, 45.660, 0, 0.000, 15.000, 0.000, 0.000, 0.000, 60.660, 60.660, 20, '', 13, '8647675477', '', 1, '39J59262R0781591S', '', 'liu', 'erek', 'lqlluo@163.com', '18953153124', '', 'AO', '', 'js', 'khbda', 'ihbkhbkjbkhbihb', '', '8263076', 'liu', 'erek', 'lqlluo@163.com', '18953153124', '', 'AO', '', 'js', 'khbda', 'ihbkhbkjbkhbihb', '', '8263076', '2021-09-18 20:08:29', '2021-09-18 20:11:19', NULL, '2021-09-18 20:10:01', NULL, NULL, NULL, '2021-09-18 20:11:19', '', 'www.strongshop.cn');

-- ----------------------------
-- Table structure for st_order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`  (
                                  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                  `order_id` int(10) NOT NULL DEFAULT 0 COMMENT '訂單id',
                                  `product_id` int(10) NOT NULL COMMENT '產品id',
                                  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '產品標題',
                                  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU',
                                  `weight` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '重量：g',
                                  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '結算貨幣',
                                  `currency_rate` decimal(10, 6) UNSIGNED NOT NULL DEFAULT 1.000000 COMMENT '結算貨幣轉換率',
                                  `original_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '原價：元',
                                  `sale_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '售價：元',
                                  `img_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '產品封面圖',
                                  `specs` json NULL COMMENT '已選規格',
                                  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已購數量',
                                  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '訂單產品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_order_product
-- ----------------------------
INSERT INTO `order_product` VALUES (1, 1, 10, 'Cotton Valueweight Tee T-Shirt-purple-xxxl', 'tshirt100-01-xxxl', 0, 'CNY', 6.394500, 498.771, 428.432, 'http://www.strongshop.local/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Purple\"}, {\"name\": \"尺寸\", \"value\": \"XXXL\"}]', 2, '2021-08-08 12:52:09', NULL);
INSERT INTO `order_product` VALUES (2, 1, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'CNY', 6.394500, 204.624, 140.615, 'http://www.strongshop.local/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-08-08 12:52:09', NULL);
INSERT INTO `order_product` VALUES (3, 2, 13, 'Google Pixel 3a  phone balck-64g', 'phone100-01-64g', 0, 'CNY', 6.394500, 3625.682, 3254.801, 'http://www.strongshop.local/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"容量\", \"value\": \"64g\"}]', 1, '2021-08-08 12:56:22', NULL);
INSERT INTO `order_product` VALUES (4, 3, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'USD', 1.000000, 28.594, 21.995, 'http://www.strongshop.local/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-08-11 13:48:28', NULL);
INSERT INTO `order_product` VALUES (5, 4, 3, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-M', 'dress100-01-m', 0, 'USD', 1.000000, 78.000, 45.660, 'http://www.strongshop.local/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-08-13 17:35:58', NULL);
INSERT INTO `order_product` VALUES (6, 4, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'USD', 1.000000, 28.594, 21.995, 'http://www.strongshop.local/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-08-13 17:35:58', NULL);
INSERT INTO `order_product` VALUES (7, 4, 4, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-M', 'dress100-02-m', 200, 'USD', 1.000000, 67.000, 56.000, 'http://www.strongshop.local/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-08-13 17:35:58', NULL);
INSERT INTO `order_product` VALUES (8, 5, 11, 'Cotton Valueweight Tee T-Shirt-red-xxl', 'tshirt100-02-xxl', 400, 'USD', 1.000000, 67.000, 45.000, 'http://demo.strongshop.local/storage/202103/DjQu6ZQRzEWQ0FFapLxD7ZU4NYtraBHooTK2TlNr_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"XXL\"}]', 1, '2021-08-20 18:07:27', NULL);
INSERT INTO `order_product` VALUES (9, 6, 7, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-L', 'dress100-03-l', 0, 'USD', 1.000000, 90.000, 78.000, 'http://demo.strongshop.local/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Cappuccino\"}, {\"name\": \"尺寸\", \"value\": \"L\"}]', 1, '2021-08-20 18:22:37', NULL);
INSERT INTO `order_product` VALUES (10, 7, 7, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-L', 'dress100-03-l', 0, 'USD', 1.000000, 90.000, 78.000, 'http://demo.strongshop.local/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Cappuccino\"}, {\"name\": \"尺寸\", \"value\": \"L\"}]', 1, '2021-08-21 09:46:07', NULL);
INSERT INTO `order_product` VALUES (11, 8, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'USD', 1.000000, 28.594, 21.995, 'http://demo.strongshop.cn/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-09-03 11:49:03', NULL);
INSERT INTO `order_product` VALUES (12, 9, 13, 'Google Pixel 3a  phone balck-64g', 'phone100-01-64g', 0, 'GBP', 0.700000, 396.900, 356.300, 'http://demo.strongshop.cn/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"容量\", \"value\": \"64g\"}]', 1, '2021-09-03 19:04:51', NULL);
INSERT INTO `order_product` VALUES (13, 10, 2, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-S', 'dress100-02-s', 630, 'GBP', 0.700000, 38.500, 31.500, 'http://demo.strongshop.cn/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-09-03 19:08:36', NULL);
INSERT INTO `order_product` VALUES (14, 11, 2, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-S', 'dress100-02-s', 630, 'USD', 1.000000, 55.000, 45.000, 'http://demo.strongshop.cn/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-09-04 13:38:34', NULL);
INSERT INTO `order_product` VALUES (15, 12, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'USD', 1.000000, 28.594, 21.995, 'http://demo.strongshop.cn/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-09-05 11:52:34', NULL);
INSERT INTO `order_product` VALUES (16, 13, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'USD', 1.000000, 28.594, 21.995, 'http://demo.strongshop.cn/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-09-05 23:03:37', NULL);
INSERT INTO `order_product` VALUES (17, 14, 2, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-S', 'dress100-02-s', 630, 'USD', 1.000000, 55.000, 45.000, 'http://demo.strongshop.cn/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 4, '2021-09-07 08:20:06', NULL);
INSERT INTO `order_product` VALUES (18, 15, 4, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-M', 'dress100-02-m', 200, 'USD', 1.000000, 67.000, 56.000, 'http://demo.strongshop.cn/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-09-16 02:50:18', NULL);
INSERT INTO `order_product` VALUES (19, 16, 4, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-M', 'dress100-02-m', 200, 'CNY', 6.394500, 428.432, 358.092, 'http://demo.strongshop.cn/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Red\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-09-18 14:18:55', NULL);
INSERT INTO `order_product` VALUES (20, 17, 3, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-M', 'dress100-01-m', 0, 'CNY', 6.394500, 498.771, 291.973, 'http://demo.strongshop.cn/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-09-18 14:21:07', NULL);
INSERT INTO `order_product` VALUES (21, 18, 3, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-M', 'dress100-01-m', 0, 'USD', 1.000000, 78.000, 45.660, 'http://demo.strongshop.cn/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ_thumb.jpg', '[{\"name\": \"顏色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"M\"}]', 1, '2021-09-18 20:08:30', NULL);

-- ----------------------------
-- Table structure for st_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
                                    `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `created_at` timestamp(0) NULL DEFAULT NULL,
                                    INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('123456789@qq.com', '$2y$10$F2MxOjTrIPj9akwqzRG2T.5QOL3Ycs5Vsl0zu3.KZEt62O3dFRnbq', '2021-09-07 08:53:21');

-- ----------------------------
-- Table structure for st_payment_option
-- ----------------------------
DROP TABLE IF EXISTS `payment_option`;
CREATE TABLE `payment_option`  (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付名稱',
                                   `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
                                   `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                   `status` int(11) NOT NULL DEFAULT 1 COMMENT '狀態：1 啟動，2 禁用',
                                   `more` json NULL,
                                   `created_at` datetime(0) NULL DEFAULT NULL,
                                   `updated_at` datetime(0) NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_payment_option
-- ----------------------------
INSERT INTO `payment_option` VALUES (1, 'PayPal', '', 'paypal', 1, '{\"env\": \"sandbox\", \"rate\": \"15\", \"business\": \"sb-nq75t7063330@business.example.com\", \"currency\": null}', NULL, '2021-09-03 19:07:40');

-- ----------------------------
-- Table structure for st_product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
                            `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品id',
                            `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '產品標題',
                            `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '產品簡介',
                            `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '產品詳情',
                            `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 關鍵字',
                            `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 描述',
                            `spu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SPU',
                            `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU',
                            `stock` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '庫存',
                            `stock_status` int(11) NOT NULL DEFAULT 1 COMMENT '庫存狀態 1 有庫存，2 無庫存',
                            `original_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '原價：元',
                            `sale_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '售價：元',
                            `wholesale_set` json NULL COMMENT '批發設定',
                            `img_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '產品封面圖',
                            `img_spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '產品規格圖',
                            `img_photos` json NULL COMMENT '產品相簿',
                            `long` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '產品長度',
                            `width` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '產品寬度',
                            `high` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '產品高度',
                            `weight` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '重量：克',
                            `volume_weight` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '體積重：克',
                            `click_num` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '點選數 檢視數',
                            `sale_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '銷售數量',
                            `status` int(11) NOT NULL DEFAULT 1 COMMENT '狀態：1 上架(顯示)，2 下架(不顯示)',
                            `hidden` int(11) NOT NULL DEFAULT 2 COMMENT '是否強制隱藏：1 是，2 否 (如果是則在產品列表中不顯示)',
                            `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '產品備註：僅後臺看到',
                            `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                            `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                            `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                            `related_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '相關產品',
                            `related_accessories_sku` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相關配件',
                            `brand_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '所屬品牌id',
                            `spec_group_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '規格組id',
                            `is_hot` int(11) NULL DEFAULT 2 COMMENT '熱賣 1 是，2 否',
                            `is_new` int(11) NULL DEFAULT 2 COMMENT '新品 1 是，2 否',
                            `is_recommend` int(11) NULL DEFAULT 2 COMMENT '推薦 1 是，2 否',
                            `more` json NULL COMMENT '更多配置',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `sku`(`sku`) USING BTREE,
                            FULLTEXT INDEX `title`(`title`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '產品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', '', '<ul><li>好產品</li><li>中國造</li><li>Made In China</li></ul><p><img src=\"http://www.strongshop.local/storage/202108/i0Jwue7WMfPxSyQtpUZU0SuRTAeYpOXj9BQ2vjBQ.jpg\" alt=\"s-l1600 (10).jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><ul><li><br/></li></ul>', '', '', 'dress100', 'dress100-01-s', 98, 1, 14.011, 10.778, '{\"num\": [\"1\", \"5\", \"10\"], \"price\": [\"10.778\", \"9.469\", \"7.537\"]}', '/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg', '/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg', '[{\"src\": \"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\", \"title\": \"s-l1600 (9).jpg\", \"isImgSpec\": true, \"isImgCover\": true}, {\"src\": \"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\", \"title\": \"s-l1600 (10).jpg\", \"isImgSpec\": false, \"isImgCover\": false}]', 0, 0, 0, 1000, 0, 213, 1, 1, 2, '', '2021-03-15 15:45:05', '2021-09-28 09:23:36', NULL, 'dress100-02-m', 'dress100-02-m,tshirt100-01-xxxl', 0, 1, 1, 1, 1, '[]');
INSERT INTO `product` VALUES (2, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-S', '', NULL, '', '', 'dress100', 'dress100-02-s', 55, 1, 55.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF.jpg', '', '[{\"src\": \"/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF.jpg\", \"title\": \"s-l1600 (4).jpg\"}, {\"src\": \"/storage/202103/kcxiKFnPGFpkiINNP1xpAtfCiOk1Vfvr4GGg9KJO.jpg\", \"title\": \"s-l1600 (5).jpg\"}]', 0, 0, 0, 630, 0, 245, 0, 1, 2, '', '2021-03-15 15:54:03', '2021-09-26 22:21:52', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (3, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-M', '', NULL, '', '', 'dress100', 'dress100-01-m', 55, 1, 78.000, 45.660, '{\"num\": [], \"price\": []}', '/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ.jpg', '', '[{\"src\": \"/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ.jpg\", \"title\": \"s-l1600 (10).jpg\"}]', 0, 0, 0, 0, 0, 181, 0, 1, 2, '', '2021-03-15 15:58:03', '2021-09-27 19:26:35', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (4, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-M', '', NULL, '', '', 'dress100', 'dress100-02-m', 89, 1, 67.000, 56.000, '{\"num\": [], \"price\": []}', '/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo.jpg', '', '[{\"src\": \"/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo.jpg\", \"title\": \"s-l1600 (5).jpg\"}]', 0, 0, 0, 200, 0, 137, 0, 1, 2, '', '2021-03-15 15:59:43', '2021-09-26 16:53:19', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (5, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-S', '', NULL, '', '', 'dress100', 'dress100-03-s', 45, 1, 55.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/3bYf4PWe4QpcPIFYUQ2ehpo012jT3esnEoAvHp4d.jpg', '', '[{\"src\": \"/storage/202103/3bYf4PWe4QpcPIFYUQ2ehpo012jT3esnEoAvHp4d.jpg\", \"title\": \"s-l1600 (6).jpg\"}]', 0, NULL, 0, 2000, 0, 84, 0, 1, 2, '', '2021-03-15 16:02:00', '2021-09-28 06:23:36', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (6, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-M', '', NULL, '', '', 'dress100', 'dress100-03-m', 66, 1, 78.000, 67.000, '{\"num\": [], \"price\": []}', '/storage/202103/0cNvrdjKAQWebiMU8KIiXjLVctmuyLYumoGlOgMm.jpg', '', '[{\"src\": \"/storage/202103/0cNvrdjKAQWebiMU8KIiXjLVctmuyLYumoGlOgMm.jpg\", \"title\": \"s-l1600 (7).jpg\"}]', 0, 0, 0, 500, 0, 56, 0, 1, 2, '', '2021-03-15 16:03:46', '2021-09-26 09:28:50', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (7, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-L', '', NULL, '', '', 'dress100', 'dress100-03-l', 800, 1, 90.000, 78.000, '{\"num\": [], \"price\": []}', '/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm.jpg', '', '[{\"src\": \"/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm.jpg\", \"title\": \"s-l1600 (8).jpg\"}]', 0, 0, 0, 0, 0, 73, 0, 1, 2, '', '2021-03-15 16:04:59', '2021-09-28 06:23:36', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (8, 'womens dress gray-s', '', NULL, '', '', 'dress100', 'dress100-04-s', 89, 1, 39.000, 30.000, '{\"num\": [], \"price\": []}', '/storage/202103/cFOPjw1BzGTysSBLE9sfycpDRsMoVNCNfaA5cT8p.jpg', '', '[{\"src\": \"/storage/202103/cFOPjw1BzGTysSBLE9sfycpDRsMoVNCNfaA5cT8p.jpg\", \"title\": \"s-l1600 (2).jpg\"}, {\"src\": \"/storage/202103/nKPsH7UyVBudUzw8loCmqN1BqKjeZkTBFX4VyJQe.jpg\", \"title\": \"s-l1600 (3).jpg\"}]', 0, 0, 0, 300, 0, 102, 0, 1, 2, '', '2021-03-17 09:57:53', '2021-09-27 14:57:37', NULL, '', NULL, 0, 1, 2, 1, 2, NULL);
INSERT INTO `product` VALUES (9, 'womens dress gray-xxl   22222', '', NULL, '', '', 'dress100', 'dress100-04-xxl', 89, 1, 56.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/biUUUUjQOOMroQtM0FQSdbq9aAd0saUpKXGR26Np.jpg', '', '[{\"src\": \"/storage/202103/biUUUUjQOOMroQtM0FQSdbq9aAd0saUpKXGR26Np.jpg\", \"title\": \"s-l1600 (3).jpg\"}, {\"src\": \"/storage/202103/koCiVHGMkpAaXUSVvSlh7Sqm3BgIRwODOucMCLBg.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 600, 0, 87, 0, 1, 2, '', '2021-03-17 09:59:03', '2021-09-26 14:07:48', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (10, 'Cotton Valueweight Tee T-Shirt-purple-xxxl', '', NULL, '', '', 'tshirt100', 'tshirt100-01-xxxl', 678, 1, 78.000, 67.000, '{\"num\": [], \"price\": []}', '/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48.jpg', '', '[{\"src\": \"/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 0, 0, 98, 0, 1, 2, '', '2021-03-17 10:07:25', '2021-09-26 12:59:56', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (11, 'Cotton Valueweight Tee T-Shirt-red-xxl', '', NULL, '', '', 'tshirt100', 'tshirt100-02-xxl', 4352, 1, 67.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/DjQu6ZQRzEWQ0FFapLxD7ZU4NYtraBHooTK2TlNr.jpg', '', '[{\"src\": \"/storage/202103/DjQu6ZQRzEWQ0FFapLxD7ZU4NYtraBHooTK2TlNr.jpg\", \"title\": \"s-l1600 (1).jpg\"}]', 0, 0, 0, 400, 0, 88, 0, 1, 2, '', '2021-03-17 10:09:29', '2021-09-28 10:42:16', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (12, 'Cotton Valueweight Tee T-Shirt-xl', '', NULL, '', '', 'tshirt100', 'tshirt100-03-xl', 56, 1, 66.000, 34.000, '{\"num\": [], \"price\": []}', '/storage/202103/8Lk9bjhQbE7S7jm3PgePvwiGZxnZpa6owkVs8O3w.jpg', '', '[{\"src\": \"/storage/202103/8Lk9bjhQbE7S7jm3PgePvwiGZxnZpa6owkVs8O3w.jpg\", \"title\": \"s-l1600.jpg\"}]', 0, 0, 0, 0, 0, 41, 0, 1, 2, '', '2021-03-17 10:11:04', '2021-09-27 00:57:33', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (13, 'Google Pixel 3a  phone balck-64g', '', NULL, '', '', 'phone100', 'phone100-01-64g', 56, 1, 567.000, 509.000, '{\"num\": [], \"price\": []}', '/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc.jpg', '', '[{\"src\": \"/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc.jpg\", \"title\": \"s-l1600.jpg\"}, {\"src\": \"/storage/202103/gr8Vzp2KsaY86cwc9B9UnpNuMAXD1ZhEJzW69Lak.jpg\", \"title\": \"s-l1600 (1).jpg\"}]', 0, 0, 0, 0, 0, 60, 0, 1, 2, '', '2021-03-17 10:20:36', '2021-09-28 03:23:36', NULL, '', NULL, 0, 2, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (14, 'Google Pixel 3a phone balck-64g', '', NULL, '', '', 'phone100', 'phone100-01-128g', 3, 1, 567.000, 409.000, '{\"num\": [], \"price\": []}', '/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg', '/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg', '[{\"src\": \"/storage/202103/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg\", \"title\": \"s-l1600 (3).jpg\", \"isImgSpec\": false, \"isImgCover\": false}, {\"src\": \"/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\", \"title\": \"s-l1600 (2).jpg\", \"isImgSpec\": true, \"isImgCover\": true}]', 0, 0, 0, 0, 0, 15, 0, 1, 2, '', '2021-03-17 10:21:35', '2021-09-25 17:21:32', NULL, '', NULL, 0, 2, 1, 1, 1, '[]');
INSERT INTO `product` VALUES (15, 'Mens Jogging Gym Shoes shoes200 xxl', '', NULL, '', '', 'shoes200', 'shoes200-xxl', 55, 1, 67.000, 56.000, '{\"num\": [], \"price\": []}', '/storage/202103/pFBevDxjysJe5canNs015sPgonRSGvHmHII8o2vk.jpg', '', '[{\"src\": \"/storage/202103/pFBevDxjysJe5canNs015sPgonRSGvHmHII8o2vk.jpg\", \"title\": \"s-l1600.jpg\"}, {\"src\": \"/storage/202103/hoILL8tt2PtcBjFqrTfogIOLJEy9IETaXfRtvAnC.jpg\", \"title\": \"s-l1600 (4).jpg\"}]', 0, 0, 0, 260, 0, 9, 0, 1, 2, '', '2021-03-17 10:26:53', '2021-09-25 17:21:36', NULL, '', NULL, 0, 1, 1, 2, 2, NULL);
INSERT INTO `product` VALUES (16, 'Mens Jogging Gym Shoes shoes200 xxxl', '', NULL, '', '', 'shoes200', 'shoes200-xxxl', 56, 1, 67.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/xnEBNCd199XkWQOYqfeS7KpeHTzKh2NluWSOTdoO.jpg', '', '[{\"src\": \"/storage/202103/xnEBNCd199XkWQOYqfeS7KpeHTzKh2NluWSOTdoO.jpg\", \"title\": \"s-l1600 (1).jpg\"}, {\"src\": \"/storage/202103/ln9OACBPi9Wbf5JZMr3tyW4JmAQKz3OlD9BaY0JI.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 350, 0, 12, 0, 1, 2, '', '2021-03-17 10:27:55', '2021-09-25 17:21:43', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (17, 'Mens Jogging Gym Shoes shoes200 xl', '', NULL, '', '', 'shoes200', 'shoes200-xl', 45, 1, 67.000, 55.000, '{\"num\": [\"1\", \"5\", \"10\"], \"price\": [\"55\", \"44\", \"33.21\"]}', '/storage/202103/R5EPkzwid5eY5iZOH4erUvUGIg0zrTFDEycOUnyc.jpg', '', '[{\"src\": \"/storage/202103/R5EPkzwid5eY5iZOH4erUvUGIg0zrTFDEycOUnyc.jpg\", \"title\": \"s-l1600 (3).jpg\"}]', 0, 0, 0, 500, 0, 26, 0, 1, 2, '', '2021-03-17 10:28:55', '2021-09-26 14:59:55', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (18, 'HP NoteBook Pro 14 Inch Laptop, 12GB RAM, 256GB SSD, Windows 10 Home, Intel computer notebook', '', NULL, '', '', 'computer100', 'computer100-i5', 66, 1, 789.000, 678.000, '{\"num\": [], \"price\": []}', '/storage/202103/P4yNh7Yxwihhanw3F9CYznXIroArgxLwYzlcBdpC.jpg', '', '[{\"src\": \"/storage/202103/P4yNh7Yxwihhanw3F9CYznXIroArgxLwYzlcBdpC.jpg\", \"title\": \"s-l500.jpg\"}]', 0, 0, 0, 2000, 0, 17, 0, 1, 2, '', '2021-03-18 11:18:59', '2021-09-25 17:22:27', NULL, '', NULL, 0, 3, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (19, 'Computer PC Notebook i7', '', NULL, '', '', 'computer100', 'computer100-i7', 45, 1, 8.610, 6.920, '{\"num\": [], \"price\": []}', '/storage/202103/ZnSdcrojCxu2OfDPPDakN7AOJiOKSJnlZOUuHu9r.jpg', '', '[{\"src\": \"/storage/202103/ZnSdcrojCxu2OfDPPDakN7AOJiOKSJnlZOUuHu9r.jpg\", \"title\": \"s-l500 (1).jpg\"}]', 0, 0, 0, 1500, 0, 12, 0, 1, 2, '', '2021-03-18 11:21:22', '2021-09-25 17:22:55', NULL, '', NULL, 0, 3, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (20, 'apple ipad 64g 111', '', NULL, '', '', 'ipad', 'ipad01', 23, 1, 456.000, 236.000, '{\"num\": [], \"price\": []}', '/storage/202103/nR8HrdtiK5izffyeNGN9iggj6TrWd5CDAafOB4t9.jpg', '', '[{\"src\": \"/storage/202103/nR8HrdtiK5izffyeNGN9iggj6TrWd5CDAafOB4t9.jpg\", \"title\": \"s-l500 (2).jpg\"}]', 2, 3, 0, 15, 0, 22, 0, 1, 2, '', '2021-03-18 11:27:57', '2021-09-25 17:23:21', NULL, '', NULL, 0, 4, 1, 1, 1, NULL);
INSERT INTO `product` VALUES (21, 'Hua Wei Pad 128g 1111', '', '<p>New Test</p><p>Good Value<img src=\"/storage/202105/gPTcTdFuL3BuTPeZwHZ24yCfVAY0PT7qImCqfJRP.png\" alt=\"QQ截圖20210512111930.png\"/><br/></p>', '', '', 'ipad', 'ipad02', 453, 1, 16.306, 15.356, '{\"num\": [\"1\", \"30\", \"50\"], \"price\": [\"16.306\", \"15.707\", \"13.640\"]}', '/storage/202103/V1B5uPDtERa5GRJ4xBe5izcNE2xlWMhP3oQKKg0e.png', '/storage/202103/V1B5uPDtERa5GRJ4xBe5izcNE2xlWMhP3oQKKg0e.png', '[{\"src\": \"/storage/202103/V1B5uPDtERa5GRJ4xBe5izcNE2xlWMhP3oQKKg0e.png\", \"title\": \"s-l1600.png\", \"isImgSpec\": true, \"isImgCover\": true}]', 0, 0, 0, 200, 0, 106, 0, 1, 2, '', '2021-03-18 11:29:13', '2022-01-17 14:18:33', NULL, '', NULL, 0, 4, 2, 2, 2, '[]');

-- ----------------------------
-- Table structure for st_product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `product_id` int(11) NOT NULL,
                                     `category_id` int(11) NOT NULL,
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '產品-分類 關聯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 1, 5);
INSERT INTO `product_category` VALUES (2, 1, 6);
INSERT INTO `product_category` VALUES (3, 1, 9);
INSERT INTO `product_category` VALUES (4, 2, 5);
INSERT INTO `product_category` VALUES (5, 2, 6);
INSERT INTO `product_category` VALUES (6, 2, 9);
INSERT INTO `product_category` VALUES (7, 3, 5);
INSERT INTO `product_category` VALUES (8, 3, 6);
INSERT INTO `product_category` VALUES (9, 3, 9);
INSERT INTO `product_category` VALUES (10, 4, 5);
INSERT INTO `product_category` VALUES (11, 4, 6);
INSERT INTO `product_category` VALUES (12, 4, 9);
INSERT INTO `product_category` VALUES (13, 5, 5);
INSERT INTO `product_category` VALUES (14, 5, 6);
INSERT INTO `product_category` VALUES (15, 5, 9);
INSERT INTO `product_category` VALUES (16, 6, 5);
INSERT INTO `product_category` VALUES (17, 6, 6);
INSERT INTO `product_category` VALUES (18, 6, 9);
INSERT INTO `product_category` VALUES (19, 7, 5);
INSERT INTO `product_category` VALUES (20, 7, 6);
INSERT INTO `product_category` VALUES (21, 7, 9);
INSERT INTO `product_category` VALUES (22, 8, 5);
INSERT INTO `product_category` VALUES (23, 8, 6);
INSERT INTO `product_category` VALUES (24, 8, 9);
INSERT INTO `product_category` VALUES (25, 9, 5);
INSERT INTO `product_category` VALUES (26, 9, 6);
INSERT INTO `product_category` VALUES (27, 9, 9);
INSERT INTO `product_category` VALUES (28, 10, 14);
INSERT INTO `product_category` VALUES (29, 10, 15);
INSERT INTO `product_category` VALUES (30, 10, 24);
INSERT INTO `product_category` VALUES (31, 11, 14);
INSERT INTO `product_category` VALUES (32, 11, 15);
INSERT INTO `product_category` VALUES (33, 11, 24);
INSERT INTO `product_category` VALUES (34, 12, 14);
INSERT INTO `product_category` VALUES (35, 12, 15);
INSERT INTO `product_category` VALUES (36, 12, 24);
INSERT INTO `product_category` VALUES (37, 13, 1);
INSERT INTO `product_category` VALUES (38, 13, 3);
INSERT INTO `product_category` VALUES (39, 14, 1);
INSERT INTO `product_category` VALUES (40, 14, 3);
INSERT INTO `product_category` VALUES (41, 15, 14);
INSERT INTO `product_category` VALUES (42, 15, 16);
INSERT INTO `product_category` VALUES (43, 15, 28);
INSERT INTO `product_category` VALUES (44, 16, 14);
INSERT INTO `product_category` VALUES (45, 16, 16);
INSERT INTO `product_category` VALUES (46, 16, 28);
INSERT INTO `product_category` VALUES (47, 17, 14);
INSERT INTO `product_category` VALUES (48, 17, 16);
INSERT INTO `product_category` VALUES (49, 17, 26);
INSERT INTO `product_category` VALUES (50, 18, 1);
INSERT INTO `product_category` VALUES (51, 18, 2);
INSERT INTO `product_category` VALUES (52, 19, 1);
INSERT INTO `product_category` VALUES (53, 19, 2);
INSERT INTO `product_category` VALUES (54, 20, 1);
INSERT INTO `product_category` VALUES (55, 20, 4);
INSERT INTO `product_category` VALUES (56, 21, 1);
INSERT INTO `product_category` VALUES (57, 21, 4);
INSERT INTO `product_category` VALUES (62, 22, 5);
INSERT INTO `product_category` VALUES (63, 22, 6);
INSERT INTO `product_category` VALUES (64, 22, 9);
INSERT INTO `product_category` VALUES (65, 22, 10);
INSERT INTO `product_category` VALUES (66, 22, 7);
INSERT INTO `product_category` VALUES (67, 22, 11);
INSERT INTO `product_category` VALUES (68, 22, 12);
INSERT INTO `product_category` VALUES (69, 22, 13);
INSERT INTO `product_category` VALUES (70, 22, 8);

-- ----------------------------
-- Table structure for st_product_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec`  (
                                 `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '產品id',
                                 `spec_id` int(11) NOT NULL DEFAULT 0 COMMENT '規格id',
                                 `spec_type` int(11) NOT NULL DEFAULT 1 COMMENT '規格型別：1 價格規格，2 普通規格',
                                 `spec_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '規格值',
                                 `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                 `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product_spec
-- ----------------------------
INSERT INTO `product_spec` VALUES (1, 1, 1, 'Black', '2021-03-15 15:50:39', '2021-03-15 16:02:13');
INSERT INTO `product_spec` VALUES (1, 2, 1, 'S', '2021-03-15 15:50:39', '2021-03-15 16:02:13');
INSERT INTO `product_spec` VALUES (2, 1, 1, 'Red', '2021-03-15 15:54:03', '2021-03-15 16:02:21');
INSERT INTO `product_spec` VALUES (2, 2, 1, 'S', '2021-03-15 15:54:03', '2021-03-15 16:02:21');
INSERT INTO `product_spec` VALUES (3, 1, 1, 'Black', '2021-03-15 15:58:03', '2021-03-15 15:58:03');
INSERT INTO `product_spec` VALUES (3, 2, 1, 'M', '2021-03-15 15:58:03', '2021-03-15 15:58:03');
INSERT INTO `product_spec` VALUES (4, 1, 1, 'Red', '2021-03-15 15:59:43', '2021-03-15 16:02:33');
INSERT INTO `product_spec` VALUES (4, 2, 1, 'M', '2021-03-15 15:59:43', '2021-03-15 16:02:33');
INSERT INTO `product_spec` VALUES (5, 1, 1, 'Cappuccino', '2021-03-15 16:02:00', '2021-03-15 16:02:00');
INSERT INTO `product_spec` VALUES (5, 2, 1, 'S', '2021-03-15 16:02:00', '2021-03-15 16:02:00');
INSERT INTO `product_spec` VALUES (6, 1, 1, 'Cappuccino', '2021-03-15 16:03:47', '2021-03-15 16:03:47');
INSERT INTO `product_spec` VALUES (6, 2, 1, 'M', '2021-03-15 16:03:47', '2021-03-15 16:03:47');
INSERT INTO `product_spec` VALUES (7, 1, 1, 'Cappuccino', '2021-03-15 16:04:59', '2021-03-15 16:04:59');
INSERT INTO `product_spec` VALUES (7, 2, 1, 'L', '2021-03-15 16:04:59', '2021-03-15 16:04:59');
INSERT INTO `product_spec` VALUES (8, 1, 1, 'Ashen', '2021-03-17 09:57:53', '2021-03-17 09:57:53');
INSERT INTO `product_spec` VALUES (8, 2, 1, 'S', '2021-03-17 09:57:53', '2021-03-17 09:57:53');
INSERT INTO `product_spec` VALUES (9, 1, 1, 'Ashen', '2021-03-17 09:59:03', '2021-03-17 09:59:20');
INSERT INTO `product_spec` VALUES (9, 2, 1, 'XXL', '2021-03-17 09:59:03', '2021-03-17 09:59:20');
INSERT INTO `product_spec` VALUES (10, 1, 1, 'Purple', '2021-03-17 10:07:25', '2021-03-17 10:11:40');
INSERT INTO `product_spec` VALUES (10, 2, 1, 'XXXL', '2021-03-17 10:07:25', '2021-03-17 10:11:40');
INSERT INTO `product_spec` VALUES (11, 1, 1, 'Red', '2021-03-17 10:09:30', '2021-03-17 10:11:52');
INSERT INTO `product_spec` VALUES (11, 2, 1, 'XXL', '2021-03-17 10:09:30', '2021-03-17 10:11:52');
INSERT INTO `product_spec` VALUES (12, 1, 1, 'Black', '2021-03-17 10:11:04', '2021-03-17 10:12:02');
INSERT INTO `product_spec` VALUES (12, 2, 1, 'XL', '2021-03-17 10:11:04', '2021-03-17 10:12:02');
INSERT INTO `product_spec` VALUES (13, 3, 1, 'Black', '2021-03-17 10:20:36', '2021-03-17 10:20:36');
INSERT INTO `product_spec` VALUES (13, 4, 1, '64g', '2021-03-17 10:20:36', '2021-03-17 10:20:36');
INSERT INTO `product_spec` VALUES (14, 3, 1, 'White', '2021-03-17 10:21:35', '2021-03-17 10:21:35');
INSERT INTO `product_spec` VALUES (14, 4, 1, '128g', '2021-03-17 10:21:35', '2021-03-17 10:21:35');
INSERT INTO `product_spec` VALUES (15, 1, 1, 'Black', '2021-03-17 10:26:53', '2021-03-17 10:26:53');
INSERT INTO `product_spec` VALUES (15, 2, 1, 'XXL', '2021-03-17 10:26:53', '2021-03-17 10:26:53');
INSERT INTO `product_spec` VALUES (16, 1, 1, 'Blue', '2021-03-17 10:27:55', '2021-03-17 10:27:55');
INSERT INTO `product_spec` VALUES (16, 2, 1, 'XXXL', '2021-03-17 10:27:55', '2021-03-17 10:27:55');
INSERT INTO `product_spec` VALUES (17, 1, 1, 'Red', '2021-03-17 10:28:55', '2021-03-17 12:42:28');
INSERT INTO `product_spec` VALUES (17, 2, 1, 'XL', '2021-03-17 10:28:55', '2021-03-17 12:42:28');
INSERT INTO `product_spec` VALUES (18, 5, 1, 'i5', NULL, NULL);
INSERT INTO `product_spec` VALUES (19, 5, 1, 'i7', NULL, NULL);
INSERT INTO `product_spec` VALUES (20, 6, 1, 'silver', NULL, NULL);
INSERT INTO `product_spec` VALUES (20, 7, 1, '64g', NULL, NULL);
INSERT INTO `product_spec` VALUES (20, 8, 1, 'apple', NULL, NULL);
INSERT INTO `product_spec` VALUES (1, 9, 2, '', NULL, NULL);
INSERT INTO `product_spec` VALUES (21, 6, 1, 'silver', NULL, NULL);
INSERT INTO `product_spec` VALUES (21, 7, 1, '64g', NULL, NULL);
INSERT INTO `product_spec` VALUES (21, 8, 1, 'huawei', NULL, NULL);

-- ----------------------------
-- Table structure for st_region_city
-- ----------------------------
DROP TABLE IF EXISTS `region_city`;
CREATE TABLE `region_city`  (
                                `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                `country` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `state` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `city` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `state_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `city_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `cn_city` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `cn_state` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `cn_country` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
                                `country_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11362 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_city
-- ----------------------------
INSERT INTO `region_city` VALUES (6143, 'Albania', NULL, 'Elbasan', NULL, 'EL', '愛爾巴桑', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6144, 'Albania', NULL, 'Diber', NULL, 'DI', '迪勃拉', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6145, 'Albania', NULL, 'Tirane', NULL, 'TR', '地拉那', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6146, 'Albania', NULL, 'Durres', NULL, 'DR', '都拉斯', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6147, 'Albania', NULL, 'Vlore', NULL, 'VL', '發羅拉', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6148, 'Albania', NULL, 'Fier', NULL, 'FR', '費里', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6149, 'Albania', NULL, 'Gjirokaster', NULL, 'GJ', '吉諾卡斯特', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6150, 'Albania', NULL, 'Korce', NULL, 'KO', '科爾察', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6151, 'Albania', NULL, 'Kukes', NULL, 'KU', '庫克斯', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6152, 'Albania', NULL, 'Lezhe', NULL, 'LE', '萊什', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6153, 'Albania', NULL, 'Berat', NULL, 'BR', '培拉特', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6154, 'Albania', NULL, 'Shkoder', NULL, 'SH', '斯庫臺', NULL, '阿爾巴尼亞', 'ALB');
INSERT INTO `region_city` VALUES (6155, 'Algeria', NULL, 'Adrar', NULL, 'ADR', '阿德拉爾', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6156, 'Algeria', NULL, 'Alger', NULL, 'ALG', '阿爾及爾', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6157, 'Algeria', NULL, 'Ain Defla', NULL, 'ADE', '艾因·德夫拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6158, 'Algeria', NULL, 'Ain Temouchent', NULL, 'ATE', '艾因·蒂姆尚特', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6159, 'Algeria', NULL, 'Annaba', NULL, 'AAE', '安納巴', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6160, 'Algeria', NULL, 'Oran', NULL, 'ORA', '奧蘭', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6161, 'Algeria', NULL, 'Batna', NULL, 'BAT', '巴特納', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6162, 'Algeria', NULL, 'Bejaia', NULL, 'BJA', '貝賈亞', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6163, 'Algeria', NULL, 'Bechar', NULL, 'BEC', '貝沙爾', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6164, 'Algeria', NULL, 'El Bayadh', NULL, 'EBA', '貝伊德', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6165, 'Algeria', NULL, 'Biskra', NULL, 'BIS', '比斯克拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6166, 'Algeria', NULL, 'Bordj Bou Arreridj', NULL, 'BOR', '布爾吉·布阿雷里吉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6167, 'Algeria', NULL, 'Blida', NULL, 'BLI', '布利達', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6168, 'Algeria', NULL, 'Boumerdes', NULL, 'BOU', '布邁德斯', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6169, 'Algeria', NULL, 'Bouira', NULL, 'BOA', '布依拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6170, 'Algeria', NULL, 'Tipaza', NULL, 'TIP', '蒂巴扎', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6171, 'Algeria', NULL, 'Tissemsilt', NULL, 'TIS', '蒂斯姆西勒特', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6172, 'Algeria', NULL, 'Ghardaia', NULL, 'GHA', '蓋爾達耶', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6173, 'Algeria', NULL, 'Guelma', NULL, 'GUE', '蓋爾馬', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6174, 'Algeria', NULL, 'Khenchela', NULL, 'KHE', '罕西拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6175, 'Algeria', NULL, 'Relizane', NULL, 'REL', '赫利贊', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6176, 'Algeria', NULL, 'Jijel', NULL, 'JIJ', '吉傑爾', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6177, 'Algeria', NULL, 'Djelfa', NULL, 'DJE', '杰勒法', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6178, 'Algeria', NULL, 'Constantine', NULL, 'CZL', '君士坦丁', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6179, 'Algeria', NULL, 'Laghouat', NULL, 'LAG', '拉格瓦特', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6180, 'Algeria', NULL, 'Mascara', NULL, 'MUA', '馬斯卡拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6181, 'Algeria', NULL, 'Medea', NULL, 'MED', '麥迪亞', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6182, 'Algeria', NULL, 'Mila', NULL, 'MIL', '密拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6183, 'Algeria', NULL, 'Mostaganem', NULL, 'MOS', '莫斯塔加納姆', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6184, 'Algeria', NULL, 'Msila', NULL, 'MSI', '姆西拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6185, 'Algeria', NULL, 'Naama', NULL, 'NAA', '納阿馬', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6186, 'Algeria', NULL, 'Setif', NULL, 'SET', '塞蒂夫', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6187, 'Algeria', NULL, 'Saida', NULL, 'SAI', '賽伊達', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6188, 'Algeria', NULL, 'Skikda', NULL, 'SKI', '斯基克達', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6189, 'Algeria', NULL, 'Souk Ahras', NULL, 'SAH', '蘇克·阿赫拉斯', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6190, 'Algeria', NULL, 'El Tarf', NULL, 'ETA', '塔里夫', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6191, 'Algeria', NULL, 'Tamanghasset', NULL, 'TAM', '塔曼拉塞特', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6192, 'Algeria', NULL, 'Tebessa', NULL, 'TEB', '特貝薩', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6193, 'Algeria', NULL, 'Tlemcen', NULL, 'TLE', '特萊姆森', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6194, 'Algeria', NULL, 'Tizi Ouzou', NULL, 'IOU', '提濟烏祖', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6195, 'Algeria', NULL, 'Tiaret', NULL, 'TIA', '提亞雷特', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6196, 'Algeria', NULL, 'Tindouf', NULL, 'TIN', '廷杜夫', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6197, 'Algeria', NULL, 'El Oued', NULL, 'EOU', '瓦德', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6198, 'Algeria', NULL, 'Ouargla', NULL, 'OUA', '瓦爾格拉', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6199, 'Algeria', NULL, 'Oum el Bouaghi', NULL, 'OEB', '烏姆布阿基', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6200, 'Algeria', NULL, 'Sidi Bel Abbes', NULL, 'SBA', '西迪貝勒阿貝斯', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6201, 'Algeria', NULL, 'Chlef', NULL, 'CHL', '謝里夫', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6202, 'Algeria', NULL, 'Illizi', NULL, 'ILL', '伊利齊', NULL, '阿爾及利亞', 'DZA');
INSERT INTO `region_city` VALUES (6203, 'Afghanistan', NULL, 'Herat', NULL, 'HEA', '赫拉特', NULL, '阿富汗', 'AFG');
INSERT INTO `region_city` VALUES (6204, 'Afghanistan', NULL, 'Kabul', NULL, 'KBL', '喀布爾', NULL, '阿富汗', 'AFG');
INSERT INTO `region_city` VALUES (6205, 'Afghanistan', NULL, 'Kandahar', NULL, 'KDH', '坎大哈', NULL, '阿富汗', 'AFG');
INSERT INTO `region_city` VALUES (6206, 'Afghanistan', NULL, 'Mazar-i Sharif', NULL, 'MZR', '馬紮里沙里夫', NULL, '阿富汗', 'AFG');
INSERT INTO `region_city` VALUES (6207, 'Argentina', NULL, 'Parana', NULL, 'PRA', '巴拉那', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6208, 'Argentina', NULL, 'Viedma', NULL, 'VDM', '別德馬', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6209, 'Argentina', NULL, 'Posadas', NULL, 'PSS', '波薩達斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6210, 'Argentina', NULL, 'Bahia Blanca', NULL, 'BHI', '布蘭卡港', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6211, 'Argentina', NULL, 'Buenos Aires', NULL, 'BUE', '布宜諾斯艾利斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6212, 'Argentina', NULL, 'Formosa', NULL, 'FMA', '福莫薩', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6213, 'Argentina', NULL, 'Jujuy', NULL, 'JUJ', '胡胡伊', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6214, 'Argentina', NULL, 'Catamarca', NULL, 'CTC', '卡塔馬卡', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6215, 'Argentina', NULL, 'Cordoba', NULL, 'COR', '科爾多瓦', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6216, 'Argentina', NULL, 'Corrientes', NULL, 'CNQ', '科連特斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6217, 'Argentina', NULL, 'Villa Krause', NULL, 'VLK', '克勞斯城', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6218, 'Argentina', NULL, 'Concordia', NULL, 'COC', '肯考迪婭', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6219, 'Argentina', NULL, 'La Rioja', NULL, 'IRJ', '拉里奧哈', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6220, 'Argentina', NULL, 'La Plata', NULL, 'LPG', '拉普拉塔', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6221, 'Argentina', NULL, 'Resistencia', NULL, 'RES', '雷西斯滕匹亞', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6222, 'Argentina', NULL, 'Rio Gallegos', NULL, 'RGL', '里奧加耶戈斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6223, 'Argentina', NULL, 'Rio Cuarto', NULL, 'RCU', '里奧夸爾托', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6224, 'Argentina', NULL, 'Comodoro Rivadavia', NULL, 'CRD', '里瓦達維亞海軍準將城', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6225, 'Argentina', NULL, 'Rosario', NULL, 'ROS', '羅薩里奧', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6226, 'Argentina', NULL, 'Rawson', NULL, 'RWO', '羅森', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6227, 'Argentina', NULL, 'Mar del Plata', NULL, 'MDQ', '馬德普拉塔', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6228, 'Argentina', NULL, 'Mendoza', NULL, 'MDZ', '門多薩', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6229, 'Argentina', NULL, 'Neuquen', NULL, 'NQN', '內烏肯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6230, 'Argentina', NULL, 'Salta', NULL, 'SLA', '薩爾塔', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6231, 'Argentina', NULL, 'Santiago del Estero', NULL, 'SDE', '聖地亞哥-德爾埃斯特羅', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6232, 'Argentina', NULL, 'Santa Fe', NULL, 'SFN', '聖菲', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6233, 'Argentina', NULL, 'San Juan', NULL, 'UAQ', '聖胡安', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6234, 'Argentina', NULL, 'San Rafael', NULL, 'AFA', '聖拉斐爾', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6235, 'Argentina', NULL, 'San Luis', NULL, 'LUQ', '聖路易斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6236, 'Argentina', NULL, 'Santa Rosa', NULL, 'RSA', '聖羅莎', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6237, 'Argentina', NULL, 'San Miguel de Tucuman', NULL, 'SMC', '聖米格爾-德相簿曼', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6238, 'Argentina', NULL, 'San Nicolas', NULL, 'SNS', '聖尼古拉斯', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6239, 'Argentina', NULL, 'Trelew', NULL, 'REL', '特雷利烏', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6240, 'Argentina', NULL, 'Ushuaia', NULL, 'USH', '烏斯懷亞', NULL, '阿根廷', 'ARG');
INSERT INTO `region_city` VALUES (6241, 'United Arab Emirates', NULL, 'Abu Dhabi', NULL, 'AZ', '阿布扎比', NULL, '阿拉伯聯合酋長國', 'ARE');
INSERT INTO `region_city` VALUES (6242, 'United Arab Emirates', NULL, 'Al l\'Ayn', NULL, 'AL', '艾因', NULL, '阿拉伯聯合酋長國', 'ARE');
INSERT INTO `region_city` VALUES (6243, 'United Arab Emirates', NULL, 'Dubai', NULL, 'DU', '迪拜', NULL, '阿拉伯聯合酋長國', 'ARE');
INSERT INTO `region_city` VALUES (6244, 'United Arab Emirates', NULL, 'Ash Shariqah', NULL, 'SH', '沙迦', NULL, '阿拉伯聯合酋長國', 'ARE');
INSERT INTO `region_city` VALUES (6245, 'Oman', NULL, 'Al-Batinah', NULL, 'BA', '巴提奈地區', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6246, 'Oman', NULL, 'Az-Zahirah', NULL, 'ZA', '達希萊地區', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6247, 'Oman', NULL, 'Ash-Sharqiyah', NULL, 'SH', '東部地區', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6248, 'Oman', NULL, 'Masqat', NULL, 'MA', '馬斯喀特省', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6249, 'Oman', NULL, 'Musandam', NULL, 'MU', '穆桑達姆省', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6250, 'Oman', NULL, 'Ad-Dakhiliyah', NULL, 'DA', '內地地區', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6251, 'Oman', NULL, 'Al-Wusta', NULL, 'WU', '中部地區', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6252, 'Oman', NULL, 'Zufar', NULL, 'ZU', '佐法爾省', NULL, '阿曼', 'OMN');
INSERT INTO `region_city` VALUES (6253, 'Azerbaijan', NULL, 'Abseron', NULL, 'ABS', '阿布歇隆', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6254, 'Azerbaijan', NULL, 'Xacmaz', NULL, 'XAC', '哈奇馬斯', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6255, 'Azerbaijan', NULL, 'Kalbacar', NULL, 'KAL', '卡爾巴卡爾', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6256, 'Azerbaijan', NULL, 'Qazax', NULL, 'QAZ', '卡扎赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6257, 'Azerbaijan', NULL, 'Lankaran', NULL, 'LAN', '連科蘭', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6258, 'Azerbaijan', NULL, 'Mil-Qarabax', NULL, 'MQA', '密爾-卡拉巴赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6259, 'Azerbaijan', NULL, 'Mugan-Salyan', NULL, 'MSA', '穆甘-薩連', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6260, 'Azerbaijan', NULL, 'Nagorni-Qarabax', NULL, 'NQA', '納戈爾諾－卡拉巴赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6261, 'Azerbaijan', NULL, 'Naxcivan', NULL, 'NX', '納希切萬', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6262, 'Azerbaijan', NULL, 'Priaraks', NULL, 'PRI', '普利亞拉克斯', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6263, 'Azerbaijan', NULL, 'Saki', NULL, 'SA', '舍基', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6264, 'Azerbaijan', NULL, 'Sumqayit', NULL, 'SMC', '蘇姆蓋特', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6265, 'Azerbaijan', NULL, 'Sirvan', NULL, 'SIR', '錫爾萬', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6266, 'Azerbaijan', NULL, 'Ganca', NULL, 'GA', '占賈', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `region_city` VALUES (6267, 'Egypt', NULL, 'Aswan', NULL, 'ASW', '阿斯旺', NULL, '埃及', 'EGY');
INSERT INTO `region_city` VALUES (6268, 'Egypt', NULL, 'Al Ghurdaqah', NULL, 'GBY', '古爾代蓋', NULL, '埃及', 'EGY');
INSERT INTO `region_city` VALUES (6269, 'Egypt', NULL, 'Cairo', NULL, 'CAI', '開羅', NULL, '埃及', 'EGY');
INSERT INTO `region_city` VALUES (6270, 'Egypt', NULL, 'Shubra al Khaymah', NULL, 'SKH', '蘇布拉開馬', NULL, '埃及', 'EGY');
INSERT INTO `region_city` VALUES (6271, 'Egypt', NULL, 'Alexandria', NULL, 'ALY', '亞歷山大', NULL, '埃及', 'EGY');
INSERT INTO `region_city` VALUES (6272, 'Ethiopia', NULL, 'Afar', NULL, 'AF', '阿法爾', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6273, 'Ethiopia', NULL, 'Amara', NULL, 'AH', '阿姆哈拉', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6274, 'Ethiopia', NULL, 'Oromiya', NULL, 'OR', '奧羅米亞', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6275, 'Ethiopia', NULL, 'Binshangul Gumuz', NULL, 'BG', '賓香古爾', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6276, 'Ethiopia', NULL, 'Dire Dawa', NULL, 'DD', '德雷達瓦', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6277, 'Ethiopia', NULL, 'Gambela Hizboch', NULL, 'GB', '甘貝拉各族', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6278, 'Ethiopia', NULL, 'Hareri  Hizb', NULL, 'HR', '哈勒里民族', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6279, 'Ethiopia', NULL, 'YeDebub Biheroch', NULL, 'SN', '南方各族', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6280, 'Ethiopia', NULL, 'Sumale', NULL, 'SM', '索馬里', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6281, 'Ethiopia', NULL, 'Tigray', NULL, 'TG', '提格雷', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6282, 'Ethiopia', NULL, 'Adis abeba', NULL, 'AA', '亞的斯亞貝巴', NULL, '埃塞俄比亞', 'ETH');
INSERT INTO `region_city` VALUES (6283, 'Ireland', NULL, 'Offaly', NULL, 'OF', '奧法利', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6284, 'Ireland', NULL, 'Tipperary', NULL, 'TP', '蒂珀雷里', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6285, 'Ireland', NULL, 'Dublin', NULL, 'DB', '都柏林', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6286, 'Ireland', NULL, 'Donegal', NULL, 'DG', '多內加爾', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6287, 'Ireland', NULL, 'Galway', NULL, 'GW', '戈爾韋', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6288, 'Ireland', NULL, 'Kildare', NULL, 'KD', '基爾代爾', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6289, 'Ireland', NULL, 'Kilkenny', NULL, 'KK', '基爾肯尼', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6290, 'Ireland', NULL, 'Cavan', NULL, 'CV', '卡范', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6291, 'Ireland', NULL, 'Carlow', NULL, 'CW', '卡洛', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6292, 'Ireland', NULL, 'Kerry', NULL, 'KR', '凱里', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6293, 'Ireland', NULL, 'Cork', NULL, 'CK', '科克', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6294, 'Ireland', NULL, 'Clare', NULL, 'CL', '克萊爾', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6295, 'Ireland', NULL, 'Longford', NULL, 'LF', '朗福德', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6296, 'Ireland', NULL, 'Louth', NULL, 'LT', '勞斯', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6297, 'Ireland', NULL, 'Laois', NULL, 'LA', '嶗斯', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6298, 'Ireland', NULL, 'Limerick', NULL, 'LM', '利默里克', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6299, 'Ireland', NULL, 'Leitrim', NULL, 'LR', '利特里姆', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6300, 'Ireland', NULL, 'Roscommon', NULL, 'RC', '羅斯康芒', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6301, 'Ireland', NULL, 'Mayo', NULL, 'MY', '梅奧', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6302, 'Ireland', NULL, 'Meath', NULL, 'MT', '米斯', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6303, 'Ireland', NULL, 'Monaghan', NULL, 'MG', '莫內根', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6304, 'Ireland', NULL, 'Sligo', NULL, 'SL', '斯萊戈', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6305, 'Ireland', NULL, 'Wicklow', NULL, 'WK', '威克洛', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6306, 'Ireland', NULL, 'Wexford', NULL, 'WX', '韋克斯福德', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6307, 'Ireland', NULL, 'Waterford', NULL, 'WF', '沃特福德', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6308, 'Ireland', NULL, 'Westmeath', NULL, 'WM', '西米斯', NULL, '愛爾蘭', 'IRL');
INSERT INTO `region_city` VALUES (6309, 'Estonia', NULL, 'Polva', NULL, '65', '貝爾瓦', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6310, 'Estonia', NULL, 'Harju', NULL, '37', '哈留', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6311, 'Estonia', NULL, 'Rapla', NULL, '70', '拉普拉', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6312, 'Estonia', NULL, 'Laane', NULL, '57', '里亞內', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6313, 'Estonia', NULL, 'Parnu', NULL, '67', '帕爾努', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6314, 'Estonia', NULL, 'Saare', NULL, '74', '薩雷', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6315, 'Estonia', NULL, 'Tartu', NULL, '78', '塔爾圖', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6316, 'Estonia', NULL, 'Valga', NULL, '82', '瓦爾加', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6317, 'Estonia', NULL, 'Viljandi', NULL, '84', '維良地', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6318, 'Estonia', NULL, 'Laane-Viru', NULL, '59', '維魯', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6319, 'Estonia', NULL, 'Voru', NULL, '86', '沃魯', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6320, 'Estonia', NULL, 'Hiiu', NULL, '39', '希尤', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6321, 'Estonia', NULL, 'Jarva', NULL, '51', '耶爾韋', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6322, 'Estonia', NULL, 'Jogeva', NULL, '49', '耶蓋瓦', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6323, 'Estonia', NULL, 'Ida-Viru', NULL, '44', '依達－維魯', NULL, '愛沙尼亞', 'EST');
INSERT INTO `region_city` VALUES (6324, 'Andorra', NULL, 'Andorra la Vella', NULL, '7', '安道爾城', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6325, 'Andorra', NULL, 'Ordino', NULL, '5', '奧爾迪諾', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6326, 'Andorra', NULL, 'Encamp', NULL, '3', '恩坎普', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6327, 'Andorra', NULL, 'Canillo', NULL, '2', '卡尼略', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6328, 'Andorra', NULL, 'Escaldes-Engordany', NULL, '8', '萊塞斯卡爾德－恩戈爾達', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6329, 'Andorra', NULL, 'La Massana', NULL, '4', '馬薩納', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6330, 'Andorra', NULL, 'Sant Julia de Laria', NULL, '6', '聖胡利婭－德洛里亞', NULL, '安道爾', 'AND');
INSERT INTO `region_city` VALUES (6331, 'Angola', NULL, 'Cuanza Norte', NULL, 'CNO', '北寬扎', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6332, 'Angola', NULL, 'Lunda Norte', NULL, 'LNO', '北隆達', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6333, 'Angola', NULL, 'Bengo', NULL, 'BGO', '本戈', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6334, 'Angola', NULL, 'Benguela', NULL, 'BGU', '本格拉', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6335, 'Angola', NULL, 'Bie', NULL, 'BIE', '比耶', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6336, 'Angola', NULL, 'Cabinda', NULL, 'CAB', '卡賓達', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6337, 'Angola', NULL, 'Cunene', NULL, 'CNN', '庫內內', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6338, 'Angola', NULL, 'Cuando Cubango', NULL, 'CCU', '寬多庫邦戈', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6339, 'Angola', NULL, 'Luanda', NULL, 'LUA', '羅安達', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6340, 'Angola', NULL, 'Malanje', NULL, 'MAL', '馬蘭熱', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6341, 'Angola', NULL, 'Moxico', NULL, 'MOX', '莫希科', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6342, 'Angola', NULL, 'Namibe', NULL, 'NAM', '納米貝', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6343, 'Angola', NULL, 'Cuanza Sul', NULL, 'CUS', '南寬扎', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6344, 'Angola', NULL, 'Lunda Sul', NULL, 'LSU', '南隆達', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6345, 'Angola', NULL, 'Huambo', NULL, 'HUA', '萬博', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6346, 'Angola', NULL, 'Huila', NULL, 'HUI', '威拉', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6347, 'Angola', NULL, 'Uige', NULL, 'UIG', '威熱', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6348, 'Angola', NULL, 'Zaire', NULL, 'ZAI', '扎伊爾', NULL, '安哥拉', 'AGO');
INSERT INTO `region_city` VALUES (6349, 'Austria', NULL, 'Burgenland', NULL, 'BUR', '布爾根蘭', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6350, 'Austria', NULL, 'Tyrol', NULL, 'TYR', '蒂羅爾', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6351, 'Austria', NULL, 'Vorarlberg', NULL, 'VOR', '福拉爾貝格', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6352, 'Austria', NULL, 'Carinthia', NULL, 'CAT', '克恩頓', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6353, 'Austria', NULL, 'Salzburg', NULL, 'SZG', '薩爾茨堡', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6354, 'Austria', NULL, 'Upper Austria', NULL, 'UAU', '上奧地利', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6355, 'Austria', NULL, 'Styria', NULL, 'STY', '施蒂利亞', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6356, 'Austria', NULL, 'Vienna', NULL, 'VDD', '維也納', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6357, 'Austria', NULL, 'Lower Austria', NULL, 'LAU', '下奧地利', NULL, '奧地利', 'AUT');
INSERT INTO `region_city` VALUES (6358, 'Papua New Guinea', NULL, 'Northern', NULL, 'NO', '北部', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6359, 'Papua New Guinea', NULL, 'Bougainville', NULL, 'BV', '布干維爾', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6360, 'Papua New Guinea', NULL, 'Eastern Highlands', NULL, 'EH', '東部高地', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6361, 'Papua New Guinea', NULL, 'East Sepik', NULL, 'ES', '東塞皮克', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6362, 'Papua New Guinea', NULL, 'East New Britain', NULL, 'EB', '東新不列顛', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6363, 'Papua New Guinea', NULL, 'Enga', NULL, 'EN', '恩加', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6364, 'Papua New Guinea', NULL, 'Gulf', NULL, 'GU', '海灣', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6365, 'Papua New Guinea', NULL, 'Madang', NULL, 'MD', '馬當', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6366, 'Papua New Guinea', NULL, 'Manus', NULL, 'MN', '馬努斯', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6367, 'Papua New Guinea', NULL, 'Milne Bay', NULL, 'MB', '米爾恩灣', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6368, 'Papua New Guinea', NULL, 'Port Moresby', NULL, 'NC', '莫爾茲比港', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6369, 'Papua New Guinea', NULL, 'Morobe', NULL, 'MR', '莫羅貝', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6370, 'Papua New Guinea', NULL, 'Southern Highlands', NULL, 'SH', '南部高地', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6371, 'Papua New Guinea', NULL, 'Simbu', NULL, 'SI', '欽布', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6372, 'Papua New Guinea', NULL, 'Sandaun', NULL, 'SA', '桑道恩', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6373, 'Papua New Guinea', NULL, 'Western', NULL, 'WE', '西部', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6374, 'Papua New Guinea', NULL, 'Western Highlands', NULL, 'WH', '西部高地', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6375, 'Papua New Guinea', NULL, 'West New Britain', NULL, 'WB', '西新不列顛', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6376, 'Papua New Guinea', NULL, 'New Ireland', NULL, 'NI', '新愛爾蘭', NULL, '巴布亞新幾內亞', 'PNG');
INSERT INTO `region_city` VALUES (6377, 'Pakistan', NULL, 'Peshawar', NULL, 'PEW', '白沙瓦', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6378, 'Pakistan', NULL, 'Faisalabad', NULL, 'LYP', '費薩拉巴德', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6379, 'Pakistan', NULL, 'Gujranwala', NULL, 'GUJ', '故吉軟瓦拉', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6380, 'Pakistan', NULL, 'Hyderabad', NULL, 'HDD', '海德拉巴', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6381, 'Pakistan', NULL, 'Karachi', NULL, 'KCT', '卡拉奇', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6382, 'Pakistan', NULL, 'Lahore', NULL, 'LHE', '拉合爾', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6383, 'Pakistan', NULL, 'Rawalpindi', NULL, 'RWP', '拉瓦爾品第', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6384, 'Pakistan', NULL, 'Multan', NULL, 'MUX', '木爾坦', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6385, 'Pakistan', NULL, 'Islamabad', NULL, 'ISB', '伊斯蘭堡', NULL, '巴基斯坦', 'PAK');
INSERT INTO `region_city` VALUES (6386, 'Paraguay', NULL, 'Amambay', NULL, 'AM', '阿曼拜', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6387, 'Paraguay', NULL, 'Presidente Hayes', NULL, 'PH', '阿耶斯總統省', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6388, 'Paraguay', NULL, 'Paraguari', NULL, 'PA', '巴拉瓜里', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6389, 'Paraguay', NULL, 'Boqueron', NULL, 'BO', '博克龍', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6390, 'Paraguay', NULL, 'Guaira', NULL, 'GU', '瓜伊拉', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6391, 'Paraguay', NULL, 'Caaguazu', NULL, 'CG', '卡瓜蘇', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6392, 'Paraguay', NULL, 'Canindeyu', NULL, 'CN', '卡嫩迪尤', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6393, 'Paraguay', NULL, 'Caazapa', NULL, 'CZ', '卡薩帕', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6394, 'Paraguay', NULL, 'Concepcion', NULL, 'CC', '康塞普西翁', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6395, 'Paraguay', NULL, 'Cordillera', NULL, 'CD', '科迪勒拉', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6396, 'Paraguay', NULL, 'Misiones', NULL, 'MI', '米西奧內斯', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6397, 'Paraguay', NULL, 'Neembucu', NULL, 'NE', '涅恩布庫', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6398, 'Paraguay', NULL, 'Alto Paraguay', NULL, 'AG', '上巴拉圭', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6399, 'Paraguay', NULL, 'Alto Parana', NULL, 'AN', '上巴拉那', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6400, 'Paraguay', NULL, 'San Pedro', NULL, 'SP', '聖佩德羅', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6401, 'Paraguay', NULL, 'Asuncion', NULL, 'AS', '亞松森特別區', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6402, 'Paraguay', NULL, 'Itapua', NULL, 'IT', '伊塔普亞', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6403, 'Paraguay', NULL, 'Central', NULL, 'CE', '中央', NULL, '巴拉圭', 'PRY');
INSERT INTO `region_city` VALUES (6404, 'Palestinian Authority', NULL, 'Gaza Strip', NULL, 'GZ', '加沙地帶', NULL, '巴勒斯坦', 'PSE');
INSERT INTO `region_city` VALUES (6405, 'Palestinian Authority', NULL, 'West Bank', NULL, 'WE', '西岸', NULL, '巴勒斯坦', 'PSE');
INSERT INTO `region_city` VALUES (6406, 'Bahrain', NULL, 'Ash-Shamaliyah', NULL, '5', '北部', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6407, 'Bahrain', NULL, 'Al-Hadd', NULL, '1', '哈德', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6408, 'Bahrain', NULL, 'Hammad', NULL, '12', '哈馬德', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6409, 'Bahrain', NULL, 'Ar-Rifa', NULL, '9', '里法', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6410, 'Bahrain', NULL, 'Al-Manamah', NULL, '3', '麥納麥', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6411, 'Bahrain', NULL, 'Al-Muharraq', NULL, '2', '穆哈拉格', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6412, 'Bahrain', NULL, 'Al-Gharbiyah', NULL, '10', '西部', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6413, 'Bahrain', NULL, 'Isa', NULL, '8', '伊薩城', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6414, 'Bahrain', NULL, 'Al-Wusta', NULL, '7', '中部', NULL, '巴林', 'BHR');
INSERT INTO `region_city` VALUES (6415, 'Brazil', NULL, 'Acre', NULL, 'AC', '阿克里', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6416, 'Brazil', NULL, 'Alagoas', NULL, 'AL', '阿拉戈斯', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6417, 'Brazil', NULL, 'Amapa', NULL, 'AP', '阿馬帕', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6418, 'Brazil', NULL, 'Parana', NULL, 'PR', '巴拉那', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6419, 'Brazil', NULL, 'Brasilia', NULL, 'BSB', '巴西利亞', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6420, 'Brazil', NULL, 'Bahia', NULL, 'BA', '巴伊亞', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6421, 'Brazil', NULL, 'Rio Grande do Norte', NULL, 'RN', '北里奧格蘭德', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6422, 'Brazil', NULL, 'Pernambuco', NULL, 'PE', '伯南布哥', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6423, 'Brazil', NULL, 'Goias', NULL, 'GO', '戈亞斯', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6424, 'Brazil', NULL, 'Rondonia', NULL, 'RO', '朗多尼亞', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6425, 'Brazil', NULL, 'Rio de Janeiro', NULL, 'RJ', '里約熱內盧', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6426, 'Brazil', NULL, 'Roraima', NULL, 'RR', '羅賴馬', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6427, 'Brazil', NULL, 'Maranhao', NULL, 'MA', '馬拉尼昂', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6428, 'Brazil', NULL, 'Mato Grosso', NULL, 'MT', '馬託格羅索', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6429, 'Brazil', NULL, 'Minas Gerais', NULL, 'MG', '米納斯吉拉斯', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6430, 'Brazil', NULL, 'Rio Grande do Sul', NULL, 'RS', '南里奧格蘭德', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6431, 'Brazil', NULL, 'Mato Grosso do Sul', NULL, 'MS', '南馬託格羅索', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6432, 'Brazil', NULL, 'Para', NULL, 'PA', '帕拉', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6433, 'Brazil', NULL, 'Paraiba', NULL, 'PB', '帕拉伊巴', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6434, 'Brazil', NULL, 'Piaui', NULL, 'PI', '皮奧伊', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6435, 'Brazil', NULL, 'Ceara', NULL, 'CE', '塞阿拉', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6436, 'Brazil', NULL, 'Sergipe', NULL, 'SE', '塞爾希培', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6437, 'Brazil', NULL, 'Espirito Santo', NULL, 'ES', '聖埃斯皮里圖', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6438, 'Brazil', NULL, 'Sao Paulo', NULL, 'SP', '聖保羅', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6439, 'Brazil', NULL, 'Santa Catarina', NULL, 'SC', '聖卡塔琳娜', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6440, 'Brazil', NULL, 'Tocantins', NULL, 'TO', '托坎廷斯', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6441, 'Brazil', NULL, 'Amazonas', NULL, 'AM', '亞馬孫', NULL, '巴西', 'BRA');
INSERT INTO `region_city` VALUES (6442, 'White Russia', NULL, 'Bresckaja', NULL, 'BR', '佈列斯特', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6443, 'White Russia', NULL, 'Homelskaja', NULL, 'HO', '戈梅利', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6444, 'White Russia', NULL, 'Hrodzenskaja', NULL, 'HR', '格羅德諾', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6445, 'White Russia', NULL, 'Minsk', NULL, 'MI', '明斯克市', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6446, 'White Russia', NULL, 'Mahileuskaja', NULL, 'MA', '莫吉廖夫', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6447, 'White Russia', NULL, 'Vicebskaja', NULL, 'VI', '維捷布斯克', NULL, '白俄羅斯', 'BLR');
INSERT INTO `region_city` VALUES (6448, 'Bulgaria', NULL, 'Burgas', NULL, 'BOJ', '布爾加斯', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6449, 'Bulgaria', NULL, 'Khaskovo', NULL, 'KHO', '卡斯科伏', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6450, 'Bulgaria', NULL, 'Ruse', NULL, 'ROU', '魯塞', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6451, 'Bulgaria', NULL, 'Lovech', NULL, 'LVP', '洛維奇', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6452, 'Bulgaria', NULL, 'Montana', NULL, 'OZA', '蒙塔納', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6453, 'Bulgaria', NULL, 'Plovdiv', NULL, 'PDV', '普羅夫迪夫', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6454, 'Bulgaria', NULL, 'Sofiya', NULL, 'SOF', '索非亞', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6455, 'Bulgaria', NULL, 'Grad Sofiya', NULL, 'GSO', '索非亞市', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6456, 'Bulgaria', NULL, 'Varna', NULL, 'VAR', '瓦爾納', NULL, '保加利亞', 'BGR');
INSERT INTO `region_city` VALUES (6457, 'Benin', NULL, 'Alibori', NULL, 'AL', '阿黎博里', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6458, 'Benin', NULL, 'Atakora', NULL, 'AK', '阿塔科拉', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6459, 'Benin', NULL, 'Littoral', NULL, 'LI', '濱海', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6460, 'Benin', NULL, 'Bohicon', NULL, 'BOH', '波希康市', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6461, 'Benin', NULL, 'Borgou', NULL, 'BO', '博爾古', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6462, 'Benin', NULL, 'Atlantique', NULL, 'AQ', '大西洋', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6463, 'Benin', NULL, 'Plateau', NULL, 'PL', '高原', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6464, 'Benin', NULL, 'Kouffo', NULL, 'KO', '庫福', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6465, 'Benin', NULL, 'Mono', NULL, 'MO', '莫諾', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6466, 'Benin', NULL, 'Collines', NULL, 'CO', '丘陵', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6467, 'Benin', NULL, 'Oueme', NULL, 'OU', '韋梅', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6468, 'Benin', NULL, 'Donga', NULL, 'DO', '峽谷', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6469, 'Benin', NULL, 'Zou', NULL, 'ZO', '祖', NULL, '貝寧', 'BEN');
INSERT INTO `region_city` VALUES (6470, 'Belgium', NULL, 'Hainaut', NULL, 'WHT', '埃諾', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6471, 'Belgium', NULL, 'Antwerpen', NULL, 'VAN', '安特衛普', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6472, 'Belgium', NULL, 'Brabant-Wallone', NULL, 'WBR', '布拉班特-瓦隆', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6473, 'Belgium', NULL, 'Brussels', NULL, 'BRU', '布魯塞爾', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6474, 'Belgium', NULL, 'Oost-Vlaanderen', NULL, 'VOV', '東佛蘭德', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6475, 'Belgium', NULL, 'Vlaams-Brabant', NULL, 'VBR', '佛蘭芒-布拉班特', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6476, 'Belgium', NULL, 'Liege', NULL, 'WLG', '列日', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6477, 'Belgium', NULL, 'Limburg', NULL, 'VLI', '林堡', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6478, 'Belgium', NULL, 'Luxembourg', NULL, 'WLX', '盧森堡', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6479, 'Belgium', NULL, 'Namur', NULL, 'WNA', '那慕爾', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6480, 'Belgium', NULL, 'West-Vlaanderen', NULL, 'VWV', '西佛蘭德', NULL, '比利時', 'BEL');
INSERT INTO `region_city` VALUES (6481, 'Poland', NULL, 'Elbląg', NULL, 'ELB', '埃爾布隆格', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6482, 'Poland', NULL, 'Olsztyn', NULL, 'OLS', '奧爾什丁', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6483, 'Poland', NULL, 'Ostrołeka', NULL, 'OSS', '奧斯特羅文卡', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6484, 'Poland', NULL, 'Bydgoszcz', NULL, 'BZG', '比得哥什', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6485, 'Poland', NULL, 'Piotrkow', NULL, 'PIO', '彼得庫夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6486, 'Poland', NULL, 'Bytom', NULL, 'BYT', '比托姆', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6487, 'Poland', NULL, 'Biała Podlaska', NULL, 'BAP', '比亞瓦波德拉斯卡', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6488, 'Poland', NULL, 'Białystok', NULL, 'BIA', '比亞維斯托克', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6489, 'Poland', NULL, 'Opole', NULL, 'OPO', '波萊', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6490, 'Poland', NULL, 'Poznan', NULL, 'POZ', '波茲南', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6491, 'Poland', NULL, 'Dabrowa Gornicza', NULL, 'DAB', '達布羅瓦戈尼察', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6492, 'Poland', NULL, 'Gorzow Wlkp', NULL, 'GOW', '大波蘭地區戈茹夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6493, 'Poland', NULL, 'Wroclaw', NULL, 'WRO', '弗羅茨瓦夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6494, 'Poland', NULL, 'Wlocławek', NULL, 'WLO', '弗沃茨瓦韋克', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6495, 'Poland', NULL, 'Gdansk', NULL, 'GDN', '格但斯克', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6496, 'Poland', NULL, 'Gdynia', NULL, 'GDY', '格丁尼亞', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6497, 'Poland', NULL, 'Gliwice', NULL, 'GWC', '格利維采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6498, 'Poland', NULL, 'Grudziadz', NULL, 'GRU', '格魯瓊茲', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6499, 'Poland', NULL, 'Chełm', NULL, 'CHO', '海烏姆', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6500, 'Poland', NULL, 'Warszawa', NULL, 'WAW', '華沙', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6501, 'Poland', NULL, 'Chorzow', NULL, 'CHZ', '霍茹夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6502, 'Poland', NULL, 'Kalisz', NULL, 'KAL', '卡利什', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6503, 'Poland', NULL, 'Katowice', NULL, 'KTW', '卡托維茲', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6504, 'Poland', NULL, 'Kielce', NULL, 'KLC', '凱爾采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6505, 'Poland', NULL, 'Konin', NULL, 'KON', '科寧', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6506, 'Poland', NULL, 'Koszalin', NULL, 'OSZ', '科沙林', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6507, 'Poland', NULL, 'Krakow', NULL, 'KRK', '克拉科夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6508, 'Poland', NULL, 'Krosno', NULL, 'KRO', '克羅斯諾', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6509, 'Poland', NULL, 'Radom', NULL, 'RDM', '拉多姆', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6510, 'Poland', NULL, 'Legnica', NULL, 'LEG', '萊格尼察', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6511, 'Poland', NULL, 'Leszno', NULL, 'LEZ', '萊什諾', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6512, 'Poland', NULL, 'Lublin', NULL, 'LUL', '盧布林', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6513, 'Poland', NULL, 'Ruda Sl', NULL, 'RDS', '魯達', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6514, 'Poland', NULL, 'Lodz', NULL, 'LOD', '羅茲', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6515, 'Poland', NULL, 'Zielona Gora', NULL, 'IEG', '綠山城', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6516, 'Poland', NULL, 'Mysłowice', NULL, 'MYL', '米什洛維采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6517, 'Poland', NULL, 'Piła', NULL, 'PIL', '皮瓦', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6518, 'Poland', NULL, 'Przemysl', NULL, 'PRZ', '普熱梅希爾', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6519, 'Poland', NULL, 'Plock', NULL, 'PLO', '普沃茨克', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6520, 'Poland', NULL, 'Ciechanow', NULL, 'CIE', '切哈努夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6521, 'Poland', NULL, 'Rzeszow', NULL, 'RZE', '熱舒夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6522, 'Poland', NULL, 'Szczecin', NULL, 'SZZ', '什切青', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6523, 'Poland', NULL, 'Skierniewice', NULL, 'SKI', '斯凱爾涅維采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6524, 'Poland', NULL, 'Slupsk', NULL, 'SLP', '斯武普斯克', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6525, 'Poland', NULL, 'Suwałki', NULL, 'SWL', '蘇瓦烏基', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6526, 'Poland', NULL, 'Sopot', NULL, 'SOP', '索波特', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6527, 'Poland', NULL, 'Sosnowiec', NULL, 'SWC', '索斯諾維茨', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6528, 'Poland', NULL, 'Tarnow', NULL, 'TAR', '塔爾努夫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6529, 'Poland', NULL, 'Tarnobrzeg', NULL, 'QEP', '塔爾諾布熱格', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6530, 'Poland', NULL, 'Tychy', NULL, 'TYY', '特切', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6531, 'Poland', NULL, 'Torun', NULL, 'TOR', '托倫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6532, 'Poland', NULL, 'Walbrzych', NULL, 'WZH', '瓦烏布日赫', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6533, 'Poland', NULL, 'Lomza', NULL, 'QOY', '沃姆扎', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6534, 'Poland', NULL, 'Siemianowice Sl', NULL, 'SOW', '希米亞諾維采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6535, 'Poland', NULL, 'Swinoujscie', NULL, 'SWI', '希維諾烏伊希切', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6536, 'Poland', NULL, 'Swietochłowice', NULL, 'SWT', '希維托赫洛維采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6537, 'Poland', NULL, 'Siedlce', NULL, 'SDC', '謝德爾采', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6538, 'Poland', NULL, 'Sieradz', NULL, 'SIR', '謝拉茲', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6539, 'Poland', NULL, 'Nowy Sacz', NULL, 'NOW', '新松奇', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6540, 'Poland', NULL, 'Jaworzno', NULL, 'JAW', '雅沃茲諾', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6541, 'Poland', NULL, 'Jelenia Gora', NULL, 'JEG', '耶萊尼亞古拉', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6542, 'Poland', NULL, 'Zabrze', NULL, 'ZAB', '扎布熱', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6543, 'Poland', NULL, 'Zamosc', NULL, 'ZAM', '扎莫希奇', NULL, '波蘭', 'POL');
INSERT INTO `region_city` VALUES (6544, 'Bolivia', NULL, 'El Alto', NULL, 'ALT', '奧爾托', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6545, 'Bolivia', NULL, 'Oruro', NULL, 'ORU', '奧魯羅', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6546, 'Bolivia', NULL, 'El Beni', NULL, 'BEN', '貝尼', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6547, 'Bolivia', NULL, 'Potosi', NULL, 'POI', '波多西', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6548, 'Bolivia', NULL, 'Quillacollo', NULL, 'QUI', '基拉科洛', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6549, 'Bolivia', NULL, 'Cochabamba', NULL, 'CBB', '科恰班巴', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6550, 'Bolivia', NULL, 'La Paz', NULL, 'LPB', '拉巴斯', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6551, 'Bolivia', NULL, 'Pando', NULL, 'PAN', '潘多', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6552, 'Bolivia', NULL, 'Chuquisaca', NULL, 'CHU', '丘基薩卡', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6553, 'Bolivia', NULL, 'Sacaba', NULL, 'SAC', '薩卡巴', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6554, 'Bolivia', NULL, 'Santa Cruz', NULL, 'SRZ', '聖克魯斯', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6555, 'Bolivia', NULL, 'Tarija', NULL, 'TJA', '塔里哈', NULL, '玻利維亞', 'BOL');
INSERT INTO `region_city` VALUES (6556, 'Bosnia and Herzegovina', NULL, 'Posavski', NULL, 'FPO', '波薩維納', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6557, 'Bosnia and Herzegovina', NULL, 'Bosansko-Podrinjski', NULL, 'FBP', '波斯尼亞－波德里涅', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6558, 'Bosnia and Herzegovina', NULL, 'Tomislavgrad', NULL, 'FTO', '多米斯拉夫格勒', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6559, 'Bosnia and Herzegovina', NULL, 'Hercegovacko-Neretvanski', NULL, 'FHN', '黑塞哥維那－涅雷特瓦', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6560, 'Bosnia and Herzegovina', NULL, 'Sarajevo', NULL, 'FSA', '薩拉熱窩', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6561, 'Bosnia and Herzegovina', NULL, 'Tuzlanski-Podrinjski', NULL, 'FTU', '圖茲拉－波德里涅', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6562, 'Bosnia and Herzegovina', NULL, 'Unsko-Sanski', NULL, 'FUS', '烏納－薩納', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6563, 'Bosnia and Herzegovina', NULL, 'Hercegovacko-Bosanski', NULL, 'FHB', '西波斯尼亞', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6564, 'Bosnia and Herzegovina', NULL, 'Zapadno-Hercegovaki', NULL, 'FZH', '西黑塞哥維那', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6565, 'Bosnia and Herzegovina', NULL, 'Zenicko-Dobojski', NULL, 'FZE', '澤尼察－多博伊', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6566, 'Bosnia and Herzegovina', NULL, 'Srednjo-Bosanski', NULL, 'FSB', '中波斯尼亞', NULL, '波斯尼亞和黑塞哥維那', 'BIH');
INSERT INTO `region_city` VALUES (6567, 'Belize', NULL, 'Belize', NULL, 'BZ', '伯利茲', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6568, 'Belize', NULL, 'Orange Walk', NULL, 'OW', '橘園', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6569, 'Belize', NULL, 'Cayo', NULL, 'CY', '卡約', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6570, 'Belize', NULL, 'Corozal', NULL, 'CR', '科羅薩爾', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6571, 'Belize', NULL, 'Stann Creek', NULL, 'SC', '斯坦港', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6572, 'Belize', NULL, 'Toledo', NULL, 'TO', '托萊多', NULL, '伯利茲', 'BLZ');
INSERT INTO `region_city` VALUES (6573, 'Burkina Faso', NULL, 'Bale', NULL, 'BAL', '巴雷', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6574, 'Burkina Faso', NULL, 'Bam', NULL, 'BAM', '巴姆', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6575, 'Burkina Faso', NULL, 'Banwa', NULL, 'BAN', '巴瓦', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6576, 'Burkina Faso', NULL, 'Bazega', NULL, 'BAZ', '巴澤加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6577, 'Burkina Faso', NULL, 'Poni', NULL, 'PON', '波尼', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6578, 'Burkina Faso', NULL, 'Boulgou', NULL, 'BLG', '布爾古', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6579, 'Burkina Faso', NULL, 'Boulkiemde', NULL, 'BOK', '布爾基恩德', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6580, 'Burkina Faso', NULL, 'Bougouriba', NULL, 'BOR', '布古里巴', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6581, 'Burkina Faso', NULL, 'Ganzourgou', NULL, 'GAN', '岡祖爾古', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6582, 'Burkina Faso', NULL, 'Gourma', NULL, 'GOU', '古爾馬', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6583, 'Burkina Faso', NULL, 'Ziro', NULL, 'ZIR', '濟羅', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6584, 'Burkina Faso', NULL, 'Kadiogo', NULL, 'KAD', '卡焦戈', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6585, 'Burkina Faso', NULL, 'Kenedougou', NULL, 'KEN', '凱內杜古', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6586, 'Burkina Faso', NULL, 'Komondjari', NULL, 'KOO', '科蒙加里', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6587, 'Burkina Faso', NULL, 'Comoe', NULL, 'COM', '科莫埃', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6588, 'Burkina Faso', NULL, 'Kompienga', NULL, 'KOP', '孔皮恩加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6589, 'Burkina Faso', NULL, 'Kossi', NULL, 'KOS', '孔西', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6590, 'Burkina Faso', NULL, 'Koulpelogo', NULL, 'KOL', '庫爾佩羅戈', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6591, 'Burkina Faso', NULL, 'Kourweogo', NULL, 'KOW', '庫爾維奧戈', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6592, 'Burkina Faso', NULL, 'Kouritenga', NULL, 'KOT', '庫里滕加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6593, 'Burkina Faso', NULL, 'Leraba', NULL, 'LER', '雷拉巴', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6594, 'Burkina Faso', NULL, 'Loroum', NULL, 'LOR', '羅盧姆', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6595, 'Burkina Faso', NULL, 'Mouhoun', NULL, 'MOU', '穆翁', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6596, 'Burkina Faso', NULL, 'Namentenga', NULL, 'NAM', '納門滕加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6597, 'Burkina Faso', NULL, 'Nahouri', NULL, 'NAH', '納烏里', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6598, 'Burkina Faso', NULL, 'Nayala', NULL, 'NAY', '納亞拉', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6599, 'Burkina Faso', NULL, 'Gnagna', NULL, 'GNA', '尼亞尼亞', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6600, 'Burkina Faso', NULL, 'Noumbiel', NULL, 'NOU', '努姆比埃爾', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6601, 'Burkina Faso', NULL, 'Passore', NULL, 'PAS', '帕索雷', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6602, 'Burkina Faso', NULL, 'Seno', NULL, 'SEN', '塞諾', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6603, 'Burkina Faso', NULL, 'Sanguie', NULL, 'SAG', '桑吉', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6604, 'Burkina Faso', NULL, 'Sanmatenga', NULL, 'SAM', '桑馬滕加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6605, 'Burkina Faso', NULL, 'Sourou', NULL, 'SOR', '蘇魯', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6606, 'Burkina Faso', NULL, 'Soum', NULL, 'SOM', '蘇姆', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6607, 'Burkina Faso', NULL, 'Tapoa', NULL, 'TAP', '塔波阿', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6608, 'Burkina Faso', NULL, 'Tuy', NULL, 'TUY', '圖伊', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6609, 'Burkina Faso', NULL, 'Houet', NULL, 'HOU', '烏埃', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6610, 'Burkina Faso', NULL, 'Oubritenga', NULL, 'OUB', '烏布里滕加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6611, 'Burkina Faso', NULL, 'Oudalan', NULL, 'OUD', '烏達蘭', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6612, 'Burkina Faso', NULL, 'Sissili', NULL, 'SIS', '錫西里', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6613, 'Burkina Faso', NULL, 'Yagha', NULL, 'YAG', '亞加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6614, 'Burkina Faso', NULL, 'Yatenga', NULL, 'YAT', '亞滕加', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6615, 'Burkina Faso', NULL, 'Ioba', NULL, 'IOA', '伊奧巴', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6616, 'Burkina Faso', NULL, 'Zoundweogo', NULL, 'ZOW', '宗德韋奧戈', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6617, 'Burkina Faso', NULL, 'Zondoma', NULL, 'ZOD', '宗多馬', NULL, '布基納法索', 'BFA');
INSERT INTO `region_city` VALUES (6618, 'Burundi', NULL, 'Bubanza', NULL, 'BB', '布班扎', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6619, 'Burundi', NULL, 'Bururi', NULL, 'BR', '布魯里', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6620, 'Burundi', NULL, 'Bujumbura Mairie', NULL, 'BM', '布瓊布拉城市', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6621, 'Burundi', NULL, 'Bujumbura Rural', NULL, 'BU', '布瓊布拉鄉村', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6622, 'Burundi', NULL, 'Ngozi', NULL, 'NG', '恩戈齊', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6623, 'Burundi', NULL, 'Kirundo', NULL, 'KI', '基龍多', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6624, 'Burundi', NULL, 'Gitega', NULL, 'GI', '基特加', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6625, 'Burundi', NULL, 'Karuzi', NULL, 'KR', '卡魯濟', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6626, 'Burundi', NULL, 'Kayanza', NULL, 'KY', '卡揚扎', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6627, 'Burundi', NULL, 'Cankuzo', NULL, 'CA', '坎庫佐', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6628, 'Burundi', NULL, 'Rutana', NULL, 'RT', '魯塔納', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6629, 'Burundi', NULL, 'Ruyigi', NULL, 'RY', '魯伊吉', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6630, 'Burundi', NULL, 'Makamba', NULL, 'MA', '馬坎巴', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6631, 'Burundi', NULL, 'Muramvya', NULL, 'MU', '穆拉姆維亞', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6632, 'Burundi', NULL, 'Mwaro', NULL, 'MW', '穆瓦洛', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6633, 'Burundi', NULL, 'Muyinga', NULL, 'MY', '穆因加', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6634, 'Burundi', NULL, 'Cibitoke', NULL, 'CI', '錫比托凱', NULL, '布隆迪', 'BDI');
INSERT INTO `region_city` VALUES (6635, 'North Korea', NULL, 'Haeju', NULL, 'HAE', '海州', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6636, 'North Korea', NULL, 'Hyesan', NULL, 'HYE', '惠山', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6637, 'North Korea', NULL, 'Kanggye', NULL, 'KAN', '江界', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6638, 'North Korea', NULL, 'Kaesong', NULL, 'KSN', '開城', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6639, 'North Korea', NULL, 'Naseon', NULL, 'NAS', '羅先', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6640, 'North Korea', NULL, 'Namp\'o', NULL, 'NAM', '南浦', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6641, 'North Korea', NULL, 'Pyongyang', NULL, 'FNJ', '平壤', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6642, 'North Korea', NULL, 'Ch\'ongjin', NULL, 'CHO', '清津', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6643, 'North Korea', NULL, 'Sariwon', NULL, 'SAR', '沙里院', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6644, 'North Korea', NULL, 'Hamhung', NULL, 'HAM', '咸興', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6645, 'North Korea', NULL, 'Sinuiju', NULL, 'SII', '新義州', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6646, 'North Korea', NULL, 'Wonsan', NULL, 'WON', '元山', NULL, '朝鮮', 'PRK');
INSERT INTO `region_city` VALUES (6647, 'Denmark', NULL, 'Aarhus', NULL, 'AR', '奧胡斯', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6648, 'Denmark', NULL, 'Nordjylland', NULL, 'VSV', '北日德蘭', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6649, 'Denmark', NULL, 'Bornholm', NULL, 'BO', '博恩霍爾姆', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6650, 'Denmark', NULL, 'Frederiksborg', NULL, 'FRE', '菲特烈堡', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6651, 'Denmark', NULL, 'Fyn', NULL, 'FY', '菲茵', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6652, 'Denmark', NULL, 'Copenhagen', NULL, 'CPH', '哥本哈根', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6653, 'Denmark', NULL, 'Ribe', NULL, 'RIB', '里伯', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6654, 'Denmark', NULL, 'Ringkoebing', NULL, 'RKG', '靈克賓', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6655, 'Denmark', NULL, 'Roskilde', NULL, 'RKE', '羅斯基勒', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6656, 'Denmark', NULL, 'Soenderjylland', NULL, 'VBI', '南日德蘭', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6657, 'Denmark', NULL, 'Storstroem', NULL, 'ST', '斯多斯特姆', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6658, 'Denmark', NULL, 'Viborg', NULL, 'VIB', '維堡', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6659, 'Denmark', NULL, 'Vejle', NULL, 'VEJ', '維厄勒', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6660, 'Denmark', NULL, 'Vestsjaelland', NULL, 'VS', '西希蘭', NULL, '丹麥', 'DNK');
INSERT INTO `region_city` VALUES (6661, 'Germany', NULL, 'Arnsberg', NULL, 'ARN', '阿恩斯貝格', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6662, 'Germany', NULL, 'Erfurt', NULL, 'ERF', '愛爾福特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6663, 'Germany', NULL, 'Ansbach', NULL, 'ANS', '安斯巴格', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6664, 'Germany', NULL, 'Augsburg', NULL, 'AGB', '奧格斯堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6665, 'Germany', NULL, 'Berlin', NULL, 'BE', '柏林', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6666, 'Germany', NULL, 'Bayreuth', NULL, 'BYU', '拜伊羅特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6667, 'Germany', NULL, 'Bielefeld', NULL, 'BFE', '比勒費爾德', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6668, 'Germany', NULL, 'Potsdam', NULL, 'POT', '波茨坦', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6669, 'Germany', NULL, 'Bochum', NULL, 'BOM', '波鴻', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6670, 'Germany', NULL, 'Bremen', NULL, 'HB', '不來梅', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6671, 'Germany', NULL, 'Brunswick', NULL, 'BRW', '不倫瑞克', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6672, 'Germany', NULL, 'Darmstadt', NULL, 'DAR', '達姆施塔特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6673, 'Germany', NULL, 'Detmold', NULL, 'DET', '代特莫爾特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6674, 'Germany', NULL, 'Dresden', NULL, 'DRS', '德累斯頓', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6675, 'Germany', NULL, 'Dessau', NULL, 'DES', '德紹', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6676, 'Germany', NULL, 'Dusseldorf', NULL, 'DUS', '杜塞爾多夫', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6677, 'Germany', NULL, 'Frankfurt', NULL, 'FFO', '法蘭克福', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6678, 'Germany', NULL, 'Freiburg', NULL, 'FBG', '弗賴堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6679, 'Germany', NULL, 'Halle', NULL, 'HAE', '哈雷', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6680, 'Germany', NULL, 'Hamburg', NULL, 'HH', '漢堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6681, 'Germany', NULL, 'Hannover', NULL, 'HAJ', '漢諾威', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6682, 'Germany', NULL, 'Kiel', NULL, 'KEL', '基爾', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6683, 'Germany', NULL, 'GieBen', NULL, 'GBN', '吉森', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6684, 'Germany', NULL, 'Karlsruhe', NULL, 'KAE', '卡爾斯魯厄', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6685, 'Germany', NULL, 'Kassel', NULL, 'KAS', '卡塞爾', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6686, 'Germany', NULL, 'Chemnitz', NULL, 'CHE', '開姆尼斯', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6687, 'Germany', NULL, 'Koblenz', NULL, 'KOB', '科布倫次', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6688, 'Germany', NULL, 'Cologne', NULL, 'CGN', '科隆', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6689, 'Germany', NULL, 'Leipzig', NULL, 'LEJ', '萊比錫', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6690, 'Germany', NULL, 'Landshut', NULL, 'LDH', '蘭茨胡特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6691, 'Germany', NULL, 'Luneburg', NULL, 'LBG', '呂訥堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6692, 'Germany', NULL, 'Magdeburg', NULL, 'MAG', '馬格德堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6693, 'Germany', NULL, 'Mannheim', NULL, 'MHG', '曼海姆', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6694, 'Germany', NULL, 'Mainz', NULL, 'MAI', '美因茲', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6695, 'Germany', NULL, 'Muenster', NULL, 'MUN', '明斯特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6696, 'Germany', NULL, 'Munich', NULL, 'MUC', '慕尼黑', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6697, 'Germany', NULL, 'Nuremberg', NULL, 'NUE', '紐倫堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6698, 'Germany', NULL, 'Schwerin', NULL, 'SWH', '什未林', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6699, 'Germany', NULL, 'Stuttgart', NULL, 'STR', '斯圖加特', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6700, 'Germany', NULL, 'Trier', NULL, 'TRI', '特里爾', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6701, 'Germany', NULL, 'Wiesbaden', NULL, 'WIB', '威斯巴登', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6702, 'Germany', NULL, 'Wuerzburg', NULL, 'WUG', '維爾茨堡', NULL, '德國', 'DEU');
INSERT INTO `region_city` VALUES (6703, 'Timor-Leste', NULL, 'Aileu', NULL, 'AL', '阿伊萊烏', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6704, 'Timor-Leste', NULL, 'Ainaro', NULL, 'AN', '阿伊納羅', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6705, 'Timor-Leste', NULL, 'Ermera', NULL, 'ER', '埃爾梅拉', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6706, 'Timor-Leste', NULL, 'Ambeno', NULL, 'AM', '安貝諾', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6707, 'Timor-Leste', NULL, 'Baucau', NULL, 'BA', '包考', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6708, 'Timor-Leste', NULL, 'Bobonaro', NULL, 'BO', '博博納羅', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6709, 'Timor-Leste', NULL, 'Dili', NULL, 'DI', '帝力', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6710, 'Timor-Leste', NULL, 'Kovalima', NULL, 'KO', '科瓦利馬', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6711, 'Timor-Leste', NULL, 'Lautem', NULL, 'LA', '勞滕', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6712, 'Timor-Leste', NULL, 'Liquica', NULL, 'LI', '利基卡', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6713, 'Timor-Leste', NULL, 'Manatuto', NULL, 'MT', '馬納圖托', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6714, 'Timor-Leste', NULL, 'Manofahi', NULL, 'MF', '馬努法伊', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6715, 'Timor-Leste', NULL, 'Viqueque', NULL, 'VI', '維克克', NULL, '東帝汶', 'TLS');
INSERT INTO `region_city` VALUES (6716, 'Togo', NULL, 'Maritime', NULL, 'M', '濱海區', NULL, '多哥', 'TGO');
INSERT INTO `region_city` VALUES (6717, 'Togo', NULL, 'Savanes', NULL, 'S', '草原區', NULL, '多哥', 'TGO');
INSERT INTO `region_city` VALUES (6718, 'Togo', NULL, 'Plateaux', NULL, 'P', '高原區', NULL, '多哥', 'TGO');
INSERT INTO `region_city` VALUES (6719, 'Togo', NULL, 'Kara', NULL, 'K', '卡拉區', NULL, '多哥', 'TGO');
INSERT INTO `region_city` VALUES (6720, 'Togo', NULL, 'Centre', NULL, 'C', '中部區', NULL, '多哥', 'TGO');
INSERT INTO `region_city` VALUES (6721, 'Russia', NULL, 'Abakan', NULL, 'ABA', '阿巴坎', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6722, 'Russia', NULL, 'Arkhangelsk', NULL, 'ARK', '阿爾漢格爾斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6723, 'Russia', NULL, 'Aginskoye', NULL, 'AGI', '阿金斯科耶', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6724, 'Russia', NULL, 'Anadyr', NULL, 'DYR', '阿納德爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6725, 'Russia', NULL, 'Astrakhan', NULL, 'AST', '阿斯特拉罕', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6726, 'Russia', NULL, 'Elista', NULL, 'ESL', '埃利斯塔', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6727, 'Russia', NULL, 'Orel', NULL, 'ORL', '奧廖爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6728, 'Russia', NULL, 'Orenburg', NULL, 'ORE', '奧倫堡', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6729, 'Russia', NULL, 'Barnaul', NULL, 'BAX', '巴爾瑙爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6730, 'Russia', NULL, 'Penza', NULL, 'PNZ', '奔薩', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6731, 'Russia', NULL, 'Petropavlovsk-Kamchatskiy', NULL, 'PKC', '彼得羅巴甫洛夫斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6732, 'Russia', NULL, 'Petrozavodsk', NULL, 'PES', '彼得羅扎沃茨克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6733, 'Russia', NULL, 'Perm', NULL, 'PER', '彼爾姆', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6734, 'Russia', NULL, 'Birobidzan', NULL, 'BBZ', '比羅比詹', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6735, 'Russia', NULL, 'Belgorod', NULL, 'BEL', '別爾哥羅德', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6736, 'Russia', NULL, 'Chabarovsk', NULL, 'COK', '伯力', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6737, 'Russia', NULL, 'Blagoveshchensk', NULL, 'BQS', '布拉戈維申斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6738, 'Russia', NULL, 'Bryansk', NULL, 'BRY', '布良斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6739, 'Russia', NULL, 'Chelyabinsk', NULL, 'CHE', '車里雅賓斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6740, 'Russia', NULL, 'Chita', NULL, 'CHI', '赤塔', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6741, 'Russia', NULL, 'Rostov-na-Donu', NULL, 'ROS', '頓河畔羅斯托夫', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6742, 'Russia', NULL, 'Omsk', NULL, 'OMS', '鄂木斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6743, 'Russia', NULL, 'Volgograd', NULL, 'VOG', '伏爾加格勒', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6744, 'Russia', NULL, 'Vladimir', NULL, 'VMR', '弗拉基米爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6745, 'Russia', NULL, 'Vladikavkaz', NULL, 'VLA', '弗拉季高加索', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6746, 'Russia', NULL, 'Gorno-Altajsk', NULL, 'GOA', '戈爾諾－阿爾泰斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6747, 'Russia', NULL, 'Grozny', NULL, 'GRV', '格羅茲尼', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6748, 'Russia', NULL, 'Vladivostok', NULL, 'VVO', '海參崴', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6749, 'Russia', NULL, 'Khanty-Mansiysk', NULL, 'KHM', '漢特－曼西斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6750, 'Russia', NULL, 'Kirov', NULL, 'KIR', '基洛夫', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6751, 'Russia', NULL, 'Kaliningrad', NULL, 'KGD', '加里寧格勒', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6752, 'Russia', NULL, 'Kazan', NULL, 'KZN', '喀山', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6753, 'Russia', NULL, 'Kaluga', NULL, 'KLF', '卡盧加', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6754, 'Russia', NULL, 'Kostroma', NULL, 'KOS', '科斯特羅馬', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6755, 'Russia', NULL, 'Krasnodar', NULL, 'KRR', '克拉斯諾達爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6756, 'Russia', NULL, 'Krasnojarsk', NULL, 'KYA', '克拉斯諾亞爾斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6757, 'Russia', NULL, 'Kemerovo', NULL, 'KEM', '克麥羅沃', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6758, 'Russia', NULL, 'Kyzyl', NULL, 'KYZ', '克孜勒', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6759, 'Russia', NULL, 'Kudymkar', NULL, 'KUD', '庫德姆卡爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6760, 'Russia', NULL, 'Kurgan', NULL, 'KRO', '庫爾干', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6761, 'Russia', NULL, 'Kursk', NULL, 'URS', '庫爾斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6762, 'Russia', NULL, 'Lipeck', NULL, 'LIP', '利佩茨克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6763, 'Russia', NULL, 'Ryazan', NULL, 'RYA', '梁贊', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6764, 'Russia', NULL, 'Makhachkala', NULL, 'MCX', '馬哈奇卡拉', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6765, 'Russia', NULL, 'Magadan', NULL, 'MAG', '馬加丹', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6766, 'Russia', NULL, 'Magas', NULL, 'IN', '馬加斯', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6767, 'Russia', NULL, 'Maykop', NULL, 'MAY', '邁科普', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6768, 'Russia', NULL, 'Murmansk', NULL, 'MMK', '摩爾曼斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6769, 'Russia', NULL, 'Moscow', NULL, 'MOW', '莫斯科', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6770, 'Russia', NULL, 'Nalchik', NULL, 'NAL', '納爾奇克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6771, 'Russia', NULL, 'Naryan-Mar', NULL, 'NNM', '納里揚馬爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6772, 'Russia', NULL, 'Juzno-Sachalinsk', NULL, 'JSA', '南薩哈林斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6773, 'Russia', NULL, 'Velikij Novgorod', NULL, 'VUS', '諾夫哥羅德', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6774, 'Russia', NULL, 'Palana', NULL, 'PAL', '帕拉納', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6775, 'Russia', NULL, 'Pskov', NULL, 'PSK', '普斯科夫', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6776, 'Russia', NULL, 'Cheboksary', NULL, 'CSY', '切博克薩雷', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6777, 'Russia', NULL, 'Cherkessk', NULL, 'CKS', '切爾克斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6778, 'Russia', NULL, 'Tyumen', NULL, 'TYU', '秋明', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6779, 'Russia', NULL, 'Saratov', NULL, 'SAR', '薩拉托夫', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6780, 'Russia', NULL, 'Saransk', NULL, 'SKX', '薩蘭斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6781, 'Russia', NULL, 'Salekhard', NULL, 'SLY', '薩列哈爾德', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6782, 'Russia', NULL, 'Samara', NULL, 'SAM', '薩馬拉', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6783, 'Russia', NULL, 'Syktyvkar', NULL, 'SCW', '瑟克特夫卡爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6784, 'Russia', NULL, 'St. Peterburg', NULL, 'SPE', '聖彼得堡', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6785, 'Russia', NULL, 'Smolensk', NULL, 'LNX', '斯摩棱斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6786, 'Russia', NULL, 'Stavropol', NULL, 'STA', '斯塔夫羅波爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6787, 'Russia', NULL, 'Tambov', NULL, 'TAM', '坦波夫', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6788, 'Russia', NULL, 'Tver', NULL, 'TVE', '特維爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6789, 'Russia', NULL, 'Tula', NULL, 'TUL', '圖拉', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6790, 'Russia', NULL, 'Tomsk', NULL, 'TOM', '托木斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6791, 'Russia', NULL, 'Voronezh', NULL, 'VOR', '沃羅涅什', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6792, 'Russia', NULL, 'Vologda', NULL, 'VLG', '沃洛格達', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6793, 'Russia', NULL, 'Ufa', NULL, 'UFA', '烏法', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6794, 'Russia', NULL, 'Ulan-Ude', NULL, 'UUD', '烏蘭烏德', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6795, 'Russia', NULL, 'Uljanovsk', NULL, 'ULY', '烏里揚諾夫斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6796, 'Russia', NULL, 'Ust-Ordynsky', NULL, 'UOB', '烏斯季奧爾登斯基', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6797, 'Russia', NULL, 'Niznij Novgorod', NULL, 'GOJ', '下諾夫哥羅德', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6798, 'Russia', NULL, 'Novosibirsk', NULL, 'NVS', '新西伯利亞', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6799, 'Russia', NULL, 'Jakutsk', NULL, 'JAK', '雅庫茨克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6800, 'Russia', NULL, 'Jaroslavl', NULL, 'JAR', '雅羅斯拉夫爾', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6801, 'Russia', NULL, 'Jekaterinburg', NULL, 'JEK', '葉卡捷林堡', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6802, 'Russia', NULL, 'Irkutsk', NULL, 'IKT', '伊爾庫茨克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6803, 'Russia', NULL, 'Izhevsk', NULL, 'IJK', '伊熱夫斯克', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6804, 'Russia', NULL, 'Ivanovo', NULL, 'IVO', '伊萬諾沃', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6805, 'Russia', NULL, 'Yoshkar-Ola', NULL, 'YOL', '約什卡爾奧拉', NULL, '俄羅斯', 'RUS');
INSERT INTO `region_city` VALUES (6806, 'Ecuador', NULL, 'Azuay', NULL, 'A', '阿蘇艾', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6807, 'Ecuador', NULL, 'El Oro', NULL, 'O', '埃爾奧羅', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6808, 'Ecuador', NULL, 'Esmeraldas', NULL, 'E', '埃斯梅拉爾達斯', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6809, 'Ecuador', NULL, 'Bolivar', NULL, 'B', '玻利瓦爾', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6810, 'Ecuador', NULL, 'Guayas', NULL, 'G', '瓜亞斯', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6811, 'Ecuador', NULL, 'Galapagos', NULL, 'W', '加拉帕戈斯', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6812, 'Ecuador', NULL, 'Carchi', NULL, 'C', '卡爾奇', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6813, 'Ecuador', NULL, 'Canar', NULL, 'F', '卡尼亞爾', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6814, 'Ecuador', NULL, 'Cotopaxi', NULL, 'X', '科托帕希', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6815, 'Ecuador', NULL, 'Loja', NULL, 'L', '洛哈', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6816, 'Ecuador', NULL, 'Los Rios', NULL, 'R', '洛斯里奧斯', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6817, 'Ecuador', NULL, 'Manabi', NULL, 'M', '馬納比', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6818, 'Ecuador', NULL, 'Morona-Santiago', NULL, 'S', '莫羅納－聖地亞哥', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6819, 'Ecuador', NULL, 'Napo, Orellana', NULL, 'D', '納波，奧雷利亞納', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6820, 'Ecuador', NULL, 'Pastaza', NULL, 'Y', '帕斯塔薩', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6821, 'Ecuador', NULL, 'Pichincha', NULL, 'P', '皮欽查', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6822, 'Ecuador', NULL, 'Chimborazo', NULL, 'H', '欽博拉索', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6823, 'Ecuador', NULL, 'Zamora-Chinchipe', NULL, 'Z', '薩莫拉－欽奇佩', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6824, 'Ecuador', NULL, 'Sucumbios', NULL, 'U', '蘇崑畢奧斯', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6825, 'Ecuador', NULL, 'Tungurahua', NULL, 'T', '通古拉瓦', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6826, 'Ecuador', NULL, 'Imbabura', NULL, 'I', '因巴布拉', NULL, '厄瓜多爾', 'ECU');
INSERT INTO `region_city` VALUES (6827, 'Eritrea', NULL, 'Anseba', NULL, 'KE', '安塞巴', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6828, 'Eritrea', NULL, 'Semenawi Keyih Bahri', NULL, 'SK', '北紅海', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6829, 'Eritrea', NULL, 'Gash Barka', NULL, 'BR', '加什·巴爾卡', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6830, 'Eritrea', NULL, 'Debub', NULL, 'DE', '南部', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6831, 'Eritrea', NULL, 'Debubawi Keyih Bahri', NULL, 'DK', '南紅海', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6832, 'Eritrea', NULL, 'Maekel', NULL, 'MA', '中部', NULL, '厄立特里亞', 'ERI');
INSERT INTO `region_city` VALUES (6833, 'France', NULL, 'Arles', NULL, 'ARL', '阿爾勒', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6834, 'France', NULL, 'Ajaccio', NULL, 'AJA', '阿雅克修', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6835, 'France', NULL, 'Aix-en-Provence', NULL, 'QXB', '艾克斯', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6836, 'France', NULL, 'Orleans', NULL, 'ORR', '奧爾良', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6837, 'France', NULL, 'Paris', NULL, 'PAR', '巴黎', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6838, 'France', NULL, 'Besancon', NULL, 'BSN', '貝桑松', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6839, 'France', NULL, 'Dijon', NULL, 'DIJ', '第戎', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6840, 'France', NULL, 'Frejus', NULL, 'FRJ', '弗雷瑞斯', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6841, 'France', NULL, 'Caen', NULL, 'CFR', '卡昂', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6842, 'France', NULL, 'Rennes', NULL, 'RNS', '雷恩', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6843, 'France', NULL, 'Lyon', NULL, 'LIO', '里昂', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6844, 'France', NULL, 'Lille', NULL, 'LLE', '里爾', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6845, 'France', NULL, 'Limoges', NULL, 'LIG', '利摩日', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6846, 'France', NULL, 'Rouen', NULL, 'URO', '魯昂', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6847, 'France', NULL, 'Marseille', NULL, 'MRS', '馬賽', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6848, 'France', NULL, 'Metz', NULL, 'MZM', '梅斯', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6849, 'France', NULL, 'Montpellier', NULL, 'MPL', '蒙彼利埃', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6850, 'France', NULL, 'Nantes', NULL, 'NTE', '南特', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6851, 'France', NULL, 'Nice', NULL, 'NCE', '尼斯', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6852, 'France', NULL, 'Chalons-en-Champagne', NULL, 'CSM', '沙隆', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6853, 'France', NULL, 'Toulouse', NULL, 'TLS', '圖盧茲', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6854, 'France', NULL, 'Valence', NULL, 'VAA', '瓦朗斯', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6855, 'France', NULL, 'Amiens', NULL, 'AMI', '亞眠', NULL, '法國', 'FRA');
INSERT INTO `region_city` VALUES (6856, 'Philippines', NULL, 'Davao', NULL, 'DOR', '達沃', NULL, '菲律賓', 'PHL');
INSERT INTO `region_city` VALUES (6857, 'Philippines', NULL, 'Caloocan', NULL, 'CAO', '卡盧坎', NULL, '菲律賓', 'PHL');
INSERT INTO `region_city` VALUES (6858, 'Philippines', NULL, 'Manila', NULL, 'MNL', '馬尼拉', NULL, '菲律賓', 'PHL');
INSERT INTO `region_city` VALUES (6859, 'Philippines', NULL, 'Cebu', NULL, 'CEB', '宿務', NULL, '菲律賓', 'PHL');
INSERT INTO `region_city` VALUES (6860, 'Finland', NULL, 'Espoo', NULL, 'ESP', '埃斯波', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6861, 'Finland', NULL, 'Oulu', NULL, 'OLU', '奧盧', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6862, 'Finland', NULL, 'Pori', NULL, 'POR', '波里', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6863, 'Finland', NULL, 'Porvoo', NULL, 'PRV', '博爾沃', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6864, 'Finland', NULL, 'Hameenlinna', NULL, 'HMY', '海門林納', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6865, 'Finland', NULL, 'Helsinki', NULL, 'HEL', '赫爾辛基', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6866, 'Finland', NULL, 'Kajaani', NULL, 'KAJ', '卡亞尼', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6867, 'Finland', NULL, 'Kokkola', NULL, 'KOK', '科科拉', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6868, 'Finland', NULL, 'Kotka', NULL, 'KTK', '科特卡', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6869, 'Finland', NULL, 'Kuopio', NULL, 'KUO', '庫奧皮奧', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6870, 'Finland', NULL, 'Lahti', NULL, 'LHI', '拉赫蒂', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6871, 'Finland', NULL, 'Lappeenranta', NULL, 'LPP', '拉彭蘭塔', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6872, 'Finland', NULL, 'Rovaniemi', NULL, 'RVN', '羅瓦涅米', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6873, 'Finland', NULL, 'Mariehamn', NULL, 'MHQ', '瑪麗港', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6874, 'Finland', NULL, 'Mikkeli', NULL, 'MIK', '米凱利', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6875, 'Finland', NULL, 'Tampere', NULL, 'TMP', '坦佩雷', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6876, 'Finland', NULL, 'Turku', NULL, 'TKU', '圖爾庫', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6877, 'Finland', NULL, 'Vaasa', NULL, 'VAA', '瓦薩', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6878, 'Finland', NULL, 'Vantaa', NULL, 'VAT', '萬塔', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6879, 'Finland', NULL, 'Joensuu', NULL, 'JOE', '約恩蘇', NULL, '芬蘭', 'FIN');
INSERT INTO `region_city` VALUES (6880, 'Cape Verde', NULL, 'Paul', NULL, 'PA', '保爾', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6881, 'Cape Verde', NULL, 'Porto Novo', NULL, 'PN', '波多諾伏', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6882, 'Cape Verde', NULL, 'Boa Vista', NULL, 'BV', '博阿維斯塔島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6883, 'Cape Verde', NULL, 'Brava', NULL, 'BR', '布拉瓦島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6884, 'Cape Verde', NULL, 'Ribeira Grande', NULL, 'RG', '大里貝拉', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6885, 'Cape Verde', NULL, 'Fogo', NULL, 'FO', '福古島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6886, 'Cape Verde', NULL, 'Maio', NULL, 'MA', '馬尤島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6887, 'Cape Verde', NULL, 'Mosteiros', NULL, 'MO', '莫斯特羅', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6888, 'Cape Verde', NULL, 'Praia', NULL, 'PR', '普拉亞', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6889, 'Cape Verde', NULL, 'Sal', NULL, 'SL', '薩爾島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6890, 'Cape Verde', NULL, 'Santo Antao', NULL, 'SA', '聖安唐島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6891, 'Cape Verde', NULL, 'Santiago', NULL, 'IA', '聖地亞哥島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6892, 'Cape Verde', NULL, 'Sao Domingos', NULL, 'SD', '聖多明戈', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6893, 'Cape Verde', NULL, 'Sao Filipe', NULL, 'SF', '聖菲利普', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6894, 'Cape Verde', NULL, 'Santa Catarina', NULL, 'CA', '聖卡塔琳娜', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6895, 'Cape Verde', NULL, 'Santa Cruz', NULL, 'CR', '聖克魯斯', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6896, 'Cape Verde', NULL, 'Sao Miguel', NULL, 'SM', '聖米戈爾', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6897, 'Cape Verde', NULL, 'Sao Nicolau', NULL, 'SN', '聖尼古拉島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6898, 'Cape Verde', NULL, 'Sao Vicente', NULL, 'SV', '聖維森特島', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6899, 'Cape Verde', NULL, 'Tarrafal', NULL, 'TA', '塔拉法爾', NULL, '佛得角', 'CPV');
INSERT INTO `region_city` VALUES (6900, 'Colombia', NULL, 'Arauca', NULL, 'ARA', '阿勞卡', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6901, 'Colombia', NULL, 'Antioquia', NULL, 'ANT', '安提奧基亞', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6902, 'Colombia', NULL, 'Norte de Santander', NULL, 'NDS', '北桑坦德', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6903, 'Colombia', NULL, 'Bogota', NULL, 'BDC', '波哥大首都區', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6904, 'Colombia', NULL, 'Bolivar', NULL, 'BOL', '博利瓦爾', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6905, 'Colombia', NULL, 'Boyaca', NULL, 'BOY', '博亞卡', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6906, 'Colombia', NULL, 'Atlantico', NULL, 'ATL', '大西洋', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6907, 'Colombia', NULL, 'Guaviare', NULL, 'GVR', '瓜維亞雷', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6908, 'Colombia', NULL, 'La Guajira', NULL, 'GJR', '瓜希拉', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6909, 'Colombia', NULL, 'Guainia', NULL, 'GNA', '瓜伊尼亞', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6910, 'Colombia', NULL, 'Quindio', NULL, 'QUI', '金迪奧', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6911, 'Colombia', NULL, 'Caldas', NULL, 'CAL', '卡爾達斯', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6912, 'Colombia', NULL, 'Caqueta', NULL, 'CAQ', '卡克塔', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6913, 'Colombia', NULL, 'Casanare', NULL, 'CAS', '卡薩納雷', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6914, 'Colombia', NULL, 'Cauca', NULL, 'CAU', '考卡', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6915, 'Colombia', NULL, 'Valle del Cauca', NULL, 'VDC', '考卡山谷', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6916, 'Colombia', NULL, 'Cordoba', NULL, 'COR', '科爾多巴', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6917, 'Colombia', NULL, 'Cundinamarca', NULL, 'CAM', '昆迪納馬卡', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6918, 'Colombia', NULL, 'Risaralda', NULL, 'RIS', '利薩拉爾達', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6919, 'Colombia', NULL, 'Magdalena', NULL, 'MAG', '馬格達雷那', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6920, 'Colombia', NULL, 'Meta', NULL, 'MET', '梅塔', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6921, 'Colombia', NULL, 'Narino', NULL, 'NAR', '納里尼奧', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6922, 'Colombia', NULL, 'Putumayo', NULL, 'PUT', '普圖馬約', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6923, 'Colombia', NULL, 'Choco', NULL, 'CHO', '喬科', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6924, 'Colombia', NULL, 'Cesar', NULL, 'CES', '塞薩爾', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6925, 'Colombia', NULL, 'Santander', NULL, 'SAN', '桑坦德', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6926, 'Colombia', NULL, 'San Andres y Providencia', NULL, 'SAP', '聖安德烈斯-普羅維登西亞', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6927, 'Colombia', NULL, 'Sucre', NULL, 'SUC', '蘇克雷', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6928, 'Colombia', NULL, 'Tolima', NULL, 'TOL', '托利馬', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6929, 'Colombia', NULL, 'Vichada', NULL, 'VIC', '維查達', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6930, 'Colombia', NULL, 'Vaupes', NULL, 'VAU', '沃佩斯', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6931, 'Colombia', NULL, 'Huila', NULL, 'HUI', '烏伊拉', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6932, 'Colombia', NULL, 'Amazonas', NULL, 'AMZ', '亞馬孫', NULL, '哥倫比亞', 'COL');
INSERT INTO `region_city` VALUES (6933, 'Costa Rica', NULL, 'Alajuela', NULL, 'A', '阿拉胡埃拉', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6934, 'Costa Rica', NULL, 'Heredia', NULL, 'H', '埃雷迪亞', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6935, 'Costa Rica', NULL, 'Guanacaste', NULL, 'G', '瓜納卡斯特', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6936, 'Costa Rica', NULL, 'Cartago', NULL, 'C', '卡塔戈', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6937, 'Costa Rica', NULL, 'Limon', NULL, 'L', '利蒙', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6938, 'Costa Rica', NULL, 'Puntarenas', NULL, 'P', '蓬塔雷納斯', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6939, 'Costa Rica', NULL, 'San Jose', NULL, 'SJ', '聖何塞', NULL, '哥斯達黎加', 'CRI');
INSERT INTO `region_city` VALUES (6940, 'Cuba', NULL, 'Holguin', NULL, '11', '奧爾金', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6941, 'Cuba', NULL, 'Pinar del Rio', NULL, '1', '比那爾德里奧', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6942, 'Cuba', NULL, 'Villa Clara', NULL, '5', '比亞克拉拉', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6943, 'Cuba', NULL, 'Granma', NULL, '12', '格拉瑪', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6944, 'Cuba', NULL, 'Guantanamo', NULL, '14', '關塔那摩', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6945, 'Cuba', NULL, 'La Habana', NULL, '2', '哈瓦那', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6946, 'Cuba', NULL, 'Ciudad de la Habana', NULL, '3', '哈瓦那城', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6947, 'Cuba', NULL, 'Camaguey', NULL, '9', '卡馬圭', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6948, 'Cuba', NULL, 'Las Tunas', NULL, '10', '拉斯圖納斯', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6949, 'Cuba', NULL, 'Matanzas', NULL, '4', '馬坦薩斯', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6950, 'Cuba', NULL, 'Mayari', NULL, 'MAY', '馬亞里', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6951, 'Cuba', NULL, 'Manzanillo', NULL, 'MZO', '曼薩尼羅', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6952, 'Cuba', NULL, 'Isla de la Juventud', NULL, '99', '青年島特區', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6953, 'Cuba', NULL, 'Santiago de Cuba', NULL, '13', '聖地亞哥', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6954, 'Cuba', NULL, 'Sancti Spiritus', NULL, '7', '聖斯皮里圖斯', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6955, 'Cuba', NULL, 'Cienfuegos', NULL, '6', '西恩富戈斯', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6956, 'Cuba', NULL, 'Ciego de Avila', NULL, '8', '謝戈德阿維拉', NULL, '古巴', 'CUB');
INSERT INTO `region_city` VALUES (6957, 'Guyana', NULL, 'Essequibo Islands-West Demerara', NULL, 'EW', '埃塞奎博群島-西德梅拉拉', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6958, 'Guyana', NULL, 'Barima-Waini', NULL, 'BW', '巴里馬-瓦伊尼', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6959, 'Guyana', NULL, 'Pomeroon-Supenaam', NULL, 'PM', '波默倫-蘇佩納姆', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6960, 'Guyana', NULL, 'Potaro-Siparuni', NULL, 'PI', '波塔羅-錫帕魯尼', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6961, 'Guyana', NULL, 'Demerara-Mahaica', NULL, 'DM', '德梅拉拉-馬海卡', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6962, 'Guyana', NULL, 'East Berbice-Corentyne', NULL, 'EC', '東伯比斯-科蘭太因', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6963, 'Guyana', NULL, 'Cuyuni-Mazaruni', NULL, 'CM', '庫尤尼-馬紮魯尼', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6964, 'Guyana', NULL, 'Mahaica-Berbice', NULL, 'MB', '馬海卡-伯比斯', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6965, 'Guyana', NULL, 'Upper Demerara-Berbice', NULL, 'UD', '上德梅拉拉-伯比斯', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6966, 'Guyana', NULL, 'Upper Takutu-Upper Essequibo', NULL, 'UT', '上塔庫圖-上埃塞奎博', NULL, '圭亞那', 'GUY');
INSERT INTO `region_city` VALUES (6967, 'Kazakhstan', NULL, 'Arkalyk', NULL, 'AYK', '阿爾卡累克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6968, 'Kazakhstan', NULL, 'Aqmola', NULL, 'AKM', '阿克莫拉', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6969, 'Kazakhstan', NULL, 'Aksu', NULL, 'AKS', '阿克蘇', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6970, 'Kazakhstan', NULL, 'Aqtobe', NULL, 'AKT', '阿克托別', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6971, 'Kazakhstan', NULL, 'Almaty', NULL, 'ALA', '阿拉木圖', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6972, 'Kazakhstan', NULL, 'Arys', NULL, 'ARY', '阿雷斯', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6973, 'Kazakhstan', NULL, 'Astana', NULL, 'AST', '阿斯塔納市', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6974, 'Kazakhstan', NULL, 'Atyrau', NULL, 'ATY', '阿特勞', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6975, 'Kazakhstan', NULL, 'Ekibastuz', NULL, 'EKB', '埃基巴斯圖茲', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6976, 'Kazakhstan', NULL, 'Balkhash', NULL, 'BXH', '巴爾喀什', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6977, 'Kazakhstan', NULL, 'Pavlodar', NULL, 'PAV', '巴甫洛達爾', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6978, 'Kazakhstan', NULL, 'Soltustik Qazaqstan', NULL, 'SEV', '北哈薩克斯坦', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6979, 'Kazakhstan', NULL, 'Shyghys Qazaqstan', NULL, 'VOS', '東哈薩克斯坦', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6980, 'Kazakhstan', NULL, 'Zyryanovsk', NULL, 'ZYR', '濟良諾夫斯克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6981, 'Kazakhstan', NULL, 'Zhambyl', NULL, 'DMB', '江布爾', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6982, 'Kazakhstan', NULL, 'Zhezkazgan', NULL, 'DZH', '杰茲卡茲甘', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6983, 'Kazakhstan', NULL, 'Qaraghandy', NULL, 'KAR', '卡拉干達', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6984, 'Kazakhstan', NULL, 'Karazhal', NULL, 'KZO', '卡拉扎爾', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6985, 'Kazakhstan', NULL, 'Kapchagay', NULL, 'KAP', '卡普恰蓋', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6986, 'Kazakhstan', NULL, 'Qostanay', NULL, 'KST', '科斯塔奈', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6987, 'Kazakhstan', NULL, 'Qyzylorda', NULL, 'KZY', '克孜勒奧爾達', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6988, 'Kazakhstan', NULL, 'Kentau', NULL, 'KEN', '肯套', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6989, 'Kazakhstan', NULL, 'Kurchatov', NULL, 'KUR', '庫爾恰托夫', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6990, 'Kazakhstan', NULL, 'Lisakovsk', NULL, 'LKK', '利薩科夫斯克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6991, 'Kazakhstan', NULL, 'Leninogorsk', NULL, 'LEN', '列寧諾戈爾斯克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6992, 'Kazakhstan', NULL, 'Rudny', NULL, 'RUD', '魯德內', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6993, 'Kazakhstan', NULL, 'Mangghystau', NULL, 'MAN', '曼格斯套', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6994, 'Kazakhstan', NULL, 'Ongtustik Qazaqstan', NULL, 'KGT', '南哈薩克斯坦', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6995, 'Kazakhstan', NULL, 'Saran', NULL, 'SAR', '薩蘭', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6996, 'Kazakhstan', NULL, 'Semey', NULL, 'SEM', '塞梅伊', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6997, 'Kazakhstan', NULL, 'Shakhtinsk', NULL, 'SAK', '沙赫京斯克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6998, 'Kazakhstan', NULL, 'Stepnogorsk', NULL, 'STE', '斯捷普諾戈爾斯克', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (6999, 'Kazakhstan', NULL, 'Tekeli', NULL, 'TEK', '鐵克利', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (7000, 'Kazakhstan', NULL, 'Temirtau', NULL, 'TEM', '鐵米爾套', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (7001, 'Kazakhstan', NULL, 'Turkestan', NULL, 'TUR', '突厥斯坦', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (7002, 'Kazakhstan', NULL, 'Batys Qazaqstan', NULL, 'ZAP', '西哈薩克斯坦', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (7003, 'Kazakhstan', NULL, 'Zhanaozen', NULL, 'ZHA', '扎納奧津', NULL, '哈薩克斯坦', 'KAZ');
INSERT INTO `region_city` VALUES (7004, 'Netherlands', NULL, 'Almere', NULL, 'AER', '阿爾梅勒', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7005, 'Netherlands', NULL, 'Amersfoort', NULL, 'AME', '阿默斯福特', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7006, 'Netherlands', NULL, 'Amsterdam', NULL, 'AMS', '阿姆斯特丹', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7007, 'Netherlands', NULL, 'Arnhem', NULL, 'ARN', '阿納姆', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7008, 'Netherlands', NULL, 'Apeldoorn', NULL, 'APE', '阿珀爾多倫', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7009, 'Netherlands', NULL, 'Assen', NULL, 'ASS', '阿森', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7010, 'Netherlands', NULL, 'Ede', NULL, 'EDE', '埃德', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7011, 'Netherlands', NULL, 'Emmen', NULL, 'EMM', '埃門', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7012, 'Netherlands', NULL, 'Eindhoven', NULL, 'EIN', '埃因霍芬', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7013, 'Netherlands', NULL, 'Breda', NULL, 'BRD', '佈雷達', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7014, 'Netherlands', NULL, 'Tilburg', NULL, 'TLB', '蒂爾堡', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7015, 'Netherlands', NULL, 'Dordrecht', NULL, 'DOR', '多德雷赫特', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7016, 'Netherlands', NULL, 'Enschede', NULL, 'ENS', '恩斯赫德', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7017, 'Netherlands', NULL, 'Groningen', NULL, 'GRQ', '格羅寧根', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7018, 'Netherlands', NULL, 'Haarlem', NULL, 'HRA', '哈勒姆', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7019, 'Netherlands', NULL, 'Hague', NULL, 'HAG', '海牙', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7020, 'Netherlands', NULL, 'Hoofddorp', NULL, 'HFD', '霍夫多爾普', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7021, 'Netherlands', NULL, 'Leiden', NULL, 'LID', '萊頓', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7022, 'Netherlands', NULL, 'Lelystad', NULL, 'LEY', '萊利斯塔德', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7023, 'Netherlands', NULL, 'Rotterdam', NULL, 'RTM', '鹿特丹', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7024, 'Netherlands', NULL, 'Leeuwarden', NULL, 'LWR', '呂伐登', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7025, 'Netherlands', NULL, 'Maastricht', NULL, 'MST', '馬斯特裡赫特', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7026, 'Netherlands', NULL, 'Middelburg', NULL, 'MDL', '米德爾堡', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7027, 'Netherlands', NULL, 'Nijmegen', NULL, 'NIJ', '奈梅亨', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7028, 'Netherlands', NULL, '\'s-Hertogenbosch', NULL, 'HTB', '斯海爾托亨博思', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7029, 'Netherlands', NULL, 'Utrecht', NULL, 'UTC', '烏得勒支', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7030, 'Netherlands', NULL, 'Zwolle', NULL, 'ZWO', '茲沃勒', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7031, 'Netherlands', NULL, 'Zoetermeer', NULL, 'ZTM', '佐特爾梅', NULL, '荷蘭', 'NLD');
INSERT INTO `region_city` VALUES (7032, 'Honduras', NULL, 'Atlantida', NULL, 'AT', '阿特蘭蒂達', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7033, 'Honduras', NULL, 'El Paraiso', NULL, 'PA', '埃爾帕拉伊索', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7034, 'Honduras', NULL, 'Ocotepeque', NULL, 'OC', '奧科特佩克', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7035, 'Honduras', NULL, 'Olancho', NULL, 'OL', '奧蘭喬', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7036, 'Honduras', NULL, 'Francisco Morazan', NULL, 'FM', '弗朗西斯科-莫拉桑', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7037, 'Honduras', NULL, 'Gracias a Dios', NULL, 'GD', '格拉西亞斯-阿迪奧斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7038, 'Honduras', NULL, 'Islas de la Bahia', NULL, 'IB', '海灣群島', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7039, 'Honduras', NULL, 'Cortes', NULL, 'CR', '科爾特斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7040, 'Honduras', NULL, 'Colon', NULL, 'CL', '科隆', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7041, 'Honduras', NULL, 'Comayagua', NULL, 'CM', '科馬亞瓜', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7042, 'Honduras', NULL, 'Copan', NULL, 'CP', '科潘', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7043, 'Honduras', NULL, 'La Paz', NULL, 'PZ', '拉巴斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7044, 'Honduras', NULL, 'Lempira', NULL, 'LE', '倫皮拉', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7045, 'Honduras', NULL, 'Choluteca', NULL, 'CH', '喬盧特卡', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7046, 'Honduras', NULL, 'Choloma', NULL, 'CHO', '喬羅馬', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7047, 'Honduras', NULL, 'Valle', NULL, 'VA', '山谷', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7048, 'Honduras', NULL, 'Santa Barbara', NULL, 'SB', '聖巴巴拉', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7049, 'Honduras', NULL, 'Intibuca', NULL, 'IN', '因蒂布卡', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7050, 'Honduras', NULL, 'Yoro', NULL, 'YO', '約羅', NULL, '洪都拉斯', 'HND');
INSERT INTO `region_city` VALUES (7051, 'Kiribati', NULL, 'Phoenix Islands', NULL, 'PHO', '菲尼克斯群島', NULL, '基里巴斯', 'KIR');
INSERT INTO `region_city` VALUES (7052, 'Kiribati', NULL, 'Gilberts Islands', NULL, 'GIL', '吉爾伯特群島', NULL, '基里巴斯', 'KIR');
INSERT INTO `region_city` VALUES (7053, 'Kiribati', NULL, 'Line Islands', NULL, 'LIN', '萊恩群島', NULL, '基里巴斯', 'KIR');
INSERT INTO `region_city` VALUES (7054, 'Djibouti', NULL, 'Ali Sabih', NULL, 'S', '阿里薩比赫區', NULL, '吉布提', 'DJI');
INSERT INTO `region_city` VALUES (7055, 'Djibouti', NULL, 'Obock', NULL, 'O', '奧博克區', NULL, '吉布提', 'DJI');
INSERT INTO `region_city` VALUES (7056, 'Djibouti', NULL, 'Dikhil', NULL, 'K', '迪基勒區', NULL, '吉布提', 'DJI');
INSERT INTO `region_city` VALUES (7057, 'Djibouti', NULL, 'Tadjoura', NULL, 'T', '塔朱拉區', NULL, '吉布提', 'DJI');
INSERT INTO `region_city` VALUES (7058, 'Kyrgyzstan', NULL, 'Osh', NULL, 'O', '奧什', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7059, 'Kyrgyzstan', NULL, 'Batken', NULL, 'B', '巴特肯', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7060, 'Kyrgyzstan', NULL, 'Bishkek', NULL, 'GB', '比什凱克市', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7061, 'Kyrgyzstan', NULL, 'Chuy', NULL, 'C', '楚河', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7062, 'Kyrgyzstan', NULL, 'Jalal-Abad', NULL, 'J', '賈拉拉巴德', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7063, 'Kyrgyzstan', NULL, 'Karabalta', NULL, 'KBA', '卡拉巴爾塔', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7064, 'Kyrgyzstan', NULL, 'Kara-Kol', NULL, 'KKO', '卡拉庫爾', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7065, 'Kyrgyzstan', NULL, 'Kant', NULL, 'KAN', '坎特', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7066, 'Kyrgyzstan', NULL, 'Kok-Jangak', NULL, 'KJ', '科克揚加克', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7067, 'Kyrgyzstan', NULL, 'Mailuu-Suu', NULL, 'MS', '邁利賽', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7068, 'Kyrgyzstan', NULL, 'Naryn', NULL, 'N', '納倫', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7069, 'Kyrgyzstan', NULL, 'Suluktu', NULL, 'SU', '蘇盧克圖', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7070, 'Kyrgyzstan', NULL, 'Talas', NULL, 'T', '塔拉斯', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7071, 'Kyrgyzstan', NULL, 'Tash-Kumyr', NULL, 'TK', '塔什庫梅爾', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7072, 'Kyrgyzstan', NULL, 'Uzgen', NULL, 'UG', '烏茲根', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7073, 'Kyrgyzstan', NULL, 'Ysyk-Kol', NULL, 'Y', '伊塞克湖', NULL, '吉爾吉斯斯坦', 'KGZ');
INSERT INTO `region_city` VALUES (7074, 'Guinea', NULL, 'Boke', NULL, 'BOK', '博凱', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7075, 'Guinea', NULL, 'Nzerekore', NULL, 'NZR', '恩澤雷科雷', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7076, 'Guinea', NULL, 'Faranah', NULL, 'FRN', '法拉納', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7077, 'Guinea', NULL, 'Kindia', NULL, 'KND', '金迪亞', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7078, 'Guinea', NULL, 'Kankan', NULL, 'KNK', '康康', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7079, 'Guinea', NULL, 'Conakry', NULL, 'CNK', '科納克里', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7080, 'Guinea', NULL, 'Labe', NULL, 'LAB', '拉貝', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7081, 'Guinea', NULL, 'Mamou', NULL, 'MAM', '瑪木', NULL, '幾內亞', 'GIN');
INSERT INTO `region_city` VALUES (7082, 'Canada', NULL, 'Abbotsford', NULL, 'ABB', '阿伯茨福', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7083, 'Canada', NULL, 'Edmonton', NULL, 'EDM', '埃德蒙頓', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7084, 'Canada', NULL, 'Oshawa', NULL, 'OSH', '奧沙瓦', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7085, 'Canada', NULL, 'Barrie', NULL, 'BAR', '巴里', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7086, 'Canada', NULL, 'Cape Breton', NULL, 'CBR', '布列塔尼角', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7087, 'Canada', NULL, 'Toronto', NULL, 'TOR', '多倫多', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7088, 'Canada', NULL, 'Fredericton', NULL, 'FRE', '弗雷德里頓', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7089, 'Canada', NULL, 'Guelph', NULL, 'GLP', '圭爾夫', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7090, 'Canada', NULL, 'Halifax', NULL, 'HAL', '哈利法克斯', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7091, 'Canada', NULL, 'Hamilton', NULL, 'HAM', '哈密爾頓', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7092, 'Canada', NULL, 'Whitehorse', NULL, 'YXY', '懷特霍斯', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7093, 'Canada', NULL, 'Kelowna', NULL, 'KWL', '基勞納', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7094, 'Canada', NULL, 'Brampton', NULL, 'BRP', '基奇納', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7095, 'Canada', NULL, 'Kingston', NULL, 'KGN', '金斯敦', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7096, 'Canada', NULL, 'Calgary', NULL, 'CAL', '卡里加里', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7097, 'Canada', NULL, 'Quebec', NULL, 'QUE', '魁北克', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7098, 'Canada', NULL, 'Regina', NULL, 'REG', '里賈納', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7099, 'Canada', NULL, 'London', NULL, 'LOD', '倫敦', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7100, 'Canada', NULL, 'Montreal', NULL, 'MTR', '蒙特利爾', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7101, 'Canada', NULL, 'Sudbury', NULL, 'SUD', '薩德伯里', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7102, 'Canada', NULL, 'Saskatoon', NULL, 'SAK', '薩斯卡通', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7103, 'Canada', NULL, 'Trois-Rivieres', NULL, 'TRR', '三河城', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7104, 'Canada', NULL, 'Thunder Bay', NULL, 'THU', '桑德貝', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7105, 'Canada', NULL, 'Sherbrooke', NULL, 'SBE', '舍布魯克', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7106, 'Canada', NULL, 'St. Catharines', NULL, 'SCA', '聖卡塔琳娜', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7107, 'Canada', NULL, 'Saint-John\'s', NULL, 'SJB', '聖約翰斯', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7108, 'Canada', NULL, 'Victoria', NULL, 'VIC', '維多利亞', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7109, 'Canada', NULL, 'Vancouver', NULL, 'VAN', '溫哥華', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7110, 'Canada', NULL, 'Winnipeg', NULL, 'WNP', '溫尼伯', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7111, 'Canada', NULL, 'Windsor', NULL, 'WDR', '溫莎', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7112, 'Canada', NULL, 'Ottawa', NULL, 'OTT', '渥太華', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7113, 'Canada', NULL, 'Charlottetown', NULL, 'CHA', '夏洛特敦', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7114, 'Canada', NULL, 'Yellowknife', NULL, 'YZF', '耶洛奈夫', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7115, 'Canada', NULL, 'Iqaluit', NULL, 'IQL', '伊魁特', NULL, '加拿大', 'CAN');
INSERT INTO `region_city` VALUES (7116, 'Ghana', NULL, 'Ashanti', NULL, 'AS', '阿散蒂', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7117, 'Ghana', NULL, 'Obuasi', NULL, 'OBU', '奧布阿西', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7118, 'Ghana', NULL, 'Northern', NULL, 'NO', '北部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7119, 'Ghana', NULL, 'Brong Ahafo', NULL, 'BA', '布朗阿哈福', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7120, 'Ghana', NULL, 'Greater Accra', NULL, 'GA', '大阿克拉', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7121, 'Ghana', NULL, 'Eastern', NULL, 'EA', '東部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7122, 'Ghana', NULL, 'Upper East', NULL, 'UE', '上東部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7123, 'Ghana', NULL, 'Upper West', NULL, 'UW', '上西部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7124, 'Ghana', NULL, 'Volta', NULL, 'VO', '沃爾特', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7125, 'Ghana', NULL, 'Western', NULL, 'WE', '西部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7126, 'Ghana', NULL, 'Central', NULL, 'CE', '中部', NULL, '加納', 'GHA');
INSERT INTO `region_city` VALUES (7127, 'Gabon', NULL, 'Ogooue-Lolo', NULL, 'OL', '奧果韋-洛洛', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7128, 'Gabon', NULL, 'Ogooue-Ivindo', NULL, 'OI', '奧果韋-伊溫多', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7129, 'Gabon', NULL, 'Ogooue-Maritime', NULL, 'OM', '濱海奧果韋', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7130, 'Gabon', NULL, 'Ngounie', NULL, 'NG', '恩古涅', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7131, 'Gabon', NULL, 'Estuaire', NULL, 'ES', '河口', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7132, 'Gabon', NULL, 'Nyanga', NULL, 'NY', '尼揚加', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7133, 'Gabon', NULL, 'Haut-Ogooue', NULL, 'HO', '上奧果韋', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7134, 'Gabon', NULL, 'Woleu-Ntem', NULL, 'WN', '沃勒-恩特姆', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7135, 'Gabon', NULL, 'Moyen-Ogooue', NULL, 'MO', '中奧果韋', NULL, '加蓬', 'GAB');
INSERT INTO `region_city` VALUES (7136, 'Cambodia', NULL, 'Otdar Mean Chey', NULL, 'OC', '奧多棉吉', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7137, 'Cambodia', NULL, 'Krong Keb', NULL, 'KB', '白馬市', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7138, 'Cambodia', NULL, 'Preah Vihear', NULL, 'PR', '柏威夏', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7139, 'Cambodia', NULL, 'Krong Pailin', NULL, 'PL', '拜林市', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7140, 'Cambodia', NULL, 'Banteay Mean Chey', NULL, 'BM', '班迭棉吉', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7141, 'Cambodia', NULL, 'Kampong Chhnang', NULL, 'KZC', '磅清揚', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7142, 'Cambodia', NULL, 'Kampong Spoe', NULL, 'KO', '磅士卑', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7143, 'Cambodia', NULL, 'Kampong Thum', NULL, 'KZK', '磅同', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7144, 'Cambodia', NULL, 'Kampong Cham', NULL, 'KM', '磅湛', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7145, 'Cambodia', NULL, 'Prey Veng', NULL, 'PG', '波羅勉', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7146, 'Cambodia', NULL, 'Takev', NULL, 'TK', '茶膠', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7147, 'Cambodia', NULL, 'Svay Rieng', NULL, 'SVR', '柴楨', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7148, 'Cambodia', NULL, 'Kandal', NULL, 'KL', '干丹', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7149, 'Cambodia', NULL, 'Kaoh Kong', NULL, 'KKZ', '戈公', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7150, 'Cambodia', NULL, 'Kampot', NULL, 'KMT', '貢布', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7151, 'Cambodia', NULL, 'Phnum Penh', NULL, 'PNH', '金邊市', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7152, 'Cambodia', NULL, 'Kracheh', NULL, 'KH', '桔井', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7153, 'Cambodia', NULL, 'Rotanak Kiri', NULL, 'RBE', '臘塔納基里', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7154, 'Cambodia', NULL, 'Bat Dambang', NULL, 'BA', '馬德望', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7155, 'Cambodia', NULL, 'Mondol Kiri', NULL, 'MWV', '蒙多基里', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7156, 'Cambodia', NULL, 'Pouthĭsat', NULL, 'PO', '菩薩', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7157, 'Cambodia', NULL, 'Stoeng Treng', NULL, 'TNX', '上丁', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7158, 'Cambodia', NULL, 'Krong Preah', NULL, 'KA', '西哈努克市', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7159, 'Cambodia', NULL, 'Siem Reab', NULL, 'REP', '暹粒', NULL, '柬埔寨', 'KHM');
INSERT INTO `region_city` VALUES (7160, 'Czech Republic', NULL, 'Olomoucky', NULL, 'OL', '奧洛穆茨', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7161, 'Czech Republic', NULL, 'Plzensky', NULL, 'PL', '比爾森', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7162, 'Czech Republic', NULL, 'Prague', NULL, 'PR', '布拉格直轄市', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7163, 'Czech Republic', NULL, 'Kralovehradecky', NULL, 'KR', '赫拉德茨-克拉洛韋', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7164, 'Czech Republic', NULL, 'Karlovarsky', NULL, 'KA', '卡羅維發利', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7165, 'Czech Republic', NULL, 'Liberecky', NULL, 'LI', '利貝雷克', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7166, 'Czech Republic', NULL, 'Moravskoslezsky', NULL, 'MO', '摩拉維亞-西里西亞', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7167, 'Czech Republic', NULL, 'Jihomoravsky', NULL, 'JC', '南摩拉維亞', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7168, 'Czech Republic', NULL, 'Pardubicky', NULL, 'PA', '帕爾杜比采', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7169, 'Czech Republic', NULL, 'Vysocina', NULL, 'VY', '維索基納', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7170, 'Czech Republic', NULL, 'Ustecky', NULL, 'US', '烏斯季', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7171, 'Czech Republic', NULL, 'Stredocesky', NULL, 'ST', '中捷克', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7172, 'Czech Republic', NULL, 'Zlinsky', NULL, 'ZL', '茲林', NULL, '捷克共和國', 'CZE');
INSERT INTO `region_city` VALUES (7173, 'Zimbabwe', NULL, 'Matabeleland North', NULL, 'MN', '北馬塔貝萊蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7174, 'Zimbabwe', NULL, 'Bulawayo', NULL, 'BU', '布拉瓦約', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7175, 'Zimbabwe', NULL, 'Mashonaland East', NULL, 'ME', '東馬紹納蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7176, 'Zimbabwe', NULL, 'Harare', NULL, 'HA', '哈拉雷', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7177, 'Zimbabwe', NULL, 'Manicaland', NULL, 'ML', '馬尼卡蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7178, 'Zimbabwe', NULL, 'Masvingo', NULL, 'MV', '馬斯溫戈', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7179, 'Zimbabwe', NULL, 'Matabeleland South', NULL, 'MS', '南馬塔貝萊蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7180, 'Zimbabwe', NULL, 'Mashonaland West', NULL, 'MW', '西馬紹納蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7181, 'Zimbabwe', NULL, 'Midlands', NULL, 'MD', '中部', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7182, 'Zimbabwe', NULL, 'Mashonaland Central', NULL, 'MC', '中馬紹納蘭', NULL, '津巴布韋', 'ZWE');
INSERT INTO `region_city` VALUES (7183, 'Cameroon', NULL, 'Adamaoua', NULL, 'ADA', '阿達馬瓦', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7184, 'Cameroon', NULL, 'Nord', NULL, 'NOR', '北部', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7185, 'Cameroon', NULL, 'Extreme-Nord', NULL, 'EXN', '北端', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7186, 'Cameroon', NULL, 'Littoral', NULL, 'LIT', '濱海', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7187, 'Cameroon', NULL, 'Est', NULL, 'EST', '東部', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7188, 'Cameroon', NULL, 'Sud', NULL, 'SUD', '南部', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7189, 'Cameroon', NULL, 'Nord-Oueste', NULL, 'NOT', '西北', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7190, 'Cameroon', NULL, 'Ouest', NULL, 'OUE', '西部', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7191, 'Cameroon', NULL, 'Sud-Oueste', NULL, 'SOU', '西南', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7192, 'Cameroon', NULL, 'Centre', NULL, 'CEN', '中央', NULL, '喀麥隆', 'CMR');
INSERT INTO `region_city` VALUES (7193, 'Qatar', NULL, 'Madinat ach Shamal', NULL, 'MS', '北部', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7194, 'Qatar', NULL, 'Ad Dawhah', NULL, 'DW', '多哈', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7195, 'Qatar', NULL, 'Al Ghuwariyah', NULL, 'GW', '古韋里耶', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7196, 'Qatar', NULL, 'Al Khawr', NULL, 'KR', '豪爾', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7197, 'Qatar', NULL, 'Jariyan al Batnah', NULL, 'JB', '杰里揚拜特奈', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7198, 'Qatar', NULL, 'Ar Rayyan', NULL, 'RN', '賴揚', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7199, 'Qatar', NULL, 'Al Wakrah', NULL, 'WK', '沃克拉', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7200, 'Qatar', NULL, 'Umm Salal', NULL, 'UL', '烏姆錫拉勒', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7201, 'Qatar', NULL, 'Al Jumaliyah', NULL, 'JM', '朱邁利耶', NULL, '卡塔爾', 'QAT');
INSERT INTO `region_city` VALUES (7202, 'Cote d\'Ivoire', NULL, 'Agnebi', NULL, 'AG', '阿涅比', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7203, 'Cote d\'Ivoire', NULL, 'Bafing', NULL, 'BF', '巴芬', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7204, 'Cote d\'Ivoire', NULL, 'Vallee du Bandama', NULL, 'VB', '邦達馬河谷', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7205, 'Cote d\'Ivoire', NULL, 'Denguele', NULL, 'DE', '登蓋萊', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7206, 'Cote d\'Ivoire', NULL, 'Nzi-Comoe', NULL, 'NC', '恩濟－科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7207, 'Cote d\'Ivoire', NULL, 'Fromager', NULL, 'FR', '弗羅馬格爾', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7208, 'Cote d\'Ivoire', NULL, 'Lacs', NULL, 'LC', '湖泊', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7209, 'Cote d\'Ivoire', NULL, 'Marahoue', NULL, 'MR', '馬拉韋', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7210, 'Cote d\'Ivoire', NULL, 'Sud-Bandama', NULL, 'SB', '南邦達馬', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7211, 'Cote d\'Ivoire', NULL, 'Sud-Comoe', NULL, 'SC', '南科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7212, 'Cote d\'Ivoire', NULL, 'Haut-Sassandra', NULL, 'HT', '薩桑德拉', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7213, 'Cote d\'Ivoire', NULL, 'Savanes', NULL, 'SV', '薩瓦納', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7214, 'Cote d\'Ivoire', NULL, 'Montagnes', NULL, 'DH', '山地', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7215, 'Cote d\'Ivoire', NULL, 'Worodougou', NULL, 'WR', '沃羅杜古', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7216, 'Cote d\'Ivoire', NULL, 'Bas-Sassandra', NULL, 'BS', '下薩桑德拉', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7217, 'Cote d\'Ivoire', NULL, 'Lagunes', NULL, 'LG', '瀉湖', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7218, 'Cote d\'Ivoire', NULL, 'Zanzan', NULL, 'ZA', '贊贊', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7219, 'Cote d\'Ivoire', NULL, 'Moyen-Cavally', NULL, 'MV', '中卡瓦利', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7220, 'Cote d\'Ivoire', NULL, 'Moyen-Comoe', NULL, 'MC', '中科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `region_city` VALUES (7221, 'Croatia', NULL, 'Osjecko-Baranjska', NULL, '14', '奧西耶克-巴拉尼亞', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7222, 'Croatia', NULL, 'Bjelovarsko-Bilogorska', NULL, '7', '別洛瓦爾-比洛戈拉', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7223, 'Croatia', NULL, 'Primorsko-Goranska', NULL, '8', '濱海和山區', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7224, 'Croatia', NULL, 'Pozega-Slavonia', NULL, '11', '波熱加-斯拉沃尼亞', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7225, 'Croatia', NULL, 'Brodsko-Posavska', NULL, '12', '布羅德-波薩維納', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7226, 'Croatia', NULL, 'Dubrovacko-Neretvanska', NULL, '19', '杜布羅夫斯克-內雷特瓦', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7227, 'Croatia', NULL, 'Karlovacka', NULL, '4', '卡爾洛瓦茨', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7228, 'Croatia', NULL, 'Koprivnicko-Krizevacka', NULL, '6', '科普里夫尼察-克里熱夫齊', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7229, 'Croatia', NULL, 'Krapinsko-Zagorska', NULL, '2', '克拉皮納-扎戈列', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7230, 'Croatia', NULL, 'Licko-Senjska', NULL, '9', '利卡-塞尼', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7231, 'Croatia', NULL, 'Medimurska', NULL, '20', '梅吉穆列', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7232, 'Croatia', NULL, 'Zagrebacka', NULL, '1', '薩格勒布', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7233, 'Croatia', NULL, 'Grad Zagreb', NULL, '21', '薩格勒布市', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7234, 'Croatia', NULL, 'Splitsko-Dalmatinska', NULL, '17', '斯普利特-達爾馬提亞', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7235, 'Croatia', NULL, 'Varazdinska', NULL, '5', '瓦拉日丁', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7236, 'Croatia', NULL, 'Viroviticko-Podravska', NULL, '10', '維羅維蒂察-波德拉維納', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7237, 'Croatia', NULL, 'Vukovarsko-Srijemska', NULL, '16', '武科瓦爾-斯里耶姆', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7238, 'Croatia', NULL, 'Sibensko-Kninska', NULL, '15', '希貝尼克-克寧', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7239, 'Croatia', NULL, 'Sisacko-Moslavacka', NULL, '3', '錫薩克-莫斯拉維納', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7240, 'Croatia', NULL, 'Istarska', NULL, '18', '伊斯特拉', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7241, 'Croatia', NULL, 'Zadarska', NULL, '13', '扎達爾', NULL, '克羅地亞', 'HRV');
INSERT INTO `region_city` VALUES (7242, 'Kenya', NULL, 'Elgeyo-Marakwet', NULL, 'EMA', '埃爾格約-馬拉奎特', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7243, 'Kenya', NULL, 'Baringo', NULL, 'BAR', '巴林戈', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7244, 'Kenya', NULL, 'Bungoma', NULL, 'BUN', '邦戈馬', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7245, 'Kenya', NULL, 'Bomet', NULL, 'BOM', '博美特', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7246, 'Kenya', NULL, 'Busia', NULL, 'BUS', '布希亞', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7247, 'Kenya', NULL, 'Embu', NULL, 'EMB', '恩布', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7248, 'Kenya', NULL, 'Homa Bay', NULL, 'HOB', '霍馬灣', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7249, 'Kenya', NULL, 'Kiambu', NULL, 'KIA', '基安布', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7250, 'Kenya', NULL, 'Kilifi', NULL, 'KIL', '基里菲', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7251, 'Kenya', NULL, 'Kirinyaga', NULL, 'KIR', '基里尼亞加', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7252, 'Kenya', NULL, 'Kisumu', NULL, 'KIS', '基蘇木', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7253, 'Kenya', NULL, 'Kitui', NULL, 'KIT', '基圖伊', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7254, 'Kenya', NULL, 'Kisii', NULL, 'KII', '基西', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7255, 'Kenya', NULL, 'Garissa', NULL, 'GAS', '加里薩', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7256, 'Kenya', NULL, 'Kakamega', NULL, 'KAK', '卡卡梅加', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7257, 'Kenya', NULL, 'Kajiado', NULL, 'KAJ', '卡耶亞多', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7258, 'Kenya', NULL, 'Kericho', NULL, 'KEY', '凱里喬', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7259, 'Kenya', NULL, 'Kwale', NULL, 'KWA', '夸勒', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7260, 'Kenya', NULL, 'Lamu', NULL, 'LAU', '拉木', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7261, 'Kenya', NULL, 'Laikipia', NULL, 'LAI', '萊基皮亞', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7262, 'Kenya', NULL, 'Machakos', NULL, 'MAC', '馬查科斯', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7263, 'Kenya', NULL, 'Makueni', NULL, 'MAK', '馬瓜尼', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7264, 'Kenya', NULL, 'Marsabit', NULL, 'RBT', '馬薩布布', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7265, 'Kenya', NULL, 'Mandera', NULL, 'MAN', '曼德拉', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7266, 'Kenya', NULL, 'Meru', NULL, 'MER', '梅魯', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7267, 'Kenya', NULL, 'Mombasa', NULL, 'MOM', '蒙巴薩', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7268, 'Kenya', NULL, 'Migori', NULL, 'MIG', '米戈利', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7269, 'Kenya', NULL, 'Muranga', NULL, 'MUR', '穆蘭卡', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7270, 'Kenya', NULL, 'Nakuru', NULL, 'NUU', '納庫魯', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7271, 'Kenya', NULL, 'Narok', NULL, 'NAR', '納羅克', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7272, 'Kenya', NULL, 'Nandi', NULL, 'NAN', '南迪', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7273, 'Kenya', NULL, 'Nairobi', NULL, 'NA', '內羅畢', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7274, 'Kenya', NULL, 'Nithi', NULL, 'NIT', '尼蒂', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7275, 'Kenya', NULL, 'Nyamira', NULL, 'NYM', '尼亞米拉', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7276, 'Kenya', NULL, 'Nyandarua', NULL, 'NYN', '年達魯阿', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7277, 'Kenya', NULL, 'Nyeri', NULL, 'NYE', '涅里', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7278, 'Kenya', NULL, 'Samburu', NULL, 'UAS', '桑布盧', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7279, 'Kenya', NULL, 'Tana River', NULL, 'TRI', '塔納河', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7280, 'Kenya', NULL, 'Taita-Taveta', NULL, 'TTA', '泰塔塔維塔', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7281, 'Kenya', NULL, 'Trans-Nzoia', NULL, 'TNZ', '特蘭斯-恩佐亞', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7282, 'Kenya', NULL, 'Turkana', NULL, 'TUR', '圖爾卡納', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7283, 'Kenya', NULL, 'Wajir', NULL, 'WJR', '瓦吉爾', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7284, 'Kenya', NULL, 'Uasin Gishu', NULL, 'UGI', '瓦辛基蘇', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7285, 'Kenya', NULL, 'Vihiga', NULL, 'VIH', '韋希加', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7286, 'Kenya', NULL, 'West Pokot', NULL, 'WPO', '西波克特', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7287, 'Kenya', NULL, 'Siaya', NULL, 'SIA', '夏亞', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7288, 'Kenya', NULL, 'Isiolo', NULL, 'ISI', '伊希約洛', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7289, 'Kenya', NULL, 'Central', NULL, 'CE', '中央', NULL, '肯尼亞', 'KEN');
INSERT INTO `region_city` VALUES (7290, 'Latvia', NULL, 'Aluksnes', NULL, 'ALU', '阿盧克斯內', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7291, 'Latvia', NULL, 'Aizkraukles', NULL, 'AIZ', '愛茲克勞克雷', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7292, 'Latvia', NULL, 'Ogres', NULL, 'OGR', '奧格雷', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7293, 'Latvia', NULL, 'Balvu', NULL, 'BAL', '巴爾維', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7294, 'Latvia', NULL, 'Bauskas', NULL, 'BAU', '包斯卡', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7295, 'Latvia', NULL, 'Cesu', NULL, 'CES', '采西斯', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7296, 'Latvia', NULL, 'Dobeles', NULL, 'DOB', '多貝萊', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7297, 'Latvia', NULL, 'Gulbenes', NULL, 'GUL', '古爾貝內', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7298, 'Latvia', NULL, 'Jekabpils', NULL, 'JEK', '杰卡布皮爾斯', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7299, 'Latvia', NULL, 'Kraslavas', NULL, 'KRA', '克拉斯拉瓦', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7300, 'Latvia', NULL, 'Kuldigas', NULL, 'KUL', '庫爾迪加', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7301, 'Latvia', NULL, 'Rezeknes', NULL, 'RZR', '雷澤克內', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7302, 'Latvia', NULL, 'Rigas', NULL, 'RGA', '里加', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7303, 'Latvia', NULL, 'Liepajas', NULL, 'LPK', '利耶帕亞', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7304, 'Latvia', NULL, 'Limbazu', NULL, 'LIM', '林巴濟', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7305, 'Latvia', NULL, 'Ludzas', NULL, 'LUD', '盧扎', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7306, 'Latvia', NULL, 'Madonas', NULL, 'MAD', '馬多納', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7307, 'Latvia', NULL, 'Preilu', NULL, 'PRE', '普雷利', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7308, 'Latvia', NULL, 'Saldus', NULL, 'SAL', '薩爾杜斯', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7309, 'Latvia', NULL, 'Talsu', NULL, 'TAL', '塔爾西', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7310, 'Latvia', NULL, 'Daugavpils', NULL, 'DGR', '陶格夫皮爾斯', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7311, 'Latvia', NULL, 'Tukuma', NULL, 'TUK', '相簿馬', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7312, 'Latvia', NULL, 'Valkas', NULL, 'VLK', '瓦爾加', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7313, 'Latvia', NULL, 'Valmieras', NULL, 'VLM', '瓦爾米耶拉', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7314, 'Latvia', NULL, 'Ventspils', NULL, 'VSL', '文茨皮爾斯', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7315, 'Latvia', NULL, 'Jelgavas', NULL, 'JGR', '葉爾加瓦', NULL, '拉脫維亞', 'LVA');
INSERT INTO `region_city` VALUES (7316, 'Lesotho', NULL, 'Berea', NULL, 'D', '伯里亞', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7317, 'Lesotho', NULL, 'Butha-Buthe', NULL, 'B', '布塔布泰', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7318, 'Lesotho', NULL, 'Quthing', NULL, 'G', '古廷', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7319, 'Lesotho', NULL, 'Qachas Nek', NULL, 'H', '加查斯內克', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7320, 'Lesotho', NULL, 'Leribe', NULL, 'C', '萊里貝', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7321, 'Lesotho', NULL, 'Mafeteng', NULL, 'E', '馬費滕', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7322, 'Lesotho', NULL, 'Maseru', NULL, 'A', '馬塞盧', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7323, 'Lesotho', NULL, 'Mohales Hoek', NULL, 'F', '莫哈萊斯胡克', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7324, 'Lesotho', NULL, 'Mokhotlong', NULL, 'J', '莫霍特隆', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7325, 'Lesotho', NULL, 'Thaba-Tseka', NULL, 'K', '塔巴采卡', NULL, '萊索托', 'LSO');
INSERT INTO `region_city` VALUES (7326, 'Laos', NULL, 'Attapu', NULL, 'AT', '阿速坡', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7327, 'Laos', NULL, 'Bolikhamxai', NULL, 'BL', '波里坎賽', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7328, 'Laos', NULL, 'Bokeo', NULL, 'BK', '博喬', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7329, 'Laos', NULL, 'Xiangkhoang', NULL, 'XI', '川壙', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7330, 'Laos', NULL, 'Phongsali', NULL, 'PH', '豐沙里', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7331, 'Laos', NULL, 'Khammouan', NULL, 'KH', '甘蒙', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7332, 'Laos', NULL, 'Houaphan', NULL, 'HO', '華潘', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7333, 'Laos', NULL, 'Louangphrabang', NULL, 'LP', '瑯勃拉邦', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7334, 'Laos', NULL, 'Louang Namtha', NULL, 'LM', '瑯南塔', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7335, 'Laos', NULL, 'Xaisomboun', NULL, 'XN', '賽宋本行政特區', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7336, 'Laos', NULL, 'Xekong', NULL, 'XE', '色貢', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7337, 'Laos', NULL, 'Saravan', NULL, 'SL', '沙拉灣', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7338, 'Laos', NULL, 'Savannakhet', NULL, 'SV', '沙灣拿吉', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7339, 'Laos', NULL, 'Xaignabouri', NULL, 'XA', '沙耶武里', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7340, 'Laos', NULL, 'Vientiane', NULL, 'VI', '萬象', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7341, 'Laos', NULL, 'Oudomxai', NULL, 'OU', '烏多姆賽', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7342, 'Laos', NULL, 'Champasak', NULL, 'CH', '占巴塞', NULL, '老撾', 'LAO');
INSERT INTO `region_city` VALUES (7343, 'Lebanon', NULL, 'Ash-Shamal', NULL, 'AS', '北部', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7344, 'Lebanon', NULL, 'Al-Biqa', NULL, 'BI', '貝卡', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7345, 'Lebanon', NULL, 'Bayrut', NULL, 'BA', '貝魯特', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7346, 'Lebanon', NULL, 'Jabal Lubnan', NULL, 'JL', '黎巴嫩山', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7347, 'Lebanon', NULL, 'An-Nabatiyah', NULL, 'NA', '奈拜提耶市', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7348, 'Lebanon', NULL, 'Al-Janub', NULL, 'JA', '南部', NULL, '黎巴嫩', 'LBN');
INSERT INTO `region_city` VALUES (7349, 'Liberia', NULL, 'Gbarpolu', NULL, 'GBA', '巴波盧', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7350, 'Liberia', NULL, 'Bong', NULL, 'BG', '邦', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7351, 'Liberia', NULL, 'Bopolu', NULL, 'BOP', '博波盧', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7352, 'Liberia', NULL, 'Bomi', NULL, 'BM', '博米', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7353, 'Liberia', NULL, 'Grand Bassa', NULL, 'GB', '大巴薩', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7354, 'Liberia', NULL, 'Grand Gedeh', NULL, 'GG', '大吉德', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7355, 'Liberia', NULL, 'Grand Cape Mount', NULL, 'CM', '大角山', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7356, 'Liberia', NULL, 'Grand Kru', NULL, 'GK', '大克魯', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7357, 'Liberia', NULL, 'Fish Town', NULL, 'FT', '菲什敦', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7358, 'Liberia', NULL, 'River Gee', NULL, 'RG', '吉河', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7359, 'Liberia', NULL, 'River Cess', NULL, 'RI', '里弗塞斯', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7360, 'Liberia', NULL, 'Lofa', NULL, 'LO', '洛法', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7361, 'Liberia', NULL, 'Margibi', NULL, 'MG', '馬吉比', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7362, 'Liberia', NULL, 'Maryland', NULL, 'MY', '馬里蘭', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7363, 'Liberia', NULL, 'Montserrado', NULL, 'MO', '蒙特塞拉多', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7364, 'Liberia', NULL, 'Nimba', NULL, 'NI', '寧巴', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7365, 'Liberia', NULL, 'Sinoe', NULL, 'SI', '錫諾', NULL, '利比里亞', 'LBR');
INSERT INTO `region_city` VALUES (7366, 'Lithuania', NULL, 'Alytus', NULL, 'AL', '阿利圖斯', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7367, 'Lithuania', NULL, 'Kaunas', NULL, 'KA', '考納斯', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7368, 'Lithuania', NULL, 'Klaipeda', NULL, 'KL', '克萊佩達', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7369, 'Lithuania', NULL, 'Marijampole', NULL, 'MA', '馬里揚泊列', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7370, 'Lithuania', NULL, 'Panevezys', NULL, 'PA', '帕涅韋日斯', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7371, 'Lithuania', NULL, 'Taurages', NULL, 'TA', '陶拉格', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7372, 'Lithuania', NULL, 'Telsiu', NULL, 'TE', '特爾希艾', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7373, 'Lithuania', NULL, 'Vilnius', NULL, 'VI', '維爾紐斯', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7374, 'Lithuania', NULL, 'Utenos', NULL, 'UT', '烏田納', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7375, 'Lithuania', NULL, 'Siauliai', NULL, 'SI', '希奧利艾', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7376, 'Lithuania', NULL, 'Akmenes', NULL, 'AKM', '亞克曼', NULL, '立陶宛', 'LTU');
INSERT INTO `region_city` VALUES (7377, 'Luxembourg', NULL, 'Diekirch', NULL, 'DD', '迪基希', NULL, '盧森堡', 'LUX');
INSERT INTO `region_city` VALUES (7378, 'Luxembourg', NULL, 'Grevenmacher', NULL, 'GG', '格雷文馬赫', NULL, '盧森堡', 'LUX');
INSERT INTO `region_city` VALUES (7379, 'Luxembourg', NULL, 'Luxembourg', NULL, 'LL', '盧森堡', NULL, '盧森堡', 'LUX');
INSERT INTO `region_city` VALUES (7380, 'Rwanda', NULL, 'Byumba', NULL, 'BY', '比溫巴', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7381, 'Rwanda', NULL, 'Butare', NULL, 'BU', '布塔雷', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7382, 'Rwanda', NULL, 'Nyanza', NULL, 'NY', '恩延扎', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7383, 'Rwanda', NULL, 'Kibungo', NULL, 'KG', '基本古', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7384, 'Rwanda', NULL, 'Kibuye', NULL, 'KY', '基布耶', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7385, 'Rwanda', NULL, 'Kigali-Ngali', NULL, 'KR', '基加利-恩加利', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7386, 'Rwanda', NULL, 'Kigali-Ville', NULL, 'KV', '基加利市', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7387, 'Rwanda', NULL, 'Gikongoro', NULL, 'GK', '吉孔戈羅', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7388, 'Rwanda', NULL, 'Gisenyi', NULL, 'GS', '吉塞尼', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7389, 'Rwanda', NULL, 'Gitarama', NULL, 'GT', '吉塔拉馬', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7390, 'Rwanda', NULL, 'Kabuga', NULL, 'KA', '卡布加', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7391, 'Rwanda', NULL, 'Rwamagana', NULL, 'RW', '盧瓦馬加納', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7392, 'Rwanda', NULL, 'Ruhango', NULL, 'RH', '魯漢戈', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7393, 'Rwanda', NULL, 'Ruhengeri', NULL, 'RU', '魯亨蓋里', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7394, 'Rwanda', NULL, 'Cyangugu', NULL, 'CY', '尚古古', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7395, 'Rwanda', NULL, 'Umutara', NULL, 'UM', '烏姆塔拉', NULL, '盧旺達', 'RWA');
INSERT INTO `region_city` VALUES (7396, 'Romania', NULL, 'Alba Iulia', NULL, 'AL', '阿爾巴尤利亞', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7397, 'Romania', NULL, 'Arad', NULL, 'AR', '阿拉德', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7398, 'Romania', NULL, 'Oradea', NULL, 'OR', '奧拉迪亞', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7399, 'Romania', NULL, 'Bacau', NULL, 'BA', '巴克烏', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7400, 'Romania', NULL, 'Baia Mare', NULL, 'BM', '巴亞馬雷', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7401, 'Romania', NULL, 'Bistrita', NULL, 'BN', '比斯特里察', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7402, 'Romania', NULL, 'Botosani', NULL, 'BO', '博托沙尼', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7403, 'Romania', NULL, 'Bucuresti', NULL, 'BC', '布加勒斯特', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7404, 'Romania', NULL, 'Brasov', NULL, 'BS', '布拉索夫', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7405, 'Romania', NULL, 'Braila', NULL, 'BL', '布勒伊拉', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7406, 'Romania', NULL, 'Buzau', NULL, 'BZ', '布澤烏', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7407, 'Romania', NULL, 'Drobeta-Turnu Severin', NULL, 'DT', '德羅貝塔-塞維林堡', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7408, 'Romania', NULL, 'Deva', NULL, 'DE', '德瓦', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7409, 'Romania', NULL, 'Timisoara', NULL, 'TI', '蒂米什瓦拉', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7410, 'Romania', NULL, 'Focsani', NULL, 'FO', '福克沙尼', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7411, 'Romania', NULL, 'Galati', NULL, 'GL', '加拉茨', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7412, 'Romania', NULL, 'Giurgiu', NULL, 'GG', '久爾久', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7413, 'Romania', NULL, 'Constanta', NULL, 'CT', '康斯坦察', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7414, 'Romania', NULL, 'Craiova', NULL, 'DO', '克拉約瓦', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7415, 'Romania', NULL, 'Calarasi', NULL, 'CR', '克勒拉希', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7416, 'Romania', NULL, 'Cluj-Napoca', NULL, 'CN', '克盧日納波卡', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7417, 'Romania', NULL, 'XRimnicu Vilcea', NULL, 'VI', '勒姆尼庫沃爾恰', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7418, 'Romania', NULL, 'Resita', NULL, 'RE', '雷希察', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7419, 'Romania', NULL, 'Miercurea-Ciuc', NULL, 'MC', '梅爾庫里亞丘克', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7420, 'Romania', NULL, 'Pitesti', NULL, 'PI', '皮特什蒂', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7421, 'Romania', NULL, 'Piatra Neamt', NULL, 'PN', '皮亞特拉尼亞姆茨', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7422, 'Romania', NULL, 'Ploiesti', NULL, 'PL', '普洛耶什蒂', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7423, 'Romania', NULL, 'Satu Mare', NULL, 'SM', '薩圖·馬雷', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7424, 'Romania', NULL, 'Sfantu-Gheorghe', NULL, 'SG', '聖格奧爾基', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7425, 'Romania', NULL, 'Slatina', NULL, 'ST', '斯拉蒂納', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7426, 'Romania', NULL, 'Slobozia', NULL, 'SB', '斯洛博齊亞', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7427, 'Romania', NULL, 'Suceava', NULL, 'SU', '蘇恰瓦', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7428, 'Romania', NULL, 'Targovişte', NULL, 'TA', '特爾戈維什泰', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7429, 'Romania', NULL, 'Tirgu Mures', NULL, 'TM', '特爾古穆列什', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7430, 'Romania', NULL, 'Tirgu-Jiu', NULL, 'TJ', '特爾古日烏', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7431, 'Romania', NULL, 'Tulcea', NULL, 'TU', '圖爾恰', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7432, 'Romania', NULL, 'Vaslui', NULL, 'VA', '瓦斯盧伊', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7433, 'Romania', NULL, 'Sibiu', NULL, 'SO', '錫比烏', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7434, 'Romania', NULL, 'Iasi', NULL, 'IS', '雅西', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7435, 'Romania', NULL, 'Alexandria', NULL, 'AD', '亞厲山德里亞', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7436, 'Romania', NULL, 'Zalau', NULL, 'ZA', '扎勒烏', NULL, '羅馬尼亞', 'ROU');
INSERT INTO `region_city` VALUES (7437, 'Madagascar', NULL, 'Antsiranana', NULL, 'AS', '安齊拉納納', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7438, 'Madagascar', NULL, 'Fianarantsoa', NULL, 'FN', '菲亞納蘭楚阿', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7439, 'Madagascar', NULL, 'Mahajanga', NULL, 'MJ', '馬哈贊加', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7440, 'Madagascar', NULL, 'Antananarivo', NULL, 'AN', '塔那那利佛', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7441, 'Madagascar', NULL, 'Toamasina', NULL, 'TM', '圖阿馬西拉', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7442, 'Madagascar', NULL, 'Toliary', NULL, 'TL', '圖利亞拉', NULL, '馬達加斯加', 'MDG');
INSERT INTO `region_city` VALUES (7443, 'Maldives', NULL, 'Addu Atoll', NULL, 'ADD', '阿杜', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7444, 'Maldives', NULL, 'North Ari Atoll', NULL, 'AAD', '北阿里', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7445, 'Maldives', NULL, 'North Thiladhunmathi', NULL, 'THD', '北蒂拉杜馬蒂', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7446, 'Maldives', NULL, 'North Maalhosmadhulu', NULL, 'MAD', '北馬洛斯馬杜盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7447, 'Maldives', NULL, 'North Miladhunmadhulu', NULL, 'MLD', '北米拉杜馬杜盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7448, 'Maldives', NULL, 'North Nilandhe Atoll', NULL, 'NAD', '北尼蘭杜', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7449, 'Maldives', NULL, 'North Huvadhu Atoll', NULL, 'HAD', '北蘇瓦迪瓦', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7450, 'Maldives', NULL, 'Faadhippolhu', NULL, 'FAA', '法迪福盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7451, 'Maldives', NULL, 'Felidhu Atoll', NULL, 'FEA', '費利杜', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7452, 'Maldives', NULL, 'Foammulah', NULL, 'FMU', '福阿穆拉庫', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7453, 'Maldives', NULL, 'Hadhdhunmathi', NULL, 'HDH', '哈杜馬蒂', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7454, 'Maldives', NULL, 'Kolhumadulu', NULL, 'KLH', '科盧馬杜盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7455, 'Maldives', NULL, 'Male', NULL, 'MAL', '馬累', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7456, 'Maldives', NULL, 'Male Atoll', NULL, 'MAA', '馬累島', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7457, 'Maldives', NULL, 'Mulakatholhu', NULL, 'MUA', '穆拉庫', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7458, 'Maldives', NULL, 'South Ari Atoll', NULL, 'AAU', '南阿里', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7459, 'Maldives', NULL, 'South Thiladhunmathi', NULL, 'THU', '南蒂拉杜馬蒂', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7460, 'Maldives', NULL, 'South Maalhosmadulu', NULL, 'MAU', '南馬洛斯馬杜盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7461, 'Maldives', NULL, 'South Miladhunmadhulu', NULL, 'MLU', '南米拉杜馬杜盧', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7462, 'Maldives', NULL, 'South Nilandhe Atoll', NULL, 'NAU', '南尼蘭杜', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7463, 'Maldives', NULL, 'South Huvadhu Atoll', NULL, 'HAU', '南蘇瓦迪瓦', NULL, '馬爾代夫', 'MDV');
INSERT INTO `region_city` VALUES (7464, 'Malawi', NULL, 'Northern', NULL, 'N', '北部區', NULL, '馬拉維', 'MWI');
INSERT INTO `region_city` VALUES (7465, 'Malawi', NULL, 'Southern', NULL, 'S', '南部區', NULL, '馬拉維', 'MWI');
INSERT INTO `region_city` VALUES (7466, 'Malawi', NULL, 'Central', NULL, 'C', '中央區', NULL, '馬拉維', 'MWI');
INSERT INTO `region_city` VALUES (7467, 'Mali', NULL, 'Bamako', NULL, 'CD', '巴馬科首都區', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7468, 'Mali', NULL, 'Kidal', NULL, 'KD', '基達爾', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7469, 'Mali', NULL, 'Gao', NULL, 'GA', '加奧', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7470, 'Mali', NULL, 'Kayes', NULL, 'KY', '卡伊', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7471, 'Mali', NULL, 'Koulikoro', NULL, 'KL', '庫利科羅', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7472, 'Mali', NULL, 'Mopti', NULL, 'MP', '莫普提', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7473, 'Mali', NULL, 'Segou', NULL, 'SG', '塞古', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7474, 'Mali', NULL, 'Tombouctou', NULL, 'TB', '通佈圖', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7475, 'Mali', NULL, 'Sikasso', NULL, 'SK', '錫卡索', NULL, '馬里', 'MLI');
INSERT INTO `region_city` VALUES (7476, 'Mauritania', NULL, 'Adrar', NULL, 'AD', '阿德拉爾', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7477, 'Mauritania', NULL, 'El-Acaba', NULL, 'AS', '阿薩巴', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7478, 'Mauritania', NULL, 'Brakna', NULL, 'BR', '卜拉克納', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7479, 'Mauritania', NULL, 'Hodh el-Gharbi', NULL, 'HG', '東胡德', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7480, 'Mauritania', NULL, 'Gorgol', NULL, 'GO', '戈爾戈勒', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7481, 'Mauritania', NULL, 'Guidimaka', NULL, 'GM', '吉迪馬卡', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7482, 'Mauritania', NULL, 'Dakhlet Nouadhibou', NULL, 'DN', '努瓦迪布灣', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7483, 'Mauritania', NULL, 'Nouakchott', NULL, 'NO', '努瓦克肖特特區', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7484, 'Mauritania', NULL, 'Tagant', NULL, 'TA', '塔甘特', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7485, 'Mauritania', NULL, 'Trarza', NULL, 'TR', '特拉扎', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7486, 'Mauritania', NULL, 'Tiris Zemmour', NULL, 'TZ', '提里斯-宰穆爾', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7487, 'Mauritania', NULL, 'Hodh ech-Chargui', NULL, 'HC', '西胡德', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7488, 'Mauritania', NULL, 'Inchiri', NULL, 'IN', '因希里', NULL, '毛里塔尼亞', 'MRT');
INSERT INTO `region_city` VALUES (7489, 'American Samoa', NULL, 'Aana', NULL, 'AAN', '阿納', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7490, 'American Samoa', NULL, 'Atua', NULL, 'ATU', '阿圖阿', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7491, 'American Samoa', NULL, 'Aigaile Tai', NULL, 'AIT', '艾加伊勒泰', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7492, 'American Samoa', NULL, 'Faasaleleaga', NULL, 'FAA', '法塞萊萊阿加', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7493, 'American Samoa', NULL, 'Gagaifomauga', NULL, 'GFG', '加蓋福毛加', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7494, 'American Samoa', NULL, 'Gagaemauga', NULL, 'GMG', '加加埃毛加', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7495, 'American Samoa', NULL, 'Palauli', NULL, 'PAL', '帕勞利', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7496, 'American Samoa', NULL, 'Satupaitea', NULL, 'SAT', '薩圖帕伊泰阿', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7497, 'American Samoa', NULL, 'Savaii', NULL, 'SAV', '薩瓦伊島', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7498, 'American Samoa', NULL, 'Tuamasaga', NULL, 'TUA', '圖阿馬薩加', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7499, 'American Samoa', NULL, 'Vaao Fonoti', NULL, 'VAF', '瓦奧福諾蒂', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7500, 'American Samoa', NULL, 'Vaisigano', NULL, 'VAI', '韋西加諾', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7501, 'American Samoa', NULL, 'Upolu', NULL, 'UPO', '烏波盧島', NULL, '美屬薩摩亞', 'ASM');
INSERT INTO `region_city` VALUES (7502, 'Mongolia', NULL, 'Bayanhongor', NULL, '69', '巴彥洪格爾', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7503, 'Mongolia', NULL, 'Bayan-Ulgiy', NULL, '71', '巴彥烏勒蓋', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7504, 'Mongolia', NULL, 'Bulgan', NULL, '67', '布爾干', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7505, 'Mongolia', NULL, 'Darhan-Uul', NULL, '37', '達爾汗烏勒', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7506, 'Mongolia', NULL, 'Dornod', NULL, '61', '東方', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7507, 'Mongolia', NULL, 'Dornogovi', NULL, '63', '東戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7508, 'Mongolia', NULL, 'Orhon', NULL, '35', '鄂爾渾', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7509, 'Mongolia', NULL, 'Govi-Altay', NULL, '65', '戈壁阿爾泰', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7510, 'Mongolia', NULL, 'Govisumber', NULL, '64', '戈壁蘇木貝爾', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7511, 'Mongolia', NULL, 'Arhangay', NULL, '73', '后杭愛', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7512, 'Mongolia', NULL, 'Hovd', NULL, '43', '科布多', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7513, 'Mongolia', NULL, 'Hentiy', NULL, '39', '肯特', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7514, 'Mongolia', NULL, 'Hovsgol', NULL, '41', '庫蘇古爾', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7515, 'Mongolia', NULL, 'Umnogovi', NULL, 'UMN', '南戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7516, 'Mongolia', NULL, 'Uvorhangay', NULL, 'UVO', '前杭愛', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7517, 'Mongolia', NULL, 'Selenge', NULL, '49', '色楞格', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7518, 'Mongolia', NULL, 'Suhbaatar', NULL, '51', '蘇赫巴托爾', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7519, 'Mongolia', NULL, 'Uvs', NULL, '46', '烏布蘇', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7520, 'Mongolia', NULL, 'Ulaanbaatar hot', NULL, '1', '烏蘭巴托市', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7521, 'Mongolia', NULL, 'Dzavhan', NULL, '57', '扎布汗', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7522, 'Mongolia', NULL, 'Dundgovi', NULL, '59', '中戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7523, 'Mongolia', NULL, 'Tov', NULL, '47', '中央', NULL, '蒙古', 'MNG');
INSERT INTO `region_city` VALUES (7524, 'Bangladesh', NULL, 'Dhaka', NULL, 'DAC', '達卡', NULL, '孟加拉', 'BGD');
INSERT INTO `region_city` VALUES (7525, 'Bangladesh', NULL, 'Chittagong', NULL, 'CGP', '吉大港', NULL, '孟加拉', 'BGD');
INSERT INTO `region_city` VALUES (7526, 'Bangladesh', NULL, 'Khulna', NULL, 'KHL', '庫爾納', NULL, '孟加拉', 'BGD');
INSERT INTO `region_city` VALUES (7527, 'Peru', NULL, 'Arequipa', NULL, 'AR', '阿雷基帕', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7528, 'Peru', NULL, 'Apurimac', NULL, 'AP', '阿普里馬克', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7529, 'Peru', NULL, 'Ayacucho', NULL, 'AY', '阿亞庫喬', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7530, 'Peru', NULL, 'Ancash', NULL, 'AN', '安卡什', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7531, 'Peru', NULL, 'Juliaca', NULL, 'JUL', '胡利亞卡', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7532, 'Peru', NULL, 'Junin', NULL, 'JU', '胡寧', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7533, 'Peru', NULL, 'Cajamarca', NULL, 'CJ', '卡哈馬卡', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7534, 'Peru', NULL, 'Callao', NULL, 'CL', '卡亞俄', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7535, 'Peru', NULL, 'Cusco', NULL, 'CU', '庫斯科', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7536, 'Peru', NULL, 'La Libertad', NULL, 'LD', '拉利伯塔德', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7537, 'Peru', NULL, 'Lambayeque', NULL, 'LY', '蘭巴耶克', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7538, 'Peru', NULL, 'Lima', NULL, 'LI', '利馬', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7539, 'Peru', NULL, 'Loreto', NULL, 'LO', '洛雷托', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7540, 'Peru', NULL, 'Madre de Dios', NULL, 'MD', '馬德雷德迪奧斯', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7541, 'Peru', NULL, 'Moquegua', NULL, 'MO', '莫克瓜', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7542, 'Peru', NULL, 'Pasco', NULL, 'PA', '帕斯科', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7543, 'Peru', NULL, 'Piura', NULL, 'PI', '皮烏拉', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7544, 'Peru', NULL, 'Puno', NULL, 'PU', '普諾', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7545, 'Peru', NULL, 'Chimbote', NULL, 'CHM', '欽博特', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7546, 'Peru', NULL, 'Chincha Alta', NULL, 'CHI', '欽查阿爾塔', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7547, 'Peru', NULL, 'San Martin', NULL, 'SM', '聖馬丁', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7548, 'Peru', NULL, 'Sullana', NULL, 'SUL', '蘇拉納', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7549, 'Peru', NULL, 'Tacna', NULL, 'TA', '塔克納', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7550, 'Peru', NULL, 'Tumbes', NULL, 'TU', '通貝斯', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7551, 'Peru', NULL, 'Huanuco', NULL, 'HO', '瓦努科', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7552, 'Peru', NULL, 'Huancavelica', NULL, 'HV', '萬卡維利卡', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7553, 'Peru', NULL, 'Ucayali', NULL, 'UC', '烏卡亞利', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7554, 'Peru', NULL, 'Amazonas', NULL, 'AM', '亞馬孫', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7555, 'Peru', NULL, 'Ica', NULL, 'IC', '伊卡', NULL, '秘魯', 'PER');
INSERT INTO `region_city` VALUES (7556, 'Myanmar', NULL, 'Bago', NULL, 'BG', '勃固省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7557, 'Myanmar', NULL, 'Shan', NULL, 'SH', '撣邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7558, 'Myanmar', NULL, 'Tanintharyi', NULL, 'TN', '德林達依省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7559, 'Myanmar', NULL, 'Kayin', NULL, 'KN', '克倫邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7560, 'Myanmar', NULL, 'Kachin', NULL, 'KC', '克欽邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7561, 'Myanmar', NULL, 'Kayah', NULL, 'KH', '克耶邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7562, 'Myanmar', NULL, 'Magway', NULL, 'MG', '馬圭省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7563, 'Myanmar', NULL, 'Mandalay', NULL, 'MD', '曼德勒省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7564, 'Myanmar', NULL, 'Mon', NULL, 'MN', '孟邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7565, 'Myanmar', NULL, 'Chin', NULL, 'CH', '欽邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7566, 'Myanmar', NULL, 'Rakhine', NULL, 'RK', '若開邦', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7567, 'Myanmar', NULL, 'Sagaing', NULL, 'SG', '實皆省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7568, 'Myanmar', NULL, 'Yangon', NULL, 'YG', '仰光省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7569, 'Myanmar', NULL, 'Ayeyarwady', NULL, 'AY', '伊洛瓦底省', NULL, '緬甸', 'MMR');
INSERT INTO `region_city` VALUES (7570, 'Morocco', NULL, 'Tangier', NULL, 'TGR', '丹吉爾', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7571, 'Morocco', NULL, 'Tetouan', NULL, 'TET', '得土安', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7572, 'Morocco', NULL, 'Fes', NULL, 'FES', '非斯', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7573, 'Morocco', NULL, 'Casablanca', NULL, 'CBL', '卡薩布蘭卡', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7574, 'Morocco', NULL, 'Rabat', NULL, 'RSA', '拉巴特', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7575, 'Morocco', NULL, 'Marrakech', NULL, 'MRK', '馬拉喀什', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7576, 'Morocco', NULL, 'Meknes', NULL, 'MKN', '梅克內斯', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7577, 'Morocco', NULL, 'Oujda', NULL, 'OUJ', '烏季達', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7578, 'Morocco', NULL, 'Western Sahara', NULL, 'WSH', '西撒哈拉', NULL, '摩洛哥', 'MAR');
INSERT INTO `region_city` VALUES (7579, 'Mexico', NULL, 'Aguascalientes', NULL, 'AGU', '阿瓜斯卡連斯特', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7580, 'Mexico', NULL, 'Acapulco', NULL, 'ACA', '阿卡普爾科', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7581, 'Mexico', NULL, 'Hermosillo', NULL, 'HMO', '埃莫西約', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7582, 'Mexico', NULL, 'Campeche', NULL, 'CAM', '埃佩切', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7583, 'Mexico', NULL, 'Obregon', NULL, 'OBR', '奧夫雷貢城', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7584, 'Mexico', NULL, 'Orizaba', NULL, 'ORI', '奧里薩巴', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7585, 'Mexico', NULL, 'Valles', NULL, 'VHM', '巴利城', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7586, 'Mexico', NULL, 'Puerto Vallarta', NULL, 'PVR', '巴亞爾塔港', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7587, 'Mexico', NULL, 'Villahermosa', NULL, 'VSA', '比利亞埃爾莫薩', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7588, 'Mexico', NULL, 'Poza Rica de Hidalgo', NULL, 'PRH', '波薩里卡', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7589, 'Mexico', NULL, 'Tijuana', NULL, 'TIJ', '蒂華納', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7590, 'Mexico', NULL, 'Durango', NULL, 'DUR', '杜蘭戈', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7591, 'Mexico', NULL, 'Ensenada', NULL, 'ESE', '恩塞納達', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7592, 'Mexico', NULL, 'Guadalajara', NULL, 'GDL', '瓜達拉哈拉', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7593, 'Mexico', NULL, 'Guanajuato', NULL, 'GUA', '瓜納華托', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7594, 'Mexico', NULL, 'Jalapa', NULL, 'JAL', '哈拉帕', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7595, 'Mexico', NULL, 'Juarez', NULL, 'JUZ', '華雷斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7596, 'Mexico', NULL, 'Benito Juare', NULL, 'BJU', '華雷斯港', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7597, 'Mexico', NULL, 'Carmen', NULL, 'CAR', '卡門', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7598, 'Mexico', NULL, 'Colima', NULL, 'COL', '科利馬', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7599, 'Mexico', NULL, 'Queretaro', NULL, 'QUE', '克雷塔羅', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7600, 'Mexico', NULL, 'Cuernavaca', NULL, 'CVC', '庫埃納瓦卡', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7601, 'Mexico', NULL, 'Culiacan', NULL, 'CUL', '庫利阿坎', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7602, 'Mexico', NULL, 'Coatzacoalcos', NULL, 'COA', '夸察夸拉克斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7603, 'Mexico', NULL, 'La Paz', NULL, 'LAP', '拉巴斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7604, 'Mexico', NULL, 'Leon', NULL, 'LEN', '萊昂', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7605, 'Mexico', NULL, 'Reynosa', NULL, 'REX', '雷諾薩', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7606, 'Mexico', NULL, 'Los Mochis', NULL, 'LMM', '洛斯莫奇斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7607, 'Mexico', NULL, 'Mazatlan', NULL, 'MZT', '馬薩特蘭', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7608, 'Mexico', NULL, 'Matamoros', NULL, 'MAM', '馬塔莫羅斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7609, 'Mexico', NULL, 'Merida', NULL, 'MID', '梅里達', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7610, 'Mexico', NULL, 'Monclova', NULL, 'LOV', '蒙克洛瓦', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7611, 'Mexico', NULL, 'Monterrey', NULL, 'MTY', '蒙特雷', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7612, 'Mexico', NULL, 'Morelia', NULL, 'MLM', '莫雷利亞', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7613, 'Mexico', NULL, 'Mexico City', NULL, 'MEX', '墨西哥城', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7614, 'Mexico', NULL, 'Mexicali', NULL, 'MXL', '墨西卡利', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7615, 'Mexico', NULL, 'Nogales', NULL, 'NOG', '諾加萊斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7616, 'Mexico', NULL, 'Pachuca', NULL, 'PAC', '帕丘卡', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7617, 'Mexico', NULL, 'Puebla', NULL, 'PUE', '普埃布拉', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7618, 'Mexico', NULL, 'Chilpancingo', NULL, 'CHI', '奇爾潘辛戈', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7619, 'Mexico', NULL, 'Chihuahua', NULL, 'CHH', '奇瓦瓦', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7620, 'Mexico', NULL, 'Cheturnal', NULL, 'CTM', '切圖馬爾', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7621, 'Mexico', NULL, 'Saltillo', NULL, 'SLW', '薩爾蒂約', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7622, 'Mexico', NULL, 'Zacatecas', NULL, 'ZAC', '薩卡特卡斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7623, 'Mexico', NULL, 'Celaya', NULL, 'CLY', '塞拉亞', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7624, 'Mexico', NULL, 'San Luis Potosi', NULL, 'SLP', '聖路易斯波托亞', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7625, 'Mexico', NULL, 'Tapachula', NULL, 'TAP', '塔帕丘拉', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7626, 'Mexico', NULL, 'Tampico', NULL, 'TAM', '坦皮科', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7627, 'Mexico', NULL, 'Tlaxcala', NULL, 'TLA', '特拉斯卡拉', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7628, 'Mexico', NULL, 'Tepic', NULL, 'TPQ', '特皮克', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7629, 'Mexico', NULL, 'Tehuacan', NULL, 'TCN', '特瓦坎', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7630, 'Mexico', NULL, 'Tuxtla Gutierrez', NULL, 'TGZ', '圖斯特拉-古鐵雷斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7631, 'Mexico', NULL, 'Torreon', NULL, 'TRC', '托雷翁', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7632, 'Mexico', NULL, 'Toluca', NULL, 'TLC', '托盧卡', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7633, 'Mexico', NULL, 'Oaxaca', NULL, 'OAX', '瓦哈卡', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7634, 'Mexico', NULL, 'Victoria', NULL, 'VIC', '維多利亞城', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7635, 'Mexico', NULL, 'Veracruz', NULL, 'VER', '韋拉克魯斯', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7636, 'Mexico', NULL, 'Uruapan', NULL, 'UPN', '烏魯阿潘', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7637, 'Mexico', NULL, 'Nuevo Laredo', NULL, 'NLE', '新拉雷多', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7638, 'Mexico', NULL, 'Irapuato', NULL, 'IRP', '伊拉普阿托', NULL, '墨西哥', 'MEX');
INSERT INTO `region_city` VALUES (7639, 'Namibia', NULL, 'Erongo', NULL, 'ER', '埃龍戈', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7640, 'Namibia', NULL, 'Ohangwena', NULL, 'OW', '奧漢圭納', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7641, 'Namibia', NULL, 'Okavango', NULL, 'KV', '奧卡萬戈', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7642, 'Namibia', NULL, 'Omaheke', NULL, 'OK', '奧馬赫科', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7643, 'Namibia', NULL, 'Omusati', NULL, 'OT', '奧姆沙蒂', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7644, 'Namibia', NULL, 'Otjozondjupa', NULL, 'OJ', '奧喬宗蒂約巴', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7645, 'Namibia', NULL, 'Oshana', NULL, 'ON', '奧沙納', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7646, 'Namibia', NULL, 'Oshikoto', NULL, 'OO', '奧希科托', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7647, 'Namibia', NULL, 'Hardap', NULL, 'HA', '哈達普', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7648, 'Namibia', NULL, 'Khomas', NULL, 'KH', '霍馬斯', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7649, 'Namibia', NULL, 'Karas', NULL, 'KR', '卡拉斯', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7650, 'Namibia', NULL, 'Caprivi', NULL, 'CA', '卡普里維', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7651, 'Namibia', NULL, 'Kunene', NULL, 'KU', '庫內內', NULL, '納米比亞', 'NAM');
INSERT INTO `region_city` VALUES (7652, 'South Africa', NULL, 'Upington', NULL, 'UTN', '阿平頓', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7653, 'South Africa', NULL, 'Mount Ayliff', NULL, 'MAY', '艾利弗山', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7654, 'South Africa', NULL, 'Pietermaritzburg', NULL, 'PZB', '彼德馬里茨堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7655, 'South Africa', NULL, 'Pietersburg', NULL, 'PTG', '彼德斯堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7656, 'South Africa', NULL, 'Pretoria', NULL, 'PRY', '比勒陀利亞', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7657, 'South Africa', NULL, 'Bisho', NULL, 'BIY', '比索', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7658, 'South Africa', NULL, 'Bredasdorp', NULL, 'BDD', '佈雷達斯多普', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7659, 'South Africa', NULL, 'Bloemfontein', NULL, 'BFN', '布隆方丹', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7660, 'South Africa', NULL, 'Bronkhorstspruit', NULL, 'BHT', '布隆克斯特斯普利特', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7661, 'South Africa', NULL, 'De Aar', NULL, 'DAA', '德阿爾', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7662, 'South Africa', NULL, 'Durban', NULL, 'DUR', '德班', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7663, 'South Africa', NULL, 'Dundee', NULL, 'DUN', '鄧迪', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7664, 'South Africa', NULL, 'Barkley East', NULL, 'BAE', '東巴克利', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7665, 'South Africa', NULL, 'East London', NULL, 'ELS', '東倫敦', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7666, 'South Africa', NULL, 'Vryburg', NULL, 'VRU', '弗雷堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7667, 'South Africa', NULL, 'Vereeniging', NULL, 'VGG', '弗里尼欣', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7668, 'South Africa', NULL, 'Groblersdal', NULL, 'GBD', '格羅布萊斯達爾', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7669, 'South Africa', NULL, 'Giyani', NULL, 'GIY', '基雅尼', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7670, 'South Africa', NULL, 'Kimberley', NULL, 'KIM', '金伯利', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7671, 'South Africa', NULL, 'Cape Town', NULL, 'CPT', '開普敦', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7672, 'South Africa', NULL, 'Klerksdorp', NULL, 'KXE', '克萊克斯多普', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7673, 'South Africa', NULL, 'Kuruman', NULL, 'KMH', '庫魯曼', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7674, 'South Africa', NULL, 'Queenstown', NULL, 'UTW', '昆士敦', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7675, 'South Africa', NULL, 'Ladysmith', NULL, 'LAY', '萊迪史密斯', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7676, 'South Africa', NULL, 'Randfontein', NULL, 'RFT', '蘭德方丹', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7677, 'South Africa', NULL, 'Richards Bay', NULL, 'RCB', '理查茲灣', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7678, 'South Africa', NULL, 'Rustenburg', NULL, 'RSB', '利斯滕堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7679, 'South Africa', NULL, 'Middelburg', NULL, 'MDB', '米德爾堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7680, 'South Africa', NULL, 'Mkuze', NULL, 'MZQ', '姆庫澤', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7681, 'South Africa', NULL, 'Moorreesburg', NULL, 'MOO', '穆里斯堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7682, 'South Africa', NULL, 'Nelspruit', NULL, 'NLP', '內爾斯普雷特', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7683, 'South Africa', NULL, 'Nylstroom', NULL, 'NYL', '尼爾斯特隆', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7684, 'South Africa', NULL, 'Newcastle', NULL, 'NCS', '紐卡斯爾', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7685, 'South Africa', NULL, 'George', NULL, 'GRJ', '喬治', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7686, 'South Africa', NULL, 'Sasolburg', NULL, 'SAS', '薩索爾堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7687, 'South Africa', NULL, 'Secunda', NULL, 'ZEC', '瑟孔達', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7688, 'South Africa', NULL, 'Ixopo', NULL, 'IXO', '特克索波', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7689, 'South Africa', NULL, 'Trompsburg', NULL, 'TPB', '特隆普斯堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7690, 'South Africa', NULL, 'Springbok', NULL, 'SBU', '跳羚', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7691, 'South Africa', NULL, 'Thulamahashe', NULL, 'TLH', '圖拉馬哈謝', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7692, 'South Africa', NULL, 'Thohoyandou', NULL, 'THY', '托霍延杜', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7693, 'South Africa', NULL, 'Witsieshoek', NULL, 'WSH', '韋茨肖克', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7694, 'South Africa', NULL, 'Welkom', NULL, 'WEL', '韋爾科姆', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7695, 'South Africa', NULL, 'Ulundi', NULL, 'ULD', '烏倫迪', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7696, 'South Africa', NULL, 'Umtata', NULL, 'UTT', '烏姆塔塔', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7697, 'South Africa', NULL, 'Worcester', NULL, 'WOR', '伍斯特', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7698, 'South Africa', NULL, 'Beaufort West', NULL, 'BEW', '西博福特', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7699, 'South Africa', NULL, 'Port Shepstone', NULL, 'PSS', '謝普斯通港', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7700, 'South Africa', NULL, 'Port Elizabeth', NULL, 'PLZ', '伊麗莎白港', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7701, 'South Africa', NULL, 'Johannesburg', NULL, 'JNB', '約翰內斯堡', NULL, '南非', 'ZAF');
INSERT INTO `region_city` VALUES (7702, 'Nepal', NULL, 'Bagmati', NULL, 'BA', '巴格馬蒂', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7703, 'Nepal', NULL, 'Dhawalagiri', NULL, 'DH', '道拉吉里', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7704, 'Nepal', NULL, 'Gandaki', NULL, 'GA', '甘達基', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7705, 'Nepal', NULL, 'Kosi', NULL, 'KO', '戈西', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7706, 'Nepal', NULL, 'Karnali', NULL, 'KA', '格爾納利', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7707, 'Nepal', NULL, 'Janakpur', NULL, 'JA', '賈納克布爾', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7708, 'Nepal', NULL, 'Rapti', NULL, 'RA', '拉布蒂', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7709, 'Nepal', NULL, 'Lumbini', NULL, 'LU', '藍毗尼', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7710, 'Nepal', NULL, 'Mahakali', NULL, 'MA', '馬哈卡利', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7711, 'Nepal', NULL, 'Mechi', NULL, 'ME', '梅吉', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7712, 'Nepal', NULL, 'Narayani', NULL, 'NA', '納拉亞尼', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7713, 'Nepal', NULL, 'Bheri', NULL, 'BH', '佩里', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7714, 'Nepal', NULL, 'Sogarmatha', NULL, 'SA', '薩加瑪塔', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7715, 'Nepal', NULL, 'Seti', NULL, 'SE', '塞蒂', NULL, '尼泊爾', 'NPL');
INSERT INTO `region_city` VALUES (7716, 'Nicaragua', NULL, 'Esteli', NULL, 'ES', '埃斯特利', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7717, 'Nicaragua', NULL, 'Atlantico Norte', NULL, 'AN', '北大西洋', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7718, 'Nicaragua', NULL, 'Boaco', NULL, 'BO', '博阿科', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7719, 'Nicaragua', NULL, 'Granada', NULL, 'GR', '格拉納達', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7720, 'Nicaragua', NULL, 'Carazo', NULL, 'CA', '卡拉索', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7721, 'Nicaragua', NULL, 'Leon', NULL, 'LE', '萊昂', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7722, 'Nicaragua', NULL, 'Rivas', NULL, 'RV', '里瓦斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7723, 'Nicaragua', NULL, 'Madriz', NULL, 'MD', '馬德里斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7724, 'Nicaragua', NULL, 'Managua', NULL, 'MN', '馬那瓜', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7725, 'Nicaragua', NULL, 'Masaya', NULL, 'MS', '馬薩亞', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7726, 'Nicaragua', NULL, 'Matagalpa', NULL, 'MT', '馬塔加爾帕', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7727, 'Nicaragua', NULL, 'Atlantico Sur', NULL, 'AS', '南大西洋', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7728, 'Nicaragua', NULL, 'Chinandega', NULL, 'CD', '奇南德加', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7729, 'Nicaragua', NULL, 'Chontales', NULL, 'CT', '瓊塔萊斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7730, 'Nicaragua', NULL, 'Rio San Juan', NULL, 'SJ', '聖胡安河', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7731, 'Nicaragua', NULL, 'Jinotega', NULL, 'JI', '希諾特加', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7732, 'Nicaragua', NULL, 'Nueva Segovia', NULL, 'NS', '新塞哥維亞', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `region_city` VALUES (7733, 'Niger', NULL, 'Agadez', NULL, 'AJY', '阿加德茲', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7734, 'Niger', NULL, 'Diffa', NULL, 'DIF', '迪法', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7735, 'Niger', NULL, 'Tillaberi', NULL, 'TIL', '蒂拉貝里', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7736, 'Niger', NULL, 'Dosso', NULL, 'DSS', '多索', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7737, 'Niger', NULL, 'Zinder', NULL, 'ZND', '津德爾', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7738, 'Niger', NULL, 'Maradi', NULL, 'MFQ', '馬拉迪', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7739, 'Niger', NULL, 'Niamey C.U.', NULL, 'NIM', '尼亞美市', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7740, 'Niger', NULL, 'Tahoua', NULL, 'THZ', '塔瓦', NULL, '尼日爾', 'NER');
INSERT INTO `region_city` VALUES (7741, 'Nigeria', NULL, 'Abuja', NULL, 'ABV', '阿比亞', NULL, '尼日利亞', 'NGA');
INSERT INTO `region_city` VALUES (7742, 'Nigeria', NULL, 'Ogbomosho', NULL, 'OGB', '奧博莫紹', NULL, '尼日利亞', 'NGA');
INSERT INTO `region_city` VALUES (7743, 'Nigeria', NULL, 'Kano', NULL, 'KAN', '卡諾', NULL, '尼日利亞', 'NGA');
INSERT INTO `region_city` VALUES (7744, 'Nigeria', NULL, 'Lagos', NULL, 'LOS', '拉各斯', NULL, '尼日利亞', 'NGA');
INSERT INTO `region_city` VALUES (7745, 'Nigeria', NULL, 'Ibadan', NULL, 'IBA', '伊巴丹', NULL, '尼日利亞', 'NGA');
INSERT INTO `region_city` VALUES (7746, 'Norway', NULL, 'Akershus', NULL, '2', '阿克什胡斯', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7747, 'Norway', NULL, 'Oppland', NULL, '5', '奧普蘭', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7748, 'Norway', NULL, 'Oslo', NULL, '3', '奧斯陸市', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7749, 'Norway', NULL, 'Nord-Trondelag', NULL, '17', '北特倫德拉格', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7750, 'Norway', NULL, 'Buskerud', NULL, '6', '布斯克呂', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7751, 'Norway', NULL, 'Aust-Agder', NULL, '9', '東阿格德爾', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7752, 'Norway', NULL, 'Ostfold', NULL, '1', '東福爾', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7753, 'Norway', NULL, 'Finnmark', NULL, '20', '芬馬克', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7754, 'Norway', NULL, 'Hedmark', NULL, '4', '海德馬克', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7755, 'Norway', NULL, 'Hordaland', NULL, '12', '霍達蘭', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7756, 'Norway', NULL, 'Rogaland', NULL, '11', '羅加蘭', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7757, 'Norway', NULL, 'More og Romsdal', NULL, '15', '默勒－魯姆斯達爾', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7758, 'Norway', NULL, 'Sor-Trondelag', NULL, '16', '南特倫德拉格', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7759, 'Norway', NULL, 'Nordland', NULL, '18', '諾爾蘭', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7760, 'Norway', NULL, 'Sogn og Fjordane', NULL, '14', '松恩－菲尤拉訥', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7761, 'Norway', NULL, 'Telemark', NULL, '8', '泰勒馬克', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7762, 'Norway', NULL, 'Troms', NULL, '19', '特羅姆斯', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7763, 'Norway', NULL, 'Vest-Agder', NULL, '10', '西阿格德爾', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7764, 'Norway', NULL, 'Vestfold', NULL, '7', '西福爾', NULL, '挪威', 'NOR');
INSERT INTO `region_city` VALUES (7765, 'Portugal', NULL, 'Alentejo Litoral', NULL, 'ALL', '濱海阿連特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7766, 'Portugal', NULL, 'Pinhal Litoral', NULL, 'PLT', '濱海皮尼亞爾', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7767, 'Portugal', NULL, 'Porto', NULL, 'VDP', '波爾圖', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7768, 'Portugal', NULL, 'Douro', NULL, 'MDR', '杜羅', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7769, 'Portugal', NULL, 'Entre Douro e Vouga', NULL, 'EDV', '恩特拉杜羅伏日', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7770, 'Portugal', NULL, 'Faro', NULL, 'FAO', '法魯', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7771, 'Portugal', NULL, 'Funchal', NULL, 'FUN', '豐沙爾', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7772, 'Portugal', NULL, 'Cavado', NULL, 'CAV', '卡瓦多', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7773, 'Portugal', NULL, 'Cova da Beira', NULL, 'CLB', '科瓦貝拉', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7774, 'Portugal', NULL, 'Lisboa', NULL, 'LIS', '里斯本', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7775, 'Portugal', NULL, 'Leziria do Tejo', NULL, 'LTE', '利巴特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7776, 'Portugal', NULL, 'Medio Tejo', NULL, 'MTE', '梅地奧特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7777, 'Portugal', NULL, 'Minho-Lima', NULL, 'MLI', '米尼奧-利馬', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7778, 'Portugal', NULL, 'Beira Interior Norte', NULL, 'BIN', '內貝拉北', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7779, 'Portugal', NULL, 'Beira Interior Sul', NULL, 'BIS', '內貝拉南', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7780, 'Portugal', NULL, 'Pinhal Interior Norte', NULL, 'PIN', '內皮尼亞爾北', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7781, 'Portugal', NULL, 'Pinhal Interior Sul', NULL, 'PIS', '內皮尼亞爾南', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7782, 'Portugal', NULL, 'Ponta Delgada', NULL, 'PDL', '蓬塔德爾加達', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7783, 'Portugal', NULL, 'Peninsula de Setubal', NULL, 'PSE', '塞圖巴爾半島', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7784, 'Portugal', NULL, 'Serra da Estrela', NULL, 'SES', '山後', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7785, 'Portugal', NULL, 'Alto Alentejo', NULL, 'AAT', '上阿連特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7786, 'Portugal', NULL, 'Alto Tros-os-Montes', NULL, 'ATM', '上特拉斯山', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7787, 'Portugal', NULL, 'Tamega', NULL, 'TAM', '塔梅加', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7788, 'Portugal', NULL, 'Ave', NULL, 'AES', '萬福', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7789, 'Portugal', NULL, 'Oeste', NULL, 'OES', '西部', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7790, 'Portugal', NULL, 'Baixo Alentejo', NULL, 'BAL', '下阿連特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7791, 'Portugal', NULL, 'Baixo Vouga', NULL, 'BVO', '下伏日', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7792, 'Portugal', NULL, 'Baixo Mondego', NULL, 'BMO', '下蒙德古', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7793, 'Portugal', NULL, 'Alentejo Central', NULL, 'ALC', '中阿連特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `region_city` VALUES (7794, 'Japan', NULL, 'Ehime', NULL, '38', '愛媛', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7795, 'Japan', NULL, 'Aichi', NULL, '23', '愛知', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7796, 'Japan', NULL, 'Hokkaido', NULL, '1', '北海道', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7797, 'Japan', NULL, 'Hyogo', NULL, '28', '兵庫', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7798, 'Japan', NULL, 'Okinawa', NULL, '47', '沖繩', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7799, 'Japan', NULL, 'Ibaraki', NULL, '8', '茨城', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7800, 'Japan', NULL, 'Osaka', NULL, '27', '大阪', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7801, 'Japan', NULL, 'Oita', NULL, '44', '大分', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7802, 'Japan', NULL, 'Shimane', NULL, '32', '島根', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7803, 'Japan', NULL, 'Tokushima', NULL, '36', '徳島', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7804, 'Japan', NULL, 'Tokyo', NULL, '13', '東京', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7805, 'Japan', NULL, 'Fukushima', NULL, '7', '福島', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7806, 'Japan', NULL, 'Fukuoka', NULL, '40', '福岡', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7807, 'Japan', NULL, 'Fukui', NULL, '18', '福井', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7808, 'Japan', NULL, 'Toyama', NULL, '16', '富山', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7809, 'Japan', NULL, 'Okayama', NULL, '33', '岡山', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7810, 'Japan', NULL, 'Kochi', NULL, '39', '高知', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7811, 'Japan', NULL, 'Miyagi', NULL, '4', '宮城', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7812, 'Japan', NULL, 'Miyazaki', NULL, '45', '宮崎', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7813, 'Japan', NULL, 'Hiroshima', NULL, '34', '廣島', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7814, 'Japan', NULL, 'Wakayama', NULL, '30', '和歌山', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7815, 'Japan', NULL, 'Kyoto', NULL, '26', '京都', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7816, 'Japan', NULL, 'Shizuoka', NULL, '22', '靜岡', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7817, 'Japan', NULL, 'Tochigi', NULL, '9', '櫪木', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7818, 'Japan', NULL, 'Kagoshima', NULL, '46', '鹿兒島', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7819, 'Japan', NULL, 'Nara', NULL, '29', '奈良', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7820, 'Japan', NULL, 'Tottori', NULL, '31', '鳥取', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7821, 'Japan', NULL, 'Gifu', NULL, '21', '岐阜', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7822, 'Japan', NULL, 'Saitama', NULL, '11', '埼玉', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7823, 'Japan', NULL, 'Chiba', NULL, '12', '千葉', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7824, 'Japan', NULL, 'Aomori', NULL, '2', '青森', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7825, 'Japan', NULL, 'Akita', NULL, '5', '秋田', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7826, 'Japan', NULL, 'Gunma', NULL, '10', '群馬', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7827, 'Japan', NULL, 'Mie', NULL, '24', '三重', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7828, 'Japan', NULL, 'Yamaguchi', NULL, '35', '山口', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7829, 'Japan', NULL, 'Yamanashi', NULL, '19', '山梨', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7830, 'Japan', NULL, 'Yamagata', NULL, '6', '山形', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7831, 'Japan', NULL, 'Kanagawa', NULL, '14', '神奈川', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7832, 'Japan', NULL, 'Ishikawa', NULL, '17', '石川', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7833, 'Japan', NULL, 'Kagawa', NULL, '37', '香川', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7834, 'Japan', NULL, 'Niigata', NULL, '15', '新潟', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7835, 'Japan', NULL, 'Kumamoto', NULL, '43', '熊本', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7836, 'Japan', NULL, 'Iwate', NULL, '3', '巖手', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7837, 'Japan', NULL, 'Nagasaki', NULL, '42', '長崎', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7838, 'Japan', NULL, 'Nagano', NULL, '20', '長野', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7839, 'Japan', NULL, 'Shiga', NULL, '25', '滋賀', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7840, 'Japan', NULL, 'Saga', NULL, '41', '佐賀', NULL, '日本', 'JPN');
INSERT INTO `region_city` VALUES (7841, 'Sweden', NULL, 'Norrbottens', NULL, 'BD', '北博滕', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7842, 'Sweden', NULL, 'Blekinge', NULL, 'K', '布萊金厄', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7843, 'Sweden', NULL, 'Dalarnas', NULL, 'DLN', '達拉納', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7844, 'Sweden', NULL, 'Ustergotland', NULL, 'UGL', '東約特蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7845, 'Sweden', NULL, 'Orebro', NULL, 'T', '厄勒布魯', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7846, 'Sweden', NULL, 'Gotlands', NULL, 'I', '哥得蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7847, 'Sweden', NULL, 'Hallands', NULL, 'N', '哈蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7848, 'Sweden', NULL, 'Kalmar', NULL, 'H', '卡爾馬', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7849, 'Sweden', NULL, 'Kronobergs', NULL, 'G', '克魯努貝里', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7850, 'Sweden', NULL, 'Sodermanlands', NULL, 'D', '南曼蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7851, 'Sweden', NULL, 'Stockholms', NULL, 'AB', '斯德哥爾摩', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7852, 'Sweden', NULL, 'Skane', NULL, 'M', '斯科耐', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7853, 'Sweden', NULL, 'Varmlands', NULL, 'S', '韋姆蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7854, 'Sweden', NULL, 'Uppsala', NULL, 'C', '烏普薩拉', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7855, 'Sweden', NULL, 'Vasterbottens', NULL, 'AC', '西博滕', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7856, 'Sweden', NULL, 'Vastmanlands', NULL, 'U', '西曼蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7857, 'Sweden', NULL, 'Vasternorrlands', NULL, 'Y', '西諾爾蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7858, 'Sweden', NULL, 'Vastra Gotalands', NULL, 'O', '西約特蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7859, 'Sweden', NULL, 'Jonkopings', NULL, 'F', '延雪平', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7860, 'Sweden', NULL, 'Gavleborgs', NULL, 'X', '耶夫勒堡', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7861, 'Sweden', NULL, 'Jamtlands', NULL, 'Z', '耶姆特蘭', NULL, '瑞典', 'SWE');
INSERT INTO `region_city` VALUES (7862, 'Switzerland', NULL, 'Aargau', NULL, 'AG', '阿爾高', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7863, 'Switzerland', NULL, 'Basel－Sstadt', NULL, 'BS', '巴塞爾城市', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7864, 'Switzerland', NULL, 'Basel Landschaft', NULL, 'BL', '巴塞爾鄉村', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7865, 'Switzerland', NULL, 'Bern', NULL, 'BE', '伯爾尼', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7866, 'Switzerland', NULL, 'Zug', NULL, 'ZG', '楚格', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7867, 'Switzerland', NULL, 'Freiburg', NULL, 'FR', '弗里堡', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7868, 'Switzerland', NULL, 'Glarus', NULL, 'GL', '格拉魯斯', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7869, 'Switzerland', NULL, 'Graubünden', NULL, 'GR', '格勞賓登', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7870, 'Switzerland', NULL, 'Luzern', NULL, 'LU', '盧塞恩', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7871, 'Switzerland', NULL, 'Lausanne', NULL, 'LA', '洛桑', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7872, 'Switzerland', NULL, 'Neuchatel', NULL, 'NE', '納沙泰爾', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7873, 'Switzerland', NULL, 'Appenzell Innerrhodn', NULL, 'AI', '內阿彭策爾', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7874, 'Switzerland', NULL, 'Geneve', NULL, 'GE', '日內瓦', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7875, 'Switzerland', NULL, 'Jura', NULL, 'JU', '汝拉', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7876, 'Switzerland', NULL, 'Schaffhausen', NULL, 'SH', '沙夫豪森', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7877, 'Switzerland', NULL, 'Obwalden', NULL, 'OW', '上瓦爾登', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7878, 'Switzerland', NULL, 'St.Gallen', NULL, 'SG', '聖加侖', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7879, 'Switzerland', NULL, 'Schwyz', NULL, 'SZ', '施維茨', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7880, 'Switzerland', NULL, 'Zurich', NULL, 'ZH', '蘇黎世', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7881, 'Switzerland', NULL, 'Solothurn', NULL, 'SO', '索洛圖恩', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7882, 'Switzerland', NULL, 'Ticino', NULL, 'TI', '提契諾', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7883, 'Switzerland', NULL, 'Thurgau', NULL, 'TG', '圖爾高', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7884, 'Switzerland', NULL, 'Wallis', NULL, 'VS', '瓦萊', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7885, 'Switzerland', NULL, 'Appenzell Ausserrhon', NULL, 'AR', '外阿彭策爾', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7886, 'Switzerland', NULL, 'Vaud', NULL, 'VD', '沃', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7887, 'Switzerland', NULL, 'Uri', NULL, 'UR', '烏里', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7888, 'Switzerland', NULL, 'Nidwalden', NULL, 'NW', '下瓦爾登', NULL, '瑞士', 'CHE');
INSERT INTO `region_city` VALUES (7889, 'El Salvador', NULL, 'Apopa', NULL, 'APO', '阿波帕', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7890, 'El Salvador', NULL, 'Ahuachapan', NULL, 'AH', '阿瓦查潘', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7891, 'El Salvador', NULL, 'Litoral', NULL, 'LI', '濱海', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7892, 'El Salvador', NULL, 'Chalatenango', NULL, 'CH', '查拉特南戈', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7893, 'El Salvador', NULL, 'Delgado', NULL, 'DE', '德爾加多', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7894, 'El Salvador', NULL, 'Kie-Ntem', NULL, 'KN', '基埃-恩特姆', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7895, 'El Salvador', NULL, 'Cabanas', NULL, 'CA', '卡瓦尼亞斯', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7896, 'El Salvador', NULL, 'Cuscatlan', NULL, 'CU', '庫斯卡特蘭', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7897, 'El Salvador', NULL, 'La Paz', NULL, 'PZ', '拉巴斯', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7898, 'El Salvador', NULL, 'La Libertad', NULL, 'LB', '拉利伯塔德', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7899, 'El Salvador', NULL, 'La Union', NULL, 'UN', '拉烏尼翁', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7900, 'El Salvador', NULL, 'Mejicanos', NULL, 'MEJ', '梅基卡諾斯', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7901, 'El Salvador', NULL, 'Morazan', NULL, 'MO', '莫拉桑', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7902, 'El Salvador', NULL, 'Santa Ana', NULL, 'SA', '聖安娜', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7903, 'El Salvador', NULL, 'San Miguel', NULL, 'SM', '聖米格爾', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7904, 'El Salvador', NULL, 'San Salvador', NULL, 'SS', '聖薩爾瓦多', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7905, 'El Salvador', NULL, 'San Vicente', NULL, 'SV', '聖維森特', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7906, 'El Salvador', NULL, 'Sonsonate', NULL, 'SO', '松索納特', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7907, 'El Salvador', NULL, 'Soyapango', NULL, 'SOY', '索亞潘戈', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7908, 'El Salvador', NULL, 'Wele-Nzas', NULL, 'WN', '韋萊-恩薩斯', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7909, 'El Salvador', NULL, 'Usulutan', NULL, 'US', '烏蘇盧坦', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7910, 'El Salvador', NULL, 'Ilopango', NULL, 'IL', '伊洛潘戈', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7911, 'El Salvador', NULL, 'Centro Sur', NULL, 'CS', '中南', NULL, '薩爾瓦多', 'SLV');
INSERT INTO `region_city` VALUES (7912, 'Serbia,Montenegro', NULL, 'Beograd', NULL, 'BEG', '貝爾格萊德', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7913, 'Serbia,Montenegro', NULL, 'Podgorica', NULL, 'POD', '波德戈里察', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7914, 'Serbia,Montenegro', NULL, 'Kragujevac', NULL, 'KGV', '克拉古涅瓦茨', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7915, 'Serbia,Montenegro', NULL, 'Nis', NULL, 'INI', '尼什', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7916, 'Serbia,Montenegro', NULL, 'Novi Sad', NULL, 'NVS', '諾維薩德', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7917, 'Serbia,Montenegro', NULL, 'Pristina', NULL, 'PRN', '普裡什蒂納', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7918, 'Serbia,Montenegro', NULL, 'Subotica', NULL, 'SUB', '蘇博蒂察', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7919, 'Serbia,Montenegro', NULL, 'Zemun', NULL, 'ZEM', '澤蒙', NULL, '塞爾維亞,黑山', 'SCG');
INSERT INTO `region_city` VALUES (7920, 'Sierra Leone', NULL, 'Northern', NULL, 'N', '北部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `region_city` VALUES (7921, 'Sierra Leone', NULL, 'Eastern', NULL, 'E', '東部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `region_city` VALUES (7922, 'Sierra Leone', NULL, 'Southern', NULL, 'S', '南部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `region_city` VALUES (7923, 'Sierra Leone', NULL, 'Western', NULL, 'W', '西部區', NULL, '塞拉利昂', 'SLE');
INSERT INTO `region_city` VALUES (7924, 'Senegal', NULL, 'Dakar', NULL, 'DA', '達喀爾', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7925, 'Senegal', NULL, 'Fatick', NULL, 'FA', '法蒂克', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7926, 'Senegal', NULL, 'Ziguinchor', NULL, 'ZI', '濟金紹爾', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7927, 'Senegal', NULL, 'Thies', NULL, 'TH', '捷斯', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7928, 'Senegal', NULL, 'Diourbel', NULL, 'DI', '久爾貝勒', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7929, 'Senegal', NULL, 'Kaolack', NULL, 'KA', '考拉克', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7930, 'Senegal', NULL, 'Kolda', NULL, 'KO', '科爾達', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7931, 'Senegal', NULL, 'Louga', NULL, 'LO', '盧加', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7932, 'Senegal', NULL, 'Matam', NULL, 'MA', '馬塔姆', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7933, 'Senegal', NULL, 'Saint-Louis', NULL, 'SL', '聖路易', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7934, 'Senegal', NULL, 'Tambacounda', NULL, 'TA', '坦巴昆達', NULL, '塞內加爾', 'SEN');
INSERT INTO `region_city` VALUES (7935, 'Cyprus', NULL, 'Famagusta', NULL, '4', '法馬古斯塔', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7936, 'Cyprus', NULL, 'Kyrenia', NULL, '6', '凱里尼亞', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7937, 'Cyprus', NULL, 'Larnaca', NULL, '3', '拉納卡', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7938, 'Cyprus', NULL, 'Limassol', NULL, '2', '利馬索爾', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7939, 'Cyprus', NULL, 'Nicosia', NULL, '1', '尼科西亞', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7940, 'Cyprus', NULL, 'Pafos', NULL, '5', '帕福斯', NULL, '塞浦路斯', 'CYP');
INSERT INTO `region_city` VALUES (7941, 'Saudi Arabia', NULL, 'Arar', NULL, 'ARA', '阿爾阿爾', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7942, 'Saudi Arabia', NULL, 'Abha', NULL, 'AHB', '艾卜哈', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7943, 'Saudi Arabia', NULL, 'Al Bahah', NULL, 'BH', '巴哈', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7944, 'Saudi Arabia', NULL, 'Buraydah', NULL, 'BUR', '布賴代', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7945, 'Saudi Arabia', NULL, 'Dammam', NULL, 'DAM', '達曼', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7946, 'Saudi Arabia', NULL, 'Hafar al-Batin', NULL, 'HBT', '哈費爾巴廷', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7947, 'Saudi Arabia', NULL, 'Hail', NULL, 'HL', '哈伊勒', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7948, 'Saudi Arabia', NULL, 'Khamis Mushayt', NULL, 'KMX', '海米斯穆謝特', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7949, 'Saudi Arabia', NULL, 'Al-Kharj', NULL, 'AKH', '海耶', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7950, 'Saudi Arabia', NULL, 'Al-Hufuf', NULL, 'HFF', '胡富夫', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7951, 'Saudi Arabia', NULL, 'Jiddah', NULL, 'JED', '吉達', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7952, 'Saudi Arabia', NULL, 'Jizan', NULL, 'JZ', '吉贊', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7953, 'Saudi Arabia', NULL, 'Riyad', NULL, 'RD', '利雅得', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7954, 'Saudi Arabia', NULL, 'Medina', NULL, 'MED', '麥地那', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7955, 'Saudi Arabia', NULL, 'Makkah', NULL, 'ML', '麥加', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7956, 'Saudi Arabia', NULL, 'Al-Mubarraz', NULL, 'MBR', '姆巴拉茲', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7957, 'Saudi Arabia', NULL, 'Najran', NULL, 'NR', '納季蘭', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7958, 'Saudi Arabia', NULL, 'Sakaka', NULL, 'SAK', '塞卡卡', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7959, 'Saudi Arabia', NULL, 'Tabuk', NULL, 'TB', '塔布克', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7960, 'Saudi Arabia', NULL, 'At Tarif', NULL, 'TAR', '塔伊夫', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7961, 'Saudi Arabia', NULL, 'Yanbu al-Bahr', NULL, 'YNB', '延布', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7962, 'Saudi Arabia', NULL, 'Al-Jubayl', NULL, 'JBI', '朱拜勒', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `region_city` VALUES (7963, 'Sri Lanka', NULL, 'Anuradhapura', NULL, 'ADP', '阿努拉德普勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7964, 'Sri Lanka', NULL, 'Ampara', NULL, 'AMP', '安帕賴', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7965, 'Sri Lanka', NULL, 'Badulla', NULL, 'BAD', '巴杜勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7966, 'Sri Lanka', NULL, 'Batticaloa', NULL, 'BTC', '拜蒂克洛', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7967, 'Sri Lanka', NULL, 'Polonnaruwa', NULL, 'POL', '波隆納魯沃', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7968, 'Sri Lanka', NULL, 'Hambantota', NULL, 'HBA', '漢班托特', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7969, 'Sri Lanka', NULL, 'Kilinochchi', NULL, 'KIL', '基里諾奇', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7970, 'Sri Lanka', NULL, 'Galle', NULL, 'GAL', '加勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7971, 'Sri Lanka', NULL, 'Gampaha', NULL, 'GAM', '加姆珀哈', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7972, 'Sri Lanka', NULL, 'Jaffna', NULL, 'JAF', '賈夫納', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7973, 'Sri Lanka', NULL, 'Kalutara', NULL, 'KLT', '卡盧特勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7974, 'Sri Lanka', NULL, 'Kegalle', NULL, 'KEG', '凱格勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7975, 'Sri Lanka', NULL, 'Kandy', NULL, 'KAN', '康提', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7976, 'Sri Lanka', NULL, 'Colombo', NULL, 'CMB', '科倫坡', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7977, 'Sri Lanka', NULL, 'Kurunegala', NULL, 'KUR', '庫魯內格勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7978, 'Sri Lanka', NULL, 'Ratnapura', NULL, 'RAT', '拉特納普勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7979, 'Sri Lanka', NULL, 'Mannar', NULL, 'MAN', '馬納爾', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7980, 'Sri Lanka', NULL, 'Matale', NULL, 'MAT', '馬特萊', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7981, 'Sri Lanka', NULL, 'Matara', NULL, 'MAA', '馬特勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7982, 'Sri Lanka', NULL, 'Monaragala', NULL, 'MON', '莫訥勒格勒', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7983, 'Sri Lanka', NULL, 'Mullathivu', NULL, 'MUL', '穆萊蒂武', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7984, 'Sri Lanka', NULL, 'Nuwara Eliya', NULL, 'NUE', '努沃勒埃利耶', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7985, 'Sri Lanka', NULL, 'Puttalam', NULL, 'PUT', '普塔勒姆', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7986, 'Sri Lanka', NULL, 'Trincomalee', NULL, 'TRR', '亭可馬里', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7987, 'Sri Lanka', NULL, 'Vavuniya', NULL, 'VAV', '瓦武尼亞', NULL, '斯里蘭卡', 'LKA');
INSERT INTO `region_city` VALUES (7988, 'Slovakia', NULL, 'Banskobystricky', NULL, 'BBY', '班斯卡-比斯特里察', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7989, 'Slovakia', NULL, 'Bratislavsky', NULL, 'BTS', '布拉迪斯拉發', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7990, 'Slovakia', NULL, 'Koricky', NULL, 'KOR', '科希策', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7991, 'Slovakia', NULL, 'Nitriansky', NULL, 'NRA', '尼特拉', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7992, 'Slovakia', NULL, 'Prerovsky', NULL, 'POV', '普雷紹夫', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7993, 'Slovakia', NULL, 'Rilinsky', NULL, 'RIL', '日利納', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7994, 'Slovakia', NULL, 'Trnavsky', NULL, 'TNA', '特爾納瓦', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7995, 'Slovakia', NULL, 'Trenriansky', NULL, 'TRE', '特倫欽', NULL, '斯洛伐克', 'SVK');
INSERT INTO `region_city` VALUES (7996, 'Slovenia', NULL, 'Obalno-kraska', NULL, 'OKR', '奧巴爾諾-克拉', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (7997, 'Slovenia', NULL, 'Osrednjeslovenska', NULL, 'OSR', '奧斯雷德涅斯洛文', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (7998, 'Slovenia', NULL, 'Podravska', NULL, 'POD', '波德拉夫', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (7999, 'Slovenia', NULL, 'Pomurska', NULL, 'POM', '波穆爾', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8000, 'Slovenia', NULL, 'Dolenjska', NULL, 'DLJ', '多雷尼', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8001, 'Slovenia', NULL, 'Gorenjska', NULL, 'GSZ', '戈雷尼', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8002, 'Slovenia', NULL, 'Goriska', NULL, 'GSK', '戈里', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8003, 'Slovenia', NULL, 'Koroska', NULL, 'KOR', '科洛', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8004, 'Slovenia', NULL, 'Notranjsko-kraska', NULL, 'NKR', '諾特拉尼', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8005, 'Slovenia', NULL, 'Savinjska', NULL, 'SAV', '薩維尼', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8006, 'Slovenia', NULL, 'Spodnjeposavska', NULL, 'SPO', '斯波德涅波薩夫', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8007, 'Slovenia', NULL, 'Zasavska', NULL, 'ZAS', '扎薩夫', NULL, '斯洛文尼亞', 'SVN');
INSERT INTO `region_city` VALUES (8008, 'Sudan', NULL, 'Ash-Shamaliyah', NULL, 'ASH', '北部', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8009, 'Sudan', NULL, 'Al-Istiwaiyah', NULL, 'SIS', '赤道', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8010, 'Sudan', NULL, 'Darfur', NULL, 'SDA', '達爾富爾', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8011, 'Sudan', NULL, 'Ash-Sharqiyah', NULL, 'SHA', '東部', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8012, 'Sudan', NULL, 'Bahr al-Ghazal', NULL, 'SBG', '加扎勒河', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8013, 'Sudan', NULL, 'Al-Khartum', NULL, 'KRT', '喀土穆', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8014, 'Sudan', NULL, 'Kurdufan', NULL, 'GKU', '科爾多凡', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8015, 'Sudan', NULL, 'Aali an-Nil', NULL, 'ANB', '上尼羅', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8016, 'Sudan', NULL, 'Al Wasta', NULL, 'WDH', '中部', NULL, '蘇丹', 'SDN');
INSERT INTO `region_city` VALUES (8017, 'Suriname', NULL, 'Brokopondo', NULL, 'BR', '布羅科蓬多', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8018, 'Suriname', NULL, 'Coronie', NULL, 'CR', '科羅尼', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8019, 'Suriname', NULL, 'Commewijne', NULL, 'CM', '科默韋訥', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8020, 'Suriname', NULL, 'Marowijne', NULL, 'MA', '馬羅韋訥', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8021, 'Suriname', NULL, 'Nickerie', NULL, 'NI', '尼克里', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8022, 'Suriname', NULL, 'Para', NULL, 'PA', '帕拉', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8023, 'Suriname', NULL, 'Paramaribo', NULL, 'PM', '帕拉馬裡博', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8024, 'Suriname', NULL, 'Saramacca', NULL, 'SA', '薩拉馬卡', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8025, 'Suriname', NULL, 'Wanica', NULL, 'WA', '瓦尼卡', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8026, 'Suriname', NULL, 'Sipaliwini', NULL, 'SI', '西帕里韋尼', NULL, '蘇里南', 'SUR');
INSERT INTO `region_city` VALUES (8027, 'Solomon Islands', NULL, 'Guadalcanal', NULL, 'GC', '瓜達爾卡納爾', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8028, 'Solomon Islands', NULL, 'Honiara', NULL, 'HO', '霍尼亞拉', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8029, 'Solomon Islands', NULL, 'Rennell and Bellona', NULL, 'RB', '拉納爾和貝羅納', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8030, 'Solomon Islands', NULL, 'Makira', NULL, 'MK', '馬基拉', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8031, 'Solomon Islands', NULL, 'Malaita', NULL, 'ML', '馬萊塔', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8032, 'Solomon Islands', NULL, 'Choiseul', NULL, 'CH', '喬伊索', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8033, 'Solomon Islands', NULL, 'Temotu', NULL, 'TM', '泰莫圖', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8034, 'Solomon Islands', NULL, 'Western', NULL, 'WE', '西部', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8035, 'Solomon Islands', NULL, 'Isabel', NULL, 'IS', '伊薩貝爾', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8036, 'Solomon Islands', NULL, 'Central Islands', NULL, 'CE', '中部群島', NULL, '所羅門群島', 'SLB');
INSERT INTO `region_city` VALUES (8037, 'Tajikistan', NULL, 'Dushanbe', NULL, 'DYU', '杜尚別', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8038, 'Tajikistan', NULL, 'Khorugh', NULL, 'KHO', '霍羅格', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8039, 'Tajikistan', NULL, 'Kanibadam', NULL, 'KAN', '卡尼巴達姆', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8040, 'Tajikistan', NULL, 'Kofarnihon', NULL, 'KOF', '科法爾尼洪', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8041, 'Tajikistan', NULL, 'Khujand', NULL, 'KHU', '苦盞', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8042, 'Tajikistan', NULL, 'Kurgan-Tjube', NULL, 'KTJ', '庫爾干-秋別', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8043, 'Tajikistan', NULL, 'Kulob', NULL, 'KLB', '庫洛布', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8044, 'Tajikistan', NULL, 'Rogun', NULL, 'RGU', '洛貢', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8045, 'Tajikistan', NULL, 'Nurek', NULL, 'NUR', '努雷克', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8046, 'Tajikistan', NULL, 'Pendzhikent', NULL, 'PJK', '彭吉肯特', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8047, 'Tajikistan', NULL, 'Sarband', NULL, 'SBA', '薩班特', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8048, 'Tajikistan', NULL, 'Taboshar', NULL, 'TBS', '塔博沙爾', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8049, 'Tajikistan', NULL, 'Tursunzade', NULL, 'TSZ', '圖爾孫扎德', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8050, 'Tajikistan', NULL, 'Ura-Tjube', NULL, 'UTJ', '烏拉秋別', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8051, 'Tajikistan', NULL, 'Isfara', NULL, 'ISF', '伊斯法拉', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `region_city` VALUES (8052, 'Thailand', NULL, 'Amnat Charoen', NULL, '37', '安納乍能', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8053, 'Thailand', NULL, 'Prachuap Khiri Khan', NULL, '77', '巴蜀', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8054, 'Thailand', NULL, 'Pathum Thani', NULL, '13', '巴吞他尼', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8055, 'Thailand', NULL, 'Prachin Buri', NULL, '25', '巴真', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8056, 'Thailand', NULL, 'Kanchanaburi', NULL, '71', '北碧', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8057, 'Thailand', NULL, 'Saraburi', NULL, '19', '北標', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8058, 'Thailand', NULL, 'Pattani', NULL, '94', '北大年', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8059, 'Thailand', NULL, 'Samut Prakan', NULL, '11', '北攬', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8060, 'Thailand', NULL, 'Nakhon Sawan', NULL, '60', '北欖坡', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8061, 'Thailand', NULL, 'Chachoengsao', NULL, '24', '北柳', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8062, 'Thailand', NULL, 'Phetchabun', NULL, '76', '碧差汶', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8063, 'Thailand', NULL, 'Phatthalung', NULL, '93', '博達倫', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8064, 'Thailand', NULL, 'Chai Nat', NULL, '18', '猜那', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8065, 'Thailand', NULL, 'Chaiyaphum', NULL, '36', '猜也奔', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8066, 'Thailand', NULL, 'Uttaradit', NULL, '53', '程逸', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8067, 'Thailand', NULL, 'Chumphon', NULL, '86', '春蓬', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8068, 'Thailand', NULL, 'Chon Buri', NULL, '20', '春武里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8069, 'Thailand', NULL, 'Tak', NULL, '63', '達', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8070, 'Thailand', NULL, 'Trat', NULL, '23', '達叻', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8071, 'Thailand', NULL, 'Phra Nakhon Si Ayutthaya', NULL, '14', '大城', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8072, 'Thailand', NULL, 'Trang', NULL, '92', '董里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8073, 'Thailand', NULL, 'Phetchaburi', NULL, '78', '佛丕', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8074, 'Thailand', NULL, 'Nakhon Pathom', NULL, '73', '佛統', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8075, 'Thailand', NULL, 'Kamphaeng Phet', NULL, '62', '甘烹碧', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8076, 'Thailand', NULL, 'Ang Thong', NULL, '15', '紅統', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8077, 'Thailand', NULL, 'Lop Buri', NULL, '16', '華富里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8078, 'Thailand', NULL, 'Kalasin', NULL, '46', '加拉信', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8079, 'Thailand', NULL, 'Krabi', NULL, '81', '甲米', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8080, 'Thailand', NULL, 'Chanthaburi', NULL, '22', '尖竹汶', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8081, 'Thailand', NULL, 'Khon Kaen', NULL, '40', '孔敬', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8082, 'Thailand', NULL, 'Rayong', NULL, '21', '拉農', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8083, 'Thailand', NULL, 'Nong Khai', NULL, '43', '廊開', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8084, 'Thailand', NULL, 'Nong Bua Lamphu', NULL, '39', '廊莫那浦', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8085, 'Thailand', NULL, 'Ratchaburi', NULL, '70', '叻丕', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8086, 'Thailand', NULL, 'Loei', NULL, '42', '黎', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8087, 'Thailand', NULL, 'Roi Et', NULL, '45', '黎逸', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8088, 'Thailand', NULL, 'Samut Sakhon', NULL, '74', '龍仔厝', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8089, 'Thailand', NULL, 'Ranong', NULL, '85', '羅勇', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8090, 'Thailand', NULL, 'Nakhon Si Thammarat', NULL, '80', '洛坤', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8091, 'Thailand', NULL, 'Maha Sarakham', NULL, '44', '瑪哈沙拉堪', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8092, 'Thailand', NULL, 'Bangkok', NULL, '10', '曼谷', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8093, 'Thailand', NULL, 'Mukdahan', NULL, '49', '莫達漢', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8094, 'Thailand', NULL, 'Nakhon Nayok', NULL, '26', '那空那育', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8095, 'Thailand', NULL, 'Nakhon Phanom', NULL, '48', '那空帕農', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8096, 'Thailand', NULL, 'Nan', NULL, '55', '難', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8097, 'Thailand', NULL, 'Lamphun', NULL, '51', '南奔', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8098, 'Thailand', NULL, 'Nonthaburi', NULL, '12', '暖武里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8099, 'Thailand', NULL, 'Phrae', NULL, '54', '帕', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8100, 'Thailand', NULL, 'Phayao', NULL, '56', '帕堯', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8101, 'Thailand', NULL, 'Phangnga', NULL, '82', '攀牙', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8102, 'Thailand', NULL, 'Phitsanulok', NULL, '65', '彭世洛', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8103, 'Thailand', NULL, 'Phichit', NULL, '66', '披集', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8104, 'Thailand', NULL, 'Phuket', NULL, '83', '普吉', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8105, 'Thailand', NULL, 'Chiang Rai', NULL, '57', '清萊', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8106, 'Thailand', NULL, 'Chiang Mai', NULL, '50', '清邁', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8107, 'Thailand', NULL, 'Sakon Nakhon', NULL, '47', '色軍', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8108, 'Thailand', NULL, 'Satun', NULL, '91', '沙敦', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8109, 'Thailand', NULL, 'Sa Kaeo', NULL, '27', '沙繳', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8110, 'Thailand', NULL, 'Si sa ket', NULL, '33', '四色菊', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8111, 'Thailand', NULL, 'Songkhla', NULL, '90', '宋卡', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8112, 'Thailand', NULL, 'Sukhothai', NULL, '64', '素可泰', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8113, 'Thailand', NULL, 'Surat Thani', NULL, '84', '素叻', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8114, 'Thailand', NULL, 'Surin', NULL, '32', '素林', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8115, 'Thailand', NULL, 'Suphan Buri', NULL, '72', '素攀武里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8116, 'Thailand', NULL, 'Narathiwat', NULL, '96', '陶公', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8117, 'Thailand', NULL, 'Udon Thani', NULL, '41', '烏隆', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8118, 'Thailand', NULL, 'Uthai Thani', NULL, '61', '烏泰他尼', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8119, 'Thailand', NULL, 'Ubon Ratchathani', NULL, '34', '烏汶', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8120, 'Thailand', NULL, 'Buri Ram', NULL, '31', '武里南', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8121, 'Thailand', NULL, 'Sing Buri', NULL, '17', '信武里', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8122, 'Thailand', NULL, 'Yasothon', NULL, '35', '耶梭通', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8123, 'Thailand', NULL, 'Yala', NULL, '95', '也拉', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8124, 'Thailand', NULL, 'Mae Hong Son', NULL, '58', '夜豐頌', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8125, 'Thailand', NULL, 'Samut Songkhram', NULL, '75', '夜功', NULL, '泰國', 'THA');
INSERT INTO `region_city` VALUES (8126, 'Tanzania', NULL, 'Arusha', NULL, 'AR', '阿魯沙', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8127, 'Tanzania', NULL, 'Kaskazini Pemba', NULL, 'PN', '奔巴北', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8128, 'Tanzania', NULL, 'Kusini Pemba', NULL, 'PS', '奔巴南', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8129, 'Tanzania', NULL, 'Pwani', NULL, 'PW', '濱海', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8130, 'Tanzania', NULL, 'Dar es Salaam', NULL, 'DS', '達累斯薩拉姆', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8131, 'Tanzania', NULL, 'Dodoma', NULL, 'DO', '多多馬', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8132, 'Tanzania', NULL, 'Kigoma', NULL, 'KI', '基戈馬', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8133, 'Tanzania', NULL, 'Kagera', NULL, 'KA', '卡蓋拉', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8134, 'Tanzania', NULL, 'Lindi', NULL, 'LN', '林迪', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8135, 'Tanzania', NULL, 'Rukwa', NULL, 'RK', '魯夸', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8136, 'Tanzania', NULL, 'Ruvuma', NULL, 'RV', '魯伍馬', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8137, 'Tanzania', NULL, 'Mara', NULL, 'MR', '馬臘', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8138, 'Tanzania', NULL, 'Manyara', NULL, 'MY', '曼亞拉', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8139, 'Tanzania', NULL, 'Morogoro', NULL, 'MO', '莫洛戈羅', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8140, 'Tanzania', NULL, 'Mbeya', NULL, 'MB', '姆貝亞', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8141, 'Tanzania', NULL, 'Mtwara', NULL, 'MT', '姆特瓦拉', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8142, 'Tanzania', NULL, 'Mwanza', NULL, 'MW', '姆萬紮', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8143, 'Tanzania', NULL, 'Kilimanjaro', NULL, 'KJ', '乞力馬紮羅', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8144, 'Tanzania', NULL, 'Zanzibar', NULL, 'ZN', '桑給巴爾', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8145, 'Tanzania', NULL, 'Kaskazini Unguja', NULL, 'UN', '桑給巴爾北', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8146, 'Tanzania', NULL, 'Kusini Unguja', NULL, 'US', '桑給巴爾南', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8147, 'Tanzania', NULL, 'Mjini Magharibi', NULL, 'MM', '桑給巴爾市和西', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8148, 'Tanzania', NULL, 'Tabora', NULL, 'TB', '塔波拉', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8149, 'Tanzania', NULL, 'Tanga', NULL, 'TN', '坦噶', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8150, 'Tanzania', NULL, 'Singida', NULL, 'SI', '辛吉達', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8151, 'Tanzania', NULL, 'Shinyanga', NULL, 'SH', '欣延加', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8152, 'Tanzania', NULL, 'Iringa', NULL, 'IR', '伊林加', NULL, '坦桑尼亞', 'TZA');
INSERT INTO `region_city` VALUES (8153, 'Tonga', NULL, 'Eua', NULL, 'E', '埃瓦', NULL, '湯加', 'TON');
INSERT INTO `region_city` VALUES (8154, 'Tonga', NULL, 'Haapai', NULL, 'H', '哈派', NULL, '湯加', 'TON');
INSERT INTO `region_city` VALUES (8155, 'Tonga', NULL, 'Niuas', NULL, 'N', '紐阿斯', NULL, '湯加', 'TON');
INSERT INTO `region_city` VALUES (8156, 'Tonga', NULL, 'Tongatapu', NULL, 'T', '湯加塔布', NULL, '湯加', 'TON');
INSERT INTO `region_city` VALUES (8157, 'Tonga', NULL, 'Vavau', NULL, 'V', '瓦瓦烏', NULL, '湯加', 'TON');
INSERT INTO `region_city` VALUES (8158, 'Tunisia', NULL, 'Ariana', NULL, 'AR', '艾爾亞奈', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8159, 'Tunisia', NULL, 'Beja', NULL, 'BJ', '巴杰', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8160, 'Tunisia', NULL, 'Ben Arous', NULL, 'BA', '本阿魯斯', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8161, 'Tunisia', NULL, 'Bizerte', NULL, 'BI', '比塞大', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8162, 'Tunisia', NULL, 'Kebili', NULL, 'KB', '吉比利', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8163, 'Tunisia', NULL, 'Gabes', NULL, 'GB', '加貝斯', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8164, 'Tunisia', NULL, 'Gafsa', NULL, 'GF', '加夫薩', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8165, 'Tunisia', NULL, 'Jendouba', NULL, 'JE', '堅杜拜', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8166, 'Tunisia', NULL, 'Le Kef', NULL, 'LK', '卡夫', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8167, 'Tunisia', NULL, 'Kasserine', NULL, 'KS', '卡塞林', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8168, 'Tunisia', NULL, 'Kairouan', NULL, 'KR', '凱魯萬', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8169, 'Tunisia', NULL, 'Mahdia', NULL, 'MH', '馬赫迪耶', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8170, 'Tunisia', NULL, 'Manouba', NULL, 'MN', '馬努巴', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8171, 'Tunisia', NULL, 'Medenine', NULL, 'ME', '梅德寧', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8172, 'Tunisia', NULL, 'Monastir', NULL, 'MO', '莫納斯提爾', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8173, 'Tunisia', NULL, 'Nabeul', NULL, 'NA', '納布勒', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8174, 'Tunisia', NULL, 'Sfax', NULL, 'SF', '斯法克斯', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8175, 'Tunisia', NULL, 'Sousse', NULL, 'SO', '蘇塞', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8176, 'Tunisia', NULL, 'Tataouine', NULL, 'TA', '泰塔溫', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8177, 'Tunisia', NULL, 'Tunis', NULL, 'TU', '突尼斯', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8178, 'Tunisia', NULL, 'Tozeur', NULL, 'TO', '托澤爾', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8179, 'Tunisia', NULL, 'Sidi Bouzid', NULL, 'SD', '西迪布濟德', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8180, 'Tunisia', NULL, 'Siliana', NULL, 'SL', '錫勒亞奈', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8181, 'Tunisia', NULL, 'Zaghouan', NULL, 'ZA', '宰格萬', NULL, '突尼斯', 'TUN');
INSERT INTO `region_city` VALUES (8182, 'Turkey', NULL, 'Adana', NULL, 'ADA', '阿達納', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8183, 'Turkey', NULL, 'Adiyaman', NULL, 'ADI', '阿德亞曼', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8184, 'Turkey', NULL, 'Ardahan', NULL, 'ARD', '阿爾達罕', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8185, 'Turkey', NULL, 'Artvin', NULL, 'ART', '阿爾特溫', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8186, 'Turkey', NULL, 'Afyon', NULL, 'AFY', '阿菲永', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8187, 'Turkey', NULL, 'Aksaray', NULL, 'AKS', '阿克薩賴', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8188, 'Turkey', NULL, 'Agri', NULL, 'AGR', '阿勒', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8189, 'Turkey', NULL, 'Amasya', NULL, 'AMA', '阿馬西亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8190, 'Turkey', NULL, 'Edirne', NULL, 'EDI', '埃迪爾內', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8191, 'Turkey', NULL, 'Erzincan', NULL, 'EZC', '埃爾津詹', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8192, 'Turkey', NULL, 'Erzurum', NULL, 'EZR', '埃爾祖魯姆', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8193, 'Turkey', NULL, 'Elazig', NULL, 'ELA', '埃拉澤', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8194, 'Turkey', NULL, 'Eskisehir', NULL, 'ESK', '埃斯基謝希爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8195, 'Turkey', NULL, 'Aydin', NULL, 'AYI', '艾登', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8196, 'Turkey', NULL, 'Ankara', NULL, 'ANK', '安卡拉', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8197, 'Turkey', NULL, 'Antalya', NULL, 'ANT', '安塔利亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8198, 'Turkey', NULL, 'Ordu', NULL, 'ORD', '奧爾杜', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8199, 'Turkey', NULL, 'Bartin', NULL, 'BAR', '巴爾騰', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8200, 'Turkey', NULL, 'Balikesir', NULL, 'BAL', '巴勒克埃西爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8201, 'Turkey', NULL, 'Batman', NULL, 'BAT', '巴特曼', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8202, 'Turkey', NULL, 'Bayburt', NULL, 'BAY', '巴伊布爾特', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8203, 'Turkey', NULL, 'Bilecik', NULL, 'BIL', '比萊吉克', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8204, 'Turkey', NULL, 'Bitlis', NULL, 'BIT', '位元利斯', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8205, 'Turkey', NULL, 'Bingol', NULL, 'BIN', '賓格爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8206, 'Turkey', NULL, 'Bolu', NULL, 'BOL', '博盧', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8207, 'Turkey', NULL, 'Burdur', NULL, 'BRD', '布爾杜爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8208, 'Turkey', NULL, 'Bursa', NULL, 'BRS', '布爾薩', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8209, 'Turkey', NULL, 'Cankiri', NULL, 'CKR', '昌克勒', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8210, 'Turkey', NULL, 'Denizli', NULL, 'DEN', '代尼茲利', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8211, 'Turkey', NULL, 'Diyarbakir', NULL, 'DIY', '迪亞巴克爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8212, 'Turkey', NULL, 'Van', NULL, 'VAN', '凡', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8213, 'Turkey', NULL, 'Hakkari', NULL, 'HKR', '哈卡里', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8214, 'Turkey', NULL, 'Hatay', NULL, 'HTY', '哈塔伊', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8215, 'Turkey', NULL, 'Kilis', NULL, 'KLS', '基利斯', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8216, 'Turkey', NULL, 'Giresun', NULL, 'GIR', '吉雷松', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8217, 'Turkey', NULL, 'Gaziantep', NULL, 'GAZ', '加濟安泰普', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8218, 'Turkey', NULL, 'Gumushane', NULL, 'GMS', '居米什哈內', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8219, 'Turkey', NULL, 'Kars', NULL, 'KRS', '卡爾斯', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8220, 'Turkey', NULL, 'Kahraman Maras', NULL, 'KAH', '卡赫拉曼馬拉什', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8221, 'Turkey', NULL, 'Karabuk', NULL, 'KRB', '卡拉比克', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8222, 'Turkey', NULL, 'Karaman', NULL, 'KRM', '卡拉曼', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8223, 'Turkey', NULL, 'Kastamonu', NULL, 'KAS', '卡斯塔莫努', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8224, 'Turkey', NULL, 'Kayseri', NULL, 'KAY', '開塞利', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8225, 'Turkey', NULL, 'Kocaeli', NULL, 'KOC', '科賈埃利', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8226, 'Turkey', NULL, 'Kirklareli', NULL, 'KLR', '柯克拉雷利', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8227, 'Turkey', NULL, 'Konya', NULL, 'KON', '科尼亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8228, 'Turkey', NULL, 'Kirsehir', NULL, 'KRH', '克爾謝希爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8229, 'Turkey', NULL, 'Kirikkale', NULL, 'KRK', '克勒克卡萊', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8230, 'Turkey', NULL, 'Urfa', NULL, 'URF', '拉飛', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8231, 'Turkey', NULL, 'Rize', NULL, 'RIZ', '里澤', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8232, 'Turkey', NULL, 'Mardin', NULL, 'MAR', '馬爾丁', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8233, 'Turkey', NULL, 'Malatya', NULL, 'MAL', '馬拉蒂亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8234, 'Turkey', NULL, 'Manisa', NULL, 'MAN', '馬尼薩', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8235, 'Turkey', NULL, 'Mugla', NULL, 'MUG', '穆拉', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8236, 'Turkey', NULL, 'Mus', NULL, 'MUS', '穆什', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8237, 'Turkey', NULL, 'Nevsehir', NULL, 'NEV', '內夫謝希爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8238, 'Turkey', NULL, 'Nigde', NULL, 'NIG', '尼代', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8239, 'Turkey', NULL, 'Canakkale', NULL, 'CKL', '恰納卡萊', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8240, 'Turkey', NULL, 'Corum', NULL, 'COR', '喬魯姆', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8241, 'Turkey', NULL, 'Kutahya', NULL, 'KUT', '屈塔希亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8242, 'Turkey', NULL, 'Sakarya', NULL, 'SAK', '薩卡里亞', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8243, 'Turkey', NULL, 'Samsun', NULL, 'SAM', '薩姆松', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8244, 'Turkey', NULL, 'Tekirdag', NULL, 'TEL', '泰基爾達', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8245, 'Turkey', NULL, 'Trabzon', NULL, 'TRA', '特拉布宗', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8246, 'Turkey', NULL, 'Tunceli', NULL, 'TUN', '通傑利', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8247, 'Turkey', NULL, 'Tokat', NULL, 'TOK', '托卡特', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8248, 'Turkey', NULL, 'Usak', NULL, 'USK', '烏薩克', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8249, 'Turkey', NULL, 'Sirnak', NULL, 'SIR', '錫爾納克', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8250, 'Turkey', NULL, 'Siirt', NULL, 'SII', '錫爾特', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8251, 'Turkey', NULL, 'Sinop', NULL, 'SIN', '錫諾普', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8252, 'Turkey', NULL, 'Sivas', NULL, 'SIV', '錫瓦斯', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8253, 'Turkey', NULL, 'Igdir', NULL, 'IGD', '伊迪爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8254, 'Turkey', NULL, 'Icel', NULL, 'ICE', '伊切爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8255, 'Turkey', NULL, 'Isparta', NULL, 'ISP', '伊斯帕爾塔', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8256, 'Turkey', NULL, 'Istanbul', NULL, 'IST', '伊斯坦布爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8257, 'Turkey', NULL, 'Izmir', NULL, 'IZM', '伊茲密爾', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8258, 'Turkey', NULL, 'Yozgat', NULL, 'YOZ', '約茲加特', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8259, 'Turkey', NULL, 'Zonguldak', NULL, 'ZON', '宗古爾達克', NULL, '土耳其', 'TUR');
INSERT INTO `region_city` VALUES (8260, 'Turkmenistan', NULL, 'Ahal', NULL, 'A', '阿哈爾', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8261, 'Turkmenistan', NULL, 'Ashgabat', NULL, 'ASB', '阿什哈巴德市', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8262, 'Turkmenistan', NULL, 'Balkan', NULL, 'B', '巴爾坎', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8263, 'Turkmenistan', NULL, 'Dashoguz', NULL, 'D', '達沙古茲', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8264, 'Turkmenistan', NULL, 'Lebap', NULL, 'L', '列巴普', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8265, 'Turkmenistan', NULL, 'Mary', NULL, 'M', '馬雷', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8266, 'Turkmenistan', NULL, 'Nebitdag', NULL, 'NEB', '涅位元達格', NULL, '土庫曼斯坦', 'TKM');
INSERT INTO `region_city` VALUES (8267, 'Vanuatu', NULL, 'Malampa', NULL, 'MA', '馬朗帕', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8268, 'Vanuatu', NULL, 'Penama', NULL, 'PE', '彭納馬', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8269, 'Vanuatu', NULL, 'Sanma', NULL, 'SA', '桑馬', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8270, 'Vanuatu', NULL, 'Tafea', NULL, 'TA', '塔菲阿', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8271, 'Vanuatu', NULL, 'Torba', NULL, 'TO', '托爾巴', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8272, 'Vanuatu', NULL, 'Shefa', NULL, 'SH', '謝法', NULL, '瓦努阿圖', 'VUT');
INSERT INTO `region_city` VALUES (8273, 'Guatemala', NULL, 'El Progreso', NULL, 'PR', '埃爾普羅格雷索', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8274, 'Guatemala', NULL, 'Escuintla', NULL, 'ES', '埃斯昆特拉', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8275, 'Guatemala', NULL, 'Jalapa', NULL, 'JA', '哈拉帕', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8276, 'Guatemala', NULL, 'Jutiapa', NULL, 'JU', '胡蒂亞帕', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8277, 'Guatemala', NULL, 'Quiche', NULL, 'QC', '基切', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8278, 'Guatemala', NULL, 'Quetzaltenango', NULL, 'QZ', '克薩爾特南戈', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8279, 'Guatemala', NULL, 'Retalhuleu', NULL, 'RE', '雷塔盧萊烏', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8280, 'Guatemala', NULL, 'Mixco', NULL, 'MIX', '米克斯科', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8281, 'Guatemala', NULL, 'Peten', NULL, 'PE', '佩滕', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8282, 'Guatemala', NULL, 'Chiquimula', NULL, 'CQ', '奇基穆拉', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8283, 'Guatemala', NULL, 'Chimaltenango', NULL, 'CM', '奇馬爾特南戈', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8284, 'Guatemala', NULL, 'Zacapa', NULL, 'ZA', '薩卡帕', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8285, 'Guatemala', NULL, 'Sacatepequez', NULL, 'ST', '薩卡特佩克斯', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8286, 'Guatemala', NULL, 'Alta Verapaz', NULL, 'AV', '上韋拉帕斯', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8287, 'Guatemala', NULL, 'Santa Rosa', NULL, 'SR', '聖羅莎', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8288, 'Guatemala', NULL, 'San Marcos', NULL, 'SM', '聖馬科斯', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8289, 'Guatemala', NULL, 'Suchitepequez', NULL, 'SU', '蘇奇特佩克斯', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8290, 'Guatemala', NULL, 'Solola', NULL, 'SO', '索洛拉', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8291, 'Guatemala', NULL, 'Totonicapan', NULL, 'TO', '托托尼卡潘', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8292, 'Guatemala', NULL, 'Guatemala', NULL, 'GU', '危地馬拉', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8293, 'Guatemala', NULL, 'Huehuetenango', NULL, 'HU', '韋韋特南戈', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8294, 'Guatemala', NULL, 'Baja Verapaz', NULL, 'BV', '下韋拉帕斯', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8295, 'Guatemala', NULL, 'Villa Nueva', NULL, 'VIN', '新城', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8296, 'Guatemala', NULL, 'Izabal', NULL, 'IZ', '伊薩瓦爾', NULL, '危地馬拉', 'GTM');
INSERT INTO `region_city` VALUES (8297, 'Venezuela', NULL, 'Aragua', NULL, 'D', '阿拉瓜', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8298, 'Venezuela', NULL, 'Delta Amacuro', NULL, 'Y', '阿馬庫羅三角洲', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8299, 'Venezuela', NULL, 'Apure', NULL, 'C', '阿普雷', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8300, 'Venezuela', NULL, 'Anzoategui', NULL, 'B', '安索阿特吉', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8301, 'Venezuela', NULL, 'Barinas', NULL, 'E', '巴里納斯', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8302, 'Venezuela', NULL, 'Bolivar', NULL, 'F', '玻利瓦爾', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8303, 'Venezuela', NULL, 'Portuguesa', NULL, 'P', '波圖格薩', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8304, 'Venezuela', NULL, 'Falcon', NULL, 'I', '法爾孔', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8305, 'Venezuela', NULL, 'Guarico', NULL, 'J', '瓜里科', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8306, 'Venezuela', NULL, 'Caracas', NULL, 'A', '加拉加斯', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8307, 'Venezuela', NULL, 'Carabobo', NULL, 'G', '卡拉沃沃', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8308, 'Venezuela', NULL, 'Cojedes', NULL, 'H', '科赫德斯', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8309, 'Venezuela', NULL, 'Lara', NULL, 'K', '拉臘', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8310, 'Venezuela', NULL, 'Dependencias Federales', NULL, 'W', '聯邦屬地', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8311, 'Venezuela', NULL, 'Merida', NULL, 'L', '梅里達', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8312, 'Venezuela', NULL, 'Miranda', NULL, 'M', '米蘭達', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8313, 'Venezuela', NULL, 'Monagas', NULL, 'N', '莫納加斯', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8314, 'Venezuela', NULL, 'Sucre', NULL, 'R', '蘇克雷', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8315, 'Venezuela', NULL, 'Zulia', NULL, 'V', '蘇利亞', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8316, 'Venezuela', NULL, 'Tachira', NULL, 'S', '塔奇拉', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8317, 'Venezuela', NULL, 'Trujillo', NULL, 'T', '特魯希略', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8318, 'Venezuela', NULL, 'Estado Nueva Esparta', NULL, 'O', '新埃斯帕塔', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8319, 'Venezuela', NULL, 'Yaracuy', NULL, 'U', '亞拉奎', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8320, 'Venezuela', NULL, 'Amazonas', NULL, 'Z', '亞馬孫', NULL, '委內瑞拉', 'VEN');
INSERT INTO `region_city` VALUES (8321, 'Uganda', NULL, 'Arua', NULL, 'ARU', '阿魯阿', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8322, 'Uganda', NULL, 'Apac', NULL, 'APC', '阿帕克', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8323, 'Uganda', NULL, 'Adjumani', NULL, 'ADJ', '阿朱馬尼', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8324, 'Uganda', NULL, 'Bundibugyo', NULL, 'BUN', '本迪布焦', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8325, 'Uganda', NULL, 'Bugiri', NULL, 'BUG', '布吉里', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8326, 'Uganda', NULL, 'Busia', NULL, 'BUS', '布西亞', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8327, 'Uganda', NULL, 'Bushenyi', NULL, 'BSH', '布謝尼', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8328, 'Uganda', NULL, 'Ntungamo', NULL, 'NTU', '恩通加莫', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8329, 'Uganda', NULL, 'Gulu', NULL, 'GUL', '古盧', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8330, 'Uganda', NULL, 'Hoima', NULL, 'HOI', '霍伊馬', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8331, 'Uganda', NULL, 'Kibaale', NULL, 'KBA', '基巴萊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8332, 'Uganda', NULL, 'Kiboga', NULL, 'KIB', '基博加', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8333, 'Uganda', NULL, 'Kyenjojo', NULL, 'KYE', '基恩喬喬', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8334, 'Uganda', NULL, 'Kisoro', NULL, 'KIS', '基索羅', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8335, 'Uganda', NULL, 'Kitgum', NULL, 'KIT', '基特古姆', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8336, 'Uganda', NULL, 'Jinja', NULL, 'JIN', '金賈', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8337, 'Uganda', NULL, 'Kabale', NULL, 'KBL', '卡巴萊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8338, 'Uganda', NULL, 'Kabarole', NULL, 'KAR', '卡巴羅萊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8339, 'Uganda', NULL, 'Kaberamaido', NULL, 'KAB', '卡貝拉馬伊多', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8340, 'Uganda', NULL, 'Kalangala', NULL, 'KAL', '卡蘭加拉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8341, 'Uganda', NULL, 'Kamwenge', NULL, 'KAM', '卡姆文蓋', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8342, 'Uganda', NULL, 'Kamuli', NULL, 'KML', '卡穆利', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8343, 'Uganda', NULL, 'Kanungu', NULL, 'KAN', '卡農古', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8344, 'Uganda', NULL, 'Kapchorwa', NULL, 'KPC', '卡普喬魯瓦', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8345, 'Uganda', NULL, 'Kasese', NULL, 'KAS', '卡塞塞', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8346, 'Uganda', NULL, 'Katakwi', NULL, 'KTK', '卡塔奎', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8347, 'Uganda', NULL, 'Kayunga', NULL, 'KAY', '卡永加', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8348, 'Uganda', NULL, 'Kampala', NULL, 'KMP', '坎帕拉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8349, 'Uganda', NULL, 'Kotido', NULL, 'KOT', '科蒂多', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8350, 'Uganda', NULL, 'Kumi', NULL, 'KUM', '庫米', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8351, 'Uganda', NULL, 'Rakai', NULL, 'RAK', '拉卡伊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8352, 'Uganda', NULL, 'Lira', NULL, 'LIR', '利拉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8353, 'Uganda', NULL, 'Luwero', NULL, 'LUW', '盧韋羅', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8354, 'Uganda', NULL, 'Rukungiri', NULL, 'RUK', '魯昆吉里', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8355, 'Uganda', NULL, 'Masaka', NULL, 'MAS', '馬薩卡', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8356, 'Uganda', NULL, 'Masindi', NULL, 'MSN', '馬辛迪', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8357, 'Uganda', NULL, 'Mayuge', NULL, 'MAY', '馬尤蓋', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8358, 'Uganda', NULL, 'Moroto', NULL, 'MRT', '莫羅托', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8359, 'Uganda', NULL, 'Moyo', NULL, 'MOY', '莫約', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8360, 'Uganda', NULL, 'Mbarara', NULL, 'MBR', '姆巴拉拉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8361, 'Uganda', NULL, 'Mbale', NULL, 'MBA', '姆巴萊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8362, 'Uganda', NULL, 'Mpigi', NULL, 'MPI', '姆皮吉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8363, 'Uganda', NULL, 'Mubende', NULL, 'MUB', '穆本德', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8364, 'Uganda', NULL, 'Mukono', NULL, 'MUK', '穆科諾', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8365, 'Uganda', NULL, 'Nakapiripirit', NULL, 'NAK', '納卡皮里皮里特', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8366, 'Uganda', NULL, 'Nakasongola', NULL, 'NKS', '納卡松戈拉', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8367, 'Uganda', NULL, 'Nebbi', NULL, 'NEB', '內比', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8368, 'Uganda', NULL, 'Pader', NULL, 'PAD', '帕德爾', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8369, 'Uganda', NULL, 'Pallisa', NULL, 'PAL', '帕利薩', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8370, 'Uganda', NULL, 'Sembabule', NULL, 'SEM', '森巴布萊', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8371, 'Uganda', NULL, 'Soroti', NULL, 'SOR', '索羅提', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8372, 'Uganda', NULL, 'Tororo', NULL, 'TOR', '托羅羅', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8373, 'Uganda', NULL, 'Wakiso', NULL, 'WAK', '瓦基索', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8374, 'Uganda', NULL, 'Sironko', NULL, 'SIR', '錫龍科', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8375, 'Uganda', NULL, 'Iganga', NULL, 'IGA', '伊甘加', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8376, 'Uganda', NULL, 'Yumbe', NULL, 'YUM', '永貝', NULL, '烏干達', 'UGA');
INSERT INTO `region_city` VALUES (8377, 'Ukraine', NULL, 'Odessa', NULL, '51', '敖德薩', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8378, 'Ukraine', NULL, 'Poltava', NULL, '53', '波爾塔瓦', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8379, 'Ukraine', NULL, 'Dnipropetrovsk', NULL, '12', '第聶伯羅波得羅夫斯克', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8380, 'Ukraine', NULL, 'Donetsk', NULL, '14', '頓涅茨克', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8381, 'Ukraine', NULL, 'Kharkiv', NULL, '63', '哈爾科夫', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8382, 'Ukraine', NULL, 'Khersonsrka', NULL, '65', '赫爾松州', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8383, 'Ukraine', NULL, 'Khmelnytsky', NULL, '68', '赫梅利尼茨基', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8384, 'Ukraine', NULL, 'Kyiv', NULL, '30', '基輔', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8385, 'Ukraine', NULL, 'Kirovohrad', NULL, '35', '基洛夫格勒', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8386, 'Ukraine', NULL, 'Ternopil', NULL, '61', '捷爾諾波爾', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8387, 'Ukraine', NULL, 'Respublika Krym', NULL, '43', '克里米亞自治共和國', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8388, 'Ukraine', NULL, 'Lviv', NULL, '46', '利沃夫', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8389, 'Ukraine', NULL, 'Luhansk', NULL, '9', '盧甘斯克', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8390, 'Ukraine', NULL, 'Rivne', NULL, '56', '羅夫諾', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8391, 'Ukraine', NULL, 'Mykolayiv', NULL, '48', '尼古拉耶夫', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8392, 'Ukraine', NULL, 'Cherkasy', NULL, '71', '切爾卡瑟', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8393, 'Ukraine', NULL, 'Chernihiv', NULL, '74', '切爾尼戈夫', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8394, 'Ukraine', NULL, 'Chernivtsi', NULL, '77', '切爾諾夫策', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8395, 'Ukraine', NULL, 'Zhytomyr', NULL, '18', '日托米爾', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8396, 'Ukraine', NULL, 'Sumy', NULL, '59', '蘇梅', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8397, 'Ukraine', NULL, 'Zakarpatska', NULL, '21', '外喀爾巴阡', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8398, 'Ukraine', NULL, 'Vinnytsya', NULL, '5', '文尼察', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8399, 'Ukraine', NULL, 'Volyn', NULL, '7', '沃倫', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8400, 'Ukraine', NULL, 'Ivano-Frankivsk', NULL, '26', '伊萬－弗蘭科夫州', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8401, 'Ukraine', NULL, 'Zaporizhzhya', NULL, '23', '扎波羅熱', NULL, '烏克蘭', 'UKR');
INSERT INTO `region_city` VALUES (8402, 'Uruguay', NULL, 'Artigas', NULL, 'AR', '阿蒂加斯', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8403, 'Uruguay', NULL, 'Durazno', NULL, 'DU', '杜拉斯諾', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8404, 'Uruguay', NULL, 'Florida', NULL, 'FA', '佛羅里達', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8405, 'Uruguay', NULL, 'Flores', NULL, 'FS', '弗洛雷斯', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8406, 'Uruguay', NULL, 'Canelones', NULL, 'CA', '卡內洛內斯', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8407, 'Uruguay', NULL, 'Colonia', NULL, 'CO', '科洛尼亞', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8408, 'Uruguay', NULL, 'Lavalleja', NULL, 'LA', '拉瓦耶哈', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8409, 'Uruguay', NULL, 'Rivera', NULL, 'RV', '里韋拉', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8410, 'Uruguay', NULL, 'Rocha', NULL, 'RO', '羅恰', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8411, 'Uruguay', NULL, 'Maldonado', NULL, 'MA', '馬爾多納多', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8412, 'Uruguay', NULL, 'Montevideo', NULL, 'MO', '蒙得維的亞', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8413, 'Uruguay', NULL, 'Rio Negro', NULL, 'RN', '內格羅河', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8414, 'Uruguay', NULL, 'Paysandu', NULL, 'PA', '派桑杜', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8415, 'Uruguay', NULL, 'Salto', NULL, 'SL', '薩爾托', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8416, 'Uruguay', NULL, 'Cerro Largo', NULL, 'CL', '塞羅拉爾戈', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8417, 'Uruguay', NULL, 'Treinta y Tres', NULL, 'TT', '三十三人', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8418, 'Uruguay', NULL, 'San Jose', NULL, 'SJ', '聖何塞', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8419, 'Uruguay', NULL, 'Soriano', NULL, 'SO', '索里亞諾', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8420, 'Uruguay', NULL, 'Tacuarembo', NULL, 'TAW', '塔夸倫博', NULL, '烏拉圭', 'URY');
INSERT INTO `region_city` VALUES (8421, 'Uzbekistan', NULL, 'Andijon', NULL, 'AN', '安集延', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8422, 'Uzbekistan', NULL, 'Buxoro', NULL, 'BU', '布哈拉', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8423, 'Uzbekistan', NULL, 'Fargona', NULL, 'FA', '費爾干納', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8424, 'Uzbekistan', NULL, 'Xorazm', NULL, 'XO', '花拉子模', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8425, 'Uzbekistan', NULL, 'Jizzax', NULL, 'JI', '吉扎克', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8426, 'Uzbekistan', NULL, 'Qoraqalpogiston', NULL, 'QR', '卡拉卡爾帕克斯坦共和國', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8427, 'Uzbekistan', NULL, 'Qasqadaryo', NULL, 'QA', '卡什卡達里亞', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8428, 'Uzbekistan', NULL, 'Namangan', NULL, 'NG', '納曼干', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8429, 'Uzbekistan', NULL, 'Navoiy', NULL, 'NW', '納沃伊', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8430, 'Uzbekistan', NULL, 'Samarqand', NULL, 'SA', '撒馬爾罕', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8431, 'Uzbekistan', NULL, 'Surxondaryo', NULL, 'SU', '蘇爾漢河', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8432, 'Uzbekistan', NULL, 'Toshkent', NULL, 'TK', '塔什干', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8433, 'Uzbekistan', NULL, 'Toshkent Shahri', NULL, 'TO', '塔什干市', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8434, 'Uzbekistan', NULL, 'Sirdaryo', NULL, 'SI', '錫爾河', NULL, '烏茲別克斯坦', 'UZB');
INSERT INTO `region_city` VALUES (8435, 'Spain', NULL, 'Almeria', NULL, 'LEI', '阿爾梅里亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8436, 'Spain', NULL, 'Albacete', NULL, 'ALB', '阿爾瓦塞特', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8437, 'Spain', NULL, 'Alava', NULL, 'ALA', '阿拉瓦', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8438, 'Spain', NULL, 'Alicante', NULL, 'ALC', '阿利坎特', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8439, 'Spain', NULL, 'Asturias', NULL, 'AST', '阿斯圖利亞斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8440, 'Spain', NULL, 'Avila', NULL, 'AVI', '阿維拉', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8441, 'Spain', NULL, 'Orense', NULL, 'ORE', '奧倫塞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8442, 'Spain', NULL, 'Badajoz', NULL, 'BJZ', '巴達霍斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8443, 'Spain', NULL, 'Baleares', NULL, 'BLR', '巴利阿里', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8444, 'Spain', NULL, 'Valladolid', NULL, 'VLL', '巴利亞多利德', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8445, 'Spain', NULL, 'Valencia', NULL, 'VLC', '巴倫西亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8446, 'Spain', NULL, 'Barcelona', NULL, 'BCN', '巴塞羅那', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8447, 'Spain', NULL, 'Vizcaya', NULL, 'VSE', '比斯開', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8448, 'Spain', NULL, 'Burgos', NULL, 'BUR', '布爾戈斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8449, 'Spain', NULL, 'Granada', NULL, 'GRX', '格拉納達', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8450, 'Spain', NULL, 'Guadalajara', NULL, 'GUA', '瓜達拉哈拉', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8451, 'Spain', NULL, 'Jaen', NULL, 'JAE', '哈恩', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8452, 'Spain', NULL, 'Gerona', NULL, 'GRO', '赫羅納', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8453, 'Spain', NULL, 'Guipuzcoa', NULL, 'GUI', '吉普斯夸', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8454, 'Spain', NULL, 'Cadiz', NULL, 'CAD', '加的斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8455, 'Spain', NULL, 'Caceres', NULL, 'CCS', '卡塞雷斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8456, 'Spain', NULL, 'Cludad Real', NULL, 'CIR', '卡斯蒂利亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8457, 'Spain', NULL, 'Castellon', NULL, 'CAS', '卡斯特利翁', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8458, 'Spain', NULL, 'Cordoba', NULL, 'ODB', '科爾多瓦', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8459, 'Spain', NULL, 'Cuenca', NULL, 'CUE', '昆卡', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8460, 'Spain', NULL, 'La Coruna', NULL, 'LCG', '拉科魯尼亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8461, 'Spain', NULL, 'La Rioja', NULL, 'ARL', '拉里奧哈', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8462, 'Spain', NULL, 'Las Palmas', NULL, 'LPA', '拉斯帕爾馬斯', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8463, 'Spain', NULL, 'Leon', NULL, 'LEN', '萊昂', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8464, 'Spain', NULL, 'Lleida', NULL, 'LLE', '萊里達', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8465, 'Spain', NULL, 'Provincia de Lugo', NULL, 'LGO', '盧戈', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8466, 'Spain', NULL, 'Madrid', NULL, 'MAD', '馬德里', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8467, 'Spain', NULL, 'Malaga', NULL, 'AGP', '馬拉加', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8468, 'Spain', NULL, 'Murcia', NULL, 'MJV', '穆爾西亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8469, 'Spain', NULL, 'Navarra', NULL, 'NVV', '納瓦拉', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8470, 'Spain', NULL, 'Palencia', NULL, 'PAC', '帕倫西亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8471, 'Spain', NULL, 'Provincia de Pontevedra', NULL, 'PEV', '蓬特韋德拉', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8472, 'Spain', NULL, 'Zaragoza', NULL, 'ZAZ', '薩拉戈薩', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8473, 'Spain', NULL, 'Salamanca', NULL, 'SLM', '薩拉曼卡', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8474, 'Spain', NULL, 'Zamora', NULL, 'ZMR', '薩莫拉', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8475, 'Spain', NULL, 'Segovia', NULL, 'SEG', '塞哥維亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8476, 'Spain', NULL, 'Sevilla', NULL, 'SVQ', '塞維利亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8477, 'Spain', NULL, 'Santander', NULL, 'SDR', '桑坦德', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8478, 'Spain', NULL, 'Santa Cruz de Tenerife', NULL, 'SCT', '聖克魯斯-德特內里費', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8479, 'Spain', NULL, 'Soria', NULL, 'SOR', '索里亞', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8480, 'Spain', NULL, 'Tarragona', NULL, 'TAR', '塔拉戈納', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8481, 'Spain', NULL, 'Teruel', NULL, 'TER', '特魯埃爾', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8482, 'Spain', NULL, 'Toledo', NULL, 'TOL', '托萊多', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8483, 'Spain', NULL, 'Huelva', NULL, 'HUV', '韋爾瓦', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8484, 'Spain', NULL, 'Huesca', NULL, 'HUC', '韋斯卡', NULL, '西班牙', 'ESP');
INSERT INTO `region_city` VALUES (8485, 'Greece', NULL, 'Peiraievs', NULL, 'PRI', '比雷埃夫斯', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8486, 'Greece', NULL, 'Dodecanese', NULL, 'DO', '多德卡尼斯', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8487, 'Greece', NULL, 'Chanion', NULL, 'CHQ', '干尼亞', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8488, 'Greece', NULL, 'Cyclades', NULL, 'CY', '基克拉迪', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8489, 'Greece', NULL, 'Lasithiou', NULL, 'LST', '拉西錫', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8490, 'Greece', NULL, 'Lesbos', NULL, 'LES', '萊斯博斯', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8491, 'Greece', NULL, 'Rethymnis', NULL, 'RET', '雷西姆農', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8492, 'Greece', NULL, 'Samos', NULL, 'SMI', '薩摩斯', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8493, 'Greece', NULL, 'Athens', NULL, 'ATH', '雅典', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8494, 'Greece', NULL, 'Irakleiou', NULL, 'HER', '伊拉克里翁', NULL, '希臘', 'GRC');
INSERT INTO `region_city` VALUES (8495, 'New Zealand', NULL, 'Auckland', NULL, 'AUK', '奧克蘭', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8496, 'New Zealand', NULL, 'North Shore', NULL, 'NSH', '北岸', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8497, 'New Zealand', NULL, 'Palmerston North', NULL, 'PMR', '北帕默斯頓', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8498, 'New Zealand', NULL, 'Far North', NULL, 'FNR', '北遠', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8499, 'New Zealand', NULL, 'Blenheim', NULL, 'BHE', '布萊尼姆', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8500, 'New Zealand', NULL, 'Dunedin', NULL, 'DUD', '達尼丁', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8501, 'New Zealand', NULL, 'Greymouth', NULL, 'GMN', '格雷茅斯', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8502, 'New Zealand', NULL, 'Hamilton', NULL, 'HLZ', '哈密爾頓', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8503, 'New Zealand', NULL, 'Hastings', NULL, 'HAS', '黑斯廷斯', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8504, 'New Zealand', NULL, 'Waitakere', NULL, 'WAE', '懷塔科拉', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8505, 'New Zealand', NULL, 'Gisborne', NULL, 'GIS', '吉斯伯恩', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8506, 'New Zealand', NULL, 'Kaipara', NULL, 'KAI', '凱帕拉', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8507, 'New Zealand', NULL, 'Christchurch', NULL, 'CHC', '克賴斯特徹奇', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8508, 'New Zealand', NULL, 'Richmond', NULL, 'RMD', '里士滿', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8509, 'New Zealand', NULL, 'Manukau', NULL, 'MNK', '馬努考', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8510, 'New Zealand', NULL, 'Nelson', NULL, 'NSN', '納爾遜', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8511, 'New Zealand', NULL, 'Napier', NULL, 'NPE', '內皮爾', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8512, 'New Zealand', NULL, 'Stratford', NULL, 'STR', '斯特拉特福德', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8513, 'New Zealand', NULL, 'Taumarunui', NULL, 'TAU', '陶馬魯努伊', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8514, 'New Zealand', NULL, 'Whakatane', NULL, 'WHK', '瓦卡塔尼', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8515, 'New Zealand', NULL, 'Whangarei', NULL, 'WRE', '旺阿雷', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8516, 'New Zealand', NULL, 'Wanganui', NULL, 'WAG', '旺格努伊', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8517, 'New Zealand', NULL, 'New Plymouth', NULL, 'NPL', '新普利茅斯', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8518, 'New Zealand', NULL, 'Invercargill', NULL, 'IVC', '因弗卡吉爾', NULL, '新西蘭', 'NZL');
INSERT INTO `region_city` VALUES (8519, 'Hungary', NULL, 'Baranya', NULL, 'BA', '巴蘭尼亞', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8520, 'Hungary', NULL, 'Bacs-Kiskun', NULL, 'BK', '巴奇-基什孔', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8521, 'Hungary', NULL, 'Borsod-Abauj-Zemplen', NULL, 'BZ', '包爾紹德-奧包烏伊-曾普倫', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8522, 'Hungary', NULL, 'Bekes', NULL, 'BE', '貝凱什', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8523, 'Hungary', NULL, 'Budapest', NULL, 'BU', '布達佩斯', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8524, 'Hungary', NULL, 'Fejer', NULL, 'FE', '費耶爾', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8525, 'Hungary', NULL, 'Hajdu-Bihar', NULL, 'HB', '豪伊杜-比豪爾', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8526, 'Hungary', NULL, 'Heves', NULL, 'HE', '赫維什', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8527, 'Hungary', NULL, 'Jasz-Nagykun-Szolnok', NULL, 'JN', '加茲-納杰孔-索爾諾克', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8528, 'Hungary', NULL, 'Gyor-Moson-Sopron', NULL, 'GS', '傑爾-莫松-肖普朗', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8529, 'Hungary', NULL, 'Komarom-Esztergom', NULL, 'KE', '科馬羅姆', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8530, 'Hungary', NULL, 'Nograd', NULL, 'NO', '諾格拉德', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8531, 'Hungary', NULL, 'Pest', NULL, 'PE', '佩斯', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8532, 'Hungary', NULL, 'Csongrad', NULL, 'CS', '瓊格拉德', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8533, 'Hungary', NULL, 'Somogy', NULL, 'SO', '紹莫吉', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8534, 'Hungary', NULL, 'Szabolcs-Szatmar-Bereg', NULL, 'SZ', '索博爾奇-索特馬爾-貝拉格', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8535, 'Hungary', NULL, 'Tolna', NULL, 'TO', '托爾瑙', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8536, 'Hungary', NULL, 'Veszprem', NULL, 'VE', '維斯普雷姆', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8537, 'Hungary', NULL, 'Vas', NULL, 'VA', '沃什', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8538, 'Hungary', NULL, 'Zala', NULL, 'ZA', '佐洛', NULL, '匈牙利', 'HUN');
INSERT INTO `region_city` VALUES (8539, 'Syria', NULL, 'Halab', NULL, 'HL', '阿勒頗', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8540, 'Syria', NULL, 'Rif Dimashq', NULL, 'RD', '大馬士革', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8541, 'Syria', NULL, 'Madinat Dimashq', NULL, 'DI', '大馬士革市', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8542, 'Syria', NULL, 'Dayr az Zawr', NULL, 'DZ', '代爾祖爾', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8543, 'Syria', NULL, 'Dara', NULL, 'DA', '德拉', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8544, 'Syria', NULL, 'Hamah', NULL, 'HM', '哈馬', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8545, 'Syria', NULL, 'Al Hasakah', NULL, 'HA', '哈塞克', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8546, 'Syria', NULL, 'Hims', NULL, 'HI', '霍姆斯', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8547, 'Syria', NULL, 'Al Ghab', NULL, 'GH', '加布', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8548, 'Syria', NULL, 'Al-Qamishli', NULL, 'QA', '卡米什利', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8549, 'Syria', NULL, 'Al Qunaytirah', NULL, 'QU', '庫奈特拉', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8550, 'Syria', NULL, 'Ar Raqqah', NULL, 'RQ', '拉卡', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8551, 'Syria', NULL, 'Al Ladhiqiyah', NULL, 'LA', '拉塔基亞', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8552, 'Syria', NULL, 'As Suwayda', NULL, 'SU', '蘇韋達', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8553, 'Syria', NULL, 'Tartus', NULL, 'TA', '塔爾圖斯', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8554, 'Syria', NULL, 'Idlib', NULL, 'ID', '伊德利卜', NULL, '敘利亞', 'SYR');
INSERT INTO `region_city` VALUES (8555, 'Jamaica', NULL, 'Portland', NULL, 'POR', '波特蘭', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8556, 'Jamaica', NULL, 'Hanover', NULL, 'HAN', '漢諾威', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8557, 'Jamaica', NULL, 'Kingston', NULL, 'KIN', '金斯敦', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8558, 'Jamaica', NULL, 'Clarendon', NULL, 'CLA', '克拉倫登', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8559, 'Jamaica', NULL, 'Manchester', NULL, 'MAN', '曼徹斯特', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8560, 'Jamaica', NULL, 'St. Andrews', NULL, 'AND', '聖安德魯斯', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8561, 'Jamaica', NULL, 'St. Ann', NULL, 'ANN', '聖安娜', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8562, 'Jamaica', NULL, 'St. Catherine', NULL, 'CAT', '聖凱瑟琳', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8563, 'Jamaica', NULL, 'St. Mary', NULL, 'MAR', '聖瑪麗', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8564, 'Jamaica', NULL, 'St. Thomas', NULL, 'THO', '聖托馬斯', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8565, 'Jamaica', NULL, 'St. Elizabeth', NULL, 'ELI', '聖伊麗莎白', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8566, 'Jamaica', NULL, 'St. James', NULL, 'JAM', '聖詹姆斯', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8567, 'Jamaica', NULL, 'Trelawny', NULL, 'TRL', '特里洛尼', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8568, 'Jamaica', NULL, 'Westmoreland', NULL, 'WML', '西摩蘭', NULL, '牙買加', 'JAM');
INSERT INTO `region_city` VALUES (8569, 'Armenia', NULL, 'Armavir', NULL, 'ARM', '阿爾馬維爾', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8570, 'Armenia', NULL, 'Aragacotn', NULL, 'AGT', '阿拉加措特恩', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8571, 'Armenia', NULL, 'Ararat', NULL, 'ARA', '阿拉拉特', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8572, 'Armenia', NULL, 'Yerevan', NULL, 'EVN', '埃裡溫市', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8573, 'Armenia', NULL, 'Gelarkunik', NULL, 'GEG', '格加爾庫尼克', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8574, 'Armenia', NULL, 'Kotayk', NULL, 'KOT', '科泰克', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8575, 'Armenia', NULL, 'Lorri', NULL, 'LOR', '洛里', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8576, 'Armenia', NULL, 'Tavus', NULL, 'TAV', '塔武什', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8577, 'Armenia', NULL, 'VayocJor', NULL, 'VAY', '瓦約茨·佐爾', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8578, 'Armenia', NULL, 'Shirak', NULL, 'SHI', '希拉剋', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8579, 'Armenia', NULL, 'Syunik', NULL, 'SYU', '休尼克', NULL, '亞美尼亞', 'ARM');
INSERT INTO `region_city` VALUES (8580, 'Yemen', NULL, 'Abyan', NULL, 'AB', '阿比揚', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8581, 'Yemen', NULL, 'Amran Sana', NULL, 'AM', '阿姆蘭', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8582, 'Yemen', NULL, 'Al-Bayda', NULL, 'BA', '貝達', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8583, 'Yemen', NULL, 'Ad-Dali', NULL, 'DA', '達利', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8584, 'Yemen', NULL, 'Hadramawt', NULL, 'HD', '哈德拉毛', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8585, 'Yemen', NULL, 'Hajjah', NULL, 'HJ', '哈杰', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8586, 'Yemen', NULL, 'Al-Hudaydah', NULL, 'HU', '荷臺達', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8587, 'Yemen', NULL, 'Al-Jawf', NULL, 'JA', '焦夫', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8588, 'Yemen', NULL, 'Lahij', NULL, 'LA', '拉赫季', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8589, 'Yemen', NULL, 'Marib', NULL, 'MA', '馬里卜', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8590, 'Yemen', NULL, 'Al-Mahrah', NULL, 'MR', '邁赫拉', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8591, 'Yemen', NULL, 'Al-Mahwit', NULL, 'MW', '邁赫維特', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8592, 'Yemen', NULL, 'Sadah', NULL, 'SD', '薩達', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8593, 'Yemen', NULL, 'Sana', NULL, 'SN', '薩那', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8594, 'Yemen', NULL, 'Seiyun', NULL, 'GXF', '賽文', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8595, 'Yemen', NULL, 'Shabwah', NULL, 'SH', '舍卜沃', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8596, 'Yemen', NULL, 'Taizz', NULL, 'TA', '塔伊茲', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8597, 'Yemen', NULL, 'Ash-Shihr', NULL, 'ASR', '希赫爾', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8598, 'Yemen', NULL, 'Adan', NULL, 'AD', '亞丁', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8599, 'Yemen', NULL, 'Ibb', NULL, 'IB', '伊卜', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8600, 'Yemen', NULL, 'Dhamar', NULL, 'DH', '扎瑪爾', NULL, '也門', 'YEM');
INSERT INTO `region_city` VALUES (8601, 'Israel', NULL, 'Ashdod', NULL, 'ASH', '阿什杜德', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8602, 'Israel', NULL, 'Beersheba', NULL, 'BEV', '貝爾謝巴', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8603, 'Israel', NULL, 'Bat Yam', NULL, 'BAT', '貝特雁', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8604, 'Israel', NULL, 'Haifa', NULL, 'HFA', '海法', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8605, 'Israel', NULL, 'Holon', NULL, 'HOL', '霍隆', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8606, 'Israel', NULL, 'Netanya', NULL, 'NAT', '內坦亞', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8607, 'Israel', NULL, 'Tel Aviv-Yafo', NULL, 'TLV', '特拉維夫', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8608, 'Israel', NULL, 'Jerusalem', NULL, 'J', '耶路撒冷', NULL, '以色列', 'ISR');
INSERT INTO `region_city` VALUES (8609, 'Italy', NULL, 'Asti', NULL, 'AST', '阿斯蒂', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8610, 'Italy', NULL, 'Ascoli Piceno', NULL, 'ASP', '阿斯科利皮切諾', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8611, 'Italy', NULL, 'Ancona', NULL, 'AOI', '安科納', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8612, 'Italy', NULL, 'Olbia-Tempio', NULL, 'OLB', '奧爾比亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8613, 'Italy', NULL, 'Oristano', NULL, 'QOS', '奧里斯塔諾', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8614, 'Italy', NULL, 'Aosta', NULL, 'AOT', '奧斯塔', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8615, 'Italy', NULL, 'Palermo', NULL, 'PMO', '巴勒莫', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8616, 'Italy', NULL, 'Bari', NULL, 'BRI', '巴里', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8617, 'Italy', NULL, 'Bergamo', NULL, 'BGO', '貝加莫', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8618, 'Italy', NULL, 'Benevento', NULL, 'BEN', '貝內文托', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8619, 'Italy', NULL, 'Pisa', NULL, 'PSA', '比薩', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8620, 'Italy', NULL, 'Pordenone', NULL, 'PRD', '波代諾內', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8621, 'Italy', NULL, 'Potenza', NULL, 'QPO', '波坦察', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8622, 'Italy', NULL, 'Bologna', NULL, 'BLQ', '博洛尼亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8623, 'Italy', NULL, 'Biella', NULL, 'BIE', '布拉', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8624, 'Italy', NULL, 'Brescia', NULL, 'BRC', '佈雷西亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8625, 'Italy', NULL, 'Brindisi', NULL, 'BDS', '布林迪西', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8626, 'Italy', NULL, 'Trieste', NULL, 'TRS', '的里雅斯特', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8627, 'Italy', NULL, 'Turin', NULL, 'TRN', '都靈', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8628, 'Italy', NULL, 'Ferrara', NULL, 'FRR', '費拉拉', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8629, 'Italy', NULL, 'Firenze', NULL, 'FLR', '佛羅倫薩', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8630, 'Italy', NULL, 'Foggia', NULL, 'FOG', '福賈', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8631, 'Italy', NULL, 'Cagliari', NULL, 'CAG', '卡利亞里', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8632, 'Italy', NULL, 'Caserta', NULL, 'CST', '卡塞塔', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8633, 'Italy', NULL, 'Catania', NULL, 'CTA', '卡塔尼亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8634, 'Italy', NULL, 'Catanzaro', NULL, 'QCZ', '卡坦扎羅', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8635, 'Italy', NULL, 'Campobasso', NULL, 'COB', '坎波巴索', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8636, 'Italy', NULL, 'Como', NULL, 'CIY', '科摩', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8637, 'Italy', NULL, 'Cosenza', NULL, 'QCS', '科森扎', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8638, 'Italy', NULL, 'Crotone', NULL, 'CRV', '克羅托內', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8639, 'Italy', NULL, 'Cuneo', NULL, 'CUN', '庫內奧', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8640, 'Italy', NULL, 'L\'Aquila', NULL, 'LAQ', '拉奎拉', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8641, 'Italy', NULL, 'La Spezia', NULL, 'SPE', '拉斯佩齊亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8642, 'Italy', NULL, 'Lecco', NULL, 'LCO', '萊科', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8643, 'Italy', NULL, 'Lecce', NULL, 'LCC', '萊切', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8644, 'Italy', NULL, 'Reggio Emilia', NULL, 'RNE', '雷焦艾米利亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8645, 'Italy', NULL, 'Reggio Calabria', NULL, 'REG', '雷焦卡拉布里亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8646, 'Italy', NULL, 'Livorno', NULL, 'LIV', '里窩那', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8647, 'Italy', NULL, 'Roma', NULL, 'ROM', '羅馬', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8648, 'Italy', NULL, 'Massa-Carrara', NULL, 'MCR', '馬薩', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8649, 'Italy', NULL, 'Matera', NULL, 'MTR', '馬泰拉', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8650, 'Italy', NULL, 'Monza e Brianza', NULL, 'MZA', '蒙扎', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8651, 'Italy', NULL, 'Milano', NULL, 'MIL', '米蘭', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8652, 'Italy', NULL, 'Modena', NULL, 'MOD', '摩德納', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8653, 'Italy', NULL, 'Messina', NULL, 'MSN', '墨西拿', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8654, 'Italy', NULL, 'Naples', NULL, 'NAP', '那不勒斯', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8655, 'Italy', NULL, 'Nuoro', NULL, 'QNU', '努奧羅', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8656, 'Italy', NULL, 'Novara', NULL, 'NVR', '諾瓦拉', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8657, 'Italy', NULL, 'Parma', NULL, 'PMF', '帕爾馬', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8658, 'Italy', NULL, 'Pavia', NULL, 'PAV', '帕維亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8659, 'Italy', NULL, 'Perugia', NULL, 'PEG', '佩魯賈', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8660, 'Italy', NULL, 'Genova', NULL, 'CAX', '熱那亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8661, 'Italy', NULL, 'Salerno', NULL, 'SAL', '薩萊諾', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8662, 'Italy', NULL, 'Sassari', NULL, 'QSS', '薩薩里', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8663, 'Italy', NULL, 'Savona', NULL, 'SVN', '薩沃納', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8664, 'Italy', NULL, 'Taranto', NULL, 'TAR', '塔蘭托', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8665, 'Italy', NULL, 'Trapani', NULL, 'TPS', '特拉帕尼', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8666, 'Italy', NULL, 'Trento', NULL, 'TRT', '特倫托', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8667, 'Italy', NULL, 'Venice', NULL, 'VCE', '威尼斯', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8668, 'Italy', NULL, 'Vercelli', NULL, 'VRL', '韋爾切利', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8669, 'Italy', NULL, 'Viterbo', NULL, 'VIT', '維泰博', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8670, 'Italy', NULL, 'Udine', NULL, 'UDN', '烏迪內', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8671, 'Italy', NULL, 'Syracuse', NULL, 'SYR', '錫拉庫扎', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8672, 'Italy', NULL, 'Siena', NULL, 'SNA', '錫耶納', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8673, 'Italy', NULL, 'Alessandria', NULL, 'ALE', '亞歷山德里亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8674, 'Italy', NULL, 'Isernia', NULL, 'ISE', '伊塞爾尼亞', NULL, '意大利', 'ITA');
INSERT INTO `region_city` VALUES (8675, 'India', NULL, 'Aizawl', NULL, 'AJL', '艾藻爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8676, 'India', NULL, 'Bangalore', NULL, 'BLR', '班加羅爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8677, 'India', NULL, 'Pondicherry', NULL, 'PNY', '本地治里', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8678, 'India', NULL, 'Bhopal', NULL, 'BHO', '博帕爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8679, 'India', NULL, 'Bhubaneswar', NULL, 'BBI', '布巴內斯瓦爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8680, 'India', NULL, 'Chandigarh', NULL, 'IXC', '昌迪加爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8681, 'India', NULL, 'Daman', NULL, 'DAM', '達曼', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8682, 'India', NULL, 'Diu', NULL, 'DIU', '第烏', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8683, 'India', NULL, 'Gangtok', NULL, 'GTO', '甘托克', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8684, 'India', NULL, 'Coimbatore', NULL, 'CJB', '哥印拜陀', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8685, 'India', NULL, 'Calcutta', NULL, 'CCU', '加爾各答', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8686, 'India', NULL, 'Karaikal', NULL, 'KRK', '加里加爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8687, 'India', NULL, 'Jabalpur', NULL, 'JLR', '賈巴爾普爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8688, 'India', NULL, 'Jalandhar', NULL, 'JUC', '賈朗達爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8689, 'India', NULL, 'Jodhpur', NULL, 'JDH', '焦特布爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8690, 'India', NULL, 'Chennai', NULL, 'MAA', '金奈', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8691, 'India', NULL, 'Kavaratti', NULL, 'KVA', '卡瓦拉蒂', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8692, 'India', NULL, 'Kohima', NULL, 'KOM', '科希馬', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8693, 'India', NULL, 'Mahe', NULL, 'MAH', '馬埃', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8694, 'India', NULL, 'Madurai', NULL, 'IXM', '馬杜賴', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8695, 'India', NULL, 'Sambalpur', NULL, 'SLR', '森伯爾布爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8696, 'India', NULL, 'Trivandrum', NULL, 'TRV', '特里凡得瑯', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8697, 'India', NULL, 'Udaipur', NULL, 'UDR', '烏代布爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8698, 'India', NULL, 'Shillong', NULL, 'SHL', '西隆', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8699, 'India', NULL, 'Silvassa', NULL, 'SIL', '錫爾薩瓦', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8700, 'India', NULL, 'New Delhi', NULL, 'ICD', '新德里', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8701, 'India', NULL, 'Yanam', NULL, 'SRV', '亞南', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8702, 'India', NULL, 'Imphal', NULL, 'IMF', '因帕爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8703, 'India', NULL, 'Indore', NULL, 'IDR', '印多爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8704, 'India', NULL, 'Jaipur', NULL, 'JAI', '齋普爾', NULL, '印度', 'IND');
INSERT INTO `region_city` VALUES (8705, 'Indonesia', NULL, 'Bali', NULL, 'BA', '巴厘', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8706, 'Indonesia', NULL, 'Kepulauan Bangka Belitung', NULL, 'BB', '邦加－勿里洞群島', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8707, 'Indonesia', NULL, 'Sulawesi Utara', NULL, 'SA', '北蘇拉威西', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8708, 'Indonesia', NULL, 'Sumatera Utara', NULL, 'SU', '北蘇門答臘', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8709, 'Indonesia', NULL, 'Daerah Tingkat I Kalimantan Barat', NULL, 'KB', '大雅加達首都特區', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8710, 'Indonesia', NULL, 'Kalimantan Timur', NULL, 'KI', '東加里曼丹', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8711, 'Indonesia', NULL, 'Sulawesi Tenggara', NULL, 'SG', '東南蘇拉威西', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8712, 'Indonesia', NULL, 'Nusa Tenggara Timur', NULL, 'NT', '東努沙登加拉', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8713, 'Indonesia', NULL, 'Java Timur', NULL, 'JI', '東爪哇', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8714, 'Indonesia', NULL, 'Riau', NULL, 'RI', '廖內', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8715, 'Indonesia', NULL, 'Maluku', NULL, 'MA', '馬魯古', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8716, 'Indonesia', NULL, 'Bengkulu', NULL, 'BE', '明古魯', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8717, 'Indonesia', NULL, 'Lampung', NULL, 'LA', '楠榜', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8718, 'Indonesia', NULL, 'Kalimantan Selatan', NULL, 'KS', '南加裡曼丹', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8719, 'Indonesia', NULL, 'Sulawesi Selatan', NULL, 'SN', '南蘇拉威西', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8720, 'Indonesia', NULL, 'Sumatera Selatan', NULL, 'SS', '南蘇門答臘', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8721, 'Indonesia', NULL, 'Daerah Istimewa Yogyakarta', NULL, 'YO', '日惹特區', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8722, 'Indonesia', NULL, 'Banten', NULL, 'BT', '萬丹', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8723, 'Indonesia', NULL, 'Nusa Tenggara Barat', NULL, 'NB', '西努沙登加拉', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8724, 'Indonesia', NULL, 'Sumatera Barat', NULL, 'SR', '西蘇門答臘', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8725, 'Indonesia', NULL, 'Java Barat', NULL, 'JB', '西爪哇', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8726, 'Indonesia', NULL, 'Jakarta Raya', NULL, 'JK', '雅加達', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8727, 'Indonesia', NULL, 'Aceh', NULL, 'AC', '亞齊', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8728, 'Indonesia', NULL, 'Irian Jaya', NULL, 'IJ', '伊里安查亞', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8729, 'Indonesia', NULL, 'Jambi', NULL, 'JA', '占碑', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8730, 'Indonesia', NULL, 'Kalimantan Tengah', NULL, 'KT', '中加裡曼丹', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8731, 'Indonesia', NULL, 'Sulawesi Tengah', NULL, 'ST', '中蘇拉威西', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8732, 'Indonesia', NULL, 'Java Tengah', NULL, 'JT', '中爪哇', NULL, '印度尼西亞', 'IDN');
INSERT INTO `region_city` VALUES (8733, 'Jordan', NULL, 'Allun', NULL, 'AJ', '阿吉隆', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8734, 'Jordan', NULL, 'Amman', NULL, 'AM', '安曼', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8735, 'Jordan', NULL, 'Balqa', NULL, 'BA', '拜勒加', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8736, 'Jordan', NULL, 'Jarash', NULL, 'JA', '傑拉什', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8737, 'Jordan', NULL, 'Karak', NULL, 'KA', '卡拉克', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8738, 'Jordan', NULL, 'Rusayfah', NULL, 'RU', '魯賽法', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8739, 'Jordan', NULL, 'Maan', NULL, 'MN', '馬安', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8740, 'Jordan', NULL, 'Madaba', NULL, 'MD', '馬德巴', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8741, 'Jordan', NULL, 'Mafraq', NULL, 'MF', '馬伕拉克', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8742, 'Jordan', NULL, 'Tafiela', NULL, 'TA', '塔菲拉', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8743, 'Jordan', NULL, 'Aqaba', NULL, 'AQ', '亞喀巴', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8744, 'Jordan', NULL, 'Irbid', NULL, 'IR', '伊爾比德', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8745, 'Jordan', NULL, 'Zarqa', NULL, 'ZA', '扎爾卡', NULL, '約旦', 'JOR');
INSERT INTO `region_city` VALUES (8746, 'Vietnam', NULL, 'Haiphong', NULL, 'HP', '海防', NULL, '越南', 'VNM');
INSERT INTO `region_city` VALUES (8747, 'Vietnam', NULL, 'Hanoi', NULL, 'HI', '河內', NULL, '越南', 'VNM');
INSERT INTO `region_city` VALUES (8748, 'Vietnam', NULL, 'Ho Chi Minh City', NULL, 'HC', '胡志明市', NULL, '越南', 'VNM');
INSERT INTO `region_city` VALUES (8749, 'Zambia', NULL, 'Northern', NULL, 'NO', '北方', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8750, 'Zambia', NULL, 'Eastern', NULL, 'EA', '東方', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8751, 'Zambia', NULL, 'Luapula', NULL, 'LP', '盧阿普拉', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8752, 'Zambia', NULL, 'Lusaka', NULL, 'LK', '盧薩卡', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8753, 'Zambia', NULL, 'Southern', NULL, 'SO', '南方', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8754, 'Zambia', NULL, 'Copperbelt', NULL, 'CB', '銅帶', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8755, 'Zambia', NULL, 'North-Western', NULL, 'NW', '西北', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8756, 'Zambia', NULL, 'Western', NULL, 'WE', '西方', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8757, 'Zambia', NULL, 'Central', NULL, 'CE', '中央', NULL, '贊比亞', 'ZMB');
INSERT INTO `region_city` VALUES (8758, 'Chile', NULL, 'Region de la Araucania', NULL, 'AR', '阿勞卡尼亞大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8759, 'Chile', NULL, 'Region de Atacama', NULL, 'AT', '阿塔卡馬大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8760, 'Chile', NULL, 'Region de Antofagasta', NULL, 'AN', '安托法加斯塔大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8761, 'Chile', NULL, 'Region del Biobio', NULL, 'BI', '比奧比奧大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8762, 'Chile', NULL, 'Libertador', NULL, 'LI', '復活節島', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8763, 'Chile', NULL, 'Region de los Lagos', NULL, 'LL', '湖大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8764, 'Chile', NULL, 'Region de Coquimbo', NULL, 'CO', '科金博大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8765, 'Chile', NULL, 'Region del Maule', NULL, 'ML', '馬烏萊大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8766, 'Chile', NULL, 'Magallanes y Antartica Chilena', NULL, 'MA', '麥哲倫-智利南極大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8767, 'Chile', NULL, 'Metropolitana de Santiago', NULL, 'RM', '聖地亞哥', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8768, 'Chile', NULL, 'Region de Tarapaca', NULL, 'TA', '塔拉帕卡大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8769, 'Chile', NULL, 'Region de Valparaiso', NULL, 'VS', '瓦爾帕萊索大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8770, 'Chile', NULL, 'Region de Alsen del General Carlos Ibanez del', NULL, 'AI', '伊瓦涅斯將軍的艾森大區', NULL, '智利', 'CHL');
INSERT INTO `region_city` VALUES (8771, 'Central African Republic', NULL, 'Bamingui-Bangoran', NULL, 'BB', '巴明吉-班戈蘭', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8772, 'Central African Republic', NULL, 'Bangui', NULL, 'BGF', '班吉直轄市', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8773, 'Central African Republic', NULL, 'Bimbo', NULL, 'BI', '賓博', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8774, 'Central African Republic', NULL, 'Kemo', NULL, 'KG', '凱莫', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8775, 'Central African Republic', NULL, 'Lobaye', NULL, 'LB', '洛巴伊', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8776, 'Central African Republic', NULL, 'Mambere-Kadei', NULL, 'HS', '曼貝雷-卡代', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8777, 'Central African Republic', NULL, 'Mbomou', NULL, 'MB', '姆博穆', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8778, 'Central African Republic', NULL, 'Nana-Gribizi', NULL, 'KB', '納納-格里比齊', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8779, 'Central African Republic', NULL, 'Nana-Mambere', NULL, 'NM', '納納-曼貝雷', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8780, 'Central African Republic', NULL, 'Sangha-Mbaere', NULL, 'SE', '桑加-姆巴埃雷', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8781, 'Central African Republic', NULL, 'Haute-Kotto', NULL, 'HK', '上科托', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8782, 'Central African Republic', NULL, 'Haut-Mbomou', NULL, 'HM', '上姆博穆', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8783, 'Central African Republic', NULL, 'Ouaka', NULL, 'UK', '瓦卡', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8784, 'Central African Republic', NULL, 'Vakaga', NULL, 'VK', '瓦卡加', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8785, 'Central African Republic', NULL, 'Ouham', NULL, 'AC', '瓦姆', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8786, 'Central African Republic', NULL, 'Ouham-Pende', NULL, 'OP', '瓦姆-彭代', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8787, 'Central African Republic', NULL, 'Ombella-Mpoko', NULL, 'MP', '翁貝拉-姆波科', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (8788, 'Central African Republic', NULL, 'Basse-Kotto', NULL, 'BK', '下科托', NULL, '中非共和國', 'CAF');
INSERT INTO `region_city` VALUES (10238, 'China', 'Beijing', 'Dongcheng', '11', '1', '東城', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10239, 'China', 'Beijing', 'Xicheng', '11', '2', '西城', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10240, 'China', 'Beijing', 'Chaoyang', '11', '5', '朝陽', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10241, 'China', 'Beijing', 'Fengtai', '11', '6', '豐臺', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10242, 'China', 'Beijing', 'Shijingshan', '11', '7', '石景山', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10243, 'China', 'Beijing', 'Haidian', '11', '8', '海淀', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10244, 'China', 'Beijing', 'Mentougou', '11', '9', '門頭溝', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10245, 'China', 'Beijing', 'Fangshan', '11', '11', '房山', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10246, 'China', 'Beijing', 'Tongzhou', '11', '12', '通州', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10247, 'China', 'Beijing', 'Shunyi', '11', '13', '順義', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10248, 'China', 'Beijing', 'Changping', '11', '21', '昌平', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10249, 'China', 'Beijing', 'Daxing', '11', '24', '大興', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10250, 'China', 'Beijing', 'Pinggu', '11', '26', '平谷', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10251, 'China', 'Beijing', 'Huairou', '11', '27', '懷柔', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10252, 'China', 'Beijing', 'Miyun', '11', '28', '密雲', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10253, 'China', 'Beijing', 'Yanqing', '11', '29', '延慶', '北京', '中國', '1');
INSERT INTO `region_city` VALUES (10254, 'China', 'Tianjin', 'Heping', '12', '1', '和平', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10255, 'China', 'Tianjin', 'Hedong', '12', '2', '河東', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10256, 'China', 'Tianjin', 'Hexi', '12', '3', '河西', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10257, 'China', 'Tianjin', 'Nankai', '12', '4', '南開', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10258, 'China', 'Tianjin', 'Hebei', '12', '5', '河北', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10259, 'China', 'Tianjin', 'Hongqiao', '12', '6', '紅橋', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10260, 'China', 'Tianjin', 'Binghaixinqu', '12', '26', '濱海新區', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10261, 'China', 'Tianjin', 'Dongli', '12', '10', '東麗', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10262, 'China', 'Tianjin', 'Xiqing', '12', '11', '西青', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10263, 'China', 'Tianjin', 'Jinnan', '12', '12', '津南', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10264, 'China', 'Tianjin', 'Beichen', '12', '13', '北辰', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10265, 'China', 'Tianjin', 'Ninghe', '12', '21', '寧河', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10266, 'China', 'Tianjin', 'Wuqing', '12', '22', '武清', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10267, 'China', 'Tianjin', 'Jinghai', '12', '23', '靜海', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10268, 'China', 'Tianjin', 'Baodi', '12', '24', '寶坻', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10269, 'China', 'Tianjin', 'Jixian', '12', '25', '薊縣', '天津', '中國', '1');
INSERT INTO `region_city` VALUES (10270, 'China', 'Hebei', 'Shijiazhuang', '13', '1', '石家莊', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10271, 'China', 'Hebei', 'Tangshan', '13', '2', '唐山', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10272, 'China', 'Hebei', 'Qinhuangdao', '13', '3', '秦皇島', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10273, 'China', 'Hebei', 'Handan', '13', '4', '邯鄲', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10274, 'China', 'Hebei', 'Xingtai', '13', '5', '邢臺', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10275, 'China', 'Hebei', 'Baoding', '13', '6', '保定', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10276, 'China', 'Hebei', 'Zhangjiakou', '13', '7', '張家口', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10277, 'China', 'Hebei', 'Chengde', '13', '8', '承德', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10278, 'China', 'Hebei', 'Cangzhou', '13', '9', '滄州', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10279, 'China', 'Hebei', 'Langfang', '13', '10', '廊坊', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10280, 'China', 'Hebei', 'Hengshui', '13', '11', '衡水', '河北', '中國', '1');
INSERT INTO `region_city` VALUES (10281, 'China', 'Shanxi', 'Taiyuan', '14', '1', '太原', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10282, 'China', 'Shanxi', 'Datong', '14', '2', '大同', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10283, 'China', 'Shanxi', 'Yangquan', '14', '3', '陽泉', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10284, 'China', 'Shanxi', 'Changzhi', '14', '4', '長治', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10285, 'China', 'Shanxi', 'Jincheng', '14', '5', '晉城', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10286, 'China', 'Shanxi', 'Shuozhou', '14', '6', '朔州', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10287, 'China', 'Shanxi', 'Jinzhong', '14', '7', '晉中', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10288, 'China', 'Shanxi', 'Yuncheng', '14', '8', '運城', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10289, 'China', 'Shanxi', 'Xinzhou', '14', '9', '忻州', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10290, 'China', 'Shanxi', 'Linfen', '14', '10', '臨汾', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10291, 'China', 'Shanxi', 'luliang', '14', '11', '呂梁', '山西', '中國', '1');
INSERT INTO `region_city` VALUES (10292, 'China', 'Inner Mongolia', 'Hohhot', '15', '1', '呼和浩特', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10293, 'China', 'Inner Mongolia', 'Baotou', '15', '2', '包頭', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10294, 'China', 'Inner Mongolia', 'Wuhai', '15', '3', '烏海', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10295, 'China', 'Inner Mongolia', 'Chifeng', '15', '4', '赤峰', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10296, 'China', 'Inner Mongolia', 'Tongliao', '15', '5', '通遼', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10297, 'China', 'Inner Mongolia', 'Ordos', '15', '6', '鄂爾多斯', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10298, 'China', 'Inner Mongolia', 'Hulun Buir', '15', '7', '呼倫貝爾', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10299, 'China', 'Inner Mongolia', 'Bayannur', '15', '8', '巴彥淖爾', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10300, 'China', 'Inner Mongolia', 'Ulan Qab', '15', '9', '烏蘭察布', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10301, 'China', 'Inner Mongolia', 'Xing\'an', '15', '22', '興安', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10302, 'China', 'Inner Mongolia', 'Xilin Gol', '15', '25', '錫林郭勒', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10303, 'China', 'Inner Mongolia', 'Alxa', '15', '29', '阿拉善', '內蒙古', '中國', '1');
INSERT INTO `region_city` VALUES (10304, 'China', 'Liaoning', 'Shenyang', '21', '1', '瀋陽', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10305, 'China', 'Liaoning', 'Dalian', '21', '2', '大連', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10306, 'China', 'Liaoning', 'Anshan', '21', '3', '鞍山', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10307, 'China', 'Liaoning', 'Fushun', '21', '4', '撫順', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10308, 'China', 'Liaoning', 'Benxi', '21', '5', '本溪', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10309, 'China', 'Liaoning', 'Dandong', '21', '6', '丹東', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10310, 'China', 'Liaoning', 'Jinzhou', '21', '7', '錦州', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10311, 'China', 'Liaoning', 'Yingkou', '21', '8', '營口', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10312, 'China', 'Liaoning', 'Fuxin', '21', '9', '阜新', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10313, 'China', 'Liaoning', 'Liaoyang', '21', '10', '遼陽', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10314, 'China', 'Liaoning', 'Panjin', '21', '11', '盤錦', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10315, 'China', 'Liaoning', 'Tieling', '21', '12', '鐵嶺', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10316, 'China', 'Liaoning', 'Chaoyang', '21', '13', '朝陽', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10317, 'China', 'Liaoning', 'Huludao', '21', '14', '葫蘆島', '遼寧', '中國', '1');
INSERT INTO `region_city` VALUES (10318, 'China', 'Jilin', 'Changchun', '22', '1', '長春', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10319, 'China', 'Jilin', 'Jilin', '22', '2', '吉林', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10320, 'China', 'Jilin', 'Siping', '22', '3', '四平', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10321, 'China', 'Jilin', 'Liaoyuan', '22', '4', '遼源', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10322, 'China', 'Jilin', 'Tonghua', '22', '5', '通化', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10323, 'China', 'Jilin', 'Baishan', '22', '6', '白山', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10324, 'China', 'Jilin', 'Songyuan', '22', '7', '松原', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10325, 'China', 'Jilin', 'Baicheng', '22', '8', '白城', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10326, 'China', 'Jilin', 'Yanbian Korean Autonomous Prefecture', '22', '24', '延邊', '吉林', '中國', '1');
INSERT INTO `region_city` VALUES (10327, 'China', 'Heilongjiang', 'Harbin', '23', '1', '哈爾濱', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10328, 'China', 'Heilongjiang', 'Qiqihar', '23', '2', '齊齊哈爾', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10329, 'China', 'Heilongjiang', 'Jixi', '23', '3', '雞西', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10330, 'China', 'Heilongjiang', 'Hegang', '23', '4', '鶴崗', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10331, 'China', 'Heilongjiang', 'Shuangyashan', '23', '5', '雙鴨山', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10332, 'China', 'Heilongjiang', 'Daqing', '23', '6', '大慶', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10333, 'China', 'Heilongjiang', 'Yichun', '23', '7', '伊春', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10334, 'China', 'Heilongjiang', 'Jiamusi', '23', '8', '佳木斯', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10335, 'China', 'Heilongjiang', 'Qitaihe', '23', '9', '七臺河', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10336, 'China', 'Heilongjiang', 'Mudanjiang', '23', '10', '牡丹江', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10337, 'China', 'Heilongjiang', 'Heihe', '23', '11', '黑河', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10338, 'China', 'Heilongjiang', 'Suihua', '23', '12', '綏化', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10339, 'China', 'Heilongjiang', 'Da Hinggan Ling', '23', '27', '大興安嶺', '黑龍江', '中國', '1');
INSERT INTO `region_city` VALUES (10340, 'China', 'Shanghai', 'Huangpu', '31', '1', '黃浦', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10341, 'China', 'Shanghai', 'Luwan', '31', '3', '盧灣', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10342, 'China', 'Shanghai', 'Xuhui', '31', '4', '徐匯', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10343, 'China', 'Shanghai', 'Changning', '31', '5', '長寧', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10344, 'China', 'Shanghai', 'Jing\'an', '31', '6', '靜安', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10345, 'China', 'Shanghai', 'Putuo', '31', '7', '普陀', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10346, 'China', 'Shanghai', 'Zhabei', '31', '8', '閘北', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10347, 'China', 'Shanghai', 'Hongkou', '31', '9', '虹口', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10348, 'China', 'Shanghai', 'Yangpu', '31', '11', '楊浦', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10349, 'China', 'Shanghai', 'Minhang', '31', '12', '閔行', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10350, 'China', 'Shanghai', 'Baoshan', '31', '13', '寶山', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10351, 'China', 'Shanghai', 'Jiading', '31', '14', '嘉定', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10352, 'China', 'Shanghai', 'Pudong New Area', '31', '15', '浦東新區', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10353, 'China', 'Shanghai', 'Jinshan', '31', '16', '金山', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10354, 'China', 'Shanghai', 'Songjiang', '31', '17', '松江', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10355, 'China', 'Shanghai', 'Fengxian', '31', '26', '奉賢', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10356, 'China', 'Shanghai', 'Qingpu', '31', '29', '青浦', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10357, 'China', 'Shanghai', 'Chongming', '31', '30', '崇明', '上海', '中國', '1');
INSERT INTO `region_city` VALUES (10358, 'China', 'Jiangsu', 'Nanjing', '32', '1', '南京', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10359, 'China', 'Jiangsu', 'Wuxi', '32', '2', '無錫', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10360, 'China', 'Jiangsu', 'Xuzhou', '32', '3', '徐州', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10361, 'China', 'Jiangsu', 'Changzhou', '32', '4', '常州', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10362, 'China', 'Jiangsu', 'Suzhou', '32', '5', '蘇州', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10363, 'China', 'Jiangsu', 'Nantong', '32', '6', '南通', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10364, 'China', 'Jiangsu', 'Lianyungang', '32', '7', '連雲港', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10365, 'China', 'Jiangsu', 'Huai\'an', '32', '8', '淮安', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10366, 'China', 'Jiangsu', 'Yancheng', '32', '9', '鹽城', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10367, 'China', 'Jiangsu', 'Yangzhou', '32', '10', '揚州', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10368, 'China', 'Jiangsu', 'Zhenjiang', '32', '11', '鎮江', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10369, 'China', 'Jiangsu', 'Taizhou', '32', '12', '泰州', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10370, 'China', 'Jiangsu', 'Suqian', '32', '13', '宿遷', '江蘇', '中國', '1');
INSERT INTO `region_city` VALUES (10371, 'China', 'Zhejiang', 'Hangzhou', '33', '1', '杭州', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10372, 'China', 'Zhejiang', 'Ningbo', '33', '2', '寧波', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10373, 'China', 'Zhejiang', 'Wenzhou', '33', '3', '溫州', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10374, 'China', 'Zhejiang', 'Jiaxing', '33', '4', '嘉興', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10375, 'China', 'Zhejiang', 'Huzhou', '33', '5', '湖州', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10376, 'China', 'Zhejiang', 'Shaoxing', '33', '6', '紹興', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10377, 'China', 'Zhejiang', 'Jinhua', '33', '7', '金華', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10378, 'China', 'Zhejiang', 'Quzhou', '33', '8', '衢州', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10379, 'China', 'Zhejiang', 'Zhoushan', '33', '9', '舟山', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10380, 'China', 'Zhejiang', 'Taizhou', '33', '10', '臺州', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10381, 'China', 'Zhejiang', 'Lishui', '33', '11', '麗水', '浙江', '中國', '1');
INSERT INTO `region_city` VALUES (10382, 'China', 'Anhui', 'Hefei', '34', '1', '合肥', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10383, 'China', 'Anhui', 'Wuhu', '34', '2', '蕪湖', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10384, 'China', 'Anhui', 'Bengbu', '34', '3', '蚌埠', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10385, 'China', 'Anhui', 'Huainan', '34', '4', '淮南', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10386, 'China', 'Anhui', 'Ma\'anshan', '34', '5', '馬鞍山', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10387, 'China', 'Anhui', 'Huaibei', '34', '6', '淮北', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10388, 'China', 'Anhui', 'Tongling', '34', '7', '銅陵', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10389, 'China', 'Anhui', 'Anqing', '34', '8', '安慶', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10390, 'China', 'Anhui', 'Huangshan', '34', '10', '黃山', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10391, 'China', 'Anhui', 'Chuzhou', '34', '11', '滁州', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10392, 'China', 'Anhui', 'Fuyang', '34', '12', '阜陽', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10393, 'China', 'Anhui', 'Suzhou', '34', '13', '宿州', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10394, 'China', 'Anhui', 'Lu\'an', '34', '15', '六安', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10395, 'China', 'Anhui', 'Bozhou', '34', '16', '亳州', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10396, 'China', 'Anhui', 'Chizhou', '34', '17', '池州', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10397, 'China', 'Anhui', 'Xuancheng', '34', '18', '宣城', '安徽', '中國', '1');
INSERT INTO `region_city` VALUES (10398, 'China', 'Fujian', 'Fuzhou', '35', '1', '福州', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10399, 'China', 'Fujian', 'Xiamen', '35', '2', '廈門', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10400, 'China', 'Fujian', 'Putian', '35', '3', '莆田', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10401, 'China', 'Fujian', 'Sanming', '35', '4', '三明', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10402, 'China', 'Fujian', 'Quanzhou', '35', '5', '泉州', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10403, 'China', 'Fujian', 'Zhangzhou', '35', '6', '漳州', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10404, 'China', 'Fujian', 'Nanping', '35', '7', '南平', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10405, 'China', 'Fujian', 'Longyan', '35', '8', '龍巖', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10406, 'China', 'Fujian', 'Ningde', '35', '9', '寧德', '福建', '中國', '1');
INSERT INTO `region_city` VALUES (10407, 'China', 'Jiangxi', 'Nanchang', '36', '1', '南昌', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10408, 'China', 'Jiangxi', 'Jingdezhen', '36', '2', '景德鎮', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10409, 'China', 'Jiangxi', 'Pingxiang', '36', '3', '萍鄉', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10410, 'China', 'Jiangxi', 'Jiujiang', '36', '4', '九江', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10411, 'China', 'Jiangxi', 'Xinyu', '36', '5', '新餘', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10412, 'China', 'Jiangxi', 'Yingtan', '36', '6', '鷹潭', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10413, 'China', 'Jiangxi', 'Ganzhou', '36', '7', '贛州', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10414, 'China', 'Jiangxi', 'Ji\'an', '36', '8', '吉安', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10415, 'China', 'Jiangxi', 'Yichun', '36', '9', '宜春', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10416, 'China', 'Jiangxi', 'Fuzhou', '36', '10', '撫州', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10417, 'China', 'Jiangxi', 'Shangrao', '36', '11', '上饒', '江西', '中國', '1');
INSERT INTO `region_city` VALUES (10418, 'China', 'Shandong', 'Jinan', '37', '1', '濟南', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10419, 'China', 'Shandong', 'Qingdao', '37', '2', '青島', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10420, 'China', 'Shandong', 'Zibo', '37', '3', '淄博', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10421, 'China', 'Shandong', 'Zaozhuang', '37', '4', '棗莊', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10422, 'China', 'Shandong', 'Dongying', '37', '5', '東營', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10423, 'China', 'Shandong', 'Yantai', '37', '6', '煙臺', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10424, 'China', 'Shandong', 'Weifang', '37', '7', '濰坊', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10425, 'China', 'Shandong', 'Jining', '37', '8', '濟寧', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10426, 'China', 'Shandong', 'Tai\'an', '37', '9', '泰安', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10427, 'China', 'Shandong', 'Weihai', '37', '10', '威海', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10428, 'China', 'Shandong', 'Rizhao', '37', '11', '日照', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10429, 'China', 'Shandong', 'Laiwu', '37', '12', '萊蕪', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10430, 'China', 'Shandong', 'Linyi', '37', '13', '臨沂', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10431, 'China', 'Shandong', 'Dezhou', '37', '14', '德州', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10432, 'China', 'Shandong', 'Liaocheng', '37', '15', '聊城', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10433, 'China', 'Shandong', 'Binzhou', '37', '16', '濱州', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10434, 'China', 'Shandong', 'Heze', '37', '17', '菏澤', '山東', '中國', '1');
INSERT INTO `region_city` VALUES (10435, 'China', 'Henan', 'Zhengzhou', '41', '1', '鄭州', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10436, 'China', 'Henan', 'Kaifeng', '41', '2', '開封', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10437, 'China', 'Henan', 'Luoyang', '41', '3', '洛陽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10438, 'China', 'Henan', 'Pingdingshan', '41', '4', '平頂山', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10439, 'China', 'Henan', 'Anyang', '41', '5', '安陽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10440, 'China', 'Henan', 'Hebi', '41', '6', '鶴壁', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10441, 'China', 'Henan', 'Xinxiang', '41', '7', '新鄉', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10442, 'China', 'Henan', 'Jiaozuo', '41', '8', '焦作', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10443, 'China', 'Henan', 'Puyang', '41', '9', '濮陽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10444, 'China', 'Henan', 'Xuchang', '41', '10', '許昌', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10445, 'China', 'Henan', 'Luohe', '41', '11', '漯河', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10446, 'China', 'Henan', 'Sanmenxia', '41', '12', '三門峽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10447, 'China', 'Henan', 'Nanyang', '41', '13', '南陽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10448, 'China', 'Henan', 'Shangqiu', '41', '14', '商丘', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10449, 'China', 'Henan', 'Xinyang', '41', '15', '信陽', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10450, 'China', 'Henan', 'Zhoukou', '41', '16', '周口', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10451, 'China', 'Henan', 'Zhumadian', '41', '17', '駐馬店', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10452, 'China', 'Henan', 'Jiyuan', '41', '18', '濟源', '河南', '中國', '1');
INSERT INTO `region_city` VALUES (10453, 'China', 'Hubei', 'Wuhan', '42', '1', '武漢', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10454, 'China', 'Hubei', 'Huangshi', '42', '2', '黃石', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10455, 'China', 'Hubei', 'Shiyan', '42', '3', '十堰', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10456, 'China', 'Hubei', 'Yichang', '42', '5', '宜昌', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10457, 'China', 'Hubei', 'Xiangyang', '42', '6', '襄陽', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10458, 'China', 'Hubei', 'Ezhou', '42', '7', '鄂州', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10459, 'China', 'Hubei', 'Jingmen', '42', '8', '荊門', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10460, 'China', 'Hubei', 'Xiaogan', '42', '9', '孝感', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10461, 'China', 'Hubei', 'Jingzhou', '42', '10', '荊州', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10462, 'China', 'Hubei', 'Huanggang', '42', '11', '黃岡', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10463, 'China', 'Hubei', 'Xianning', '42', '12', '咸寧', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10464, 'China', 'Hubei', 'Suizhou', '42', '13', '隨州', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10465, 'China', 'Hubei', 'Enshi Tujia-Miao Autonomous Prefecture', '42', '28', '恩施', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10466, 'China', 'Hubei', 'Xiantao', '42', '94', '仙桃', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10467, 'China', 'Hubei', 'Qianjiang', '42', '95', '潛江', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10468, 'China', 'Hubei', 'Tianmen', '42', '96', '天門', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10469, 'China', 'Hubei', 'Shennongjia', '42', 'A21', '神農架', '湖北', '中國', '1');
INSERT INTO `region_city` VALUES (10470, 'China', 'Hunan', 'Changsha', '43', '1', '長沙', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10471, 'China', 'Hunan', 'Zhuzhou', '43', '2', '株洲', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10472, 'China', 'Hunan', 'Xiangtan', '43', '3', '湘潭', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10473, 'China', 'Hunan', 'Hengyang', '43', '4', '衡陽', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10474, 'China', 'Hunan', 'Shaoyang', '43', '5', '邵陽', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10475, 'China', 'Hunan', 'Yueyang', '43', '6', '岳陽', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10476, 'China', 'Hunan', 'Changde', '43', '7', '常德', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10477, 'China', 'Hunan', 'Zhangjiajie', '43', '8', '張家界', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10478, 'China', 'Hunan', 'Yiyang', '43', '9', '益陽', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10479, 'China', 'Hunan', 'Chenzhou', '43', '10', '郴州', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10480, 'China', 'Hunan', 'Yongzhou', '43', '11', '永州', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10481, 'China', 'Hunan', 'Huaihua', '43', '12', '懷化', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10482, 'China', 'Hunan', 'Loudi', '43', '13', '婁底', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10483, 'China', 'Hunan', 'Xiangxi Tujia-Miao Autonomous Prefecture', '43', '31', '湘西', '湖南', '中國', '1');
INSERT INTO `region_city` VALUES (10484, 'China', 'Guangdong', 'Guangzhou', '44', '1', '廣州', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10485, 'China', 'Guangdong', 'Shaoguan', '44', '2', '韶關', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10486, 'China', 'Guangdong', 'Shenzhen', '44', '3', '深圳', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10487, 'China', 'Guangdong', 'Zhuhai', '44', '4', '珠海', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10488, 'China', 'Guangdong', 'Shantou', '44', '5', '汕頭', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10489, 'China', 'Guangdong', 'Foshan', '44', '6', '佛山', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10490, 'China', 'Guangdong', 'Jiangmen', '44', '7', '江門', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10491, 'China', 'Guangdong', 'Zhanjiang', '44', '8', '湛江', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10492, 'China', 'Guangdong', 'Maoming', '44', '9', '茂名', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10493, 'China', 'Guangdong', 'Zhaoqing', '44', '12', '肇慶', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10494, 'China', 'Guangdong', 'Huizhou', '44', '13', '惠州', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10495, 'China', 'Guangdong', 'Meizhou', '44', '14', '梅州', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10496, 'China', 'Guangdong', 'Shanwei', '44', '15', '汕尾', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10497, 'China', 'Guangdong', 'Heyuan', '44', '16', '河源', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10498, 'China', 'Guangdong', 'Yangjiang', '44', '17', '陽江', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10499, 'China', 'Guangdong', 'Qingyuan', '44', '18', '清遠', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10500, 'China', 'Guangdong', 'Dongguan', '44', '19', '東莞', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10501, 'China', 'Guangdong', 'Zhongshan', '44', '20', '中山', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10502, 'China', 'Guangdong', 'Chaozhou', '44', '51', '潮州', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10503, 'China', 'Guangdong', 'Jieyang', '44', '52', '揭陽', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10504, 'China', 'Guangdong', 'Yunfu', '44', '53', '雲浮', '廣東', '中國', '1');
INSERT INTO `region_city` VALUES (10505, 'China', 'Guangxi', 'Nanning', '45', '1', '南寧', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10506, 'China', 'Guangxi', 'Liuzhou', '45', '2', '柳州', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10507, 'China', 'Guangxi', 'Guilin', '45', '3', '桂林', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10508, 'China', 'Guangxi', 'Wuzhou', '45', '4', '梧州', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10509, 'China', 'Guangxi', 'Beihai', '45', '5', '北海', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10510, 'China', 'Guangxi', 'Fangchenggang', '45', '6', '防城港', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10511, 'China', 'Guangxi', 'Qinzhou', '45', '7', '欽州', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10512, 'China', 'Guangxi', 'Guigang', '45', '8', '貴港', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10513, 'China', 'Guangxi', 'Yulin', '45', '9', '玉林', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10514, 'China', 'Guangxi', 'Baise', '45', '10', '百色', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10515, 'China', 'Guangxi', 'Hezhou', '45', '11', '賀州', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10516, 'China', 'Guangxi', 'Hechi', '45', '12', '河池', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10517, 'China', 'Guangxi', 'Laibin', '45', '13', '來賓', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10518, 'China', 'Guangxi', 'Chongzuo', '45', '14', '崇左', '廣西', '中國', '1');
INSERT INTO `region_city` VALUES (10519, 'China', 'Hainan', 'Haikou', '46', '1', '海口', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10520, 'China', 'Hainan', 'Sanya', '46', '2', '三亞', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10521, 'China', 'Hainan', 'Shansha', '46', '3', '三沙', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10522, 'China', 'Hainan', 'Wuzhishan', '46', '91', '五指山', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10523, 'China', 'Hainan', 'Qionghai', '46', '92', '瓊海', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10524, 'China', 'Hainan', 'Danzhou', '46', '93', '儋州', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10525, 'China', 'Hainan', 'Wenchang', '46', '95', '文昌', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10526, 'China', 'Hainan', 'Wanning', '46', '96', '萬寧', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10527, 'China', 'Hainan', 'Dongfang', '46', '97', '東方', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10528, 'China', 'Hainan', 'Ding\'an', '46', 'A25', '定安', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10529, 'China', 'Hainan', 'Tunchang', '46', 'A26', '屯昌', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10530, 'China', 'Hainan', 'Cengmai', '46', 'A27', '澄邁', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10531, 'China', 'Hainan', 'Lingao', '46', 'A28', '臨高', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10532, 'China', 'Hainan', 'Baisha Li Autonomous County', '46', 'A30', '白沙', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10533, 'China', 'Hainan', 'Jiang Li Autonomous County', '46', 'A31', '昌江', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10534, 'China', 'Hainan', 'Ledong Li Autonomous County', '46', 'A33', '樂東', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10535, 'China', 'Hainan', 'Lingshui Li Autonomous County', '46', 'A34', '陵水', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10536, 'China', 'Hainan', 'Baoting Li-Miao Autonomous County', '46', 'A35', '保亭', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10537, 'China', 'Hainan', 'Qiongzhong Li-Miao Autonomous County', '46', 'A36', '瓊中', '海南', '中國', '1');
INSERT INTO `region_city` VALUES (10538, 'China', 'Chongqing', 'Wanzhou', '50', '1', '萬州', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10539, 'China', 'Chongqing', 'Fuling', '50', '2', '涪陵', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10540, 'China', 'Chongqing', 'Yuzhong', '50', '3', '渝中', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10541, 'China', 'Chongqing', 'Dadukou', '50', '4', '大渡口', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10542, 'China', 'Chongqing', 'Jiangbei', '50', '5', '江北', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10543, 'China', 'Chongqing', 'Shapingba', '50', '6', '沙坪壩', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10544, 'China', 'Chongqing', 'Jiulongpo', '50', '7', '九龍坡', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10545, 'China', 'Chongqing', 'Nan\'an', '50', '8', '南岸', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10546, 'China', 'Chongqing', 'Beibei', '50', '9', '北碚', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10547, 'China', 'Chongqing', 'Kaixian', '50', '85', '兩江新區', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10548, 'China', 'Chongqing', 'Wansheng', '50', '10', '萬盛', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10549, 'China', 'Chongqing', 'Shuangqiao', '50', '11', '雙橋', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10550, 'China', 'Chongqing', 'Yubei', '50', '12', '渝北', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10551, 'China', 'Chongqing', 'Ba\'nan', '50', '13', '巴南', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10552, 'China', 'Chongqing', 'Changshou', '50', '21', '長壽', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10553, 'China', 'Chongqing', 'Qijiang', '50', '22', '綦江', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10554, 'China', 'Chongqing', 'Tongnan', '50', '23', '潼南', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10555, 'China', 'Chongqing', 'Tongliang', '50', '24', '銅梁', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10556, 'China', 'Chongqing', 'Dazu', '50', '25', '大足', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10557, 'China', 'Chongqing', 'Rongchang', '50', '26', '榮昌', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10558, 'China', 'Chongqing', 'Bishan', '50', '27', '璧山', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10559, 'China', 'Chongqing', 'Liangping', '50', '28', '梁平', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10560, 'China', 'Chongqing', 'Chengkou', '50', '29', '城口', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10561, 'China', 'Chongqing', 'Fengdu', '50', '30', '豐都', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10562, 'China', 'Chongqing', 'Dianjiang', '50', '31', '墊江', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10563, 'China', 'Chongqing', 'Wulong', '50', '32', '武隆', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10564, 'China', 'Chongqing', 'Zhongxian', '50', '33', '忠縣', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10565, 'China', 'Chongqing', 'Kaixian', '50', '34', '開縣', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10566, 'China', 'Chongqing', 'Yunyang', '50', '35', '雲陽', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10567, 'China', 'Chongqing', 'Fengjie', '50', '36', '奉節', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10568, 'China', 'Chongqing', 'Wushan', '50', '37', '巫山', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10569, 'China', 'Chongqing', 'Wuxi', '50', '38', '巫溪', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10570, 'China', 'Chongqing', 'Qianjiang', '50', '39', '黔江', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10571, 'China', 'Chongqing', 'Shizhu Tujia Autonomous Country', '50', '40', '石柱', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10572, 'China', 'Chongqing', 'Xiushan Tujia-Miao Autonomous Country', '50', '41', '秀山', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10573, 'China', 'Chongqing', 'Youyang Tujia-Miao Autonomous Country', '50', '42', '酉陽', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10574, 'China', 'Chongqing', 'Pengshui Miao-Tujia Autonomous Country', '50', '43', '彭水', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10575, 'China', 'Chongqing', 'Jiangjin', '50', '81', '江津', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10576, 'China', 'Chongqing', 'Hechuan', '50', '82', '合川', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10577, 'China', 'Chongqing', 'Yongchuan', '50', '83', '永川', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10578, 'China', 'Chongqing', 'Liangjiangxinqu', '50', '84', '南川', '重慶', '中國', '1');
INSERT INTO `region_city` VALUES (10579, 'China', 'Sichuan', 'Chengdu', '51', '1', '成都', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10580, 'China', 'Sichuan', 'Zigong', '51', '3', '自貢', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10581, 'China', 'Sichuan', 'Panzhihua', '51', '4', '攀枝花', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10582, 'China', 'Sichuan', 'Luzhou', '51', '5', '瀘州', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10583, 'China', 'Sichuan', 'Deyang', '51', '6', '德陽', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10584, 'China', 'Sichuan', 'Mianyang', '51', '7', '綿陽', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10585, 'China', 'Sichuan', 'Guangyuan', '51', '8', '廣元', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10586, 'China', 'Sichuan', 'Suining', '51', '9', '遂寧', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10587, 'China', 'Sichuan', 'Neijiang', '51', '10', '內江', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10588, 'China', 'Sichuan', 'Leshan', '51', '11', '樂山', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10589, 'China', 'Sichuan', 'Nanchong', '51', '13', '南充', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10590, 'China', 'Sichuan', 'Meishan', '51', '14', '眉山', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10591, 'China', 'Sichuan', 'Yibin', '51', '15', '宜賓', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10592, 'China', 'Sichuan', 'Guang\'an', '51', '16', '廣安', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10593, 'China', 'Sichuan', 'Dazhou', '51', '17', '達州', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10594, 'China', 'Sichuan', 'Ya\'an', '51', '18', '雅安', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10595, 'China', 'Sichuan', 'Bazhong', '51', '19', '巴中', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10596, 'China', 'Sichuan', 'Ziyang', '51', '20', '資陽', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10597, 'China', 'Sichuan', 'Aba Tibetan-Qiang Autonomous Prefecture', '51', '32', '阿壩', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10598, 'China', 'Sichuan', 'Garze Tibetan Autonomous Prefecture', '51', '33', '甘孜', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10599, 'China', 'Sichuan', 'Liangshan Yi Autonomous Prefecture', '51', '34', '涼山', '四川', '中國', '1');
INSERT INTO `region_city` VALUES (10600, 'China', 'Guizhou', 'Guiyang', '52', '1', '貴陽', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10601, 'China', 'Guizhou', 'Liupanshui', '52', '2', '六盤水', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10602, 'China', 'Guizhou', 'Zunyi', '52', '3', '遵義', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10603, 'China', 'Guizhou', 'Anshun', '52', '4', '安順', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10604, 'China', 'Guizhou', 'Tongren', '52', '22', '銅仁', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10605, 'China', 'Guizhou', 'Qianxinan Buyi-Miao Autonomous Prefecture', '52', '23', '黔西南', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10606, 'China', 'Guizhou', 'Bijie', '52', '24', '畢節', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10607, 'China', 'Guizhou', 'Qiandongnan Miao-Dong Autonomous Prefecture', '52', '26', '黔東南', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10608, 'China', 'Guizhou', 'Qiannan Buyi Autonomous Prefecture', '52', '27', '黔南', '貴州', '中國', '1');
INSERT INTO `region_city` VALUES (10609, 'China', 'Yunnan', 'Kunming', '53', '1', '昆明', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10610, 'China', 'Yunnan', 'Qujing', '53', '3', '曲靖', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10611, 'China', 'Yunnan', 'Yuxi', '53', '4', '玉溪', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10612, 'China', 'Yunnan', 'Baoshan', '53', '5', '保山', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10613, 'China', 'Yunnan', 'Zhaotong', '53', '6', '昭通', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10614, 'China', 'Yunnan', 'Lijiang', '53', '7', '麗江', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10615, 'China', 'Yunnan', 'Pu\'er', '53', '8', '普洱', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10616, 'China', 'Yunnan', 'Lincang', '53', '9', '臨滄', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10617, 'China', 'Yunnan', 'Chuxiong Yi Autonomous Prefecture', '53', '23', '楚雄', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10618, 'China', 'Yunnan', 'Honghe Hani-Yi Autonomous Prefecture', '53', '25', '紅河', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10619, 'China', 'Yunnan', 'Wenshan Zhuang-Miao Autonomous Prefecture', '53', '26', '文山', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10620, 'China', 'Yunnan', 'Xishuangbanna Dai Autonomous Prefecture', '53', '28', '西雙版納', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10621, 'China', 'Yunnan', 'Dali Bai Autonomous Prefecture', '53', '29', '大理', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10622, 'China', 'Yunnan', 'Dehong Dai-Jingpo Autonomous Prefecture', '53', '31', '德宏', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10623, 'China', 'Yunnan', 'Nujiang Lisu Autonomous Prefecture', '53', '33', '怒江', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10624, 'China', 'Yunnan', 'Diqing Tibetan Autonomous Prefecture', '53', '34', '迪慶', '雲南', '中國', '1');
INSERT INTO `region_city` VALUES (10625, 'China', 'Tibet', 'Lhasa', '54', '1', '拉薩', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10626, 'China', 'Tibet', 'Qamdo', '54', '21', '昌都', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10627, 'China', 'Tibet', 'Shannan', '54', '22', '山南', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10628, 'China', 'Tibet', 'Xigaze', '54', '23', '日喀則', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10629, 'China', 'Tibet', 'Nagqu', '54', '24', '那曲', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10630, 'China', 'Tibet', 'Ngari', '54', '25', '阿里', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10631, 'China', 'Tibet', 'Nyingchi', '54', '26', '林芝', '西藏', '中國', '1');
INSERT INTO `region_city` VALUES (10632, 'China', 'Shaanxi', 'Xi\'an', '61', '1', '西安', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10633, 'China', 'Shaanxi', 'Tongchuan', '61', '2', '銅川', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10634, 'China', 'Shaanxi', 'Baoji', '61', '3', '寶雞', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10635, 'China', 'Shaanxi', 'Xianyang', '61', '4', '咸陽', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10636, 'China', 'Shaanxi', 'Weinan', '61', '5', '渭南', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10637, 'China', 'Shaanxi', 'Yan\'an', '61', '6', '延安', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10638, 'China', 'Shaanxi', 'Hanzhong', '61', '7', '漢中', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10639, 'China', 'Shaanxi', 'Yulin', '61', '8', '榆林', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10640, 'China', 'Shaanxi', 'Ankang', '61', '9', '安康', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10641, 'China', 'Shaanxi', 'Shangluo', '61', '10', '商洛', '陜西', '中國', '1');
INSERT INTO `region_city` VALUES (10642, 'China', 'Gansu', 'Lanzhou', '62', '1', '蘭州市', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10643, 'China', 'Gansu', 'Jinchang', '62', '2', '嘉峪關', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10644, 'China', 'Gansu', 'Baiyin', '62', '3', '金昌', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10645, 'China', 'Gansu', 'Tianshui', '62', '4', '白銀', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10646, 'China', 'Gansu', 'Jiayuguan', '62', '5', '天水', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10647, 'China', 'Gansu', 'Wuwei', '62', '6', '武威', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10648, 'China', 'Gansu', 'Zhangye', '62', '7', '張掖', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10649, 'China', 'Gansu', 'Pingliang', '62', '8', '平涼', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10650, 'China', 'Gansu', 'Jiuquan', '62', '9', '酒泉', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10651, 'China', 'Gansu', 'Qingyang', '62', '10', '慶陽', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10652, 'China', 'Gansu', 'Dingxi', '62', '11', '定西', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10653, 'China', 'Gansu', 'Longnan', '62', '12', '隴南', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10654, 'China', 'Gansu', 'Linxia Hui Autonomous Prefecture', '62', '29', '臨夏', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10655, 'China', 'Gansu', 'Gannan Tibetan Autonomous Prefecture', '62', '30', '甘南', '甘肅', '中國', '1');
INSERT INTO `region_city` VALUES (10656, 'China', 'Qinghai', 'Xining', '63', '1', '西寧', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10657, 'China', 'Qinghai', 'Haidong', '63', '21', '海東', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10658, 'China', 'Qinghai', 'Haibei Tibetan Autonomous Prefecture', '63', '22', '海北', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10659, 'China', 'Qinghai', 'Huangnan Tibetan Autonomous Prefecture', '63', '23', '黃南', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10660, 'China', 'Qinghai', 'Hainan Tibetan Autonomous Prefecture', '63', '25', '海南', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10661, 'China', 'Qinghai', 'Guoluo Tibetan Autonomous Prefecture', '63', '26', '果洛', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10662, 'China', 'Qinghai', 'Yushu Tibetan Autonomous Prefecture', '63', '27', '玉樹', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10663, 'China', 'Qinghai', 'Haixi Mongol-Tibetan Autonomous Prefecture', '63', '28', '海西', '青海', '中國', '1');
INSERT INTO `region_city` VALUES (10664, 'China', 'Ningxia', 'Yinchuan', '64', '1', '銀川', '寧夏', '中國', '1');
INSERT INTO `region_city` VALUES (10665, 'China', 'Ningxia', 'Shizuishan', '64', '2', '石嘴山', '寧夏', '中國', '1');
INSERT INTO `region_city` VALUES (10666, 'China', 'Ningxia', 'Wuzhong', '64', '3', '吳忠', '寧夏', '中國', '1');
INSERT INTO `region_city` VALUES (10667, 'China', 'Ningxia', 'Guyuan', '64', '4', '固原', '寧夏', '中國', '1');
INSERT INTO `region_city` VALUES (10668, 'China', 'Ningxia', 'Zhongwei', '64', '5', '中衛', '寧夏', '中國', '1');
INSERT INTO `region_city` VALUES (10669, 'China', 'Xinjiang', 'Urumqi', '65', '1', '烏魯木齊', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10670, 'China', 'Xinjiang', 'Karamay', '65', '2', '克拉瑪依', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10671, 'China', 'Xinjiang', 'Turpan', '65', '21', '吐魯番', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10672, 'China', 'Xinjiang', 'Hami', '65', '22', '哈密', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10673, 'China', 'Xinjiang', 'Changji Hui Autonomous Prefecture', '65', '23', '昌吉', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10674, 'China', 'Xinjiang', 'Bortala Mongol Autonomous Prefecture', '65', '27', '博爾塔拉', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10675, 'China', 'Xinjiang', 'Bayingolin Mongol Autonomous Prefecture', '65', '28', '巴音郭楞', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10676, 'China', 'Xinjiang', 'Aksu', '65', '29', '阿克蘇', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10677, 'China', 'Xinjiang', 'Kizilsu Kirgiz Autonomous Prefecture', '65', '30', '克孜勒蘇', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10678, 'China', 'Xinjiang', 'Kashi', '65', '31', '喀什', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10679, 'China', 'Xinjiang', 'Hotan', '65', '32', '和田', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10680, 'China', 'Xinjiang', 'Ili Kazakh Autonomous Prefecture', '65', '40', '伊犁', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10681, 'China', 'Xinjiang', 'Tacheng', '65', '42', '塔城', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10682, 'China', 'Xinjiang', 'Altay', '65', '43', '阿勒泰', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10683, 'China', 'Xinjiang', 'Shihezi', '65', '91', '石河子', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10684, 'China', 'Xinjiang', 'Alar', '65', '92', '阿拉爾', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10685, 'China', 'Xinjiang', 'Tumsuk', '65', '93', '圖木舒克', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10686, 'China', 'Xinjiang', 'Wujiaqu', '65', '94', '五家渠', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10687, 'China', 'Xinjiang', 'Beitun', '65', '95', '北屯', '新疆', '中國', '1');
INSERT INTO `region_city` VALUES (10688, 'China', 'Taiwan', 'Taipei City', '71', '1', '臺北市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10689, 'China', 'Taiwan', 'Kaohsiung City', '71', '2', '高雄市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10690, 'China', 'Taiwan', 'Keelung City', '71', '3', '基隆市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10691, 'China', 'Taiwan', 'Taichung City', '71', '4', '臺中市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10692, 'China', 'Taiwan', 'Tainan City', '71', '5', '臺南市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10693, 'China', 'Taiwan', 'Hsinchu City', '71', '6', '新竹市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10694, 'China', 'Taiwan', 'Chiayi City', '71', '7', '嘉義市', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10695, 'China', 'Taiwan', 'Taipei County', '71', '8', '臺北縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10696, 'China', 'Taiwan', 'Ilan County', '71', '9', '宜蘭縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10697, 'China', 'Taiwan', 'Taoyuan County', '71', '10', '桃園縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10698, 'China', 'Taiwan', 'Hsinchu County', '71', '11', '新竹縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10699, 'China', 'Taiwan', 'Miaoli County', '71', '12', '苗栗縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10700, 'China', 'Taiwan', 'Taichung County', '71', '13', '臺中縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10701, 'China', 'Taiwan', 'Changhwa County', '71', '14', '彰化縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10702, 'China', 'Taiwan', 'Nantou County', '71', '15', '南投縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10703, 'China', 'Taiwan', 'Yunnlin County', '71', '16', '雲林縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10704, 'China', 'Taiwan', 'Chiayi County', '71', '17', '嘉義縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10705, 'China', 'Taiwan', 'Tainan County', '71', '18', '臺南縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10706, 'China', 'Taiwan', 'Kaohsiung County', '71', '19', '高雄縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10707, 'China', 'Taiwan', 'Pingtung County', '71', '20', '屏東縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10708, 'China', 'Taiwan', 'Taitung County', '71', '22', '臺東縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10709, 'China', 'Taiwan', 'Hualian County', '71', '23', '花蓮縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10710, 'China', 'Taiwan', 'Penghu County', '71', '21', '澎湖縣', '臺灣', '中國', '1');
INSERT INTO `region_city` VALUES (10711, 'Australia', 'Northern Territory', 'Palmerston', 'NT', 'PAL', '北帕默斯頓', '北部地區', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10712, 'Australia', 'Northern Territory', 'Darwin', 'NT', 'DRW', '達爾文', '北部地區', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10713, 'Australia', 'Canberra', 'Canberra', 'ACT', 'CBR', '堪培拉', '堪培拉', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10714, 'Australia', 'Queensland', 'Brisbane', 'QLD', 'BNE', '布里斯班', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10715, 'Australia', 'Queensland', 'Gold Coast', 'QLD', 'OOL', '黃金海岸', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10716, 'Australia', 'Queensland', 'Cairns', 'QLD', 'CNS', '凱恩斯', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10717, 'Australia', 'Queensland', 'Caloundra', 'QLD', 'CUD', '日光海岸', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10718, 'Australia', 'Queensland', 'Townsville', 'QLD', 'TSV', '湯斯維爾', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10719, 'Australia', 'Queensland', 'Toowoomba', 'QLD', 'TWB', '圖文巴', '昆士蘭', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10720, 'Australia', 'South Australia', 'Adelaide', 'SA', 'ADL', '阿德萊德', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10721, 'Australia', 'South Australia', 'Port Augusta', 'SA', 'PUG', '奧古斯塔港', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10722, 'Australia', 'South Australia', 'Mount Gambier', 'SA', 'MGB', '甘比亞山', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10723, 'Australia', 'South Australia', 'Whyalla', 'SA', 'WAY', '懷阿拉', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10724, 'Australia', 'South Australia', 'Port Lincoln', 'SA', 'PLO', '林肯港', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10725, 'Australia', 'South Australia', 'Murray Bridge', 'SA', 'MYB', '默里布里奇', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10726, 'Australia', 'South Australia', 'Port Pirie', 'SA', 'PPI', '皮里港', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10727, 'Australia', 'South Australia', 'Victor Harbor', 'SA', 'VHA', '維克托港', '南澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10728, 'Australia', 'Tasmania', 'Burnie', 'TAS', 'BWT', '伯尼港', '塔斯馬尼亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10729, 'Australia', 'Tasmania', 'Devonport', 'TAS', 'DPO', '德文波特', '塔斯馬尼亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10730, 'Australia', 'Tasmania', 'Hobart', 'TAS', 'HBA', '霍巴特', '塔斯馬尼亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10731, 'Australia', 'Tasmania', 'Launceston', 'TAS', 'LST', '朗塞斯頓', '塔斯馬尼亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10732, 'Australia', 'Victoria', 'Geelong', 'VIC', 'GEX', '吉朗', '維多利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10733, 'Australia', 'Victoria', 'Melbourne', 'VIC', 'MEL', '墨爾本', '維多利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10734, 'Australia', 'Western Australia', 'Albany', 'WA', 'ALH', '奧爾巴尼', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10735, 'Australia', 'Western Australia', 'Bunbury', 'WA', 'BUY', '班伯里', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10736, 'Australia', 'Western Australia', 'Fremantle', 'WA', 'FRE', '弗里曼特爾港', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10737, 'Australia', 'Western Australia', 'Geraldton', 'WA', 'GET', '傑拉爾頓', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10738, 'Australia', 'Western Australia', 'Kalgoorlie', 'WA', 'KGI', '卡爾古利', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10739, 'Australia', 'Western Australia', 'Mandurah', 'WA', 'MDU', '曼哲拉', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10740, 'Australia', 'Western Australia', 'Perth', 'WA', 'PER', '珀斯', '西澳大利亞', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10741, 'Australia', 'New South Wales', 'Newcastle', 'NSW', 'NTL', '紐卡斯爾', '新南威爾士', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10742, 'Australia', 'New South Wales', 'Wollongong', 'NSW', 'WOL', '伍倫貢', '新南威爾士', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10743, 'Australia', 'New South Wales', 'Sydney', 'NSW', 'HBS', '悉尼', '新南威爾士', '澳大利亞', 'AUS');
INSERT INTO `region_city` VALUES (10744, 'Korea', 'Daegu', 'Dalseong-gun', '27', 'DSG', '達城郡', '大邱', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10745, 'Korea', 'Daegu', 'Daegu', '27', 'TAE', '大邱', '大邱', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10746, 'Korea', 'Daegu', 'Suseong-gu', '27', 'SUS', '壽城區', '大邱', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10747, 'Korea', 'Gangwon-do', 'Chuncheon', '42', 'CHC', '春川市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10748, 'Korea', 'Gangwon-do', 'Donghae', '42', 'TGH', '東海市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10749, 'Korea', 'Gangwon-do', 'Goseong County', '42', 'GSG', '高城郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10750, 'Korea', 'Gangwon-do', 'Hoengseong County', '42', 'HSG', '橫城郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10751, 'Korea', 'Gangwon-do', 'Hongcheon County', '42', 'HCN', '洪川郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10752, 'Korea', 'Gangwon-do', 'Hwacheon County', '42', 'HCH', '華川郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10753, 'Korea', 'Gangwon-do', 'Gangneung', '42', 'KAG', '江陵市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10754, 'Korea', 'Gangwon-do', 'Jeongseon County', '42', 'JSE', '旌善郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10755, 'Korea', 'Gangwon-do', 'Inje County', '42', 'IJE', '麟蹄郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10756, 'Korea', 'Gangwon-do', 'Yeongwol County', '42', 'YWL', '甯越郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10757, 'Korea', 'Gangwon-do', 'Pyeongchang County', '42', 'POG', '平昌郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10758, 'Korea', 'Gangwon-do', 'Samcheok', '42', 'SUK', '三陟市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10759, 'Korea', 'Gangwon-do', 'Sokcho', '42', 'SHO', '束草市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10760, 'Korea', 'Gangwon-do', 'Taebaek', '42', 'TBK', '太白市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10761, 'Korea', 'Gangwon-do', 'Cheorwon County', '42', 'CWN', '鐵原郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10762, 'Korea', 'Gangwon-do', 'Yangyang County', '42', 'YNY', '襄陽郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10763, 'Korea', 'Gangwon-do', 'Yanggu County', '42', 'YGU', '楊口郡', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10764, 'Korea', 'Gangwon-do', 'Wonju', '42', 'WJU', '原州市', '江原道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10765, 'Korea', 'Gyeonggi-do', 'Anseong', '49', 'ASG', '安城市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10766, 'Korea', 'Gyeonggi-do', 'Ansan', '49', 'ASN', '安山市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10767, 'Korea', 'Gyeonggi-do', 'Anyang', '49', 'ANY', '安養市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10768, 'Korea', 'Gyeonggi-do', 'Pocheon', '49', 'POC', '抱川市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10769, 'Korea', 'Gyeonggi-do', 'Seongnam', '49', 'SEO', '城南市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10770, 'Korea', 'Gyeonggi-do', 'Dongducheon', '49', 'DDC', '東豆川市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10771, 'Korea', 'Gyeonggi-do', 'Bucheon', '49', 'BCN', '富川市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10772, 'Korea', 'Gyeonggi-do', 'Goyang', '49', 'GYG', '高陽市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10773, 'Korea', 'Gyeonggi-do', 'Gwangmyeong', '49', 'GMG', '光明市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10774, 'Korea', 'Gyeonggi-do', 'Gwangju', '49', 'KWU', '廣州市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10775, 'Korea', 'Gyeonggi-do', 'Gwacheon', '49', 'GCN', '果川市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10776, 'Korea', 'Gyeonggi-do', 'Hanam', '49', 'HNM', '河南市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10777, 'Korea', 'Gyeonggi-do', 'Hwaseong', '49', 'HCH', '華城市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10778, 'Korea', 'Gyeonggi-do', 'Gapyeong County', '49', 'GPG', '加平郡', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10779, 'Korea', 'Gyeonggi-do', 'Gimpo', '49', 'GMP', '金浦市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10780, 'Korea', 'Gyeonggi-do', 'Guri', '49', 'GRI', '九里市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10781, 'Korea', 'Gyeonggi-do', 'Gunpo', '49', 'GUN', '軍浦市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10782, 'Korea', 'Gyeonggi-do', 'Yeoju County', '49', 'YJU', '驪州郡', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10783, 'Korea', 'Gyeonggi-do', 'Icheon', '49', 'ICE', '利川市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10784, 'Korea', 'Gyeonggi-do', 'Yeoncheon County', '49', 'YCN', '漣川郡', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10785, 'Korea', 'Gyeonggi-do', 'Yongin', '49', 'YNG', '龍仁市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10786, 'Korea', 'Gyeonggi-do', 'Namyangju', '49', 'NYU', '南楊州市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10787, 'Korea', 'Gyeonggi-do', 'Pyeongtaek', '49', 'PTK', '平澤市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10788, 'Korea', 'Gyeonggi-do', 'Paju', '49', 'PJU', '坡州市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10789, 'Korea', 'Gyeonggi-do', 'Siheung', '49', 'SHE', '始興市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10790, 'Korea', 'Gyeonggi-do', 'Suwon', '49', 'SUO', '水原市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10791, 'Korea', 'Gyeonggi-do', 'Osan', '49', 'OSN', '烏山市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10792, 'Korea', 'Gyeonggi-do', 'Yangpyeong County', '49', 'YPG', '揚平郡', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10793, 'Korea', 'Gyeonggi-do', 'Yangju', '49', 'YYU', '楊州市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10794, 'Korea', 'Gyeonggi-do', 'Uiwang', '49', 'UWN', '儀旺市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10795, 'Korea', 'Gyeonggi-do', 'Uijeongbu', '49', 'UIJ', '議政府市', '京畿道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10796, 'Korea', 'Chungcheongbuk-do', 'Andong', '43', 'ADG', '安東市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10797, 'Korea', 'Chungcheongbuk-do', 'Bonghwa County', '43', 'BHA', '奉化郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10798, 'Korea', 'Chungcheongbuk-do', 'Goryeong County', '43', 'GRG', '高靈郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10799, 'Korea', 'Chungcheongbuk-do', 'Gumi', '43', 'KUM', '龜尾市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10800, 'Korea', 'Chungcheongbuk-do', 'Gimcheon', '43', 'KMC', '金泉市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10801, 'Korea', 'Chungcheongbuk-do', 'Gunwi County', '43', 'GWI', '軍威郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10802, 'Korea', 'Chungcheongbuk-do', 'Yecheon County', '43', 'YEC', '醴泉郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10803, 'Korea', 'Chungcheongbuk-do', 'Pohang', '43', 'KPO', '浦項市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10804, 'Korea', 'Chungcheongbuk-do', 'Chilgok County', '43', 'CGK', '漆谷郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10805, 'Korea', 'Chungcheongbuk-do', 'Cheongdo County', '43', 'CDO', '淸道郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10806, 'Korea', 'Chungcheongbuk-do', 'Cheongsong County', '43', 'CSG', '靑松郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10807, 'Korea', 'Chungcheongbuk-do', 'Gyeongsan', '43', 'GYS', '慶山市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10808, 'Korea', 'Chungcheongbuk-do', 'Gyeongju', '43', 'GJU', '慶州市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10809, 'Korea', 'Chungcheongbuk-do', 'Yeongju', '43', 'YEJ', '榮州市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10810, 'Korea', 'Chungcheongbuk-do', 'Sangju', '43', 'SJU', '尙州市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10811, 'Korea', 'Chungcheongbuk-do', 'Uljin County', '43', 'UJN', '蔚珍郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10812, 'Korea', 'Chungcheongbuk-do', 'Mungyeong', '43', 'MGG', '聞慶市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10813, 'Korea', 'Chungcheongbuk-do', 'Seongju County', '43', 'SEJ', '星州郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10814, 'Korea', 'Chungcheongbuk-do', 'Uiseong County', '43', 'USG', '義城郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10815, 'Korea', 'Chungcheongbuk-do', 'Yeongyang County', '43', 'YYG', '英陽郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10816, 'Korea', 'Chungcheongbuk-do', 'Yeongdeok County', '43', 'YDK', '盈德郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10817, 'Korea', 'Chungcheongbuk-do', 'Yeongcheon', '43', 'YCH', '永川市', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10818, 'Korea', 'Chungcheongbuk-do', 'Ulleung County', '43', 'ULG', '郁陵郡', '慶尚北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10819, 'Korea', 'Chungcheongnam-do', 'Changnyeong County', '44', 'CNG', '昌寧郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10820, 'Korea', 'Chungcheongnam-do', 'Changwon', '44', 'CHW', '昌原市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10821, 'Korea', 'Chungcheongnam-do', 'Goseong County', '44', 'GSO', '固城郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10822, 'Korea', 'Chungcheongnam-do', 'Hadong County', '44', 'HDG', '河東郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10823, 'Korea', 'Chungcheongnam-do', 'Gimhae', '44', 'KMH', '金海市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10824, 'Korea', 'Chungcheongnam-do', 'Jinju', '44', 'HIN', '晉州市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10825, 'Korea', 'Chungcheongnam-do', 'Geochang County', '44', 'GCH', '居昌郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10826, 'Korea', 'Chungcheongnam-do', 'Geoje', '44', 'KJE', '巨濟市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10827, 'Korea', 'Chungcheongnam-do', 'Yangsan', '44', 'YSN', '梁山市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10828, 'Korea', 'Chungcheongnam-do', 'Masan', '44', 'MAS', '馬山市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10829, 'Korea', 'Chungcheongnam-do', 'Miryang', '44', 'MIR', '密陽市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10830, 'Korea', 'Chungcheongnam-do', 'Namhae County', '44', 'NHE', '南海郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10831, 'Korea', 'Chungcheongnam-do', 'Sancheong County', '44', 'SCH', '山淸郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10832, 'Korea', 'Chungcheongnam-do', 'Sacheon', '44', 'SAH', '泗川市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10833, 'Korea', 'Chungcheongnam-do', 'Tongyeong', '44', 'TYG', '統營市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10834, 'Korea', 'Chungcheongnam-do', 'Hapcheon County', '44', 'HCE', '陜川郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10835, 'Korea', 'Chungcheongnam-do', 'Haman County', '44', 'HAN', '咸安郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10836, 'Korea', 'Chungcheongnam-do', 'Hamyang County', '44', 'HYG', '咸陽郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10837, 'Korea', 'Chungcheongnam-do', 'Uiryeong County', '44', 'URG', '宜寧郡', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10838, 'Korea', 'Chungcheongnam-do', 'Jinhae', '44', 'CHF', '鎭海市', '慶尚南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10839, 'Korea', 'Gyeongsangbuk-do', 'Sunchang County', '47', 'SCG', '淳昌郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10840, 'Korea', 'Gyeongsangbuk-do', 'Buan County', '47', 'PUS', '扶安郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10841, 'Korea', 'Gyeongsangbuk-do', 'Gochang County', '47', 'GCG', '高敞郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10842, 'Korea', 'Gyeongsangbuk-do', 'Gimje', '47', 'GJE', '金堤市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10843, 'Korea', 'Gyeongsangbuk-do', 'Jeongeup', '47', 'JEO', '井邑市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10844, 'Korea', 'Gyeongsangbuk-do', 'Muju County', '47', 'MJU', '茂朱郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10845, 'Korea', 'Gyeongsangbuk-do', 'Namwon', '47', 'NWN', '南原市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10846, 'Korea', 'Gyeongsangbuk-do', 'Jeonju', '47', 'JNJ', '全州市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10847, 'Korea', 'Gyeongsangbuk-do', 'Gunsan', '47', 'KUV', '群山市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10848, 'Korea', 'Gyeongsangbuk-do', 'Imsil County', '47', 'ISL', '任實郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10849, 'Korea', 'Gyeongsangbuk-do', 'Wanju County', '47', 'WAJ', '完州郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10850, 'Korea', 'Gyeongsangbuk-do', 'Iksan', '47', 'IKS', '益山市', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10851, 'Korea', 'Gyeongsangbuk-do', 'Jangsu County', '47', 'JSU', '長水郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10852, 'Korea', 'Gyeongsangbuk-do', 'Jinan County', '47', 'JAN', '鎭安郡', '全羅北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10853, 'Korea', 'Gyeongsangnam-do', 'Boseong County', '48', 'BSG', '寶城郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10854, 'Korea', 'Gyeongsangnam-do', 'Goheung County', '48', 'GHG', '高興郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10855, 'Korea', 'Gyeongsangnam-do', 'Gokseong County', '48', 'GSE', '谷城郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10856, 'Korea', 'Gyeongsangnam-do', 'Wando County', '48', 'WND', '莞島郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10857, 'Korea', 'Gyeongsangnam-do', 'Gwangyang', '48', 'KAN', '光陽市', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10858, 'Korea', 'Gyeongsangnam-do', 'Haenam County', '48', 'HAE', '海南郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10859, 'Korea', 'Gyeongsangnam-do', 'Hwasun County', '48', 'HSN', '和順郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10860, 'Korea', 'Gyeongsangnam-do', 'Gangjin County', '48', 'GJN', '康津郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10861, 'Korea', 'Gyeongsangnam-do', 'Yeosu', '48', 'YOS', '麗水市', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10862, 'Korea', 'Gyeongsangnam-do', 'Yeonggwang County', '48', 'YGG', '靈光郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10863, 'Korea', 'Gyeongsangnam-do', 'Yeongam County', '48', 'YAM', '靈巖郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10864, 'Korea', 'Gyeongsangnam-do', 'Naju', '48', 'NJU', '羅州市', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10865, 'Korea', 'Gyeongsangnam-do', 'Mokpo', '48', 'MOK', '木浦市', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10866, 'Korea', 'Gyeongsangnam-do', 'Gurye County', '48', 'GRE', '求禮郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10867, 'Korea', 'Gyeongsangnam-do', 'Suncheon', '48', 'SYS', '順天市', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10868, 'Korea', 'Gyeongsangnam-do', 'Damyang County', '48', 'DYA', '潭陽郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10869, 'Korea', 'Gyeongsangnam-do', 'Muan County', '48', 'MAN', '務安郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10870, 'Korea', 'Gyeongsangnam-do', 'Hampyeong County', '48', 'HPG', '咸平郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10871, 'Korea', 'Gyeongsangnam-do', 'Sinan County', '48', 'SAN', '新安郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10872, 'Korea', 'Gyeongsangnam-do', 'Jangseong County', '48', 'JSN', '長城郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10873, 'Korea', 'Gyeongsangnam-do', 'Jangheung County', '48', 'JHG', '長興郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10874, 'Korea', 'Gyeongsangnam-do', 'Jindo County', '48', 'JDO', '珍島郡', '全羅南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10875, 'Korea', 'Jeollabuk-do', 'Boeun County', '45', 'BEN', '報恩郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10876, 'Korea', 'Jeollabuk-do', 'Jeungpyeong County', '45', 'JYG', '曾坪郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10877, 'Korea', 'Jeollabuk-do', 'Danyang County', '45', 'DYG', '丹陽郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10878, 'Korea', 'Jeollabuk-do', 'Jecheon', '45', 'JCH', '堤川市', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10879, 'Korea', 'Jeollabuk-do', 'Goesan County', '45', 'GSN', '槐山郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10880, 'Korea', 'Jeollabuk-do', 'Cheongwon County', '45', 'CWO', '淸原郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10881, 'Korea', 'Jeollabuk-do', 'Cheongju', '45', 'CJJ', '淸州市', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10882, 'Korea', 'Jeollabuk-do', 'Okcheon County', '45', 'OCN', '沃川郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10883, 'Korea', 'Jeollabuk-do', 'Eumseong County', '45', 'ESG', '陰城郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10884, 'Korea', 'Jeollabuk-do', 'Yeongdong County', '45', 'YDG', '永同郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10885, 'Korea', 'Jeollabuk-do', 'Jincheon County', '45', 'JCN', '鎭川郡', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10886, 'Korea', 'Jeollabuk-do', 'Chungju', '45', 'CHU', '忠州市', '忠清北道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10887, 'Korea', 'Jeollanam-do', 'Boryeong', '46', 'BOR', '保寧市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10888, 'Korea', 'Jeollanam-do', 'Buyeo County', '46', 'BYO', '扶余郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10889, 'Korea', 'Jeollanam-do', 'Gongju', '46', 'GOJ', '公州市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10890, 'Korea', 'Jeollanam-do', 'Hongseong County', '46', 'HSE', '洪城郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10891, 'Korea', 'Jeollanam-do', 'Gyeryong', '46', 'GYE', '雞龍市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10892, 'Korea', 'Jeollanam-do', 'Geumsan County', '46', 'GSA', '錦山郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10893, 'Korea', 'Jeollanam-do', 'Yesan County', '46', 'YOS', '禮山郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10894, 'Korea', 'Jeollanam-do', 'Nonsan', '46', 'NSN', '論山市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10895, 'Korea', 'Jeollanam-do', 'Cheongyang County', '46', 'CYG', '青陽郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10896, 'Korea', 'Jeollanam-do', 'Seosan', '46', 'SSA', '瑞山市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10897, 'Korea', 'Jeollanam-do', 'Seocheon County', '46', 'SCE', '舒川郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10898, 'Korea', 'Jeollanam-do', 'Taean County', '46', 'TAN', '泰安郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10899, 'Korea', 'Jeollanam-do', 'Dangjin County', '46', 'TJI', '唐津郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10900, 'Korea', 'Jeollanam-do', 'Cheonan', '46', 'CHO', '天安市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10901, 'Korea', 'Jeollanam-do', 'Asan', '46', 'ASA', '牙山市', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10902, 'Korea', 'Jeollanam-do', 'Yeongi County', '46', 'YGI', '燕岐郡', '忠清南道', '韓國', 'KOR');
INSERT INTO `region_city` VALUES (10903, 'Malaysia', 'Pulau Pinang', 'Butterworth', 'PH', 'BWH', '北海', '檳榔嶼', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10904, 'Malaysia', 'Pulau Pinang', 'George Town', 'PH', 'PEN', '檳城', '檳榔嶼', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10905, 'Malaysia', 'Pulau Pinang', 'Bukit Mertajam', 'PH', 'BMJ', '大山腳', '檳榔嶼', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10906, 'Malaysia', 'Pulau Pinang', 'Nibong Tebal', 'PH', 'NTE', '高淵', '檳榔嶼', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10907, 'Malaysia', 'Perlis', 'Kangar', 'PS', 'KGR', '加央', '玻璃市', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10908, 'Malaysia', 'Terengganu', 'Kemaman', 'TR', 'KEM', '甘馬挽', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10909, 'Malaysia', 'Terengganu', 'Kuala Terengganu', 'TR', 'TGG', '瓜拉丁加奴', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10910, 'Malaysia', 'Terengganu', 'Dungun', 'TR', 'DGN', '龍運', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10911, 'Malaysia', 'Terengganu', 'Marang', 'TR', 'MAR', '馬江', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10912, 'Malaysia', 'Terengganu', 'Setiu', 'TR', 'SET', '實兆', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10913, 'Malaysia', 'Terengganu', 'Hulu', 'TR', 'HUL', '烏魯', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10914, 'Malaysia', 'Terengganu', 'Besut', 'TR', 'BES', '勿述', '丁加奴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10915, 'Malaysia', 'Kedah', 'Padang Terap', 'KD', 'PGT', '巴東得臘', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10916, 'Malaysia', 'Kedah', 'Pendang', 'KD', 'PEN', '笨筒', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10917, 'Malaysia', 'Kedah', 'Langkawi', 'KD', 'LGK', '浮羅交怡', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10918, 'Malaysia', 'Kedah', 'Kota Setar', 'KD', 'KOR', '哥打士打', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10919, 'Malaysia', 'Kedah', 'Kubang Pasu', 'KD', 'KPA', '古邦巴素', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10920, 'Malaysia', 'Kedah', 'Kuala Muda', 'KD', 'KMU', '瓜拉姆達', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10921, 'Malaysia', 'Kedah', 'Baling', 'KD', 'BLZ', '華玲', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10922, 'Malaysia', 'Kedah', 'Kulim', 'KD', 'KLM', '居林', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10923, 'Malaysia', 'Kedah', 'Bandar Baharu', 'KD', 'BMA', '萬拉峇魯', '吉打', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10924, 'Malaysia', 'Kelantan', 'Pasir Putih', 'KN', 'PPU', '巴西富地', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10925, 'Malaysia', 'Kelantan', 'Pasir Mas', 'KN', 'PMA', '巴西馬', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10926, 'Malaysia', 'Kelantan', 'Tanah Merah', 'KN', 'TMR', '丹那美拉', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10927, 'Malaysia', 'Kelantan', 'Tumpat', 'KN', 'TUM', '道北', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10928, 'Malaysia', 'Kelantan', 'Bachok', 'KN', 'BAC', '登卓', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10929, 'Malaysia', 'Kelantan', 'Kota Bharu', 'KN', 'KBR', '哥打巴魯', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10930, 'Malaysia', 'Kelantan', 'Kuala Krai', 'KN', 'KUG', '瓜拉吉賴', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10931, 'Malaysia', 'Kelantan', 'Gua Musang', 'KN', 'GMU', '話望生', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10932, 'Malaysia', 'Kelantan', 'Machang', 'KN', 'MAC', '馬樟', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10933, 'Malaysia', 'Kelantan', 'Jeli', 'KN', 'JEL', '日裡', '吉蘭丹', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10934, 'Malaysia', 'Kuala Lumpur', 'Kuala Lumpur', 'KL', 'KUL', '吉隆坡', '吉隆坡', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10935, 'Malaysia', 'Malacca', 'Melaka', 'ML', 'MEL', '馬六甲市', '馬六甲', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10936, 'Malaysia', 'Malacca', 'Alor Gajah', 'ML', 'AOG', '亞羅牙也', '馬六甲', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10937, 'Malaysia', 'Malacca', 'Jasin', 'ML', 'JAS', '野新', '馬六甲', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10938, 'Malaysia', 'Labuan', 'Labuan', 'LB', 'LBU', '納閩', '納閩', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10939, 'Malaysia', 'Labuan', 'Victoria', 'LB', 'VIC', '維多利亞', '納閩', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10940, 'Malaysia', 'Pahang', 'Bera', 'PG', 'BER', '百樂', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10941, 'Malaysia', 'Pahang', 'Pekan', 'PG', 'PEK', '北根', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10942, 'Malaysia', 'Pahang', 'Temerloh', 'PG', 'TEM', '淡馬魯', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10943, 'Malaysia', 'Pahang', 'Jerantut', 'PG', 'JER', '而連突', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10944, 'Malaysia', 'Pahang', 'Kuantan', 'PG', 'KUA', '關丹', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10945, 'Malaysia', 'Pahang', 'Cameron Highlands', 'PG', 'CAH', '金馬侖高原', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10946, 'Malaysia', 'Pahang', 'Raub', 'PG', 'RAU', '勞勿', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10947, 'Malaysia', 'Pahang', 'Kuala Lipis', 'PG', 'KUL', '立卑', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10948, 'Malaysia', 'Pahang', 'Maran', 'PG', 'MAR', '馬蘭', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10949, 'Malaysia', 'Pahang', 'Bentong', 'PG', 'BEN', '文冬', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10950, 'Malaysia', 'Pahang', 'Rompin', 'PG', 'TOM', '云冰', '彭亨', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10951, 'Malaysia', 'Perak', 'Teluk Intan', 'PK', 'TAS', '安順', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10952, 'Malaysia', 'Perak', 'Tanjung Malim', 'PK', 'TAM', '丹絨馬', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10953, 'Malaysia', 'Perak', 'Sungai Siput', 'PK', 'SSP', '和豐', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10954, 'Malaysia', 'Perak', 'Lumut', 'PK', 'LUM', '紅土坎', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10955, 'Malaysia', 'Perak', 'Batu Gajah', 'PK', 'BGA', '華都牙也', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10956, 'Malaysia', 'Perak', 'Kuala Kangsar', 'PK', 'KAR', '江沙', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10957, 'Malaysia', 'Perak', 'Taiping', 'PK', 'TPG', '太平', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10958, 'Malaysia', 'Perak', 'Ipoh', 'PK', 'IPH', '怡保', '霹靂', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10959, 'Malaysia', 'Johor', 'Pontian', 'JH', 'POW', '笨珍', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10960, 'Malaysia', 'Johor', 'Mersing', 'JH', 'MEP', '豐盛港', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10961, 'Malaysia', 'Johor', 'Kota Tinggi', 'JH', 'KTI', '哥打丁宜', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10962, 'Malaysia', 'Johor', 'Kluang', 'JH', 'KLA', '居鑾', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10963, 'Malaysia', 'Johor', 'Batu Pahat', 'JH', 'BAT', '峇株巴轄', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10964, 'Malaysia', 'Johor', 'Muar', 'JH', 'MUA', '麻坡', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10965, 'Malaysia', 'Johor', 'Segamat', 'JH', 'SGM', '昔加末', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10966, 'Malaysia', 'Johor', 'Johor Bahru', 'JH', 'JHB', '新山', '柔佛', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10967, 'Malaysia', 'Negeri Sembilan', 'Port Dickson', 'NS', 'PDI', '波德申', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10968, 'Malaysia', 'Negeri Sembilan', 'Tampin', 'NS', 'TAI', '淡邊', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10969, 'Malaysia', 'Negeri Sembilan', 'Seremban', 'NS', 'SRB', '芙蓉', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10970, 'Malaysia', 'Negeri Sembilan', 'Kuala Pilah', 'NS', 'KPI', '瓜拉庇勞', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10971, 'Malaysia', 'Negeri Sembilan', 'Rembau', 'NS', 'REM', '林茂', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10972, 'Malaysia', 'Negeri Sembilan', 'Jempol', 'NS', 'JEP', '仁保', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10973, 'Malaysia', 'Negeri Sembilan', 'Jelebu', 'NS', 'JEL', '日叻務', '森美蘭', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10974, 'Malaysia', 'Sabah', 'Papar', 'SB', 'PAP', '吧巴', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10975, 'Malaysia', 'Sabah', 'Beaufort', 'SB', 'BEF', '保佛', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10976, 'Malaysia', 'Sabah', 'Beluran', 'SB', 'BEL', '比魯蘭', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10977, 'Malaysia', 'Sabah', 'Pitas', 'SB', 'PIT', '必達士', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10978, 'Malaysia', 'Sabah', 'Penampang', 'SB', 'PMP', '兵南邦', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10979, 'Malaysia', 'Sabah', 'Tambunan', 'SB', 'TAB', '擔布南', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10980, 'Malaysia', 'Sabah', 'Tenom', 'SB', 'TEN', '丹南', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10981, 'Malaysia', 'Sabah', 'Tawau', 'SB', 'TAW', '斗湖', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10982, 'Malaysia', 'Sabah', 'Tuaran', 'SB', 'TUR', '斗亞蘭', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10983, 'Malaysia', 'Sabah', 'Kota Kinabalu', 'SB', 'BKI', '哥打基納巴魯', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10984, 'Malaysia', 'Sabah', 'Kota Marudu', 'SB', 'KMU', '哥打馬魯都', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10985, 'Malaysia', 'Sabah', 'Keningau', 'SB', 'KEG', '根地咬', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10986, 'Malaysia', 'Sabah', 'Kudat', 'SB', 'KUD', '古達', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10987, 'Malaysia', 'Sabah', 'Kota Belud', 'SB', 'KBD', '古打毛律', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10988, 'Malaysia', 'Sabah', 'Kunak', 'SB', 'KUN', '古納', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10989, 'Malaysia', 'Sabah', 'Kuala Penyu', 'SB', 'KPU', '瓜拉班尤', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10990, 'Malaysia', 'Sabah', 'Kinabatangan', 'SB', 'KBT', '京那巴登岸', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10991, 'Malaysia', 'Sabah', 'Ranau', 'SB', 'RNU', '蘭腦', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10992, 'Malaysia', 'Sabah', 'Lahad Datu', 'SB', 'LDU', '拿篤', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10993, 'Malaysia', 'Sabah', 'Nabawan', 'SB', 'NAB', '納巴灣', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10994, 'Malaysia', 'Sabah', 'Sandakan', 'SB', 'SDK', '山打根', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10995, 'Malaysia', 'Sabah', 'Sipitang', 'SB', 'SPT', '西比陶', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10996, 'Malaysia', 'Sabah', 'Semporna', 'SB', 'SMM', '仙本那', '沙巴', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10997, 'Malaysia', 'Sarawak', 'Kuching', 'SR', 'KCH', '古晉', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10998, 'Malaysia', 'Sarawak', 'Kapit', 'SR', 'KPI', '加帛', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (10999, 'Malaysia', 'Sarawak', 'Limbang', 'SR', 'LMN', '林夢', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11000, 'Malaysia', 'Sarawak', 'Miri', 'SR', 'MYY', '美里', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11001, 'Malaysia', 'Sarawak', 'Bintulu', 'SR', 'BTU', '民都魯', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11002, 'Malaysia', 'Sarawak', 'Mukah', 'SR', 'MKM', '木膠', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11003, 'Malaysia', 'Sarawak', 'Betong', 'SR', 'BTG', '木中', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11004, 'Malaysia', 'Sarawak', 'Samarahan', 'SR', 'SMH', '三馬拉漢', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11005, 'Malaysia', 'Sarawak', 'Sri Aman', 'SR', 'SAM', '斯里阿曼', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11006, 'Malaysia', 'Sarawak', 'Sarikei', 'SR', 'SAR', '泗里街', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11007, 'Malaysia', 'Sarawak', 'Sibu', 'SR', 'SBW', '泗務', '沙撈越', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11008, 'Malaysia', 'Selangor', 'Petaling', 'SL', 'PJA', '八打靈', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11009, 'Malaysia', 'Selangor', 'Gombak', 'SL', 'GOM', '鵝麥', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11010, 'Malaysia', 'Selangor', 'Kuala Langat', 'SL', 'KLG', '瓜拉冷岳', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11011, 'Malaysia', 'Selangor', 'Kuala Selangor', 'SL', 'KSL', '瓜拉雪蘭莪', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11012, 'Malaysia', 'Selangor', 'Sabak Bernam', 'SL', 'SBM', '沙白安南', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11013, 'Malaysia', 'Selangor', 'Hulu Langat', 'SL', 'HUL', '烏魯冷岳', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11014, 'Malaysia', 'Selangor', 'Hulu Selangor', 'SL', 'HUS', '烏魯雪蘭莪', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11015, 'Malaysia', 'Selangor', 'Sepang', 'SL', 'SEP', '雪邦', '雪蘭莪', '馬來西亞', 'MYS');
INSERT INTO `region_city` VALUES (11016, 'United States', 'Arkansas', 'Fayetteville', 'AR', 'FYV', '費耶特維爾', '阿肯色', '美國', 'USA');
INSERT INTO `region_city` VALUES (11017, 'United States', 'Arkansas', 'Fort Smith', 'AR', 'FSM', '史密斯堡', '阿肯色', '美國', 'USA');
INSERT INTO `region_city` VALUES (11018, 'United States', 'Arkansas', 'Little Rock', 'AR', 'LIT', '小石城', '阿肯色', '美國', 'USA');
INSERT INTO `region_city` VALUES (11019, 'United States', 'Alabama', 'Birmingham', 'AL', 'BHM', '伯明罕', '阿拉巴馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11020, 'United States', 'Alabama', 'Montgomery', 'AL', 'MGM', '蒙哥馬利', '阿拉巴馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11021, 'United States', 'Alabama', 'Mobile', 'AL', 'MOB', '莫比爾', '阿拉巴馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11022, 'United States', 'Alaska', 'Anchorage', 'AK', 'ANC', '安克雷奇', '阿拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11023, 'United States', 'Alaska', 'Fairbanks', 'AK', 'FAI', '費爾班克斯', '阿拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11024, 'United States', 'Alaska', 'Juneau', 'AK', 'JNU', '朱諾', '阿拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11025, 'United States', 'Idaho', 'Idaho Falls', 'ID', 'IDA', '愛達荷福爾斯', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11026, 'United States', 'Idaho', 'Pocatello', 'ID', 'PIH', '波卡特洛', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11027, 'United States', 'Idaho', 'Boise', 'ID', 'BOI', '博伊西', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11028, 'United States', 'Idaho', 'Blackfoot', 'ID', 'BLK', '布萊克富特', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11029, 'United States', 'Idaho', 'Coeur d\'Alene', 'ID', 'COE', '科達倫', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11030, 'United States', 'Idaho', 'Lewiston', 'ID', 'LWS', '劉易斯頓', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11031, 'United States', 'Idaho', 'Moscow', 'ID', 'MJL', '莫斯科', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11032, 'United States', 'Idaho', 'Murphy', 'ID', 'ZMU', '墨菲', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11033, 'United States', 'Idaho', 'Nampa', 'ID', 'NPA', '楠帕', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11034, 'United States', 'Idaho', 'Ketchum', 'ID', 'QKM', '豈徹姆', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11035, 'United States', 'Idaho', 'Sun Valley', 'ID', 'SVY', '森瓦利', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11036, 'United States', 'Idaho', 'American Falls', 'ID', 'YAF', '亞美利加瀑布城', '愛達荷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11037, 'United States', 'Iowa', 'Davenport', 'IA', 'DVN', '達文波特', '愛荷華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11038, 'United States', 'Iowa', 'Des Moines', 'IA', 'DSM', '得梅因', '愛荷華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11039, 'United States', 'Iowa', 'Cedar Rapids', 'IA', 'CID', '錫達拉皮茲', '愛荷華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11040, 'United States', 'North Dakota', 'Bismarck', 'ND', 'BIS', '俾斯麥', '北達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11041, 'United States', 'North Dakota', 'Grand Forks', 'ND', 'GFK', '大福克斯', '北達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11042, 'United States', 'North Dakota', 'Fargo', 'ND', 'FAR', '法戈', '北達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11043, 'United States', 'North Dakota', 'Minot', 'ND', 'MOT', '邁諾特', '北達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11044, 'United States', 'North Carolina', 'Asheville', 'NC', 'AEV', '艾許維爾', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11045, 'United States', 'North Carolina', 'Durham', 'NC', 'DHH', '杜罕', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11046, 'United States', 'North Carolina', 'Greensboro', 'NC', 'GBO', '格林斯伯勒', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11047, 'United States', 'North Carolina', 'Chapel Hill', 'NC', 'CHE', '教堂山', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11048, 'United States', 'North Carolina', 'Raleigh', 'NC', 'RAG', '羅利', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11049, 'United States', 'North Carolina', 'Raleigh-Durham', 'NC', 'RDU', '洛利杜罕都會區', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11050, 'United States', 'North Carolina', 'Charlotte', 'NC', 'CRQ', '夏洛特', '北卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11051, 'United States', 'Pennsylvania', 'Allentown', 'PA', 'AEW', '阿倫敦', '賓夕法尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11052, 'United States', 'Pennsylvania', 'Philadephia', 'PA', 'PHL', '費城', '賓夕法尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11053, 'United States', 'Pennsylvania', 'Pittsburgh', 'PA', 'PIT', '匹茲堡', '賓夕法尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11054, 'United States', 'Texas', 'El Paso', 'TX', 'ELP', '埃爾帕索', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11055, 'United States', 'Texas', 'Austin', 'TX', 'AUS', '奧斯汀', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11056, 'United States', 'Texas', 'Dallas', 'TX', 'DAL', '達拉斯', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11057, 'United States', 'Texas', 'Corpus Christi', 'TX', 'CRP', '哥帕斯基斯蒂', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11058, 'United States', 'Texas', 'Galveston', 'TX', 'GLS', '交維斯頓', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11059, 'United States', 'Texas', 'Laredo', 'TX', 'LRD', '拉雷多', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11060, 'United States', 'Texas', 'McAllen', 'TX', 'TXC', '麥亞倫', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11061, 'United States', 'Texas', 'San Antonio', 'TX', 'SAT', '聖安東尼奧', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11062, 'United States', 'Texas', 'Houston', 'TX', 'HOU', '休斯敦', '德克薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11063, 'United States', 'Ohio', 'Dayton', 'OH', 'DYT', '代頓', '俄亥俄', '美國', 'USA');
INSERT INTO `region_city` VALUES (11064, 'United States', 'Ohio', 'Columbus', 'OH', 'CZX', '哥倫布', '俄亥俄', '美國', 'USA');
INSERT INTO `region_city` VALUES (11065, 'United States', 'Ohio', 'Cleveland', 'OH', 'CLE', '克利夫蘭', '俄亥俄', '美國', 'USA');
INSERT INTO `region_city` VALUES (11066, 'United States', 'Ohio', 'Toledo', 'OH', 'TOL', '托萊多', '俄亥俄', '美國', 'USA');
INSERT INTO `region_city` VALUES (11067, 'United States', 'Ohio', 'Cincinnati', 'OH', 'CVG', '辛辛那提', '俄亥俄', '美國', 'USA');
INSERT INTO `region_city` VALUES (11068, 'United States', 'Oklahoma', 'Oklahoma City', 'OK', 'OKC', '俄克拉荷馬城', '俄克拉荷馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11069, 'United States', 'Oklahoma', 'Norman', 'OK', 'OUN', '諾曼', '俄克拉荷馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11070, 'United States', 'Oklahoma', 'Tulsa', 'OK', 'TUL', '塔爾薩', '俄克拉荷馬', '美國', 'USA');
INSERT INTO `region_city` VALUES (11071, 'United States', 'Oregon', 'Bend', 'OR', 'BZO', '本德', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11072, 'United States', 'Oregon', 'Portland', 'OR', 'PDX', '波特蘭', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11073, 'United States', 'Oregon', 'The Dalles', 'OR', 'DLS', '達爾斯', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11074, 'United States', 'Oregon', 'Dallas', 'OR', 'DAC', '達拉斯', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11075, 'United States', 'Oregon', 'Tillamook', 'OR', 'TLM', '蒂拉穆克', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11076, 'United States', 'Oregon', 'Grant\'s Pass', 'OR', 'XFX', '格蘭茨帕斯', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11077, 'United States', 'Oregon', 'Hood River', 'OR', 'HDX', '胡德里弗', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11078, 'United States', 'Oregon', 'Crater Lake', 'OR', 'CTR', '火山口湖', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11079, 'United States', 'Oregon', 'Corvallis', 'OR', 'YCV', '科瓦利斯', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11080, 'United States', 'Oregon', 'Coos Bay', 'OR', 'COB', '庫斯貝', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11081, 'United States', 'Oregon', 'Medford', 'OR', 'MFR', '梅德福', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11082, 'United States', 'Oregon', 'Salem', 'OR', 'SLE', '塞勒姆', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11083, 'United States', 'Oregon', 'St Helens', 'OR', 'STH', '聖海倫斯', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11084, 'United States', 'Oregon', 'Springfield', 'OR', 'SPY', '斯普林菲爾德', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11085, 'United States', 'Oregon', 'Eugene', 'OR', 'EUG', '尤金', '俄勒岡', '美國', 'USA');
INSERT INTO `region_city` VALUES (11086, 'United States', 'Florida', 'Orlando', 'FL', 'ORL', '奧蘭多', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11087, 'United States', 'Florida', 'Key West', 'FL', 'EYW', '基韋斯特', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11088, 'United States', 'Florida', 'Jacksonville', 'FL', 'JAX', '傑克遜維爾', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11089, 'United States', 'Florida', 'Cape Canaveral', 'FL', 'CPV', '卡納維爾角', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11090, 'United States', 'Florida', 'Fort Lauderdale', 'FL', 'FLL', '羅德岱堡', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11091, 'United States', 'Florida', 'Miami', 'FL', 'MIA', '邁阿密', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11092, 'United States', 'Florida', 'St. Petersburg', 'FL', 'PIE', '聖彼德斯堡市', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11093, 'United States', 'Florida', 'Tallahassee', 'FL', 'TLH', '塔拉哈西', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11094, 'United States', 'Florida', 'Tampa', 'FL', 'TPA', '坦帕', '佛羅里達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11095, 'United States', 'Vermont', 'Burlington', 'VT', 'BTV', '伯靈頓', '佛蒙特', '美國', 'USA');
INSERT INTO `region_city` VALUES (11096, 'United States', 'Vermont', 'Rutland', 'VT', 'RUT', '拉特蘭', '佛蒙特', '美國', 'USA');
INSERT INTO `region_city` VALUES (11097, 'United States', 'Vermont', 'South Burlington', 'VT', 'ZBR', '南伯靈頓', '佛蒙特', '美國', 'USA');
INSERT INTO `region_city` VALUES (11098, 'United States', 'District of Columbia', 'Washington D.C.', 'DC', 'WAS', '華盛頓哥倫比亞特區', '哥倫比亞特區', '美國', 'USA');
INSERT INTO `region_city` VALUES (11099, 'United States', 'Washington', 'Spokane', 'WA', 'GEG', '斯波坎', '華盛頓', '美國', 'USA');
INSERT INTO `region_city` VALUES (11100, 'United States', 'Washington', 'Tacoma', 'WA', 'TTW', '塔科馬', '華盛頓', '美國', 'USA');
INSERT INTO `region_city` VALUES (11101, 'United States', 'Washington', 'Seattle', 'WA', 'SEA', '西雅圖', '華盛頓', '美國', 'USA');
INSERT INTO `region_city` VALUES (11102, 'United States', 'Wyoming', 'Evanston', 'WY', 'EVD', '埃文斯頓', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11103, 'United States', 'Wyoming', 'Casper', 'WY', 'CPR', '卡斯珀', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11104, 'United States', 'Wyoming', 'Laramie', 'WY', 'LAR', '拉勒米', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11105, 'United States', 'Wyoming', 'Rock Springs', 'WY', 'RKS', '羅克斯普林斯', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11106, 'United States', 'Wyoming', 'Cheyenne', 'WY', 'CYS', '夏延', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11107, 'United States', 'Wyoming', 'Sheridan', 'WY', 'SHR', '謝里登', '懷俄明', '美國', 'USA');
INSERT INTO `region_city` VALUES (11108, 'United States', 'California', 'San Francisco', 'CA', 'SFO', '舊金山', '加利福尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11109, 'United States', 'California', 'Los Angeles', 'CA', 'LAX', '洛杉磯', '加利福尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11110, 'United States', 'California', 'San Diego', 'CA', 'SAN', '聖迭戈', '加利福尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11111, 'United States', 'California', 'San Jose', 'CA', 'SJC', '聖何塞', '加利福尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11112, 'United States', 'Kansas', 'Abilene', 'KS', 'ABZ', '阿比林', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11113, 'United States', 'Kansas', 'Overland Park', 'KS', 'OVL', '奧弗蘭公園', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11114, 'United States', 'Kansas', 'Hutchinson', 'KS', 'HCH', '哈欽森', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11115, 'United States', 'Kansas', 'Kansas City', 'KS', 'KCK', '堪薩斯城', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11116, 'United States', 'Kansas', 'Leavenworth', 'KS', 'XIA', '萊文沃思', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11117, 'United States', 'Kansas', 'Lawrence', 'KS', 'LWC', '勞倫斯', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11118, 'United States', 'Kansas', 'Manhattan', 'KS', 'MHK', '曼哈頓', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11119, 'United States', 'Kansas', 'Topeka', 'KS', 'TOP', '托皮卡', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11120, 'United States', 'Kansas', 'Wichita', 'KS', 'ICT', '威奇托', '堪薩斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11121, 'United States', 'Connecticut', 'Bridgeport', 'CT', 'BDR', '布里奇波特', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11122, 'United States', 'Connecticut', 'Darien', 'CT', 'DAQ', '達里恩', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11123, 'United States', 'Connecticut', 'Greenwich', 'CT', 'GRH', '格林尼治', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11124, 'United States', 'Connecticut', 'Hartford', 'CT', 'HFD', '哈特福德', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11125, 'United States', 'Connecticut', 'Middletown', 'CT', 'XIN', '米德爾頓', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11126, 'United States', 'Connecticut', 'New Haven', 'CT', 'HVN', '紐黑文', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11127, 'United States', 'Connecticut', 'Westport', 'CT', 'WPT', '韋斯特波特', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11128, 'United States', 'Connecticut', 'Waterbury', 'CT', 'WAT', '沃特伯里', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11129, 'United States', 'Connecticut', 'New Britain', 'CT', 'NWT', '新不列顛', '康涅狄格', '美國', 'USA');
INSERT INTO `region_city` VALUES (11130, 'United States', 'Colorado', 'Aspen', 'CO', 'ASE', '阿斯彭', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11131, 'United States', 'Colorado', 'Aurora', 'CO', 'AUX', '奧羅拉', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11132, 'United States', 'Colorado', 'Boulder', 'CO', 'WBU', '博爾德', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11133, 'United States', 'Colorado', 'Grand Junction', 'CO', 'GJT', '大章克申', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11134, 'United States', 'Colorado', 'Denver', 'CO', 'DEN', '丹佛', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11135, 'United States', 'Colorado', 'Fort Collins', 'CO', 'FNL', '柯林斯堡', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11136, 'United States', 'Colorado', 'Colorado Springs', 'CO', 'COS', '科羅拉多斯普林斯', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11137, 'United States', 'Colorado', 'Vail', 'CO', 'VAC', '韋爾', '科羅拉多', '美國', 'USA');
INSERT INTO `region_city` VALUES (11138, 'United States', 'Kentucky', 'Lexington', 'KY', 'LEX', '列剋星敦', '肯塔基', '美國', 'USA');
INSERT INTO `region_city` VALUES (11139, 'United States', 'Kentucky', 'Louisville', 'KY', 'LUI', '路易斯維爾', '肯塔基', '美國', 'USA');
INSERT INTO `region_city` VALUES (11140, 'United States', 'Kentucky', 'Owensboro', 'KY', 'OWB', '歐文斯伯勒', '肯塔基', '美國', 'USA');
INSERT INTO `region_city` VALUES (11141, 'United States', 'Louisiana', 'Baton Rouge', 'LA', 'BTR', '巴吞魯日', '路易斯安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11142, 'United States', 'Louisiana', 'Shreveport', 'LA', 'SHV', '什里夫波特', '路易斯安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11143, 'United States', 'Louisiana', 'New Orleans', 'LA', 'MSY', '新奧爾良', '路易斯安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11144, 'United States', 'Rhode Island', 'Pawtucket', 'RI', 'PAW', '波塔基特', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11145, 'United States', 'Rhode Island', 'Cranston', 'RI', 'CQH', '克蘭斯頓', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11146, 'United States', 'Rhode Island', 'Newport', 'RI', 'NPO', '紐波特', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11147, 'United States', 'Rhode Island', 'Providence', 'RI', 'PVD', '普羅維登斯', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11148, 'United States', 'Rhode Island', 'Westerly', 'RI', 'WST', '韋斯特利', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11149, 'United States', 'Rhode Island', 'Woonsocket', 'RI', 'SFN', '文索基特', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11150, 'United States', 'Rhode Island', 'Warwick', 'RI', 'UZO', '沃威克', '羅德島', '美國', 'USA');
INSERT INTO `region_city` VALUES (11151, 'United States', 'Maryland', 'Balitmore', 'MD', 'BAL', '巴爾的摩', '馬里蘭', '美國', 'USA');
INSERT INTO `region_city` VALUES (11152, 'United States', 'Maryland', 'Gaithersburg', 'MD', 'GAI', '蓋瑟斯堡', '馬里蘭', '美國', 'USA');
INSERT INTO `region_city` VALUES (11153, 'United States', 'Maryland', 'Rockville', 'MD', 'RKV', '羅克維爾', '馬里蘭', '美國', 'USA');
INSERT INTO `region_city` VALUES (11154, 'United States', 'Massachusetts', 'Boston', 'MA', 'BZD', '波士頓', '馬薩諸塞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11155, 'United States', 'Massachusetts', 'Springfield', 'MA', 'SFY', '斯普林菲爾德', '馬薩諸塞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11156, 'United States', 'Massachusetts', 'Worcester', 'MA', 'ORH', '伍斯特', '馬薩諸塞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11157, 'United States', 'Montana', 'Billings', 'MT', 'BGS', '比靈斯', '蒙大拿', '美國', 'USA');
INSERT INTO `region_city` VALUES (11158, 'United States', 'Montana', 'Great Falls', 'MT', 'GTF', '大瀑布村', '蒙大拿', '美國', 'USA');
INSERT INTO `region_city` VALUES (11159, 'United States', 'Montana', 'Missoula', 'MT', 'MSO', '米蘇拉', '蒙大拿', '美國', 'USA');
INSERT INTO `region_city` VALUES (11160, 'United States', 'Missouri', 'Columbia', 'MO', 'COV', '哥倫比亞', '密蘇里', '美國', 'USA');
INSERT INTO `region_city` VALUES (11161, 'United States', 'Missouri', 'Jefferson City', 'MO', 'JEF', '傑佛遜市', '密蘇里', '美國', 'USA');
INSERT INTO `region_city` VALUES (11162, 'United States', 'Missouri', 'Kansas City', 'MO', 'MKC', '堪薩斯城', '密蘇里', '美國', 'USA');
INSERT INTO `region_city` VALUES (11163, 'United States', 'Missouri', 'Sanit Louis', 'MO', 'STL', '聖路易斯', '密蘇里', '美國', 'USA');
INSERT INTO `region_city` VALUES (11164, 'United States', 'Missouri', 'Springfield', 'MO', 'SGF', '斯普林菲爾德', '密蘇里', '美國', 'USA');
INSERT INTO `region_city` VALUES (11165, 'United States', 'Mississippi', 'Biloxi', 'MS', 'BIX', '比洛克西', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11166, 'United States', 'Mississippi', 'Gulfport', 'MS', 'GPT', '格爾夫波特', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11167, 'United States', 'Mississippi', 'Greenville', 'MS', 'GLH', '格林維爾', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11168, 'United States', 'Mississippi', 'Hattiesburg', 'MS', 'HBG', '哈蒂斯堡', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11169, 'United States', 'Mississippi', 'Jackson', 'MS', 'JAN', '傑克遜', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11170, 'United States', 'Mississippi', 'Meridian', 'MS', 'MEI', '默里迪恩', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11171, 'United States', 'Mississippi', 'Vicksburg', 'MS', 'VKS', '維克斯堡', '密西西比', '美國', 'USA');
INSERT INTO `region_city` VALUES (11172, 'United States', 'Michigan', 'Ann Arbor', 'MI', 'ARB', '安娜堡', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11173, 'United States', 'Michigan', 'Battle Creek', 'MI', 'BTL', '巴特爾克里克', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11174, 'United States', 'Michigan', 'Bay City', 'MI', 'BCY', '貝城', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11175, 'United States', 'Michigan', 'Grand Rapids', 'MI', 'GRR', '大急流城', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11176, 'United States', 'Michigan', 'Dearborn', 'MI', 'DEO', '迪爾伯恩', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11177, 'United States', 'Michigan', 'Detroit', 'MI', 'DET', '底特律', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11178, 'United States', 'Michigan', 'Flint', 'MI', 'FNT', '弗林特', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11179, 'United States', 'Michigan', 'Wyandotte', 'MI', 'WYD', '懷恩多特', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11180, 'United States', 'Michigan', 'Kalamazoo', 'MI', 'AZO', '卡拉馬袓', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11181, 'United States', 'Michigan', 'Lansing', 'MI', 'LAN', '蘭辛', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11182, 'United States', 'Michigan', 'Muskegon', 'MI', 'MKG', '馬斯基根', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11183, 'United States', 'Michigan', 'Pontiac', 'MI', 'PTK', '龐菷亞克', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11184, 'United States', 'Michigan', 'Saginaw', 'MI', 'SGM', '薩吉諾', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11185, 'United States', 'Michigan', 'Sault Ste Marie', 'MI', 'SSM', '蘇聖瑪麗', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11186, 'United States', 'Michigan', 'Warren', 'MI', 'WAM', '沃倫', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11187, 'United States', 'Michigan', 'Port Huron', 'MI', 'PHN', '休倫港', '密歇根', '美國', 'USA');
INSERT INTO `region_city` VALUES (11188, 'United States', 'Maine', 'Bangor', 'ME', 'BNQ', '班戈', '緬因', '美國', 'USA');
INSERT INTO `region_city` VALUES (11189, 'United States', 'Maine', 'Portland', 'ME', 'POL', '波特蘭', '緬因', '美國', 'USA');
INSERT INTO `region_city` VALUES (11190, 'United States', 'Maine', 'Lewiston', 'ME', 'QLW', '劉易斯頓', '緬因', '美國', 'USA');
INSERT INTO `region_city` VALUES (11191, 'United States', 'Minnesota', 'Rochester', 'MN', 'RST', '羅切斯特', '明尼蘇達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11192, 'United States', 'Minnesota', 'Minneapolis', 'MN', 'MES', '明尼阿波利斯', '明尼蘇達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11193, 'United States', 'Minnesota', 'Saint Paul', 'MN', 'STP', '聖保羅', '明尼蘇達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11194, 'United States', 'South Dakota', 'Aberdeen', 'SD', 'ABK', '阿伯丁', '南達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11195, 'United States', 'South Dakota', 'Rapid City', 'SD', 'RAP', '拉皮德城', '南達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11196, 'United States', 'South Dakota', 'Sioux Falls', 'SD', 'FSD', '蘇福爾斯', '南達科他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11197, 'United States', 'South Carolina', 'North Charleston', 'SC', 'NTS', '北查爾斯頓', '南卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11198, 'United States', 'South Carolina', 'Charleston', 'SC', 'CHS', '查爾斯頓', '南卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11199, 'United States', 'South Carolina', 'Columbia', 'SC', 'COV', '哥倫比亞', '南卡羅來納', '美國', 'USA');
INSERT INTO `region_city` VALUES (11200, 'United States', 'Nebraska', 'Omaha', 'NE', 'OMA', '奧馬哈', '內布拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11201, 'United States', 'Nebraska', 'Bellevue', 'NE', 'XDE', '貝爾維尤', '內布拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11202, 'United States', 'Nebraska', 'Lincoln', 'NE', 'LNK', '林肯', '內布拉斯加', '美國', 'USA');
INSERT INTO `region_city` VALUES (11203, 'United States', 'Nevada', 'Elko', 'NV', 'EKO', '埃爾科', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11204, 'United States', 'Nevada', 'North Las Vegas', 'NV', 'NVS', '北拉斯維加斯', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11205, 'United States', 'Nevada', 'Virginia City', 'NV', 'VGI', '弗吉尼亞城', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11206, 'United States', 'Nevada', 'Henderson', 'NV', 'HNZ', '亨德森', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11207, 'United States', 'Nevada', 'Carson City', 'NV', 'CSN', '卡森城', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11208, 'United States', 'Nevada', 'Las Vegas', 'NV', 'LAS', '拉斯維加斯', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11209, 'United States', 'Nevada', 'Reno', 'NV', 'RNO', '里諾', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11210, 'United States', 'Nevada', 'Sparks', 'NV', 'SPK', '斯帕克斯', '內華達', '美國', 'USA');
INSERT INTO `region_city` VALUES (11211, 'United States', 'New York', 'Buffalo', 'NY', 'FFO', '布法羅', '紐約', '美國', 'USA');
INSERT INTO `region_city` VALUES (11212, 'United States', 'New York', 'Rochester', 'NY', 'ROC', '羅切斯特', '紐約', '美國', 'USA');
INSERT INTO `region_city` VALUES (11213, 'United States', 'New York', 'New York', 'NY', 'QEE', '紐約市', '紐約', '美國', 'USA');
INSERT INTO `region_city` VALUES (11214, 'United States', 'Delaware', 'Dover', 'DE', 'DOR', '多佛', '特拉華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11215, 'United States', 'Delaware', 'Newark', 'DE', 'NWK', '紐瓦克', '特拉華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11216, 'United States', 'Delaware', 'Wilmington', 'DE', 'ILG', '威明頓', '特拉華', '美國', 'USA');
INSERT INTO `region_city` VALUES (11217, 'United States', 'Tennessee', 'Bristol', 'TN', 'BSJ', '布利斯托', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11218, 'United States', 'Tennessee', 'Chattanooga', 'TN', 'CHA', '查塔努加', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11219, 'United States', 'Tennessee', 'Kingsport', 'TN', 'TRI', '金斯波特', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11220, 'United States', 'Tennessee', 'Memphis', 'TN', 'MEM', '孟菲斯', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11221, 'United States', 'Tennessee', 'Nashville', 'TN', 'BNA', '納什維爾', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11222, 'United States', 'Tennessee', 'Knoxville', 'TN', 'TYS', '諾克斯維爾', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11223, 'United States', 'Tennessee', 'Tri-City Area', 'TN', 'YTC', '三城區', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11224, 'United States', 'Tennessee', 'Smyrna', 'TN', 'MQY', '士麥那', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11225, 'United States', 'Tennessee', 'Spring Hill', 'TN', 'RGI', '斯普林希爾', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11226, 'United States', 'Tennessee', 'Johnson City', 'TN', 'JCY', '約翰遜城', '田納西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11227, 'United States', 'Wisconsin', 'Appleton', 'WI', 'ATW', '阿普尓頓', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11228, 'United States', 'Wisconsin', 'Oshkosh', 'WI', 'OSH', '奧什科什', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11229, 'United States', 'Wisconsin', 'Green Bay', 'WI', 'GBK', '格林貝', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11230, 'United States', 'Wisconsin', 'Kenosha', 'WI', 'ENW', '基諾沙', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11231, 'United States', 'Wisconsin', 'LaCrosse', 'WI', 'LSE', '拉克羅斯', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11232, 'United States', 'Wisconsin', 'Racine', 'WI', 'RAC', '拉辛', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11233, 'United States', 'Wisconsin', 'Manitowoc', 'WI', 'MTW', '馬尼托沃克', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11234, 'United States', 'Wisconsin', 'Madison', 'WI', 'QMD', '邁迪遜', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11235, 'United States', 'Wisconsin', 'Milwaukee', 'WI', 'MKE', '密爾沃基', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11236, 'United States', 'Wisconsin', 'Eau Claire', 'WI', 'EAU', '歐克萊尓', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11237, 'United States', 'Wisconsin', 'Wausau', 'WI', 'AUW', '沃索', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11238, 'United States', 'Wisconsin', 'Sheboygan', 'WI', 'SBM', '希博伊根', '威斯康星', '美國', 'USA');
INSERT INTO `region_city` VALUES (11239, 'United States', 'Virginia', 'Virginia Beach', 'VA', 'VAB', '弗吉尼亞比奇', '維吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11240, 'United States', 'Virginia', 'Norfolk', 'VA', 'ORF', '諾福克', '維吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11241, 'United States', 'Virginia', 'Chesapeake', 'VA', 'HTW', '切薩皮克', '維吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11242, 'United States', 'West Virginia', 'Charleston', 'WV', 'CRW', '查爾斯頓', '西佛吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11243, 'United States', 'West Virginia', 'Huntington', 'WV', 'HNU', '亨廷頓', '西佛吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11244, 'United States', 'West Virginia', 'Parkersburg', 'WV', 'PKB', '帕克斯堡', '西佛吉尼亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11245, 'United States', 'Hawaii', 'Kailua', 'HI', 'KHH', '凱盧阿', '夏威夷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11246, 'United States', 'Hawaii', 'Honolulu', 'HI', 'HNL', '檀香山', '夏威夷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11247, 'United States', 'Hawaii', 'Hilo', 'HI', 'ITO', '希洛', '夏威夷', '美國', 'USA');
INSERT INTO `region_city` VALUES (11248, 'United States', 'New Hampshire', 'Concord', 'NH', 'CON', '康科德', '新罕布什爾', '美國', 'USA');
INSERT INTO `region_city` VALUES (11249, 'United States', 'New Hampshire', 'Manchester', 'NH', 'MHT', '曼徹斯特', '新罕布什爾', '美國', 'USA');
INSERT INTO `region_city` VALUES (11250, 'United States', 'New Hampshire', 'Nashua', 'NH', 'ASH', '納舒厄', '新罕布什爾', '美國', 'USA');
INSERT INTO `region_city` VALUES (11251, 'United States', 'New Mexico', 'Albuquerque', 'NM', 'ABQ', '阿爾伯克基', '新墨西哥', '美國', 'USA');
INSERT INTO `region_city` VALUES (11252, 'United States', 'New Mexico', 'Las Cruces', 'NM', 'LRU', '拉斯克魯塞斯', '新墨西哥', '美國', 'USA');
INSERT INTO `region_city` VALUES (11253, 'United States', 'New Mexico', 'Roswell', 'NM', 'ROW', '羅斯韋爾', '新墨西哥', '美國', 'USA');
INSERT INTO `region_city` VALUES (11254, 'United States', 'New Mexico', 'Santa Fe', 'NM', 'SAF', '聖菲', '新墨西哥', '美國', 'USA');
INSERT INTO `region_city` VALUES (11255, 'United States', 'New Jersey', 'Newark', 'NJ', 'NRK', '紐瓦克', '新澤西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11256, 'United States', 'New Jersey', 'Paterson', 'NJ', 'PAT', '帕特森', '新澤西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11257, 'United States', 'New Jersey', 'Jersey City', 'NJ', 'JEC', '澤西城', '新澤西', '美國', 'USA');
INSERT INTO `region_city` VALUES (11258, 'United States', 'Arizona', 'Phoenix', 'AZ', 'PHX', '鳳凰城', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11259, 'United States', 'Arizona', 'Glendale', 'AZ', 'GDA', '格蘭代爾', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11260, 'United States', 'Arizona', 'Mesa', 'AZ', 'MQA', '梅薩', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11261, 'United States', 'Arizona', 'Scottsdale', 'AZ', 'STZ', '史卡茲代爾', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11262, 'United States', 'Arizona', 'Tempe', 'AZ', 'TPE', '坦普', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11263, 'United States', 'Arizona', 'Tucson', 'AZ', 'TUC', '圖森', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11264, 'United States', 'Arizona', 'Yuma', 'AZ', 'YUM', '優瑪', '亞利桑那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11265, 'United States', 'Illinois', 'Alton', 'IL', 'ALN', '奧爾頓', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11266, 'United States', 'Illinois', 'Aurora', 'IL', 'AUZ', '奧羅拉', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11267, 'United States', 'Illinois', 'Bloomington', 'IL', 'BLO', '布盧明頓', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11268, 'United States', 'Illinois', 'Danville', 'IL', 'DVI', '丹維尓', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11269, 'United States', 'Illinois', 'De Kalb', 'IL', 'DEK', '迪卡爾布', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11270, 'United States', 'Illinois', 'Decatur', 'IL', 'DEC', '迪凱持', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11271, 'United States', 'Illinois', 'East St Louis', 'IL', 'ESL', '東聖路易斯', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11272, 'United States', 'Illinois', 'Champaign-Urbana', 'IL', 'CMI', '厄巴納-香檳', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11273, 'United States', 'Illinois', 'Galesburg', 'IL', 'GSU', '蓋爾斯堡', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11274, 'United States', 'Illinois', 'Carbondale', 'IL', 'MDH', '卡本代爾', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11275, 'United States', 'Illinois', 'Rock Island', 'IL', 'RKI', '羅克艾蘭', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11276, 'United States', 'Illinois', 'Rockford', 'IL', 'RFD', '羅克福德', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11277, 'United States', 'Illinois', 'Normal', 'IL', 'NOM', '諾黙爾', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11278, 'United States', 'Illinois', 'Peoria', 'IL', 'PLA', '皮奧里亞', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11279, 'United States', 'Illinois', 'Centralia', 'IL', 'CRA', '森特勒利亞', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11280, 'United States', 'Illinois', 'Springfield', 'IL', 'SPI', '斯普林菲爾德', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11281, 'United States', 'Illinois', 'Waukegan', 'IL', 'UGN', '沃其根', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11282, 'United States', 'Illinois', 'Chicago', 'IL', 'CHI', '芝加哥', '伊利諾斯', '美國', 'USA');
INSERT INTO `region_city` VALUES (11283, 'United States', 'Indiana', 'Evansville', 'IN', 'EVV', '埃文斯維爾', '印第安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11284, 'United States', 'Indiana', 'Fort Wayne', 'IN', 'FWA', '韋恩堡', '印第安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11285, 'United States', 'Indiana', 'Indianapolis', 'IN', 'IND', '印第安納波利斯', '印第安那', '美國', 'USA');
INSERT INTO `region_city` VALUES (11286, 'United States', 'Utah', 'Ogden', 'UT', 'OGD', '奧格登', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11287, 'United States', 'Utah', 'Layton', 'UT', 'LTJ', '雷登', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11288, 'United States', 'Utah', 'Orem', 'UT', 'OEU', '歐仁', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11289, 'United States', 'Utah', 'Park City', 'UT', 'PAC', '帕克城', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11290, 'United States', 'Utah', 'Provo', 'UT', 'PVU', '普羅沃', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11291, 'United States', 'Utah', 'St.George', 'UT', 'SGU', '聖喬治', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11292, 'United States', 'Utah', 'West Valley City', 'UT', 'WVC', '西瓦利城', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11293, 'United States', 'Utah', 'Salt Lake City', 'UT', 'SLC', '鹽湖城', '猶他', '美國', 'USA');
INSERT INTO `region_city` VALUES (11294, 'United States', 'Georgia', 'Augusta', 'GA', 'AUT', '奧古斯塔', '佐治亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11295, 'United States', 'Georgia', 'Columbus', 'GA', 'CZX', '哥倫布', '佐治亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11296, 'United States', 'Georgia', 'Macon', 'GA', 'MCN', '梅肯', '佐治亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11297, 'United States', 'Georgia', 'Savannah', 'GA', 'SAV', '沙瓦納', '佐治亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11298, 'United States', 'Georgia', 'Atlanta', 'GA', 'TAT', '亞特蘭大', '佐治亞', '美國', 'USA');
INSERT INTO `region_city` VALUES (11299, 'United Kingdom', 'Northern Ireland', 'Belfast', 'NIR', 'BFS', '貝爾法斯特', '北愛爾蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11300, 'United Kingdom', 'Northern Ireland', 'Derry', 'NIR', 'DRY', '德里', '北愛爾蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11301, 'United Kingdom', 'Northern Ireland', 'Lisburn', 'NIR', 'LSB', '利斯本', '北愛爾蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11302, 'United Kingdom', 'Northern Ireland', 'Newry', 'NIR', 'NYM', '紐里', '北愛爾蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11303, 'United Kingdom', 'Scotland', 'Aberdeen', 'SCT', 'ABD', '阿伯丁', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11304, 'United Kingdom', 'Scotland', 'Edinburgh', 'SCT', 'EDH', '愛丁堡', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11305, 'United Kingdom', 'Scotland', 'Dundee', 'SCT', 'DND', '丹迪', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11306, 'United Kingdom', 'Scotland', 'Glasgow', 'SCT', 'GLG', '格拉斯哥', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11307, 'United Kingdom', 'Scotland', 'Stirling', 'SCT', 'STG', '斯特靈', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11308, 'United Kingdom', 'Scotland', 'Inverness', 'SCT', 'INV', '因弗內斯', '蘇格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11309, 'United Kingdom', 'Wales', 'Bangor', 'WLS', 'BAN', '班戈', '威爾士', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11310, 'United Kingdom', 'Wales', 'Cardiff', 'WLS', 'CDF', '卡迪夫', '威爾士', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11311, 'United Kingdom', 'Wales', 'Newport', 'WLS', 'NWP', '紐波特', '威爾士', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11312, 'United Kingdom', 'Wales', 'Swansea', 'WLS', 'SWA', '斯旺西', '威爾士', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11313, 'United Kingdom', 'England', 'Exeter', 'ENG', 'EXE', '埃克塞特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11314, 'United Kingdom', 'England', 'Bath', 'ENG', 'BAS', '巴斯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11315, 'United Kingdom', 'England', 'Peterborough', 'ENG', 'PTE', '彼得伯勒', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11316, 'United Kingdom', 'England', 'Birmingham', 'ENG', 'BIR', '伯明翰', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11317, 'United Kingdom', 'England', 'Bradford', 'ENG', 'BRD', '布拉德福德', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11318, 'United Kingdom', 'England', 'Brighton & Hove', 'ENG', 'BNH', '布萊頓與赫福', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11319, 'United Kingdom', 'England', 'Bristol', 'ENG', 'BST', '布裡斯托爾', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11320, 'United Kingdom', 'England', 'Derby', 'ENG', 'DER', '德比', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11321, 'United Kingdom', 'England', 'Durham', 'ENG', 'DUR', '德罕', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11322, 'United Kingdom', 'England', 'Gloucester', 'ENG', 'GLO', '格洛斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11323, 'United Kingdom', 'England', 'Kingston upon Hull', 'ENG', 'KUH', '赫爾河畔京斯敦', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11324, 'United Kingdom', 'England', 'Hereford', 'ENG', 'HAF', '赫里福德', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11325, 'United Kingdom', 'England', 'Cambridge', 'ENG', 'CAM', '劍橋', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11326, 'United Kingdom', 'England', 'Carlisle', 'ENG', 'CAX', '卡萊爾', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11327, 'United Kingdom', 'England', 'Canterbury', 'ENG', 'CNG', '坎特伯雷', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11328, 'United Kingdom', 'England', 'Coventry', 'ENG', 'COV', '考文垂', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11329, 'United Kingdom', 'England', 'Lancaster', 'ENG', 'LAN', '蘭開斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11330, 'United Kingdom', 'England', 'Ripon', 'ENG', 'RIP', '里彭', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11331, 'United Kingdom', 'England', 'Lichfield', 'ENG', 'LHF', '利奇菲爾德', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11332, 'United Kingdom', 'England', 'Liverpool', 'ENG', 'LIV', '利物浦', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11333, 'United Kingdom', 'England', 'Leeds', 'ENG', 'LDS', '利茲', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11334, 'United Kingdom', 'England', 'Leicester', 'ENG', 'LCE', '列斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11335, 'United Kingdom', 'England', 'Lincoln', 'ENG', 'LCN', '林肯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11336, 'United Kingdom', 'England', 'London', 'ENG', 'LND', '倫敦', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11337, 'United Kingdom', 'England', 'Manchester', 'ENG', 'MAN', '曼徹斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11338, 'United Kingdom', 'England', 'Southampton', 'ENG', 'STH', '南安普敦', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11339, 'United Kingdom', 'England', 'Oxford', 'ENG', 'OXF', '牛津', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11340, 'United Kingdom', 'England', 'Newcastle', 'ENG', 'NCL', '紐卡斯爾', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11341, 'United Kingdom', 'England', 'Nottingham', 'ENG', 'NGM', '諾丁漢', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11342, 'United Kingdom', 'England', 'Norwich', 'ENG', 'NRW', '諾里奇', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11343, 'United Kingdom', 'England', 'Portsmouth', 'ENG', 'POR', '樸茨茅斯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11344, 'United Kingdom', 'England', 'Preston', 'ENG', 'PRE', '普雷斯頓', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11345, 'United Kingdom', 'England', 'Plymouth', 'ENG', 'PLY', '普利茅斯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11346, 'United Kingdom', 'England', 'Chichester', 'ENG', 'CST', '奇切斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11347, 'United Kingdom', 'England', 'Chester', 'ENG', 'CEG', '切斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11348, 'United Kingdom', 'England', 'Sunderland', 'ENG', 'SUN', '桑德蘭', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11349, 'United Kingdom', 'England', 'Saint Albans', 'ENG', 'TBL', '聖阿本斯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11350, 'United Kingdom', 'England', 'Salisbury', 'ENG', 'SLS', '索爾斯堡', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11351, 'United Kingdom', 'England', 'Salford', 'ENG', 'SLF', '索福特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11352, 'United Kingdom', 'England', 'Truro', 'ENG', 'TRU', '特魯羅', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11353, 'United Kingdom', 'England', 'Stoke-on-Trent', 'ENG', 'SOT', '特倫特河畔斯多克', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11354, 'United Kingdom', 'England', 'Wells', 'ENG', 'WLS', '威爾斯', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11355, 'United Kingdom', 'England', 'Wakefield', 'ENG', 'WKF', '韋克菲爾德', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11356, 'United Kingdom', 'England', 'Winchester', 'ENG', 'WNE', '溫徹斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11357, 'United Kingdom', 'England', 'Wolverhampton', 'ENG', 'WOV', '伍爾弗漢普頓', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11358, 'United Kingdom', 'England', 'Worcester', 'ENG', 'WOR', '伍斯特', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11359, 'United Kingdom', 'England', 'Sheffield', 'ENG', 'SHE', '謝菲爾德', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11360, 'United Kingdom', 'England', 'Ely', 'ENG', 'ELY', '伊利', '英格蘭', '英國', 'GBR');
INSERT INTO `region_city` VALUES (11361, 'United Kingdom', 'England', 'York', 'ENG', 'YOR', '約克', '英格蘭', '英國', 'GBR');

-- ----------------------------
-- Table structure for st_region_continent
-- ----------------------------
DROP TABLE IF EXISTS `region_continent`;
CREATE TABLE `region_continent`  (
                                     `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
                                     `iso2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO二字程式碼',
                                     `cn_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
                                     `en_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
                                     `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                     `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全球7大洲' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_continent
-- ----------------------------
INSERT INTO `region_continent` VALUES (1, 'AS', '亞洲', 'Asia', NULL, NULL);
INSERT INTO `region_continent` VALUES (2, 'EU', '歐洲', 'Europe', NULL, NULL);
INSERT INTO `region_continent` VALUES (3, 'AF', '非洲', 'Africa', NULL, NULL);
INSERT INTO `region_continent` VALUES (4, 'OC', '大洋洲', 'Oceania', NULL, NULL);
INSERT INTO `region_continent` VALUES (5, 'AN', '南極洲', 'Antarctica', NULL, NULL);
INSERT INTO `region_continent` VALUES (6, 'NA', '北美洲', 'North America', NULL, NULL);
INSERT INTO `region_continent` VALUES (7, 'SA', '南美洲', 'South America', NULL, '2021-08-07 10:37:54');

-- ----------------------------
-- Table structure for st_region_country
-- ----------------------------
DROP TABLE IF EXISTS `region_country`;
CREATE TABLE `region_country`  (
                                   `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                   `continent_iso2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大陸簡碼',
                                   `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名稱',
                                   `cn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名稱',
                                   `iso2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO二字簡碼',
                                   `iso3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO三字簡碼',
                                   `iso_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO數字程式碼',
                                   `capital` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首都',
                                   `more` json NULL COMMENT '更多配置',
                                   `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                   `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '國家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_country
-- ----------------------------
INSERT INTO `region_country` VALUES (253, 'EU', 'Andorra', '安道爾', 'AD', 'AND', '020', 'Andorra la Vella', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": \"0\"}}', NULL, '2021-08-07 10:56:22');
INSERT INTO `region_country` VALUES (254, 'AS', 'United Arab Emirates', '阿拉伯聯合酋長國', 'AE', 'ARE', '784', 'Abu Dhabi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (255, 'AS', 'Afghanistan', '阿富汗', 'AF', 'AFG', '004', 'Kabul', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (256, 'NA', 'Antigua and Barbuda', '安提瓜和巴布達', 'AG', 'ATG', '028', 'St. John』s', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (257, 'NA', 'Anguilla', '安圭拉島', 'AI', 'AIA', '660', 'The Valley', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (258, 'EU', 'Albania', '阿爾巴尼亞', 'AL', 'ALB', '008', 'Tirana', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (259, 'AS', 'Armenia', '亞美尼亞', 'AM', 'ARM', '051', 'Yerevan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (260, 'NA', 'Netherlands Antilles', '荷屬安的列斯', 'AN', 'ANT', '530', 'Willemstad', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (261, 'AF', 'Angola', '安哥拉', 'AO', 'AGO', '024', 'Luanda', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (262, 'AN', 'Antarctica', '南極洲', 'AQ', 'ATA', '010', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (263, 'SA', 'Argentina', '阿根廷', 'AR', 'ARG', '032', 'Buenos Aires', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (264, 'OC', 'American Samoa', '美屬薩摩亞', 'AS', 'ASM', '016', 'Pago Pago', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (265, 'EU', 'Austria', '奧地利', 'AT', 'AUT', '040', 'Vienna', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (266, 'OC', 'Australia', '澳大利亞', 'AU', 'AUS', '036', 'Canberra', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (267, 'NA', 'Aruba', '阿魯巴島', 'AW', 'ABW', '533', 'Oranjestad', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (268, 'EU', 'Åland', '', 'AX', 'ALA', '248', 'Mariehamn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (269, 'AS', 'Azerbaijan', '阿塞拜疆', 'AZ', 'AZE', '031', 'Baku', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (270, 'EU', 'Bosnia and Herzegovina', '波斯尼亞和黑塞哥維那', 'BA', 'BIH', '070', 'Sarajevo', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (271, 'NA', 'Barbados', '巴巴多斯', 'BB', 'BRB', '052', 'Bridgetown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (272, 'AS', 'Bangladesh', '孟加拉國', 'BD', 'BGD', '050', 'Dhaka', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (273, 'EU', 'Belgium', '比利時', 'BE', 'BEL', '056', 'Brussels', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (274, 'AF', 'Burkina Faso', '布基納法索', 'BF', 'BFA', '854', 'Ouagadougou', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (275, 'EU', 'Bulgaria', '保加利亞', 'BG', 'BGR', '100', 'Sofia', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (276, 'AS', 'Bahrain', '巴林', 'BH', 'BHR', '048', 'Manama', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (277, 'AF', 'Burundi', '布隆迪', 'BI', 'BDI', '108', 'Gitega', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (278, 'AF', 'Benin', '貝寧', 'BJ', 'BEN', '204', 'Porto-Novo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (279, 'NA', 'Saint Barthélemy', '聖巴塞洛繆', 'BL', 'BLM', '652', 'Gustavia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (280, 'NA', 'Bermuda', '百慕大', 'BM', 'BMU', '060', 'Hamilton', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (281, 'AS', 'Brunei', '文萊', 'BN', 'BRN', '096', 'Bandar Seri Begawan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (282, 'SA', 'Bolivia', '玻利維亞', 'BO', 'BOL', '068', 'Sucre', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (283, 'NA', 'Bonaire, Sint Eustatius, and Saba', '博內爾，聖尤斯特歇斯和薩巴', 'BQ', 'BES', '535', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (284, 'SA', 'Brazil', '巴西', 'BR', 'BRA', '076', 'Brasilia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (285, 'NA', 'Bahamas', '巴哈馬', 'BS', 'BHS', '044', 'Nassau', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (286, 'AS', 'Bhutan', '不丹', 'BT', 'BTN', '064', 'Thimphu', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (287, 'AN', 'Bouvet Island', '布維島', 'BV', 'BVT', '074', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (288, 'AF', 'Botswana', '博茨瓦納', 'BW', 'BWA', '072', 'Gaborone', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (289, 'EU', 'Belarus', '白俄羅斯', 'BY', 'BLR', '112', 'Minsk', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (290, 'NA', 'Belize', '伯利茲', 'BZ', 'BLZ', '084', 'Belmopan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (291, 'NA', 'Canada', '加拿大', 'CA', 'CAN', '124', 'Ottawa', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 14}}', NULL, NULL);
INSERT INTO `region_country` VALUES (292, 'AS', 'Cocos [Keeling] Islands', '[基林]群島', 'CC', 'CCK', '166', 'West Island', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (293, 'AF', 'DR Congo', '剛果民主共和國', 'CD', 'COD', '180', 'Kinshasa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (294, 'AF', 'Central African Republic', '中非共和國', 'CF', 'CAF', '140', 'Bangui', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (295, 'AF', 'Congo Republic', '剛果共和國', 'CG', 'COG', '178', 'Brazzaville', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (296, 'EU', 'Switzerland', '瑞士', 'CH', 'CHE', '756', 'Bern', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (297, 'AF', 'Ivory Coast', '', 'CI', 'CIV', '384', 'Yamoussoukro', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (298, 'OC', 'Cook Islands', '庫克羣島', 'CK', 'COK', '184', 'Avarua', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (299, 'SA', 'Chile', '智利', 'CL', 'CHL', '152', 'Santiago', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (300, 'AF', 'Cameroon', '喀麥隆', 'CM', 'CMR', '120', 'Yaounde', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (301, 'AS', 'China', '中國', 'CN', 'CHN', '156', 'Beijing', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (302, 'SA', 'Colombia', '哥倫比亞', 'CO', 'COL', '170', 'Bogota', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (303, 'NA', 'Costa Rica', '哥斯達黎加', 'CR', 'CRI', '188', 'San Jose', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (304, 'EU', 'Serbia and Montenegro', '塞爾維亞和黑山', 'CS', 'SCG', '891', 'Belgrade', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (305, 'NA', 'Cuba', '古巴', 'CU', 'CUB', '192', 'Havana', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (306, 'AF', 'Cabo Verde', '佛得角', 'CV', 'CPV', '132', 'Praia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (307, 'NA', 'Curaçao', '庫拉索', 'CW', 'CUW', '531', 'Willemstad', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (308, 'OC', 'Christmas Island', '聖誕島', 'CX', 'CXR', '162', 'Flying Fish Cove', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (309, 'EU', 'Cyprus', '塞浦路斯', 'CY', 'CYP', '196', 'Nicosia', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (310, 'EU', 'Czechia', '捷克', 'CZ', 'CZE', '203', 'Prague', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (311, 'EU', 'Germany', '德國', 'DE', 'DEU', '276', 'Berlin', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (312, 'AF', 'Djibouti', '吉布地', 'DJ', 'DJI', '262', 'Djibouti', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (313, 'EU', 'Denmark', '丹麥', 'DK', 'DNK', '208', 'Copenhagen', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (314, 'NA', 'Dominica', '多米尼加', 'DM', 'DMA', '212', 'Roseau', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (315, 'NA', 'Dominican Republic', '多明尼加共和國', 'DO', 'DOM', '214', 'Santo Domingo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (316, 'AF', 'Algeria', '阿爾及利亞', 'DZ', 'DZA', '012', 'Algiers', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (317, 'SA', 'Ecuador', '厄瓜多爾', 'EC', 'ECU', '218', 'Quito', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (318, 'EU', 'Estonia', '愛沙尼亞', 'EE', 'EST', '233', 'Tallinn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (319, 'AF', 'Egypt', '埃及', 'EG', 'EGY', '818', 'Cairo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (320, 'AF', 'Western Sahara', '西撒哈拉', 'EH', 'ESH', '732', 'El-Aaiun', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (321, 'AF', 'Eritrea', '厄立特里亞', 'ER', 'ERI', '232', 'Asmara', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (322, 'EU', 'Spain', '西班牙', 'ES', 'ESP', '724', 'Madrid', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (323, 'AF', 'Ethiopia', '埃塞俄比亞', 'ET', 'ETH', '231', 'Addis Ababa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (324, 'EU', 'Finland', '芬蘭', 'FI', 'FIN', '246', 'Helsinki', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (325, 'OC', 'Fiji', '斐濟', 'FJ', 'FJI', '242', 'Suva', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (326, 'SA', 'Falkland Islands', '福克蘭羣島', 'FK', 'FLK', '238', 'Stanley', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (327, 'OC', 'Micronesia', '密克羅尼西亞', 'FM', 'FSM', '583', 'Palikir', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (328, 'EU', 'Faroe Islands', '法羅群島', 'FO', 'FRO', '234', 'Torshavn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (329, 'EU', 'France', '法國', 'FR', 'FRA', '250', 'Paris', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (330, 'AF', 'Gabon', '加蓬', 'GA', 'GAB', '266', 'Libreville', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (331, 'EU', 'United Kingdom', '英國', 'GB', 'GBR', '826', 'London', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (332, 'NA', 'Grenada', '格林納達', 'GD', 'GRD', '308', 'St. George』s', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (333, 'AS', 'Georgia', '佐治亞州', 'GE', 'GEO', '268', 'Tbilisi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (334, 'SA', 'French Guiana', '法屬圭亞那', 'GF', 'GUF', '254', 'Cayenne', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (335, 'EU', 'Guernsey', '根西島', 'GG', 'GGY', '831', 'St Peter Port', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (336, 'AF', 'Ghana', '加納', 'GH', 'GHA', '288', 'Accra', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (337, 'EU', 'Gibraltar', '直布羅陀', 'GI', 'GIB', '292', 'Gibraltar', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (338, 'NA', 'Greenland', '格陵蘭', 'GL', 'GRL', '304', 'Nuuk', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (339, 'AF', 'Gambia', '岡比亞', 'GM', 'GMB', '270', 'Banjul', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (340, 'AF', 'Guinea', '幾內亞', 'GN', 'GIN', '324', 'Conakry', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (341, 'NA', 'Guadeloupe', '瓜德羅普島', 'GP', 'GLP', '312', 'Basse-Terre', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (342, 'AF', 'Equatorial Guinea', '幾內亞', 'GQ', 'GNQ', '226', 'Malabo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (343, 'EU', 'Greece', '希臘', 'GR', 'GRC', '300', 'Athens', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (344, 'AN', 'South Georgia and South Sandwich Islands', '南喬治亞島和南桑威奇群島', 'GS', 'SGS', '239', 'Grytviken', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (345, 'NA', 'Guatemala', '危地馬拉', 'GT', 'GTM', '320', 'Guatemala City', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (346, 'OC', 'Guam', '關島', 'GU', 'GUM', '316', 'Hagatna', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (347, 'AF', 'Guinea-Bissau', '幾內亞比紹', 'GW', 'GNB', '624', 'Bissau', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (348, 'SA', 'Guyana', '圭亞那', 'GY', 'GUY', '328', 'Georgetown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (349, 'AS', 'Hong Kong', '中國香港', 'HK', 'HKG', '344', 'Hong Kong', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (350, 'AN', 'Heard Island and McDonald Islands', '希爾德島和麥當勞群島', 'HM', 'HMD', '334', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (351, 'NA', 'Honduras', '洪都拉斯', 'HN', 'HND', '340', 'Tegucigalpa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (352, 'EU', 'Croatia', '克羅地亞', 'HR', 'HRV', '191', 'Zagreb', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (353, 'NA', 'Haiti', '海地', 'HT', 'HTI', '332', 'Port-au-Prince', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (354, 'EU', 'Hungary', '匈牙利', 'HU', 'HUN', '348', 'Budapest', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (355, 'AS', 'Indonesia', '印度尼西亞', 'ID', 'IDN', '360', 'Jakarta', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (356, 'EU', 'Ireland', '愛爾蘭', 'IE', 'IRL', '372', 'Dublin', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (357, 'AS', 'Israel', '以色列', 'IL', 'ISR', '376', 'Jerusalem', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (358, 'EU', 'Isle of Man', '馬恩島', 'IM', 'IMN', '833', 'Douglas', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (359, 'AS', 'India', '印度', 'IN', 'IND', '356', 'New Delhi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (360, 'AS', 'British Indian Ocean Territory', '', 'IO', 'IOT', '086', 'Diego Garcia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (361, 'AS', 'Iraq', '伊拉克', 'IQ', 'IRQ', '368', 'Baghdad', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (362, 'AS', 'Iran', '伊朗', 'IR', 'IRN', '364', 'Tehran', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (363, 'EU', 'Iceland', '冰島', 'IS', 'ISL', '352', 'Reykjavik', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (364, 'EU', 'Italy', '意大利', 'IT', 'ITA', '380', 'Rome', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (365, 'EU', 'Jersey', '澤西島', 'JE', 'JEY', '832', 'Saint Helier', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (366, 'NA', 'Jamaica', '牙買加', 'JM', 'JAM', '388', 'Kingston', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (367, 'AS', 'Jordan', '約旦', 'JO', 'JOR', '400', 'Amman', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (368, 'AS', 'Japan', '日本', 'JP', 'JPN', '392', 'Tokyo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (369, 'AF', 'Kenya', '肯尼亞', 'KE', 'KEN', '404', 'Nairobi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (370, 'AS', 'Kyrgyzstan', '吉爾吉斯斯坦', 'KG', 'KGZ', '417', 'Bishkek', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (371, 'AS', 'Cambodia', '柬埔寨', 'KH', 'KHM', '116', 'Phnom Penh', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (372, 'OC', 'Kiribati', '基里巴斯', 'KI', 'KIR', '296', 'Tarawa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (373, 'AF', 'Comoros', '科摩羅', 'KM', 'COM', '174', 'Moroni', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (374, 'NA', 'St Kitts and Nevis', '聖基茨和尼維斯', 'KN', 'KNA', '659', 'Basseterre', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (375, 'AS', 'North Korea', '北朝鮮', 'KP', 'PRK', '408', 'Pyongyang', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (376, 'AS', 'South Korea', '南韓', 'KR', 'KOR', '410', 'Seoul', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (377, 'AS', 'Kuwait', '科威特', 'KW', 'KWT', '414', 'Kuwait City', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (378, 'NA', 'Cayman Islands', '開曼群島', 'KY', 'CYM', '136', 'George Town', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (379, 'AS', 'Kazakhstan', '哈薩克斯坦', 'KZ', 'KAZ', '398', 'Nur-Sultan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (380, 'AS', 'Laos', '老撾', 'LA', 'LAO', '418', 'Vientiane', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (381, 'AS', 'Lebanon', '黎巴嫩', 'LB', 'LBN', '422', 'Beirut', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (382, 'NA', 'Saint Lucia', '聖盧西亞', 'LC', 'LCA', '662', 'Castries', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (383, 'EU', 'Liechtenstein', '列支敦士登', 'LI', 'LIE', '438', 'Vaduz', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (384, 'AS', 'Sri Lanka', '斯里蘭卡', 'LK', 'LKA', '144', 'Colombo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (385, 'AF', 'Liberia', '利比里亞', 'LR', 'LBR', '430', 'Monrovia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (386, 'AF', 'Lesotho', '萊索托', 'LS', 'LSO', '426', 'Maseru', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (387, 'EU', 'Lithuania', '立陶宛', 'LT', 'LTU', '440', 'Vilnius', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (388, 'EU', 'Luxembourg', '盧森堡', 'LU', 'LUX', '442', 'Luxembourg', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (389, 'EU', 'Latvia', '拉脫維亞', 'LV', 'LVA', '428', 'Riga', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (390, 'AF', 'Libya', '利比亞', 'LY', 'LBY', '434', 'Tripoli', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (391, 'AF', 'Morocco', '摩洛哥', 'MA', 'MAR', '504', 'Rabat', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (392, 'EU', 'Monaco', '摩納哥', 'MC', 'MCO', '492', 'Monaco', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (393, 'EU', 'Moldova', '摩爾多瓦', 'MD', 'MDA', '498', 'Chisinau', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (394, 'EU', 'Montenegro', '黑山共和國', 'ME', 'MNE', '499', 'Podgorica', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (395, 'NA', 'Saint Martin', '聖馬丁', 'MF', 'MAF', '663', 'Marigot', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (396, 'AF', 'Madagascar', '馬達加斯加', 'MG', 'MDG', '450', 'Antananarivo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (397, 'OC', 'Marshall Islands', '馬紹爾群島', 'MH', 'MHL', '584', 'Majuro', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (398, 'EU', 'North Macedonia', '北馬其頓', 'MK', 'MKD', '807', 'Skopje', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (399, 'AF', 'Mali', '馬里', 'ML', 'MLI', '466', 'Bamako', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (400, 'AS', 'Myanmar', '緬甸', 'MM', 'MMR', '104', 'Nay Pyi Taw', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (401, 'AS', 'Mongolia', '蒙古', 'MN', 'MNG', '496', 'Ulaanbaatar', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (402, 'AS', 'Macao', '中國澳門', 'MO', 'MAC', '446', 'Macao', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (403, 'OC', 'Northern Mariana Islands', '北馬裡亞納羣島', 'MP', 'MNP', '580', 'Saipan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (404, 'NA', 'Martinique', '馬提尼克島', 'MQ', 'MTQ', '474', 'Fort-de-France', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (405, 'AF', 'Mauritania', '毛里塔尼亞', 'MR', 'MRT', '478', 'Nouakchott', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (406, 'NA', 'Montserrat', '蒙特塞拉特', 'MS', 'MSR', '500', 'Plymouth', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (407, 'EU', 'Malta', '馬耳他', 'MT', 'MLT', '470', 'Valletta', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (408, 'AF', 'Mauritius', '毛里求斯', 'MU', 'MUS', '480', 'Port Louis', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (409, 'AS', 'Maldives', '馬爾代夫', 'MV', 'MDV', '462', 'Male', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (410, 'AF', 'Malawi', '馬拉維', 'MW', 'MWI', '454', 'Lilongwe', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (411, 'NA', 'Mexico', '墨西哥', 'MX', 'MEX', '484', 'Mexico City', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (412, 'AS', 'Malaysia', '馬來西亞', 'MY', 'MYS', '458', 'Kuala Lumpur', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (413, 'AF', 'Mozambique', '莫桑比克', 'MZ', 'MOZ', '508', 'Maputo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (414, 'AF', 'Namibia', '納米比亞', 'NA', 'NAM', '516', 'Windhoek', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (415, 'OC', 'New Caledonia', '新喀里多尼亞', 'NC', 'NCL', '540', 'Noumea', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (416, 'AF', 'Niger', '尼日爾', 'NE', 'NER', '562', 'Niamey', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (417, 'OC', 'Norfolk Island', '諾福克島', 'NF', 'NFK', '574', 'Kingston', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (418, 'AF', 'Nigeria', '', 'NG', 'NGA', '566', 'Abuja', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (419, 'NA', 'Nicaragua', '尼加拉瓜', 'NI', 'NIC', '558', 'Managua', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (420, 'EU', 'Netherlands', '荷蘭', 'NL', 'NLD', '528', 'Amsterdam', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (421, 'EU', 'Norway', '挪威', 'NO', 'NOR', '578', 'Oslo', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (422, 'AS', 'Nepal', '尼泊爾', 'NP', 'NPL', '524', 'Kathmandu', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (423, 'OC', 'Nauru', '瑙魯', 'NR', 'NRU', '520', 'Yaren', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (424, 'OC', 'Niue', '紐埃', 'NU', 'NIU', '570', 'Alofi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (425, 'OC', 'New Zealand', '新西蘭', 'NZ', 'NZL', '554', 'Wellington', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (426, 'AS', 'Oman', '阿曼', 'OM', 'OMN', '512', 'Muscat', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (427, 'NA', 'Panama', '巴拿馬', 'PA', 'PAN', '591', 'Panama City', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (428, 'SA', 'Peru', '秘魯', 'PE', 'PER', '604', 'Lima', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (429, 'OC', 'French Polynesia', '法屬波利尼西亞', 'PF', 'PYF', '258', 'Papeete', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (430, 'OC', 'Papua New Guinea', '巴布亞新幾內亞', 'PG', 'PNG', '598', 'Port Moresby', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (431, 'AS', 'Philippines', '菲律賓', 'PH', 'PHL', '608', 'Manila', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (432, 'AS', 'Pakistan', '巴基斯坦', 'PK', 'PAK', '586', 'Islamabad', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (433, 'EU', 'Poland', '波蘭', 'PL', 'POL', '616', 'Warsaw', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (434, 'NA', 'Saint Pierre and Miquelon', '聖皮埃爾和密克隆群島', 'PM', 'SPM', '666', 'Saint-Pierre', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (435, 'OC', 'Pitcairn Islands', '皮特凱恩群島', 'PN', 'PCN', '612', 'Adamstown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (436, 'NA', 'Puerto Rico', '波多黎各', 'PR', 'PRI', '630', 'San Juan', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (437, 'AS', 'Palestine', '巴勒斯坦', 'PS', 'PSE', '275', 'East Jerusalem', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (438, 'EU', 'Portugal', '葡萄牙', 'PT', 'PRT', '620', 'Lisbon', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (439, 'OC', 'Palau', '帕勞', 'PW', 'PLW', '585', 'Melekeok', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (440, 'SA', 'Paraguay', '巴拉圭', 'PY', 'PRY', '600', 'Asuncion', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (441, 'AS', 'Qatar', '卡塔爾', 'QA', 'QAT', '634', 'Doha', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (442, 'AF', 'Réunion', '留尼汪', 'RE', 'REU', '638', 'Saint-Denis', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (443, 'EU', 'Romania', '羅馬尼亞', 'RO', 'ROU', '642', 'Bucharest', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (444, 'EU', 'Serbia', '塞爾維亞', 'RS', 'SRB', '688', 'Belgrade', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (445, 'EU', 'Russia', '俄國', 'RU', 'RUS', '643', 'Moscow', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (446, 'AF', 'Rwanda', '盧旺達', 'RW', 'RWA', '646', 'Kigali', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (447, 'AS', 'Saudi Arabia', '沙特阿拉伯', 'SA', 'SAU', '682', 'Riyadh', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (448, 'OC', 'Solomon Islands', '所羅門群島', 'SB', 'SLB', '090', 'Honiara', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (449, 'AF', 'Seychelles', '塞舌爾', 'SC', 'SYC', '690', 'Victoria', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (450, 'AF', 'Sudan', '蘇丹', 'SD', 'SDN', '729', 'Khartoum', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (451, 'EU', 'Sweden', '瑞典', 'SE', 'SWE', '752', 'Stockholm', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (452, 'AS', 'Singapore', '新加坡', 'SG', 'SGP', '702', 'Singapore', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (453, 'AF', 'Saint Helena', '聖海倫娜', 'SH', 'SHN', '654', 'Jamestown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (454, 'EU', 'Slovenia', '斯洛文尼亞', 'SI', 'SVN', '705', 'Ljubljana', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (455, 'EU', 'Svalbard and Jan Mayen', '斯瓦爾巴和揚·馬延', 'SJ', 'SJM', '744', 'Longyearbyen', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (456, 'EU', 'Slovakia', '斯洛伐克', 'SK', 'SVK', '703', 'Bratislava', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (457, 'AF', 'Sierra Leone', '塞拉利昂', 'SL', 'SLE', '694', 'Freetown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (458, 'EU', 'San Marino', '聖馬力諾', 'SM', 'SMR', '674', 'San Marino', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (459, 'AF', 'Senegal', '塞內加爾', 'SN', 'SEN', '686', 'Dakar', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (460, 'AF', 'Somalia', '索馬里', 'SO', 'SOM', '706', 'Mogadishu', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (461, 'SA', 'Suriname', '蘇里南', 'SR', 'SUR', '740', 'Paramaribo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (462, 'AF', 'South Sudan', '南蘇丹', 'SS', 'SSD', '728', 'Juba', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (463, 'AF', 'São Tomé and Príncipe', '聖多美和普林西比', 'ST', 'STP', '678', 'Sao Tome', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (464, 'NA', 'El Salvador', '薩爾瓦多', 'SV', 'SLV', '222', 'San Salvador', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (465, 'NA', 'Sint Maarten', '聖馬丁', 'SX', 'SXM', '534', 'Philipsburg', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (466, 'AS', 'Syria', '敘利亞', 'SY', 'SYR', '760', 'Damascus', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (467, 'AF', 'Eswatini', '埃斯瓦蒂尼', 'SZ', 'SWZ', '748', 'Mbabane', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (468, 'NA', 'Turks and Caicos Islands', '特克斯和凱科斯群島', 'TC', 'TCA', '796', 'Cockburn Town', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (469, 'AF', 'Chad', '乍得', 'TD', 'TCD', '148', 'N』Djamena', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (470, 'AN', 'French Southern Territories', '法屬南部領地', 'TF', 'ATF', '260', 'Port-aux-Francais', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (471, 'AF', 'Togo', '多哥', 'TG', 'TGO', '768', 'Lome', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (472, 'AS', 'Thailand', '泰國', 'TH', 'THA', '764', 'Bangkok', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (473, 'AS', 'Tajikistan', '塔吉克斯坦', 'TJ', 'TJK', '762', 'Dushanbe', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (474, 'OC', 'Tokelau', '托克勞', 'TK', 'TKL', '772', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (475, 'OC', 'Timor-Leste', '東帝汶', 'TL', 'TLS', '626', 'Dili', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (476, 'AS', 'Turkmenistan', '土庫曼斯坦', 'TM', 'TKM', '795', 'Ashgabat', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (477, 'AF', 'Tunisia', '突尼斯', 'TN', 'TUN', '788', 'Tunis', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (478, 'OC', 'Tonga', '湯加', 'TO', 'TON', '776', 'Nuku』alofa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (479, 'AS', 'Turkey', '土耳其', 'TR', 'TUR', '792', 'Ankara', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (480, 'NA', 'Trinidad and Tobago', '特立尼達和多巴哥', 'TT', 'TTO', '780', 'Port of Spain', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (481, 'OC', 'Tuvalu', '圖瓦盧', 'TV', 'TUV', '798', 'Funafuti', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (482, 'AS', 'Taiwan', '中國臺灣', 'TW', 'TWN', '158', 'Taipei', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (483, 'AF', 'Tanzania', '坦桑尼亞', 'TZ', 'TZA', '834', 'Dodoma', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (484, 'EU', 'Ukraine', '烏克蘭', 'UA', 'UKR', '804', 'Kyiv', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (485, 'AF', 'Uganda', '烏干達', 'UG', 'UGA', '800', 'Kampala', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (486, 'OC', 'U.S. Minor Outlying Islands', '', 'UM', 'UMI', '581', '', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (487, 'NA', 'United States', '美國', 'US', 'USA', '840', 'Washington', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (488, 'SA', 'Uruguay', '烏拉圭', 'UY', 'URY', '858', 'Montevideo', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (489, 'AS', 'Uzbekistan', '烏茲別克斯坦', 'UZ', 'UZB', '860', 'Tashkent', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (490, 'EU', 'Vatican City', '梵蒂岡城', 'VA', 'VAT', '336', 'Vatican City', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (491, 'NA', 'St Vincent and Grenadines', '聖文森特和格林納丁斯', 'VC', 'VCT', '670', 'Kingstown', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (492, 'SA', 'Venezuela', '委內瑞拉', 'VE', 'VEN', '862', 'Caracas', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (493, 'NA', 'British Virgin Islands', '英屬維爾京群島', 'VG', 'VGB', '092', 'Road Town', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (494, 'NA', 'U.S. Virgin Islands', '美屬維爾京群島', 'VI', 'VIR', '850', 'Charlotte Amalie', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (495, 'AS', 'Vietnam', '越南', 'VN', 'VNM', '704', 'Hanoi', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (496, 'OC', 'Vanuatu', '瓦努阿圖', 'VU', 'VUT', '548', 'Port Vila', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (497, 'OC', 'Wallis and Futuna', '瓦利斯和富圖納群島', 'WF', 'WLF', '876', 'Mata Utu', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (498, 'OC', 'Samoa', '薩摩亞', 'WS', 'WSM', '882', 'Apia', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (499, 'EU', 'Kosovo', '科索沃', 'XK', 'XKX', '0', 'Pristina', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `region_country` VALUES (500, 'AS', 'Yemen', '也門', 'YE', 'YEM', '887', 'Sanaa', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (501, 'AF', 'Mayotte', '馬約特島', 'YT', 'MYT', '175', 'Mamoudzou', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (502, 'AF', 'South Africa', '南非', 'ZA', 'ZAF', '710', 'Pretoria', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (503, 'AF', 'Zambia', '贊比亞', 'ZM', 'ZMB', '894', 'Lusaka', NULL, NULL, NULL);
INSERT INTO `region_country` VALUES (504, 'AF', 'Zimbabwe', '津巴布韋', 'ZW', 'ZWE', '716', 'Harare', '{\"tax_config\": {\"rate\": null, \"order_amount\": null}}', NULL, '2021-08-07 14:59:44');

-- ----------------------------
-- Table structure for st_shipping_option
-- ----------------------------
DROP TABLE IF EXISTS `shipping_option`;
CREATE TABLE `shipping_option`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配送名稱',
                                    `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
                                    `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                    `status` int(11) NOT NULL DEFAULT 1 COMMENT '狀態：1 啟動，2 禁用',
                                    `more` json NULL,
                                    `created_at` datetime(0) NULL DEFAULT NULL,
                                    `updated_at` datetime(0) NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配送方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_shipping_option
-- ----------------------------
INSERT INTO `shipping_option` VALUES (13, 'Standard Global Express (6-9  business days)', 'Ship with DHL,UPS,TNT,or FedEx etc.  Delivery time 6-9 business days', 'kuaidi', 1, NULL, '2021-06-07 09:49:37', '2021-08-01 21:06:34');
INSERT INTO `shipping_option` VALUES (30, 'United States UPS By Sea (48-58 days)', 'Only Ship to United States; Delivery time 48-58 days, shipped by sea, one shipment each week，no tracking updates during first 25-35 days(Floating on the sea), until your parcel is received and scanned by UPS or USPS;Slow but cheap', 'kuaidiSupper', 1, NULL, '2021-06-07 09:49:39', '2021-06-07 09:49:39');

-- ----------------------------
-- Table structure for st_shipping_option_config
-- ----------------------------
DROP TABLE IF EXISTS `shipping_option_config`;
CREATE TABLE `shipping_option_config`  (
                                           `id` int(11) NOT NULL AUTO_INCREMENT,
                                           `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '標題',
                                           `shipping_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '配送方式id',
                                           `countries` json NOT NULL COMMENT '國家',
                                           `states` json NULL COMMENT '省',
                                           `more` json NOT NULL COMMENT '配置',
                                           `status` int(11) NOT NULL DEFAULT 1 COMMENT '狀態：1 啟動，2 禁用',
                                           `created_at` datetime(0) NULL DEFAULT NULL,
                                           `updated_at` datetime(0) NULL DEFAULT NULL,
                                           `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配送費用公式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_shipping_option_config
-- ----------------------------
INSERT INTO `shipping_option_config` VALUES (126, '美國UPS 海運', 30, '[\"US\"]', NULL, '{\"over_weight\": {\"amount\": \"5.5\", \"weight\": 1000}, \"range_wieght\": [{\"range\": {\"end\": 100000, \"start\": 10}, \"first_weight\": {\"amount\": \"3.2\", \"weight\": 10}, \"continued_weight\": {\"amount\": \"0.046\", \"weight\": 10}}]}', 1, '2021-06-07 12:23:50', '2021-06-07 12:23:50', NULL);
INSERT INTO `shipping_option_config` VALUES (133, '全部國家', 13, '[\"AF\", \"AX\", \"AL\", \"DZ\", \"AS\", \"AD\", \"AO\", \"AI\", \"AQ\", \"AG\", \"AR\", \"AM\", \"AW\", \"AU\", \"AT\", \"AZ\", \"BS\", \"BH\", \"BD\", \"BB\", \"BY\", \"BE\", \"BZ\", \"BJ\", \"BM\", \"BT\", \"BO\", \"BQ\", \"BA\", \"BW\", \"BV\", \"BR\", \"IO\", \"VG\", \"BN\", \"BG\", \"BF\", \"BI\", \"CV\", \"KH\", \"CM\", \"CA\", \"KY\", \"CF\", \"TD\", \"CL\", \"CN\", \"CX\", \"CC\", \"CO\", \"KM\", \"CG\", \"CK\", \"CR\", \"HR\", \"CU\", \"CW\", \"CY\", \"CZ\", \"DK\", \"DJ\", \"DM\", \"DO\", \"CD\", \"EC\", \"EG\", \"SV\", \"GQ\", \"ER\", \"EE\", \"SZ\", \"ET\", \"FK\", \"FO\", \"FJ\", \"FI\", \"FR\", \"GF\", \"PF\", \"TF\", \"GA\", \"GM\", \"GE\", \"DE\", \"GH\", \"GI\", \"GR\", \"GL\", \"GD\", \"GP\", \"GU\", \"GT\", \"GG\", \"GN\", \"GW\", \"GY\", \"HT\", \"HM\", \"HN\", \"HK\", \"HU\", \"IS\", \"IN\", \"ID\", \"IR\", \"IQ\", \"IE\", \"IM\", \"IL\", \"IT\", \"CI\", \"JM\", \"JP\", \"JE\", \"JO\", \"KZ\", \"KE\", \"KI\", \"XK\", \"KW\", \"KG\", \"LA\", \"LV\", \"LB\", \"LS\", \"LR\", \"LY\", \"LI\", \"LT\", \"LU\", \"MO\", \"MG\", \"MW\", \"MY\", \"MV\", \"ML\", \"MT\", \"MH\", \"MQ\", \"MR\", \"MU\", \"YT\", \"MX\", \"FM\", \"MD\", \"MC\", \"MN\", \"ME\", \"MS\", \"MA\", \"MZ\", \"MM\", \"NA\", \"NR\", \"NP\", \"NL\", \"AN\", \"NC\", \"NZ\", \"NI\", \"NE\", \"NG\", \"NU\", \"NF\", \"KP\", \"MK\", \"MP\", \"NO\", \"OM\", \"PK\", \"PW\", \"PS\", \"PA\", \"PG\", \"PY\", \"PE\", \"PH\", \"PN\", \"PL\", \"PT\", \"PR\", \"QA\", \"RE\", \"RO\", \"RU\", \"RW\", \"BL\", \"SH\", \"LC\", \"MF\", \"PM\", \"WS\", \"SM\", \"ST\", \"SA\", \"SN\", \"RS\", \"CS\", \"SC\", \"SL\", \"SG\", \"SX\", \"SK\", \"SI\", \"SB\", \"SO\", \"ZA\", \"GS\", \"KR\", \"SS\", \"ES\", \"LK\", \"KN\", \"VC\", \"SD\", \"SR\", \"SJ\", \"SE\", \"CH\", \"SY\", \"TW\", \"TJ\", \"TZ\", \"TH\", \"TL\", \"TG\", \"TK\", \"TO\", \"TT\", \"TN\", \"TR\", \"TM\", \"TC\", \"TV\", \"UM\", \"VI\", \"UG\", \"UA\", \"AE\", \"GB\", \"US\", \"UY\", \"UZ\", \"VU\", \"VA\", \"VE\", \"VN\", \"WF\", \"EH\", \"YE\", \"ZM\", \"ZW\"]', NULL, '{\"over_weight\": {\"amount\": \"6.5\", \"weight\": \"1000\"}, \"range_wieght\": [{\"range\": {\"end\": \"20500\", \"start\": \"0\"}, \"first_weight\": {\"amount\": \"20\", \"weight\": \"500\"}, \"continued_weight\": {\"amount\": \"4\", \"weight\": \"500\"}}, {\"range\": {\"end\": \"30500\", \"start\": \"20500\"}, \"first_weight\": {\"amount\": \"1\", \"weight\": \"500\"}, \"continued_weight\": {\"amount\": \"1\", \"weight\": \"500\"}}]}', 1, '2021-06-07 11:07:00', '2021-08-08 13:29:31', NULL);

-- ----------------------------
-- Table structure for st_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用者id',
                                  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                  `product_id` int(11) NOT NULL DEFAULT 0,
                                  `product_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '加入購物車時的價格，不作為結算單價',
                                  `qty` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '數量',
                                  `is_buy_now` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是立即購買',
                                  `created_at` datetime(0) NULL DEFAULT NULL,
                                  `updated_at` datetime(0) NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE,
                                  UNIQUE INDEX `uniq_uuid_product_id`(`uuid`, `product_id`, `is_buy_now`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '購物車' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (8, 0, '49608b08-06ff-49c0-abe2-f2ef2097d680', 1, 22.00, 1, 0, '2021-08-11 15:08:25', '2021-08-11 15:08:25');
INSERT INTO `shopping_cart` VALUES (9, 0, 'f5bc0875-d7ed-45af-bedf-33d3c028cae5', 1, 22.00, 1, 0, '2021-08-11 15:08:32', '2021-08-11 15:08:32');
INSERT INTO `shopping_cart` VALUES (10, 0, '0c0d8a37-0e3b-49a5-aa5d-9a64259dd6ee', 1, 22.00, 1, 0, '2021-08-11 15:08:43', '2021-08-11 15:08:43');
INSERT INTO `shopping_cart` VALUES (14, 0, '07a51b02-bdfe-42b1-b407-98aab49dd8d4', 1, 22.00, 1, 0, '2021-09-01 17:51:19', '2021-09-01 17:51:19');
INSERT INTO `shopping_cart` VALUES (15, 0, 'dd424cf9-cc98-4b89-88e8-b45e45080eec', 7, 78.00, 1, 0, '2021-09-01 17:58:58', '2021-09-01 17:58:58');
INSERT INTO `shopping_cart` VALUES (16, 0, '0a4768df-005b-495a-8e38-22642bc60af9', 2, 45.00, 1, 0, '2021-09-01 18:06:31', '2021-09-01 18:06:31');
INSERT INTO `shopping_cart` VALUES (17, 0, '354ac525-62f9-4417-a819-89247e388483', 1, 22.00, 2, 0, '2021-09-01 18:13:56', '2021-09-01 18:14:01');
INSERT INTO `shopping_cart` VALUES (18, 0, '354ac525-62f9-4417-a819-89247e388483', 21, 22.29, 1, 0, '2021-09-01 18:15:20', '2021-09-01 18:15:20');
INSERT INTO `shopping_cart` VALUES (19, 0, '70ad3614-6e5e-41bf-9b3a-7255a9771b66', 3, 45.66, 1, 0, '2021-09-01 18:28:41', '2021-09-01 18:28:41');
INSERT INTO `shopping_cart` VALUES (20, 0, 'c697128c-06cb-41fb-b978-37a500503c58', 8, 30.00, 2, 0, '2021-09-01 18:39:47', '2021-09-01 18:39:49');
INSERT INTO `shopping_cart` VALUES (21, 0, 'e16c0bfd-d4f0-4949-9949-14ec817230e7', 21, 22.29, 1, 0, '2021-09-01 18:45:20', '2021-09-01 18:45:20');
INSERT INTO `shopping_cart` VALUES (22, 0, '9245e504-6ff0-48d8-a696-67834594fa46', 3, 45.66, 1, 0, '2021-09-01 18:45:56', '2021-09-01 18:45:56');
INSERT INTO `shopping_cart` VALUES (23, 0, '9ff9e9b0-aaea-4b5f-a172-6f2c23e874dd', 10, 67.00, 1, 0, '2021-09-01 20:06:46', '2021-09-01 20:06:46');
INSERT INTO `shopping_cart` VALUES (24, 0, '725f5672-0af7-4f90-8cff-6cfb7ec08dd0', 11, 45.00, 1, 0, '2021-09-01 23:05:02', '2021-09-01 23:05:02');
INSERT INTO `shopping_cart` VALUES (25, 0, '16511812-236d-408b-93dc-754e953c0130', 3, 45.66, 1, 0, '2021-09-01 23:33:27', '2021-09-01 23:33:27');
INSERT INTO `shopping_cart` VALUES (26, 0, '130c7ba4-db2e-4f2b-b398-8287f0b28a91', 15, 56.00, 1, 0, '2021-09-01 23:57:26', '2021-09-01 23:57:26');
INSERT INTO `shopping_cart` VALUES (27, 0, '82e6a0b9-1325-48a1-b391-db3673bd1c7f', 3, 45.66, 1, 0, '2021-09-02 05:10:08', '2021-09-02 05:10:08');
INSERT INTO `shopping_cart` VALUES (28, 0, '409ab756-5bd9-4b86-9854-aa69246fd569', 9, 45.00, 1, 0, '2021-09-02 06:53:00', '2021-09-02 06:53:00');
INSERT INTO `shopping_cart` VALUES (29, 0, 'dccdcc19-dcee-4339-95b6-6813c4d80fcf', 11, 45.00, 1, 0, '2021-09-02 08:05:04', '2021-09-02 08:05:04');
INSERT INTO `shopping_cart` VALUES (30, 0, 'c0b7b8b8-aa1c-4226-9258-c8951fc4c7db', 2, 45.00, 1, 0, '2021-09-02 08:41:45', '2021-09-02 08:41:45');
INSERT INTO `shopping_cart` VALUES (31, 0, '6681af22-5cf8-449b-8acd-508bd58e297e', 10, 67.00, 1, 0, '2021-09-02 08:42:08', '2021-09-02 08:42:08');
INSERT INTO `shopping_cart` VALUES (32, 0, '86deffa0-7fc4-43c5-8ad9-a36207dc0330', 5, 45.00, 1, 0, '2021-09-02 09:32:02', '2021-09-02 09:32:02');
INSERT INTO `shopping_cart` VALUES (33, 0, '725a768a-f48c-436c-9d34-8f297773499e', 4, 56.00, 1, 0, '2021-09-02 09:33:12', '2021-09-02 09:33:12');
INSERT INTO `shopping_cart` VALUES (34, 0, 'b7269374-3ce8-4f5e-b9bd-7c714d6773e3', 2, 45.00, 1, 0, '2021-09-02 09:47:04', '2021-09-02 09:47:04');
INSERT INTO `shopping_cart` VALUES (35, 0, '28bee525-255a-4db1-b3d4-cc2d82e2b807', 8, 30.00, 1, 0, '2021-09-02 11:21:32', '2021-09-02 11:21:32');
INSERT INTO `shopping_cart` VALUES (36, 0, '28bee525-255a-4db1-b3d4-cc2d82e2b807', 1, 22.00, 1, 0, '2021-09-02 11:22:11', '2021-09-02 11:22:11');
INSERT INTO `shopping_cart` VALUES (37, 0, 'b13d90c0-2843-4ba1-b3f0-f88e8aa8bc42', 2, 45.00, 1, 0, '2021-09-02 11:34:15', '2021-09-02 11:34:15');
INSERT INTO `shopping_cart` VALUES (38, 0, 'b13d90c0-2843-4ba1-b3f0-f88e8aa8bc42', 1, 22.00, 1, 0, '2021-09-02 11:34:20', '2021-09-02 11:34:20');
INSERT INTO `shopping_cart` VALUES (39, 0, '5c351f56-f53f-44d1-80fc-d94d245fafb0', 11, 45.00, 1, 0, '2021-09-02 11:40:32', '2021-09-02 11:40:32');
INSERT INTO `shopping_cart` VALUES (40, 0, 'bf39cdd6-671a-4a96-97bb-40f4493fbb2d', 3, 45.66, 1, 0, '2021-09-02 11:40:40', '2021-09-02 11:40:40');
INSERT INTO `shopping_cart` VALUES (41, 0, '25900d6c-69a9-4a25-99ce-0f18e342bf45', 1, 22.00, 1, 0, '2021-09-02 11:52:58', '2021-09-02 11:52:58');
INSERT INTO `shopping_cart` VALUES (42, 0, '9fa16f19-6e9c-4107-834b-d84b1322bae4', 7, 78.00, 1, 0, '2021-09-02 12:43:15', '2021-09-02 12:43:15');
INSERT INTO `shopping_cart` VALUES (43, 0, '5c762548-4f32-44b9-82ab-87b2b1df9cbe', 14, 409.00, 1, 0, '2021-09-02 14:28:03', '2021-09-02 14:28:03');
INSERT INTO `shopping_cart` VALUES (44, 0, '88464c02-02b7-44c0-96c7-187fa18c5086', 1, 22.00, 1, 0, '2021-09-02 15:29:15', '2021-09-02 15:29:15');
INSERT INTO `shopping_cart` VALUES (45, 0, '7ce9b889-76c1-478e-a79f-b7088d10b62c', 1, 22.00, 1, 0, '2021-09-02 17:05:24', '2021-09-02 17:05:24');
INSERT INTO `shopping_cart` VALUES (46, 0, '570dfd64-c564-431b-9137-c993259732f0', 10, 67.00, 1, 0, '2021-09-02 18:51:39', '2021-09-02 18:51:39');
INSERT INTO `shopping_cart` VALUES (47, 0, 'a5919ccd-39f3-4c21-afad-263b3ece8c6f', 3, 45.66, 1, 0, '2021-09-03 10:41:12', '2021-09-03 10:41:12');
INSERT INTO `shopping_cart` VALUES (48, 0, 'a760e24f-beac-43b9-8d28-12d0299a46e3', 11, 45.00, 1, 0, '2021-09-03 11:38:55', '2021-09-03 11:38:55');
INSERT INTO `shopping_cart` VALUES (50, 0, 'f0c1b857-1a6a-4bfc-b701-42696cbe4645', 5, 45.00, 4, 0, '2021-09-03 12:08:24', '2021-09-03 12:08:29');
INSERT INTO `shopping_cart` VALUES (51, 0, '4c0c9ff6-0628-4818-9a1f-0c80b9917baf', 10, 67.00, 1, 0, '2021-09-03 12:28:38', '2021-09-03 12:28:38');
INSERT INTO `shopping_cart` VALUES (52, 0, '24d423ca-62b3-4b5b-95f6-7519eb77d902', 9, 45.00, 1, 0, '2021-09-03 15:27:31', '2021-09-03 15:27:31');
INSERT INTO `shopping_cart` VALUES (53, 0, '3726259d-f42c-4ac7-b0ea-606a100d108f', 11, 45.00, 1, 0, '2021-09-03 15:37:37', '2021-09-03 15:37:37');
INSERT INTO `shopping_cart` VALUES (54, 0, '8cf3cd61-e2ac-4d3d-9111-879a271dd42b', 9, 45.00, 1, 0, '2021-09-03 15:48:44', '2021-09-03 15:48:44');
INSERT INTO `shopping_cart` VALUES (55, 0, 'd6a415f9-a18d-4027-97ea-7058e68dfdb7', 2, 45.00, 1, 0, '2021-09-03 16:02:16', '2021-09-03 16:02:16');
INSERT INTO `shopping_cart` VALUES (56, 0, 'a43419a0-cc32-4c3b-b291-2fe7bd5a0f31', 11, 45.00, 1, 0, '2021-09-03 16:06:57', '2021-09-03 16:06:57');
INSERT INTO `shopping_cart` VALUES (58, 0, 'cb3391dc-3198-4c74-9b95-80dc1eb2641a', 10, 67.00, 1, 0, '2021-09-03 16:25:53', '2021-09-03 16:25:53');
INSERT INTO `shopping_cart` VALUES (59, 0, '52f289ef-8fbc-4de3-a497-f58a9cdd0df4', 21, 22.29, 1, 0, '2021-09-03 16:27:25', '2021-09-03 16:27:25');
INSERT INTO `shopping_cart` VALUES (61, 0, 'a72c32a2-d13b-4fa6-8c1d-9a260fcfee2e', 10, 67.00, 1, 0, '2021-09-03 16:53:34', '2021-09-03 16:53:34');
INSERT INTO `shopping_cart` VALUES (62, 0, 'e993b1e0-e140-430a-aeb0-634df25ff72d', 3, 45.66, 1, 0, '2021-09-03 17:00:01', '2021-09-03 17:00:01');
INSERT INTO `shopping_cart` VALUES (63, 0, '37f9afe3-945f-4952-8fbb-5bed6478d5ec', 4, 56.00, 1, 0, '2021-09-03 17:12:25', '2021-09-03 17:12:25');
INSERT INTO `shopping_cart` VALUES (64, 0, 'ac374f2e-7c6b-4713-9e5f-83a0567dd3c1', 3, 45.66, 1, 0, '2021-09-03 17:34:30', '2021-09-03 17:34:30');
INSERT INTO `shopping_cart` VALUES (65, 0, 'ac374f2e-7c6b-4713-9e5f-83a0567dd3c1', 6, 67.00, 1, 0, '2021-09-03 17:34:48', '2021-09-03 17:34:48');
INSERT INTO `shopping_cart` VALUES (66, 0, '5d3599ac-2884-4d7c-bd37-29436823b8e4', 3, 45.66, 1, 0, '2021-09-03 17:51:15', '2021-09-03 17:51:15');
INSERT INTO `shopping_cart` VALUES (67, 0, '10cdca64-499f-4450-990f-407a5873bbcc', 1, 22.00, 2, 0, '2021-09-03 18:06:08', '2021-09-03 18:06:11');
INSERT INTO `shopping_cart` VALUES (68, 0, '10cdca64-499f-4450-990f-407a5873bbcc', 17, 55.00, 1, 0, '2021-09-03 18:06:20', '2021-09-03 18:06:20');
INSERT INTO `shopping_cart` VALUES (69, 0, '10cdca64-499f-4450-990f-407a5873bbcc', 2, 45.00, 1, 0, '2021-09-03 18:06:24', '2021-09-03 18:06:24');
INSERT INTO `shopping_cart` VALUES (71, 0, 'c106e412-f0e2-43ef-b303-1578fac686a8', 9, 45.00, 1, 0, '2021-09-03 21:47:29', '2021-09-03 21:47:29');
INSERT INTO `shopping_cart` VALUES (73, 0, '4477fc86-8528-4dce-8a64-932cb43311fc', 11, 45.00, 1, 0, '2021-09-04 10:27:20', '2021-09-04 10:27:20');
INSERT INTO `shopping_cart` VALUES (74, 0, '86a3adca-302b-4fb9-a5dc-4e91ce58c125', 2, 45.00, 1, 0, '2021-09-04 11:18:56', '2021-09-04 11:18:56');
INSERT INTO `shopping_cart` VALUES (75, 0, 'a31bbec3-c812-4b22-abec-0c025a55c659', 3, 45.66, 1, 0, '2021-09-04 11:23:18', '2021-09-04 11:23:18');
INSERT INTO `shopping_cart` VALUES (76, 0, 'a31bbec3-c812-4b22-abec-0c025a55c659', 1, 22.00, 1, 0, '2021-09-04 11:25:40', '2021-09-04 11:25:40');
INSERT INTO `shopping_cart` VALUES (77, 0, 'ad4bde7c-11b5-4029-8f83-8cbee2d714b3', 21, 22.29, 1, 0, '2021-09-04 11:39:21', '2021-09-04 11:39:21');
INSERT INTO `shopping_cart` VALUES (78, 0, 'f39fc7a0-835c-4fd3-a8bd-962b2dc12cf0', 9, 45.00, 1, 0, '2021-09-04 13:25:13', '2021-09-04 13:25:13');
INSERT INTO `shopping_cart` VALUES (80, 0, '92573401-d423-456e-97e3-d23eb58fe479', 1, 22.00, 1, 0, '2021-09-04 14:52:26', '2021-09-04 14:52:26');
INSERT INTO `shopping_cart` VALUES (81, 0, 'de8fc64e-fe22-4935-9652-adf6ff4666cb', 21, 22.29, 1, 0, '2021-09-04 15:13:00', '2021-09-04 15:13:00');
INSERT INTO `shopping_cart` VALUES (82, 0, '0d82952d-752a-47d0-ac61-11a48941640c', 3, 45.66, 1, 0, '2021-09-04 16:19:05', '2021-09-04 16:19:05');
INSERT INTO `shopping_cart` VALUES (83, 0, '66f04870-6949-44f0-be93-fcdc79f84d37', 3, 45.66, 1, 0, '2021-09-04 17:04:09', '2021-09-04 17:04:09');
INSERT INTO `shopping_cart` VALUES (84, 0, '45b640dc-202f-4b54-bfa5-fbb9cee57e6c', 5, 45.00, 1, 0, '2021-09-04 17:18:34', '2021-09-04 17:18:34');
INSERT INTO `shopping_cart` VALUES (85, 0, '45b640dc-202f-4b54-bfa5-fbb9cee57e6c', 1, 22.00, 1, 0, '2021-09-04 17:18:36', '2021-09-04 17:18:36');
INSERT INTO `shopping_cart` VALUES (86, 0, '70b87796-2d26-43a2-97ea-c3987c8e8c0e', 2, 45.00, 1, 0, '2021-09-05 08:23:43', '2021-09-05 08:23:43');
INSERT INTO `shopping_cart` VALUES (87, 0, '8c5cd0b7-3a2d-4c4a-a054-c42ca1448f57', 9, 45.00, 1, 0, '2021-09-05 10:12:28', '2021-09-05 10:12:28');
INSERT INTO `shopping_cart` VALUES (89, 0, '3e81a683-7be1-41d3-a6fd-6e8774fda8cd', 2, 45.00, 1, 0, '2021-09-05 15:48:31', '2021-09-05 15:48:31');
INSERT INTO `shopping_cart` VALUES (91, 0, 'bcb7cbab-6fcb-437c-ade8-191028b9d857', 6, 67.00, 1, 0, '2021-09-06 00:19:28', '2021-09-06 00:19:28');
INSERT INTO `shopping_cart` VALUES (92, 5, 'c9a1a722-f8ec-4509-8e8a-5b98351a16ec', 1, 22.00, 1, 1, '2021-09-06 08:33:20', '2021-09-06 08:33:20');
INSERT INTO `shopping_cart` VALUES (93, 0, '302ac3ed-8f59-493b-a684-c46f6360795c', 8, 30.00, 1, 0, '2021-09-06 09:04:58', '2021-09-06 09:04:58');
INSERT INTO `shopping_cart` VALUES (94, 0, 'c01038eb-c2aa-492a-8b23-09a043cafdad', 7, 78.00, 1, 0, '2021-09-06 11:03:39', '2021-09-06 11:03:39');
INSERT INTO `shopping_cart` VALUES (95, 0, '4965b097-1ba7-4a4d-a870-274314dd22be', 3, 45.66, 1, 0, '2021-09-06 12:07:06', '2021-09-06 12:07:06');
INSERT INTO `shopping_cart` VALUES (96, 0, '40b33163-f8ff-46c8-8ef8-1861e2c31814', 18, 678.00, 2, 0, '2021-09-06 12:26:35', '2021-09-06 12:26:35');
INSERT INTO `shopping_cart` VALUES (97, 0, '5bad6fff-a174-433e-8833-7924157c7798', 6, 67.00, 1, 0, '2021-09-06 18:00:44', '2021-09-06 18:00:44');
INSERT INTO `shopping_cart` VALUES (98, 0, 'e8d6ce29-cf13-4c64-8a64-2b0b9e2aa96e', 9, 45.00, 1, 0, '2021-09-06 19:45:58', '2021-09-06 19:45:58');
INSERT INTO `shopping_cart` VALUES (100, 0, '9fa9acba-eb10-44c8-bfb8-211a57670dfb', 12, 34.00, 1, 0, '2021-09-07 09:40:31', '2021-09-07 09:40:31');
INSERT INTO `shopping_cart` VALUES (101, 0, '8e0fce8d-401f-4896-b937-7fa72bfc03a4', 1, 22.00, 1, 0, '2021-09-07 09:42:39', '2021-09-07 09:42:39');
INSERT INTO `shopping_cart` VALUES (102, 0, 'ce8ce15c-41a3-4d57-a45c-240ad34d5bbb', 1, 22.00, 2, 0, '2021-09-07 12:01:46', '2021-09-07 12:01:52');
INSERT INTO `shopping_cart` VALUES (103, 0, '0506252e-a463-417e-9cdf-18556c50a37e', 3, 45.66, 1, 0, '2021-09-07 14:22:55', '2021-09-07 14:22:55');
INSERT INTO `shopping_cart` VALUES (104, 0, 'af3563c2-0457-4577-b70e-696f92f201ff', 1, 22.00, 1, 0, '2021-09-07 14:31:59', '2021-09-07 14:31:59');
INSERT INTO `shopping_cart` VALUES (105, 0, '71890a22-e967-4ffb-8523-3896e84033a3', 4, 56.00, 3, 0, '2021-09-07 14:35:00', '2021-09-07 14:35:08');
INSERT INTO `shopping_cart` VALUES (106, 0, '125854cc-4dde-4d1f-abd2-c892f292214f', 3, 45.66, 1, 0, '2021-09-07 16:10:09', '2021-09-07 16:10:09');
INSERT INTO `shopping_cart` VALUES (107, 0, '29de0e6f-fcc9-443e-a1c5-25595da9eb0a', 3, 45.66, 1, 0, '2021-09-07 16:10:37', '2021-09-07 16:10:37');
INSERT INTO `shopping_cart` VALUES (108, 0, '38acca7f-567c-49c6-b489-8502048f9056', 9, 45.00, 1, 0, '2021-09-07 16:24:00', '2021-09-07 16:24:00');
INSERT INTO `shopping_cart` VALUES (109, 0, '38acca7f-567c-49c6-b489-8502048f9056', 6, 67.00, 1, 0, '2021-09-07 17:26:55', '2021-09-07 17:26:55');
INSERT INTO `shopping_cart` VALUES (110, 0, 'ff2336a9-0fee-4b2e-8df2-3ccc1ff11afd', 1, 22.00, 1, 0, '2021-09-07 17:55:08', '2021-09-07 17:55:08');
INSERT INTO `shopping_cart` VALUES (111, 0, '4c4ef19a-8720-4509-9172-647c3d8af0d5', 12, 34.00, 1, 0, '2021-09-08 11:06:21', '2021-09-08 11:06:21');
INSERT INTO `shopping_cart` VALUES (112, 0, '19ecbbfc-0f18-4c9d-8255-a34e14008acf', 12, 34.00, 1, 0, '2021-09-08 16:29:44', '2021-09-08 16:29:44');
INSERT INTO `shopping_cart` VALUES (113, 0, 'a26fb0a5-06cc-4414-8fa1-0c7a69382c7d', 2, 45.00, 1, 0, '2021-09-08 17:48:47', '2021-09-08 17:48:47');
INSERT INTO `shopping_cart` VALUES (114, 0, 'd0021241-134d-4827-bc24-782096b90513', 1, 22.00, 1, 0, '2021-09-09 07:23:03', '2021-09-09 07:23:03');
INSERT INTO `shopping_cart` VALUES (116, 0, 'b4e4d82f-8cb2-4e96-a8e5-1300a35cc816', 1, 22.00, 10, 0, '2021-09-09 08:47:49', '2021-09-09 08:47:49');
INSERT INTO `shopping_cart` VALUES (117, 0, '214625e7-5bbc-4fcb-9f5b-21efd3515a77', 11, 45.00, 1, 0, '2021-09-09 15:55:12', '2021-09-09 15:55:12');
INSERT INTO `shopping_cart` VALUES (118, 0, '77bd2660-be20-4db6-8486-5e369bfc7210', 2, 45.00, 2, 0, '2021-09-09 16:18:26', '2021-09-09 16:18:31');
INSERT INTO `shopping_cart` VALUES (119, 0, '866a5ca9-de00-49b2-973d-e956d5cca536', 1, 22.00, 1, 0, '2021-09-09 16:25:39', '2021-09-09 16:25:39');
INSERT INTO `shopping_cart` VALUES (120, 0, '866a5ca9-de00-49b2-973d-e956d5cca536', 3, 45.66, 1, 0, '2021-09-09 16:28:40', '2021-09-09 16:28:40');
INSERT INTO `shopping_cart` VALUES (121, 0, '00d3e793-4832-44e9-a261-f5964c97b474', 1, 22.00, 1, 0, '2021-09-09 16:42:32', '2021-09-09 16:42:32');
INSERT INTO `shopping_cart` VALUES (122, 0, 'd1c35268-4298-4627-9ed9-fb923ec2361b', 2, 45.00, 1, 0, '2021-09-10 15:31:05', '2021-09-10 15:31:05');
INSERT INTO `shopping_cart` VALUES (123, 0, 'c7be1a41-e38a-4ae1-aa72-dd82ad795353', 1, 22.00, 1, 0, '2021-09-10 15:32:53', '2021-09-10 15:32:53');
INSERT INTO `shopping_cart` VALUES (124, 0, 'fa175337-56f6-4b4f-a17f-a39fe818230e', 4, 56.00, 5, 0, '2021-09-10 22:29:37', '2021-09-10 22:29:46');
INSERT INTO `shopping_cart` VALUES (125, 0, 'ea009ebd-d64e-47ed-9555-f2ba0c08be37', 1, 22.00, 1, 0, '2021-09-11 09:56:58', '2021-09-11 09:56:58');
INSERT INTO `shopping_cart` VALUES (126, 0, '14f3153a-c4b8-4c66-87b6-db5ad502d115', 5, 45.00, 1, 0, '2021-09-11 14:31:41', '2021-09-11 14:31:41');
INSERT INTO `shopping_cart` VALUES (127, 0, 'e8e42686-267d-4029-b1a1-d810da1d11eb', 14, 409.00, 1, 0, '2021-09-12 12:34:20', '2021-09-12 12:34:20');
INSERT INTO `shopping_cart` VALUES (128, 0, '7351b685-67e1-4e47-9d65-f9670fc52b56', 1, 22.00, 2, 0, '2021-09-13 09:24:52', '2021-09-13 09:24:55');
INSERT INTO `shopping_cart` VALUES (129, 0, '8eee1da9-7b1c-4501-a4e8-4e6de6ba27a8', 6, 67.00, 1, 0, '2021-09-13 13:19:38', '2021-09-13 13:19:38');
INSERT INTO `shopping_cart` VALUES (130, 0, '4aab1090-a001-46f4-9271-c8a92cc0c026', 2, 45.00, 1, 0, '2021-09-14 14:34:41', '2021-09-14 14:34:41');
INSERT INTO `shopping_cart` VALUES (131, 0, '7b02d151-9a15-4b50-a8d7-9f9ff351079c', 11, 45.00, 1, 0, '2021-09-14 17:26:12', '2021-09-14 17:26:12');
INSERT INTO `shopping_cart` VALUES (133, 0, '9af1be16-0ffd-48ea-a632-959410764d31', 10, 67.00, 1, 0, '2021-09-15 14:41:58', '2021-09-15 14:41:58');
INSERT INTO `shopping_cart` VALUES (134, 0, '942efaae-85a7-44a3-b8c4-df1097d7a531', 1, 22.00, 2, 0, '2021-09-15 15:31:11', '2021-09-15 15:31:21');
INSERT INTO `shopping_cart` VALUES (135, 0, 'b1552760-af58-4324-8706-b542093de0c6', 9, 45.00, 1, 0, '2021-09-15 16:01:03', '2021-09-15 16:01:03');
INSERT INTO `shopping_cart` VALUES (136, 7, 'eaa47df8-471a-4a7d-8791-6780d075e01b', 1, 22.00, 2, 0, '2021-09-15 17:40:50', '2021-09-15 17:41:33');
INSERT INTO `shopping_cart` VALUES (137, 7, 'eaa47df8-471a-4a7d-8791-6780d075e01b', 2, 45.00, 1, 0, '2021-09-15 17:42:30', '2021-09-15 17:42:30');
INSERT INTO `shopping_cart` VALUES (138, 7, 'eaa47df8-471a-4a7d-8791-6780d075e01b', 3, 45.66, 1, 0, '2021-09-15 17:43:05', '2021-09-15 17:43:05');
INSERT INTO `shopping_cart` VALUES (139, 0, 'e999cde5-4bba-4fa0-ba32-9023ff0eb977', 21, 22.29, 1, 0, '2021-09-15 20:12:51', '2021-09-15 20:12:51');
INSERT INTO `shopping_cart` VALUES (141, 0, '0b3e1a79-5a26-4f62-81a4-a10437c6938f', 3, 45.66, 2, 0, '2021-09-15 21:12:46', '2021-09-15 21:12:47');
INSERT INTO `shopping_cart` VALUES (142, 0, '86deffa0-7fc4-43c5-8ad9-a36207dc0330', 10, 67.00, 1, 0, '2021-09-15 22:04:39', '2021-09-15 22:04:39');
INSERT INTO `shopping_cart` VALUES (144, 0, 'ad7568ab-bd0c-4ce4-beba-ea39f8d876ef', 3, 45.66, 1, 0, '2021-09-16 08:28:03', '2021-09-16 08:28:03');
INSERT INTO `shopping_cart` VALUES (145, 0, '385a5553-8f6f-4456-af29-99e6546cb298', 3, 45.66, 1, 0, '2021-09-16 08:33:45', '2021-09-16 08:33:45');
INSERT INTO `shopping_cart` VALUES (146, 0, 'f29a9937-59b8-42ad-b167-fd04c6746da9', 3, 45.66, 1, 0, '2021-09-16 08:41:08', '2021-09-16 08:41:08');
INSERT INTO `shopping_cart` VALUES (147, 0, 'dfe37f2b-8931-43e9-b5ab-61470d214057', 1, 22.00, 1, 0, '2021-09-16 08:59:54', '2021-09-16 08:59:54');
INSERT INTO `shopping_cart` VALUES (148, 0, 'a72c32a2-d13b-4fa6-8c1d-9a260fcfee2e', 1, 22.00, 1, 0, '2021-09-16 09:12:12', '2021-09-16 09:12:12');
INSERT INTO `shopping_cart` VALUES (149, 0, 'a72c32a2-d13b-4fa6-8c1d-9a260fcfee2e', 2, 45.00, 1, 0, '2021-09-16 09:12:14', '2021-09-16 09:12:14');
INSERT INTO `shopping_cart` VALUES (150, 0, 'e6fc8edb-6b83-4e7b-b672-6fff729e67ef', 4, 56.00, 1, 0, '2021-09-16 09:30:20', '2021-09-16 09:30:20');
INSERT INTO `shopping_cart` VALUES (151, 0, '5db55af6-58cb-4a23-a220-38950f8bbacd', 10, 67.00, 6, 0, '2021-09-16 10:43:19', '2021-09-16 10:43:43');
INSERT INTO `shopping_cart` VALUES (152, 0, 'b4265cfa-707e-467b-9cbb-f24c07f4460d', 4, 56.00, 1, 0, '2021-09-16 11:55:49', '2021-09-16 11:55:49');
INSERT INTO `shopping_cart` VALUES (153, 0, 'b4265cfa-707e-467b-9cbb-f24c07f4460d', 5, 45.00, 1, 0, '2021-09-16 11:56:07', '2021-09-16 11:56:07');
INSERT INTO `shopping_cart` VALUES (154, 0, '70e57a7b-fa09-4f2c-a6cd-548891451961', 9, 45.00, 1, 0, '2021-09-16 14:34:23', '2021-09-16 14:34:23');
INSERT INTO `shopping_cart` VALUES (155, 0, 'd2f39571-4dc3-4690-a7be-9e2f74cae52a', 3, 45.66, 1, 0, '2021-09-16 14:34:40', '2021-09-16 14:34:40');
INSERT INTO `shopping_cart` VALUES (156, 0, '350f2ac3-4dc8-426d-850d-96484490198c', 12, 34.00, 1, 0, '2021-09-16 14:48:22', '2021-09-16 14:48:22');
INSERT INTO `shopping_cart` VALUES (157, 0, '14eb0138-ba1b-43ab-a21d-2f78461f7687', 5, 45.00, 1, 0, '2021-09-16 15:39:23', '2021-09-16 15:39:23');
INSERT INTO `shopping_cart` VALUES (158, 0, 'e4db02a0-2af8-40c8-b7bf-c7025a08ad85', 8, 30.00, 1, 0, '2021-09-17 06:58:28', '2021-09-17 06:58:28');
INSERT INTO `shopping_cart` VALUES (159, 0, '5ce3f087-5ee9-4ddf-9c9d-556483de47e6', 1, 22.00, 1, 0, '2021-09-17 10:27:29', '2021-09-17 10:27:29');
INSERT INTO `shopping_cart` VALUES (160, 0, '9ae3ef27-2426-495e-ba6b-04ae86b33f9c', 3, 45.66, 1, 0, '2021-09-17 13:49:20', '2021-09-17 13:49:20');
INSERT INTO `shopping_cart` VALUES (161, 0, 'efb3490f-e68e-4808-8810-bba783d88d21', 1, 22.00, 2, 0, '2021-09-17 14:58:50', '2021-09-17 14:58:54');
INSERT INTO `shopping_cart` VALUES (162, 0, 'e3598e22-0f21-4df6-9f19-19296acc93bb', 1, 22.00, 1, 0, '2021-09-17 17:52:44', '2021-09-17 17:52:44');
INSERT INTO `shopping_cart` VALUES (163, 0, '7b16e784-2ba2-4941-b4ce-8fa0cc47be55', 2, 45.00, 4, 0, '2021-09-17 18:15:41', '2021-09-17 18:15:53');
INSERT INTO `shopping_cart` VALUES (164, 0, '3643706e-405c-4f1e-85ad-6f7072b1b50a', 6, 67.00, 1, 0, '2021-09-17 19:36:02', '2021-09-17 19:36:02');
INSERT INTO `shopping_cart` VALUES (165, 0, '3643706e-405c-4f1e-85ad-6f7072b1b50a', 4, 56.00, 1, 0, '2021-09-17 19:36:07', '2021-09-17 19:36:07');
INSERT INTO `shopping_cart` VALUES (168, 0, '55c41bdd-dc7e-458f-bb3f-8388438f7c7a', 2, 45.00, 1, 0, '2021-09-18 16:58:47', '2021-09-18 16:58:47');
INSERT INTO `shopping_cart` VALUES (170, 0, 'a88d7e93-c245-43e6-9c56-4fc4970dcd60', 10, 67.00, 1, 0, '2021-09-18 20:59:52', '2021-09-18 20:59:52');
INSERT INTO `shopping_cart` VALUES (171, 0, 'a88d7e93-c245-43e6-9c56-4fc4970dcd60', 11, 45.00, 1, 0, '2021-09-18 20:59:54', '2021-09-18 20:59:54');
INSERT INTO `shopping_cart` VALUES (172, 0, 'fb94de1a-2d75-4086-9a57-80f4cbccbfd6', 1, 22.00, 1, 0, '2021-09-20 12:07:11', '2021-09-20 12:07:11');
INSERT INTO `shopping_cart` VALUES (173, 0, 'eb61e49a-dab2-4825-b887-6fabcdb833d9', 1, 22.00, 1, 0, '2021-09-22 13:39:51', '2021-09-22 13:39:51');
INSERT INTO `shopping_cart` VALUES (174, 0, 'afe10263-725b-4722-a810-bbbae694a316', 2, 45.00, 1, 0, '2021-09-22 17:56:58', '2021-09-22 17:56:58');
INSERT INTO `shopping_cart` VALUES (175, 0, '0088a9da-c7f2-4b11-b635-14f461ddf6ed', 8, 30.00, 1, 0, '2021-09-22 22:19:31', '2021-09-22 22:19:31');
INSERT INTO `shopping_cart` VALUES (176, 0, 'a30163cb-364d-43eb-b4ed-96c808f19686', 4, 56.00, 1, 0, '2021-09-23 09:13:47', '2021-09-23 09:13:47');
INSERT INTO `shopping_cart` VALUES (177, 0, 'bca8b375-481d-4162-9904-579cd92cb385', 1, 22.00, 1, 0, '2021-09-23 13:41:41', '2021-09-23 13:41:41');
INSERT INTO `shopping_cart` VALUES (178, 0, '3c8e5ee4-8d54-42ee-b8bb-538b04e8fdaf', 13, 509.00, 3, 0, '2021-09-23 17:48:58', '2021-09-23 17:49:12');
INSERT INTO `shopping_cart` VALUES (180, 0, '13f8e849-d4b9-48ad-95ce-f06e13e83051', 1, 22.00, 9, 0, '2021-09-23 18:16:23', '2021-09-23 19:14:31');
INSERT INTO `shopping_cart` VALUES (181, 0, '9e669cb5-46f5-466b-ba5b-ae78aa0c75cb', 2, 45.00, 1, 0, '2021-09-23 19:49:59', '2021-09-23 19:49:59');
INSERT INTO `shopping_cart` VALUES (182, 0, '23f0c5ba-3a1f-42c1-8c99-12d39c63844e', 11, 45.00, 1, 0, '2021-09-24 09:04:34', '2021-09-24 09:04:34');
INSERT INTO `shopping_cart` VALUES (183, 0, '9c14daf3-e736-4e31-ae29-a8f740157651', 3, 45.66, 1, 0, '2021-09-24 14:04:56', '2021-09-24 14:04:56');
INSERT INTO `shopping_cart` VALUES (184, 0, '9c14daf3-e736-4e31-ae29-a8f740157651', 5, 45.00, 1, 0, '2021-09-24 14:05:26', '2021-09-24 14:05:26');
INSERT INTO `shopping_cart` VALUES (185, 0, '9c14daf3-e736-4e31-ae29-a8f740157651', 1, 22.00, 2, 0, '2021-09-24 14:05:28', '2021-09-24 14:05:30');
INSERT INTO `shopping_cart` VALUES (186, 0, 'c379ce6a-e254-403e-823b-d139884f2712', 12, 34.00, 1, 0, '2021-09-24 16:08:06', '2021-09-24 16:08:06');
INSERT INTO `shopping_cart` VALUES (187, 1, '44616a43-b40a-4a28-8b67-9859095517b8', 4, 56.00, 2, 0, '2021-09-25 16:01:33', '2021-09-25 16:01:40');
INSERT INTO `shopping_cart` VALUES (188, 0, 'f25015b4-c507-4e68-9457-68274c585b44', 9, 45.00, 1, 0, '2021-09-26 14:07:57', '2021-09-26 14:07:57');
INSERT INTO `shopping_cart` VALUES (189, 0, 'c56578c4-01f8-4db8-91e9-09ea70f58000', 11, 45.00, 1, 0, '2021-09-26 15:52:37', '2021-09-26 15:52:37');
INSERT INTO `shopping_cart` VALUES (190, 0, '336830a0-d3f0-4042-a5da-8cdca4904da4', 1, 10.78, 1, 0, '2021-09-27 13:48:41', '2021-09-27 13:48:41');
INSERT INTO `shopping_cart` VALUES (191, 0, 'f57d52f7-6f5c-45f4-b3e8-12c1d715d190', 3, 45.66, 1, 0, '2021-09-27 17:26:19', '2021-09-27 17:26:19');
INSERT INTO `shopping_cart` VALUES (192, 0, 'f57d52f7-6f5c-45f4-b3e8-12c1d715d190', 7, 78.00, 1, 0, '2021-09-27 17:26:35', '2021-09-27 17:26:35');

-- ----------------------------
-- Table structure for st_spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec`  (
                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '規格id',
                         `spec_group_id` int(11) NOT NULL DEFAULT 0 COMMENT '規格組id',
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '規格名稱',
                         `spec_type` int(11) NOT NULL DEFAULT 1 COMMENT '規格型別：1 價格規格，2 普通規格',
                         `input_type` int(11) NOT NULL DEFAULT 1 COMMENT '錄入方式：1 下拉選擇，2 文字輸入',
                         `select_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '可選值列表：錄入方式為 1 時使用',
                         `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                         `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                         `is_show_img` int(1) NULL DEFAULT 2 COMMENT '是否顯示圖片 1 顯示，2 不顯示',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '產品規格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_spec
-- ----------------------------
INSERT INTO `spec` VALUES (1, 1, '顏色', 1, 1, 'Black\nGraphite\nAshen\nRed\nCappuccino\nBlue\nCrimson\nBeige\nKhaki\nViolet\nWhite\nPurple', '2021-03-15 15:49:21', '2021-07-02 17:26:00', 1);
INSERT INTO `spec` VALUES (2, 1, '尺寸', 1, 1, 'S\nM\nL\nXL\nXXL\nXXXL', '2021-03-15 15:50:00', '2021-03-15 15:50:00', 2);
INSERT INTO `spec` VALUES (3, 2, '顏色', 1, 1, 'Black\nWhite\nRed', '2021-03-17 10:14:41', '2021-03-17 10:14:41', 2);
INSERT INTO `spec` VALUES (4, 2, '容量', 1, 1, '32g\n64g\n128g', '2021-03-17 10:16:22', '2021-03-17 10:16:22', 2);
INSERT INTO `spec` VALUES (5, 3, 'CPU', 1, 1, 'i5\ni7', '2021-03-18 11:16:52', '2021-03-18 11:16:52', 2);
INSERT INTO `spec` VALUES (6, 4, '顏色', 1, 1, 'silver\nblack', '2021-03-18 11:24:32', '2021-03-18 11:24:32', 2);
INSERT INTO `spec` VALUES (7, 4, '容量', 1, 1, '32g\n64g\n128g', '2021-03-18 11:25:01', '2021-03-18 11:25:01', 2);
INSERT INTO `spec` VALUES (8, 4, '品牌', 1, 1, 'apple\nhuawei', '2021-03-18 11:25:37', '2021-03-18 11:25:37', 2);
INSERT INTO `spec` VALUES (9, 1, 'test', 2, 2, NULL, '2021-05-21 22:37:22', '2021-05-21 22:37:22', 2);

-- ----------------------------
-- Table structure for st_spec_group
-- ----------------------------
DROP TABLE IF EXISTS `spec_group`;
CREATE TABLE `spec_group`  (
                               `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '規格組id',
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '規格組名稱',
                               `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                               `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '產品規格組' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_spec_group
-- ----------------------------
INSERT INTO `spec_group` VALUES (1, '衣服', '2021-03-15 15:47:11', '2021-03-15 15:47:11');
INSERT INTO `spec_group` VALUES (2, '手機', '2021-03-17 10:14:04', '2021-03-17 10:14:04');
INSERT INTO `spec_group` VALUES (3, '膝上型電腦', '2021-03-18 11:16:17', '2021-03-18 11:16:17');
INSERT INTO `spec_group` VALUES (4, '平板', '2021-03-18 11:24:02', '2021-03-18 11:24:02');

-- ----------------------------
-- Table structure for st_strongadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `strongadmin_log`;
CREATE TABLE `strongadmin_log`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `route_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '路由',
                                    `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作描述',
                                    `log_original` json NULL COMMENT '欄位變更前內容',
                                    `log_dirty` json NULL COMMENT '欄位變更后內容',
                                    `admin_user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '操作使用者',
                                    `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '新增時間',
                                    `updated_at` timestamp(0) NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 952 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日誌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_strongadmin_log
-- ----------------------------
INSERT INTO `strongadmin_log` VALUES (1, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-08 12:02:45', '2021-08-08 12:02:45');
INSERT INTO `strongadmin_log` VALUES (2, '/admin/adminMenu/destroy?id=97', '[菜單管理][刪除成功]『id:[\"97\"]』', NULL, NULL, 1, '2021-08-08 12:31:48', '2021-08-08 12:31:48');
INSERT INTO `strongadmin_log` VALUES (3, '/admin/adminMenu/destroy?id=96', '[菜單管理][刪除成功]『id:[\"96\"]』', NULL, NULL, 1, '2021-08-08 12:31:56', '2021-08-08 12:31:56');
INSERT INTO `strongadmin_log` VALUES (4, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"more\": null, \"details\": \"<ul class=\\\"a-unordered-list a-vertical a-spacing-mini\\\"><li><br></li></ul>\", \"img_spec\": \"\", \"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\"}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\"}]\", \"related_sku\": \"\", \"related_accessories_sku\": null}', '{\"more\": \"[]\", \"details\": \"<ul class=\\\"a-unordered-list a-vertical a-spacing-mini\\\"><li><br/></li></ul>\", \"img_spec\": \"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\", \"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"related_sku\": \"dress100-02-m\", \"related_accessories_sku\": \"dress100-02-m,tshirt100-01-xxxl\"}', 1, '2021-08-08 12:58:52', '2021-08-08 12:58:52');
INSERT INTO `strongadmin_log` VALUES (5, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"details\": \"<ul class=\\\"a-unordered-list a-vertical a-spacing-mini\\\"><li><br/></li></ul>\", \"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\"}', '{\"details\": \"<ul><li>好產品</li><li>中國造</li><li>Made In China</li></ul><p><img src=\\\"http://www.strongshop.local/storage/202108/i0Jwue7WMfPxSyQtpUZU0SuRTAeYpOXj9BQ2vjBQ.jpg\\\" alt=\\\"s-l1600 (10).jpg\\\" style=\\\"max-width:100%;\\\" contenteditable=\\\"false\\\"/></p><ul><li><br/></li></ul>\", \"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\"}', 1, '2021-08-08 13:03:04', '2021-08-08 13:03:04');
INSERT INTO `strongadmin_log` VALUES (6, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\", \"wholesale_set\": \"{\\\"num\\\": [], \\\"price\\\": []}\", \"original_price\": \"32.00\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"wholesale_set\": \"{\\\"num\\\":[\\\"1\\\",\\\"5\\\",\\\"10\\\"],\\\"price\\\":[\\\"21.995\\\",\\\"19.324\\\",\\\"15.382\\\"]}\", \"original_price\": \"28.587\"}', 1, '2021-08-08 13:05:51', '2021-08-08 13:05:51');
INSERT INTO `strongadmin_log` VALUES (7, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\", \"sale_price\": \"21.99\", \"original_price\": \"28.59\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"sale_price\": \"21.995\", \"original_price\": \"28.594\"}', 1, '2021-08-08 13:06:13', '2021-08-08 13:06:13');
INSERT INTO `strongadmin_log` VALUES (8, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\", \"sale_price\": \"22.00\", \"original_price\": \"28.59\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"sale_price\": \"21.995\", \"original_price\": \"28.594\"}', 1, '2021-08-08 13:06:32', '2021-08-08 13:06:32');
INSERT INTO `strongadmin_log` VALUES (9, '/admin/product/update', '[更新成功][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\"}', 1, '2021-08-08 13:14:06', '2021-08-08 13:14:06');
INSERT INTO `strongadmin_log` VALUES (10, '/admin/shippingOptionConfig/update', '[更新成功][配送費用公式][id:133]', NULL, NULL, 1, '2021-08-08 13:29:31', '2021-08-08 13:29:31');
INSERT INTO `strongadmin_log` VALUES (11, '/admin/user/feedback/update', '[更新成功][意見反饋表][id:1]', NULL, NULL, 1, '2021-08-08 13:32:49', '2021-08-08 13:32:49');
INSERT INTO `strongadmin_log` VALUES (12, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-08 13:51:25', '2021-08-08 13:51:25');
INSERT INTO `strongadmin_log` VALUES (13, '/admin/adminUser/create', '[建立成功][賬號管理][id:19]', NULL, NULL, 1, '2021-08-08 13:51:48', '2021-08-08 13:51:48');
INSERT INTO `strongadmin_log` VALUES (14, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-08-08 13:52:02', '2021-08-08 13:52:02');
INSERT INTO `strongadmin_log` VALUES (15, '/admin/adminMenu/update', '[菜單管理][更新成功][id:1]', NULL, NULL, 19, '2021-08-08 13:52:24', '2021-08-08 13:52:24');
INSERT INTO `strongadmin_log` VALUES (16, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-08 13:55:25', '2021-08-08 13:55:25');
INSERT INTO `strongadmin_log` VALUES (17, '/admin/adminMenu/create', '[菜單管理][新增成功][id:121]', NULL, NULL, 1, '2021-08-08 13:56:21', '2021-08-08 13:56:21');
INSERT INTO `strongadmin_log` VALUES (18, '/admin/adminMenu/create', '[菜單管理][新增成功][id:122]', NULL, NULL, 1, '2021-08-08 13:56:43', '2021-08-08 13:56:43');
INSERT INTO `strongadmin_log` VALUES (19, '/admin/adminMenu/create', '[菜單管理][新增成功][id:123]', NULL, NULL, 1, '2021-08-08 13:56:52', '2021-08-08 13:56:52');
INSERT INTO `strongadmin_log` VALUES (20, '/admin/adminMenu/create', '[菜單管理][新增成功][id:124]', NULL, NULL, 1, '2021-08-08 13:57:05', '2021-08-08 13:57:05');
INSERT INTO `strongadmin_log` VALUES (21, '/admin/adminMenu/create', '[菜單管理][新增成功][id:125]', NULL, NULL, 1, '2021-08-08 13:57:14', '2021-08-08 13:57:14');
INSERT INTO `strongadmin_log` VALUES (22, '/admin/adminMenu/create', '[菜單管理][新增成功][id:126]', NULL, NULL, 1, '2021-08-08 13:57:23', '2021-08-08 13:57:23');
INSERT INTO `strongadmin_log` VALUES (23, '/admin/adminMenu/create', '[菜單管理][新增成功][id:127]', NULL, NULL, 1, '2021-08-08 13:57:31', '2021-08-08 13:57:31');
INSERT INTO `strongadmin_log` VALUES (24, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-08 13:58:08', '2021-08-08 13:58:08');
INSERT INTO `strongadmin_log` VALUES (25, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-08-08 14:00:15', '2021-08-08 14:00:15');
INSERT INTO `strongadmin_log` VALUES (26, '/admin/adminMenu/update', '[菜單管理][更新成功][id:41]', NULL, NULL, 1, '2021-08-08 14:03:18', '2021-08-08 14:03:18');
INSERT INTO `strongadmin_log` VALUES (27, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-08-08 14:04:29', '2021-08-08 14:04:29');
INSERT INTO `strongadmin_log` VALUES (28, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-08 14:05:33', '2021-08-08 14:05:33');
INSERT INTO `strongadmin_log` VALUES (29, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-11 13:30:32', '2021-08-11 13:30:32');
INSERT INTO `strongadmin_log` VALUES (30, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 13:31:00', '2021-08-11 13:31:00');
INSERT INTO `strongadmin_log` VALUES (31, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-11 15:06:28', '2021-08-11 15:06:28');
INSERT INTO `strongadmin_log` VALUES (32, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 15:06:39', '2021-08-11 15:06:39');
INSERT INTO `strongadmin_log` VALUES (33, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 20:18:45', '2021-08-11 20:18:45');
INSERT INTO `strongadmin_log` VALUES (34, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 20:26:10', '2021-08-11 20:26:10');
INSERT INTO `strongadmin_log` VALUES (35, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 20:32:56', '2021-08-11 20:32:56');
INSERT INTO `strongadmin_log` VALUES (36, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 20:35:56', '2021-08-11 20:35:56');
INSERT INTO `strongadmin_log` VALUES (37, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:03:30', '2021-08-11 21:03:30');
INSERT INTO `strongadmin_log` VALUES (38, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:03:52', '2021-08-11 21:03:52');
INSERT INTO `strongadmin_log` VALUES (39, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:03:57', '2021-08-11 21:03:57');
INSERT INTO `strongadmin_log` VALUES (40, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:09:34', '2021-08-11 21:09:34');
INSERT INTO `strongadmin_log` VALUES (41, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:09:40', '2021-08-11 21:09:40');
INSERT INTO `strongadmin_log` VALUES (42, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:15:12', '2021-08-11 21:15:12');
INSERT INTO `strongadmin_log` VALUES (43, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-11 21:15:27', '2021-08-11 21:15:27');
INSERT INTO `strongadmin_log` VALUES (44, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-13 09:16:41', '2021-08-13 09:16:41');
INSERT INTO `strongadmin_log` VALUES (45, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 09:20:10', '2021-08-13 09:20:10');
INSERT INTO `strongadmin_log` VALUES (46, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 09:20:51', '2021-08-13 09:20:51');
INSERT INTO `strongadmin_log` VALUES (47, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-13 09:22:17', '2021-08-13 09:22:17');
INSERT INTO `strongadmin_log` VALUES (48, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 09:22:56', '2021-08-13 09:22:56');
INSERT INTO `strongadmin_log` VALUES (49, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 09:23:03', '2021-08-13 09:23:03');
INSERT INTO `strongadmin_log` VALUES (50, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:34:11', '2021-08-13 10:34:11');
INSERT INTO `strongadmin_log` VALUES (51, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:35:26', '2021-08-13 10:35:26');
INSERT INTO `strongadmin_log` VALUES (52, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:38:20', '2021-08-13 10:38:20');
INSERT INTO `strongadmin_log` VALUES (53, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:38:25', '2021-08-13 10:38:25');
INSERT INTO `strongadmin_log` VALUES (54, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:38:33', '2021-08-13 10:38:33');
INSERT INTO `strongadmin_log` VALUES (55, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:39:10', '2021-08-13 10:39:10');
INSERT INTO `strongadmin_log` VALUES (56, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:39:27', '2021-08-13 10:39:27');
INSERT INTO `strongadmin_log` VALUES (57, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 10:39:56', '2021-08-13 10:39:56');
INSERT INTO `strongadmin_log` VALUES (58, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:04:31', '2021-08-13 11:04:31');
INSERT INTO `strongadmin_log` VALUES (59, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:05:54', '2021-08-13 11:05:54');
INSERT INTO `strongadmin_log` VALUES (60, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:06:05', '2021-08-13 11:06:05');
INSERT INTO `strongadmin_log` VALUES (61, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:15:22', '2021-08-13 11:15:22');
INSERT INTO `strongadmin_log` VALUES (62, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:18:25', '2021-08-13 11:18:25');
INSERT INTO `strongadmin_log` VALUES (63, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:24:36', '2021-08-13 11:24:36');
INSERT INTO `strongadmin_log` VALUES (64, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 11:26:01', '2021-08-13 11:26:01');
INSERT INTO `strongadmin_log` VALUES (65, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:09:16', '2021-08-13 12:09:16');
INSERT INTO `strongadmin_log` VALUES (66, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:09:31', '2021-08-13 12:09:31');
INSERT INTO `strongadmin_log` VALUES (67, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:17:15', '2021-08-13 12:17:15');
INSERT INTO `strongadmin_log` VALUES (68, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:18:42', '2021-08-13 12:18:42');
INSERT INTO `strongadmin_log` VALUES (69, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:18:56', '2021-08-13 12:18:56');
INSERT INTO `strongadmin_log` VALUES (70, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:19:00', '2021-08-13 12:19:00');
INSERT INTO `strongadmin_log` VALUES (71, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:21:15', '2021-08-13 12:21:15');
INSERT INTO `strongadmin_log` VALUES (72, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:23:25', '2021-08-13 12:23:25');
INSERT INTO `strongadmin_log` VALUES (73, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:30:59', '2021-08-13 12:30:59');
INSERT INTO `strongadmin_log` VALUES (74, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:31:14', '2021-08-13 12:31:14');
INSERT INTO `strongadmin_log` VALUES (75, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:31:19', '2021-08-13 12:31:19');
INSERT INTO `strongadmin_log` VALUES (76, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:36:32', '2021-08-13 12:36:32');
INSERT INTO `strongadmin_log` VALUES (77, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:36:36', '2021-08-13 12:36:36');
INSERT INTO `strongadmin_log` VALUES (78, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:44:57', '2021-08-13 12:44:57');
INSERT INTO `strongadmin_log` VALUES (79, '/admin/webconfig/sendReceiveMailTest', '[Connection to smtp.qq.com:465 Timed Out][網站設定]', NULL, NULL, 1, '2021-08-13 12:47:46', '2021-08-13 12:47:46');
INSERT INTO `strongadmin_log` VALUES (80, '/admin/webconfig/sendReceiveMailTest', '[Connection to smtp.qq.com:465 Timed Out][網站設定]', NULL, NULL, 1, '2021-08-13 12:48:27', '2021-08-13 12:48:27');
INSERT INTO `strongadmin_log` VALUES (81, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:49:28', '2021-08-13 12:49:28');
INSERT INTO `strongadmin_log` VALUES (82, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 12:50:45', '2021-08-13 12:50:45');
INSERT INTO `strongadmin_log` VALUES (83, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:03:24', '2021-08-13 13:03:24');
INSERT INTO `strongadmin_log` VALUES (84, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:03:42', '2021-08-13 13:03:42');
INSERT INTO `strongadmin_log` VALUES (85, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:04:08', '2021-08-13 13:04:08');
INSERT INTO `strongadmin_log` VALUES (86, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:06:42', '2021-08-13 13:06:42');
INSERT INTO `strongadmin_log` VALUES (87, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:08:50', '2021-08-13 13:08:50');
INSERT INTO `strongadmin_log` VALUES (88, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:09:05', '2021-08-13 13:09:05');
INSERT INTO `strongadmin_log` VALUES (89, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:13:11', '2021-08-13 13:13:11');
INSERT INTO `strongadmin_log` VALUES (90, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:15:54', '2021-08-13 13:15:54');
INSERT INTO `strongadmin_log` VALUES (91, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"3\"』', NULL, NULL, 1, '2021-08-13 13:23:01', '2021-08-13 13:23:01');
INSERT INTO `strongadmin_log` VALUES (92, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"3\"』', NULL, NULL, 1, '2021-08-13 13:23:14', '2021-08-13 13:23:14');
INSERT INTO `strongadmin_log` VALUES (93, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"2\"』', NULL, NULL, 1, '2021-08-13 13:23:22', '2021-08-13 13:23:22');
INSERT INTO `strongadmin_log` VALUES (94, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:23:42', '2021-08-13 13:23:42');
INSERT INTO `strongadmin_log` VALUES (95, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 13:23:47', '2021-08-13 13:23:47');
INSERT INTO `strongadmin_log` VALUES (96, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"2\"』', NULL, NULL, 1, '2021-08-13 13:23:59', '2021-08-13 13:23:59');
INSERT INTO `strongadmin_log` VALUES (97, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 17:35:25', '2021-08-13 17:35:25');
INSERT INTO `strongadmin_log` VALUES (98, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-13 17:35:34', '2021-08-13 17:35:34');
INSERT INTO `strongadmin_log` VALUES (99, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-14 12:36:22', '2021-08-14 12:36:22');
INSERT INTO `strongadmin_log` VALUES (100, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-08-18 17:33:42', '2021-08-18 17:33:42');
INSERT INTO `strongadmin_log` VALUES (101, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:01:20', '2021-08-19 18:01:20');
INSERT INTO `strongadmin_log` VALUES (102, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:01:24', '2021-08-19 18:01:24');
INSERT INTO `strongadmin_log` VALUES (103, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-08-19 18:02:03', '2021-08-19 18:02:03');
INSERT INTO `strongadmin_log` VALUES (104, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-19 18:04:02', '2021-08-19 18:04:02');
INSERT INTO `strongadmin_log` VALUES (105, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 19, '2021-08-19 18:04:15', '2021-08-19 18:04:15');
INSERT INTO `strongadmin_log` VALUES (106, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:06:25', '2021-08-19 18:06:25');
INSERT INTO `strongadmin_log` VALUES (107, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:10:17', '2021-08-19 18:10:17');
INSERT INTO `strongadmin_log` VALUES (108, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:10:28', '2021-08-19 18:10:28');
INSERT INTO `strongadmin_log` VALUES (109, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:11:13', '2021-08-19 18:11:13');
INSERT INTO `strongadmin_log` VALUES (110, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:12:03', '2021-08-19 18:12:03');
INSERT INTO `strongadmin_log` VALUES (111, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:12:11', '2021-08-19 18:12:11');
INSERT INTO `strongadmin_log` VALUES (112, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:12:27', '2021-08-19 18:12:27');
INSERT INTO `strongadmin_log` VALUES (113, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:13:37', '2021-08-19 18:13:37');
INSERT INTO `strongadmin_log` VALUES (114, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:13:51', '2021-08-19 18:13:51');
INSERT INTO `strongadmin_log` VALUES (115, '/admin/adminMenu/update', '[菜單管理][更新成功][id:120]', NULL, NULL, 1, '2021-08-19 18:15:20', '2021-08-19 18:15:20');
INSERT INTO `strongadmin_log` VALUES (116, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-08-19 18:16:01', '2021-08-19 18:16:01');
INSERT INTO `strongadmin_log` VALUES (117, '/admin/adminMenu/create', '[菜單管理][新增成功][id:128]', NULL, NULL, 1, '2021-08-19 18:16:49', '2021-08-19 18:16:49');
INSERT INTO `strongadmin_log` VALUES (118, '/admin/adminMenu/create', '[菜單管理][新增成功][id:129]', NULL, NULL, 1, '2021-08-19 18:17:49', '2021-08-19 18:17:49');
INSERT INTO `strongadmin_log` VALUES (119, '/admin/adminRole/update', '[角色表][更新成功][id:2]', NULL, NULL, 1, '2021-08-19 18:18:51', '2021-08-19 18:18:51');
INSERT INTO `strongadmin_log` VALUES (120, '/admin/adminRole/update', '[角色表][更新成功][id:1]', NULL, NULL, 1, '2021-08-19 18:19:37', '2021-08-19 18:19:37');
INSERT INTO `strongadmin_log` VALUES (121, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-08-19 18:20:01', '2021-08-19 18:20:01');
INSERT INTO `strongadmin_log` VALUES (122, '/admin/user/update', '[更新成功][會員表][id:1]', NULL, NULL, 1, '2021-08-20 17:59:05', '2021-08-20 17:59:05');
INSERT INTO `strongadmin_log` VALUES (123, '/admin/user/destroy', '[刪除成功][會員表]『id:[\"2\"]』', NULL, NULL, 1, '2021-08-20 17:59:18', '2021-08-20 17:59:18');
INSERT INTO `strongadmin_log` VALUES (124, '/admin/order/confirm/done', '[確認完成][訂單管理]『id:\"3\"』', NULL, NULL, 1, '2021-08-20 18:01:26', '2021-08-20 18:01:26');
INSERT INTO `strongadmin_log` VALUES (125, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"4\"』', NULL, NULL, 1, '2021-08-20 18:09:07', '2021-08-20 18:09:07');
INSERT INTO `strongadmin_log` VALUES (126, '/admin/product/update', '[更新成功][產品表][id:14][sku:phone100-01-128g]', '{\"more\": null, \"stock\": 323, \"img_spec\": \"\", \"img_cover\": \"/storage/202103/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg\", \"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg\\\", \\\"title\\\": \\\"s-l1600 (3).jpg\\\"}, {\\\"src\\\": \\\"/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\\\", \\\"title\\\": \\\"s-l1600 (2).jpg\\\"}]\"}', '{\"more\": \"[]\", \"stock\": \"3\", \"img_spec\": \"/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\", \"img_cover\": \"/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\", \"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg\\\",\\\"title\\\":\\\"s-l1600 (3).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\\\",\\\"title\\\":\\\"s-l1600 (2).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true}]\"}', 1, '2021-08-20 18:09:46', '2021-08-20 18:09:46');
INSERT INTO `strongadmin_log` VALUES (127, '/admin/paymentOption/update', '[更新成功][支付方式][id:1]', NULL, NULL, 1, '2021-08-20 18:12:30', '2021-08-20 18:12:30');
INSERT INTO `strongadmin_log` VALUES (128, '/admin/paymentOption/update', '[更新成功][支付方式][id:1]', NULL, NULL, 1, '2021-08-20 18:12:42', '2021-08-20 18:12:42');
INSERT INTO `strongadmin_log` VALUES (129, '/admin/paymentOption/update', '[更新成功][支付方式][id:1]', NULL, NULL, 1, '2021-08-21 09:42:11', '2021-08-21 09:42:11');
INSERT INTO `strongadmin_log` VALUES (130, '/admin/paymentOption/update', '[更新成功][支付方式][id:1]', NULL, NULL, 1, '2021-08-21 09:47:27', '2021-08-21 09:47:27');
INSERT INTO `strongadmin_log` VALUES (131, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-01 12:59:02', '2021-09-01 12:59:02');
INSERT INTO `strongadmin_log` VALUES (132, '/admin/adminUser/update', '[更新成功][賬號管理][id:1]', NULL, NULL, 1, '2021-09-01 12:59:50', '2021-09-01 12:59:50');
INSERT INTO `strongadmin_log` VALUES (133, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-01 13:00:23', '2021-09-01 13:00:23');
INSERT INTO `strongadmin_log` VALUES (134, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 13:00:54', '2021-09-01 13:00:54');
INSERT INTO `strongadmin_log` VALUES (135, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"7\"』', NULL, NULL, 19, '2021-09-01 13:01:41', '2021-09-01 13:01:41');
INSERT INTO `strongadmin_log` VALUES (136, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"7\"』', NULL, NULL, 19, '2021-09-01 13:02:16', '2021-09-01 13:02:16');
INSERT INTO `strongadmin_log` VALUES (137, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 16:52:05', '2021-09-01 16:52:05');
INSERT INTO `strongadmin_log` VALUES (138, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-01 17:25:51', '2021-09-01 17:25:51');
INSERT INTO `strongadmin_log` VALUES (139, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:37:18', '2021-09-01 17:37:18');
INSERT INTO `strongadmin_log` VALUES (140, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:41:01', '2021-09-01 17:41:01');
INSERT INTO `strongadmin_log` VALUES (141, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:41:37', '2021-09-01 17:41:37');
INSERT INTO `strongadmin_log` VALUES (142, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:43:43', '2021-09-01 17:43:43');
INSERT INTO `strongadmin_log` VALUES (143, '/admin/order/confirm/done', '[確認完成][訂單管理]『id:\"7\"』', NULL, NULL, 19, '2021-09-01 17:44:26', '2021-09-01 17:44:26');
INSERT INTO `strongadmin_log` VALUES (144, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:46:53', '2021-09-01 17:46:53');
INSERT INTO `strongadmin_log` VALUES (145, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:51:18', '2021-09-01 17:51:18');
INSERT INTO `strongadmin_log` VALUES (146, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-01 17:53:46', '2021-09-01 17:53:46');
INSERT INTO `strongadmin_log` VALUES (147, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:53:59', '2021-09-01 17:53:59');
INSERT INTO `strongadmin_log` VALUES (148, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:55:28', '2021-09-01 17:55:28');
INSERT INTO `strongadmin_log` VALUES (149, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-01 17:57:20', '2021-09-01 17:57:20');
INSERT INTO `strongadmin_log` VALUES (150, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 17:57:27', '2021-09-01 17:57:27');
INSERT INTO `strongadmin_log` VALUES (151, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:01:07', '2021-09-01 18:01:07');
INSERT INTO `strongadmin_log` VALUES (152, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-01 18:02:47', '2021-09-01 18:02:47');
INSERT INTO `strongadmin_log` VALUES (153, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:02:55', '2021-09-01 18:02:55');
INSERT INTO `strongadmin_log` VALUES (154, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:03:57', '2021-09-01 18:03:57');
INSERT INTO `strongadmin_log` VALUES (155, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:04:36', '2021-09-01 18:04:36');
INSERT INTO `strongadmin_log` VALUES (156, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:07:01', '2021-09-01 18:07:01');
INSERT INTO `strongadmin_log` VALUES (157, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:09:29', '2021-09-01 18:09:29');
INSERT INTO `strongadmin_log` VALUES (158, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:13:28', '2021-09-01 18:13:28');
INSERT INTO `strongadmin_log` VALUES (159, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:13:47', '2021-09-01 18:13:47');
INSERT INTO `strongadmin_log` VALUES (160, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:14:24', '2021-09-01 18:14:24');
INSERT INTO `strongadmin_log` VALUES (161, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:15:04', '2021-09-01 18:15:04');
INSERT INTO `strongadmin_log` VALUES (162, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:27:07', '2021-09-01 18:27:07');
INSERT INTO `strongadmin_log` VALUES (163, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-01 18:38:02', '2021-09-01 18:38:02');
INSERT INTO `strongadmin_log` VALUES (164, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:38:11', '2021-09-01 18:38:11');
INSERT INTO `strongadmin_log` VALUES (165, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:38:24', '2021-09-01 18:38:24');
INSERT INTO `strongadmin_log` VALUES (166, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:39:31', '2021-09-01 18:39:31');
INSERT INTO `strongadmin_log` VALUES (167, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:40:59', '2021-09-01 18:40:59');
INSERT INTO `strongadmin_log` VALUES (168, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:44:55', '2021-09-01 18:44:55');
INSERT INTO `strongadmin_log` VALUES (169, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:46:35', '2021-09-01 18:46:35');
INSERT INTO `strongadmin_log` VALUES (170, '/admin/article/category/create', '[建立成功][產品分類][id:32]', NULL, NULL, 19, '2021-09-01 18:46:57', '2021-09-01 18:46:57');
INSERT INTO `strongadmin_log` VALUES (171, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 18:57:30', '2021-09-01 18:57:30');
INSERT INTO `strongadmin_log` VALUES (172, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-01 19:03:11', '2021-09-01 19:03:11');
INSERT INTO `strongadmin_log` VALUES (173, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:16:40', '2021-09-01 19:16:40');
INSERT INTO `strongadmin_log` VALUES (174, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:21:26', '2021-09-01 19:21:26');
INSERT INTO `strongadmin_log` VALUES (175, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:56:43', '2021-09-01 19:56:43');
INSERT INTO `strongadmin_log` VALUES (176, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:57:26', '2021-09-01 19:57:26');
INSERT INTO `strongadmin_log` VALUES (177, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:59:08', '2021-09-01 19:59:08');
INSERT INTO `strongadmin_log` VALUES (178, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 19:59:23', '2021-09-01 19:59:23');
INSERT INTO `strongadmin_log` VALUES (179, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:26:02', '2021-09-01 20:26:02');
INSERT INTO `strongadmin_log` VALUES (180, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:26:04', '2021-09-01 20:26:04');
INSERT INTO `strongadmin_log` VALUES (181, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:30:48', '2021-09-01 20:30:48');
INSERT INTO `strongadmin_log` VALUES (182, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:32:55', '2021-09-01 20:32:55');
INSERT INTO `strongadmin_log` VALUES (183, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:42:33', '2021-09-01 20:42:33');
INSERT INTO `strongadmin_log` VALUES (184, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:43:28', '2021-09-01 20:43:28');
INSERT INTO `strongadmin_log` VALUES (185, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 20:45:39', '2021-09-01 20:45:39');
INSERT INTO `strongadmin_log` VALUES (186, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:00:02', '2021-09-01 21:00:02');
INSERT INTO `strongadmin_log` VALUES (187, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:03:29', '2021-09-01 21:03:29');
INSERT INTO `strongadmin_log` VALUES (188, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:07:50', '2021-09-01 21:07:50');
INSERT INTO `strongadmin_log` VALUES (189, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:24:26', '2021-09-01 21:24:26');
INSERT INTO `strongadmin_log` VALUES (190, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:26:09', '2021-09-01 21:26:09');
INSERT INTO `strongadmin_log` VALUES (191, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:30:26', '2021-09-01 21:30:26');
INSERT INTO `strongadmin_log` VALUES (192, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:35:26', '2021-09-01 21:35:26');
INSERT INTO `strongadmin_log` VALUES (193, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-01 21:53:24', '2021-09-01 21:53:24');
INSERT INTO `strongadmin_log` VALUES (194, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 21:53:32', '2021-09-01 21:53:32');
INSERT INTO `strongadmin_log` VALUES (195, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-01 22:22:48', '2021-09-01 22:22:48');
INSERT INTO `strongadmin_log` VALUES (196, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 22:22:58', '2021-09-01 22:22:58');
INSERT INTO `strongadmin_log` VALUES (197, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:28:26', '2021-09-01 23:28:26');
INSERT INTO `strongadmin_log` VALUES (198, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:30:04', '2021-09-01 23:30:04');
INSERT INTO `strongadmin_log` VALUES (199, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:33:46', '2021-09-01 23:33:46');
INSERT INTO `strongadmin_log` VALUES (200, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:34:20', '2021-09-01 23:34:20');
INSERT INTO `strongadmin_log` VALUES (201, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"5\"』', NULL, NULL, 19, '2021-09-01 23:34:51', '2021-09-01 23:34:51');
INSERT INTO `strongadmin_log` VALUES (202, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:54:01', '2021-09-01 23:54:01');
INSERT INTO `strongadmin_log` VALUES (203, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:56:45', '2021-09-01 23:56:45');
INSERT INTO `strongadmin_log` VALUES (204, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-01 23:57:41', '2021-09-01 23:57:41');
INSERT INTO `strongadmin_log` VALUES (205, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 00:30:49', '2021-09-02 00:30:49');
INSERT INTO `strongadmin_log` VALUES (206, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 01:03:00', '2021-09-02 01:03:00');
INSERT INTO `strongadmin_log` VALUES (207, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 01:55:49', '2021-09-02 01:55:49');
INSERT INTO `strongadmin_log` VALUES (208, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 05:10:55', '2021-09-02 05:10:55');
INSERT INTO `strongadmin_log` VALUES (209, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 07:39:45', '2021-09-02 07:39:45');
INSERT INTO `strongadmin_log` VALUES (210, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 07:59:06', '2021-09-02 07:59:06');
INSERT INTO `strongadmin_log` VALUES (211, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:34:38', '2021-09-02 08:34:38');
INSERT INTO `strongadmin_log` VALUES (212, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:39:58', '2021-09-02 08:39:58');
INSERT INTO `strongadmin_log` VALUES (213, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:41:21', '2021-09-02 08:41:21');
INSERT INTO `strongadmin_log` VALUES (214, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:44:58', '2021-09-02 08:44:58');
INSERT INTO `strongadmin_log` VALUES (215, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:50:06', '2021-09-02 08:50:06');
INSERT INTO `strongadmin_log` VALUES (216, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:55:20', '2021-09-02 08:55:20');
INSERT INTO `strongadmin_log` VALUES (217, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:55:26', '2021-09-02 08:55:26');
INSERT INTO `strongadmin_log` VALUES (218, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-02 08:58:30', '2021-09-02 08:58:30');
INSERT INTO `strongadmin_log` VALUES (219, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 08:58:44', '2021-09-02 08:58:44');
INSERT INTO `strongadmin_log` VALUES (220, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-02 09:08:20', '2021-09-02 09:08:20');
INSERT INTO `strongadmin_log` VALUES (221, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:09:02', '2021-09-02 09:09:02');
INSERT INTO `strongadmin_log` VALUES (222, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:09:03', '2021-09-02 09:09:03');
INSERT INTO `strongadmin_log` VALUES (223, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:09:28', '2021-09-02 09:09:28');
INSERT INTO `strongadmin_log` VALUES (224, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:09:36', '2021-09-02 09:09:36');
INSERT INTO `strongadmin_log` VALUES (225, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:11:50', '2021-09-02 09:11:50');
INSERT INTO `strongadmin_log` VALUES (226, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:13:16', '2021-09-02 09:13:16');
INSERT INTO `strongadmin_log` VALUES (227, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:16:08', '2021-09-02 09:16:08');
INSERT INTO `strongadmin_log` VALUES (228, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:16:10', '2021-09-02 09:16:10');
INSERT INTO `strongadmin_log` VALUES (229, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:16:48', '2021-09-02 09:16:48');
INSERT INTO `strongadmin_log` VALUES (230, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:17:31', '2021-09-02 09:17:31');
INSERT INTO `strongadmin_log` VALUES (231, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:22:18', '2021-09-02 09:22:18');
INSERT INTO `strongadmin_log` VALUES (232, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:22:23', '2021-09-02 09:22:23');
INSERT INTO `strongadmin_log` VALUES (233, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:22:30', '2021-09-02 09:22:30');
INSERT INTO `strongadmin_log` VALUES (234, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:22:39', '2021-09-02 09:22:39');
INSERT INTO `strongadmin_log` VALUES (235, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:24:20', '2021-09-02 09:24:20');
INSERT INTO `strongadmin_log` VALUES (236, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:27:09', '2021-09-02 09:27:09');
INSERT INTO `strongadmin_log` VALUES (237, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:28:56', '2021-09-02 09:28:56');
INSERT INTO `strongadmin_log` VALUES (238, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:29:05', '2021-09-02 09:29:05');
INSERT INTO `strongadmin_log` VALUES (239, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:29:15', '2021-09-02 09:29:15');
INSERT INTO `strongadmin_log` VALUES (240, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:29:29', '2021-09-02 09:29:29');
INSERT INTO `strongadmin_log` VALUES (241, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:30:56', '2021-09-02 09:30:56');
INSERT INTO `strongadmin_log` VALUES (242, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:31:07', '2021-09-02 09:31:07');
INSERT INTO `strongadmin_log` VALUES (243, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:33:28', '2021-09-02 09:33:28');
INSERT INTO `strongadmin_log` VALUES (244, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:33:40', '2021-09-02 09:33:40');
INSERT INTO `strongadmin_log` VALUES (245, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:35:26', '2021-09-02 09:35:26');
INSERT INTO `strongadmin_log` VALUES (246, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:37:15', '2021-09-02 09:37:15');
INSERT INTO `strongadmin_log` VALUES (247, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:43:12', '2021-09-02 09:43:12');
INSERT INTO `strongadmin_log` VALUES (248, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:47:27', '2021-09-02 09:47:27');
INSERT INTO `strongadmin_log` VALUES (249, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:54:22', '2021-09-02 09:54:22');
INSERT INTO `strongadmin_log` VALUES (250, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-02 09:54:27', '2021-09-02 09:54:27');
INSERT INTO `strongadmin_log` VALUES (251, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:54:33', '2021-09-02 09:54:33');
INSERT INTO `strongadmin_log` VALUES (252, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:55:35', '2021-09-02 09:55:35');
INSERT INTO `strongadmin_log` VALUES (253, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 09:58:29', '2021-09-02 09:58:29');
INSERT INTO `strongadmin_log` VALUES (254, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:10:39', '2021-09-02 10:10:39');
INSERT INTO `strongadmin_log` VALUES (255, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:19:13', '2021-09-02 10:19:13');
INSERT INTO `strongadmin_log` VALUES (256, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:22:32', '2021-09-02 10:22:32');
INSERT INTO `strongadmin_log` VALUES (257, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:38:26', '2021-09-02 10:38:26');
INSERT INTO `strongadmin_log` VALUES (258, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:46:28', '2021-09-02 10:46:28');
INSERT INTO `strongadmin_log` VALUES (259, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 10:46:59', '2021-09-02 10:46:59');
INSERT INTO `strongadmin_log` VALUES (260, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:18:17', '2021-09-02 11:18:17');
INSERT INTO `strongadmin_log` VALUES (261, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:19:23', '2021-09-02 11:19:23');
INSERT INTO `strongadmin_log` VALUES (262, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:33:51', '2021-09-02 11:33:51');
INSERT INTO `strongadmin_log` VALUES (263, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:36:02', '2021-09-02 11:36:02');
INSERT INTO `strongadmin_log` VALUES (264, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:38:57', '2021-09-02 11:38:57');
INSERT INTO `strongadmin_log` VALUES (265, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:39:43', '2021-09-02 11:39:43');
INSERT INTO `strongadmin_log` VALUES (266, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:53:27', '2021-09-02 11:53:27');
INSERT INTO `strongadmin_log` VALUES (267, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 11:54:25', '2021-09-02 11:54:25');
INSERT INTO `strongadmin_log` VALUES (268, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 12:21:21', '2021-09-02 12:21:21');
INSERT INTO `strongadmin_log` VALUES (269, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 12:23:31', '2021-09-02 12:23:31');
INSERT INTO `strongadmin_log` VALUES (270, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 12:43:50', '2021-09-02 12:43:50');
INSERT INTO `strongadmin_log` VALUES (271, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 13:37:39', '2021-09-02 13:37:39');
INSERT INTO `strongadmin_log` VALUES (272, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 13:53:39', '2021-09-02 13:53:39');
INSERT INTO `strongadmin_log` VALUES (273, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:24:54', '2021-09-02 14:24:54');
INSERT INTO `strongadmin_log` VALUES (274, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:26:40', '2021-09-02 14:26:40');
INSERT INTO `strongadmin_log` VALUES (275, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:37:49', '2021-09-02 14:37:49');
INSERT INTO `strongadmin_log` VALUES (276, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:37:57', '2021-09-02 14:37:57');
INSERT INTO `strongadmin_log` VALUES (277, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:41:20', '2021-09-02 14:41:20');
INSERT INTO `strongadmin_log` VALUES (278, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:43:17', '2021-09-02 14:43:17');
INSERT INTO `strongadmin_log` VALUES (279, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:46:02', '2021-09-02 14:46:02');
INSERT INTO `strongadmin_log` VALUES (280, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 14:59:52', '2021-09-02 14:59:52');
INSERT INTO `strongadmin_log` VALUES (281, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 15:02:34', '2021-09-02 15:02:34');
INSERT INTO `strongadmin_log` VALUES (282, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 15:05:37', '2021-09-02 15:05:37');
INSERT INTO `strongadmin_log` VALUES (283, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 15:29:48', '2021-09-02 15:29:48');
INSERT INTO `strongadmin_log` VALUES (284, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 15:36:15', '2021-09-02 15:36:15');
INSERT INTO `strongadmin_log` VALUES (285, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:00:24', '2021-09-02 16:00:24');
INSERT INTO `strongadmin_log` VALUES (286, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:18:06', '2021-09-02 16:18:06');
INSERT INTO `strongadmin_log` VALUES (287, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:26:38', '2021-09-02 16:26:38');
INSERT INTO `strongadmin_log` VALUES (288, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:41:59', '2021-09-02 16:41:59');
INSERT INTO `strongadmin_log` VALUES (289, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:49:48', '2021-09-02 16:49:48');
INSERT INTO `strongadmin_log` VALUES (290, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:53:30', '2021-09-02 16:53:30');
INSERT INTO `strongadmin_log` VALUES (291, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 16:55:30', '2021-09-02 16:55:30');
INSERT INTO `strongadmin_log` VALUES (292, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:05:59', '2021-09-02 17:05:59');
INSERT INTO `strongadmin_log` VALUES (293, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:15:33', '2021-09-02 17:15:33');
INSERT INTO `strongadmin_log` VALUES (294, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:18:21', '2021-09-02 17:18:21');
INSERT INTO `strongadmin_log` VALUES (295, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:44:35', '2021-09-02 17:44:35');
INSERT INTO `strongadmin_log` VALUES (296, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:44:57', '2021-09-02 17:44:57');
INSERT INTO `strongadmin_log` VALUES (297, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 17:45:12', '2021-09-02 17:45:12');
INSERT INTO `strongadmin_log` VALUES (298, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 18:05:34', '2021-09-02 18:05:34');
INSERT INTO `strongadmin_log` VALUES (299, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 18:16:37', '2021-09-02 18:16:37');
INSERT INTO `strongadmin_log` VALUES (300, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 18:20:12', '2021-09-02 18:20:12');
INSERT INTO `strongadmin_log` VALUES (301, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 18:35:18', '2021-09-02 18:35:18');
INSERT INTO `strongadmin_log` VALUES (302, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 20:03:02', '2021-09-02 20:03:02');
INSERT INTO `strongadmin_log` VALUES (303, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-02 21:37:21', '2021-09-02 21:37:21');
INSERT INTO `strongadmin_log` VALUES (304, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-03 08:55:46', '2021-09-03 08:55:46');
INSERT INTO `strongadmin_log` VALUES (305, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 08:55:59', '2021-09-03 08:55:59');
INSERT INTO `strongadmin_log` VALUES (306, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 09:04:18', '2021-09-03 09:04:18');
INSERT INTO `strongadmin_log` VALUES (307, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 09:42:47', '2021-09-03 09:42:47');
INSERT INTO `strongadmin_log` VALUES (308, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 09:54:46', '2021-09-03 09:54:46');
INSERT INTO `strongadmin_log` VALUES (309, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 10:41:27', '2021-09-03 10:41:27');
INSERT INTO `strongadmin_log` VALUES (310, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 10:41:35', '2021-09-03 10:41:35');
INSERT INTO `strongadmin_log` VALUES (311, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 10:44:58', '2021-09-03 10:44:58');
INSERT INTO `strongadmin_log` VALUES (312, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-03 11:13:04', '2021-09-03 11:13:04');
INSERT INTO `strongadmin_log` VALUES (313, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 11:13:14', '2021-09-03 11:13:14');
INSERT INTO `strongadmin_log` VALUES (314, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 11:37:58', '2021-09-03 11:37:58');
INSERT INTO `strongadmin_log` VALUES (315, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 11:39:44', '2021-09-03 11:39:44');
INSERT INTO `strongadmin_log` VALUES (316, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 11:41:20', '2021-09-03 11:41:20');
INSERT INTO `strongadmin_log` VALUES (317, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 12:09:04', '2021-09-03 12:09:04');
INSERT INTO `strongadmin_log` VALUES (318, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 12:52:20', '2021-09-03 12:52:20');
INSERT INTO `strongadmin_log` VALUES (319, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 13:46:35', '2021-09-03 13:46:35');
INSERT INTO `strongadmin_log` VALUES (320, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 14:01:47', '2021-09-03 14:01:47');
INSERT INTO `strongadmin_log` VALUES (321, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 14:12:19', '2021-09-03 14:12:19');
INSERT INTO `strongadmin_log` VALUES (322, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:09:50', '2021-09-03 15:09:50');
INSERT INTO `strongadmin_log` VALUES (323, '/admin/product/specGroup/create', '[建立成功][產品規格組][id:5]', NULL, NULL, 19, '2021-09-03 15:10:09', '2021-09-03 15:10:09');
INSERT INTO `strongadmin_log` VALUES (324, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:21:18', '2021-09-03 15:21:18');
INSERT INTO `strongadmin_log` VALUES (325, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:22:08', '2021-09-03 15:22:08');
INSERT INTO `strongadmin_log` VALUES (326, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:24:24', '2021-09-03 15:24:24');
INSERT INTO `strongadmin_log` VALUES (327, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:28:23', '2021-09-03 15:28:23');
INSERT INTO `strongadmin_log` VALUES (328, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-03 15:30:20', '2021-09-03 15:30:20');
INSERT INTO `strongadmin_log` VALUES (329, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:31:59', '2021-09-03 15:31:59');
INSERT INTO `strongadmin_log` VALUES (330, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:33:39', '2021-09-03 15:33:39');
INSERT INTO `strongadmin_log` VALUES (331, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:38:55', '2021-09-03 15:38:55');
INSERT INTO `strongadmin_log` VALUES (332, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:40:18', '2021-09-03 15:40:18');
INSERT INTO `strongadmin_log` VALUES (333, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:47:50', '2021-09-03 15:47:50');
INSERT INTO `strongadmin_log` VALUES (334, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:54:28', '2021-09-03 15:54:28');
INSERT INTO `strongadmin_log` VALUES (335, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:55:36', '2021-09-03 15:55:36');
INSERT INTO `strongadmin_log` VALUES (336, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:56:37', '2021-09-03 15:56:37');
INSERT INTO `strongadmin_log` VALUES (337, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:58:43', '2021-09-03 15:58:43');
INSERT INTO `strongadmin_log` VALUES (338, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 15:59:24', '2021-09-03 15:59:24');
INSERT INTO `strongadmin_log` VALUES (339, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:03:20', '2021-09-03 16:03:20');
INSERT INTO `strongadmin_log` VALUES (340, '/admin/webconfig/sendReceiveMailTest', '[Cannot send message without a sender address][網站設定]', NULL, NULL, 1, '2021-09-03 16:04:04', '2021-09-03 16:04:04');
INSERT INTO `strongadmin_log` VALUES (341, '/admin/webconfig/sendReceiveMailTest', '[Cannot send message without a sender address][網站設定]', NULL, NULL, 1, '2021-09-03 16:04:27', '2021-09-03 16:04:27');
INSERT INTO `strongadmin_log` VALUES (342, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 16:05:01', '2021-09-03 16:05:01');
INSERT INTO `strongadmin_log` VALUES (343, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 16:05:06', '2021-09-03 16:05:06');
INSERT INTO `strongadmin_log` VALUES (344, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:05:20', '2021-09-03 16:05:20');
INSERT INTO `strongadmin_log` VALUES (345, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-03 16:06:11', '2021-09-03 16:06:11');
INSERT INTO `strongadmin_log` VALUES (346, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:06:30', '2021-09-03 16:06:30');
INSERT INTO `strongadmin_log` VALUES (347, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-09-03 16:06:44', '2021-09-03 16:06:44');
INSERT INTO `strongadmin_log` VALUES (348, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:07:58', '2021-09-03 16:07:58');
INSERT INTO `strongadmin_log` VALUES (349, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:08:19', '2021-09-03 16:08:19');
INSERT INTO `strongadmin_log` VALUES (350, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"6\"』', NULL, NULL, 19, '2021-09-03 16:08:28', '2021-09-03 16:08:28');
INSERT INTO `strongadmin_log` VALUES (351, '/admin/order/confirm/close', '[成功關閉訂單][訂單管理]『id:\"8\"』『order_no:』', NULL, NULL, 19, '2021-09-03 16:08:43', '2021-09-03 16:08:43');
INSERT INTO `strongadmin_log` VALUES (352, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:12:04', '2021-09-03 16:12:04');
INSERT INTO `strongadmin_log` VALUES (353, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:12:09', '2021-09-03 16:12:09');
INSERT INTO `strongadmin_log` VALUES (354, '/admin/webconfig/sendReceiveMailTest', '[測試郵件發送成功][網站設定]', NULL, NULL, 1, '2021-09-03 16:12:12', '2021-09-03 16:12:12');
INSERT INTO `strongadmin_log` VALUES (355, '/admin/webconfig/save/config', '[網站配置儲存成功][網站設定]', NULL, NULL, 1, '2021-09-03 16:12:17', '2021-09-03 16:12:17');
INSERT INTO `strongadmin_log` VALUES (356, '/admin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-09-03 16:12:52', '2021-09-03 16:12:52');
INSERT INTO `strongadmin_log` VALUES (357, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:13:14', '2021-09-03 16:13:14');
INSERT INTO `strongadmin_log` VALUES (358, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:17:40', '2021-09-03 16:17:40');
INSERT INTO `strongadmin_log` VALUES (359, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:18:39', '2021-09-03 16:18:39');
INSERT INTO `strongadmin_log` VALUES (360, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:20:24', '2021-09-03 16:20:24');
INSERT INTO `strongadmin_log` VALUES (361, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:22:59', '2021-09-03 16:22:59');
INSERT INTO `strongadmin_log` VALUES (362, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:24:46', '2021-09-03 16:24:46');
INSERT INTO `strongadmin_log` VALUES (363, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:27:09', '2021-09-03 16:27:09');
INSERT INTO `strongadmin_log` VALUES (364, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:30:40', '2021-09-03 16:30:40');
INSERT INTO `strongadmin_log` VALUES (365, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:36:36', '2021-09-03 16:36:36');
INSERT INTO `strongadmin_log` VALUES (366, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:40:23', '2021-09-03 16:40:23');
INSERT INTO `strongadmin_log` VALUES (367, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:45:39', '2021-09-03 16:45:39');
INSERT INTO `strongadmin_log` VALUES (368, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:46:49', '2021-09-03 16:46:49');
INSERT INTO `strongadmin_log` VALUES (369, '/admin/order/update', '[更新成功][訂單管理][id:8][order_no:ST20210903114967327]', '{\"shipping_option_id\": 13}', '{\"shipping_option_id\": \"30\"}', 19, '2021-09-03 16:47:58', '2021-09-03 16:47:58');
INSERT INTO `strongadmin_log` VALUES (370, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:48:10', '2021-09-03 16:48:10');
INSERT INTO `strongadmin_log` VALUES (371, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:52:21', '2021-09-03 16:52:21');
INSERT INTO `strongadmin_log` VALUES (372, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 16:53:20', '2021-09-03 16:53:20');
INSERT INTO `strongadmin_log` VALUES (373, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:53:30', '2021-09-03 16:53:30');
INSERT INTO `strongadmin_log` VALUES (374, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:54:10', '2021-09-03 16:54:10');
INSERT INTO `strongadmin_log` VALUES (375, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:54:34', '2021-09-03 16:54:34');
INSERT INTO `strongadmin_log` VALUES (376, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 16:56:37', '2021-09-03 16:56:37');
INSERT INTO `strongadmin_log` VALUES (377, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:00:24', '2021-09-03 17:00:24');
INSERT INTO `strongadmin_log` VALUES (378, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:05:41', '2021-09-03 17:05:41');
INSERT INTO `strongadmin_log` VALUES (379, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:05:49', '2021-09-03 17:05:49');
INSERT INTO `strongadmin_log` VALUES (380, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:09:27', '2021-09-03 17:09:27');
INSERT INTO `strongadmin_log` VALUES (381, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:19:11', '2021-09-03 17:19:11');
INSERT INTO `strongadmin_log` VALUES (382, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:23:03', '2021-09-03 17:23:03');
INSERT INTO `strongadmin_log` VALUES (383, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:24:16', '2021-09-03 17:24:16');
INSERT INTO `strongadmin_log` VALUES (384, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-03 17:29:55', '2021-09-03 17:29:55');
INSERT INTO `strongadmin_log` VALUES (385, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:30:09', '2021-09-03 17:30:09');
INSERT INTO `strongadmin_log` VALUES (386, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:30:26', '2021-09-03 17:30:26');
INSERT INTO `strongadmin_log` VALUES (387, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:31:23', '2021-09-03 17:31:23');
INSERT INTO `strongadmin_log` VALUES (388, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:38:36', '2021-09-03 17:38:36');
INSERT INTO `strongadmin_log` VALUES (389, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:41:47', '2021-09-03 17:41:47');
INSERT INTO `strongadmin_log` VALUES (390, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:42:49', '2021-09-03 17:42:49');
INSERT INTO `strongadmin_log` VALUES (391, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:43:49', '2021-09-03 17:43:49');
INSERT INTO `strongadmin_log` VALUES (392, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:45:02', '2021-09-03 17:45:02');
INSERT INTO `strongadmin_log` VALUES (393, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:45:58', '2021-09-03 17:45:58');
INSERT INTO `strongadmin_log` VALUES (394, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:50:11', '2021-09-03 17:50:11');
INSERT INTO `strongadmin_log` VALUES (395, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:50:13', '2021-09-03 17:50:13');
INSERT INTO `strongadmin_log` VALUES (396, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:50:28', '2021-09-03 17:50:28');
INSERT INTO `strongadmin_log` VALUES (397, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:51:27', '2021-09-03 17:51:27');
INSERT INTO `strongadmin_log` VALUES (398, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:53:08', '2021-09-03 17:53:08');
INSERT INTO `strongadmin_log` VALUES (399, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 17:55:40', '2021-09-03 17:55:40');
INSERT INTO `strongadmin_log` VALUES (400, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:03:43', '2021-09-03 18:03:43');
INSERT INTO `strongadmin_log` VALUES (401, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:05:10', '2021-09-03 18:05:10');
INSERT INTO `strongadmin_log` VALUES (402, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:25:49', '2021-09-03 18:25:49');
INSERT INTO `strongadmin_log` VALUES (403, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:25:49', '2021-09-03 18:25:49');
INSERT INTO `strongadmin_log` VALUES (404, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:33:40', '2021-09-03 18:33:40');
INSERT INTO `strongadmin_log` VALUES (405, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:47:32', '2021-09-03 18:47:32');
INSERT INTO `strongadmin_log` VALUES (406, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 18:55:22', '2021-09-03 18:55:22');
INSERT INTO `strongadmin_log` VALUES (407, '/admin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-03 19:00:43', '2021-09-03 19:00:43');
INSERT INTO `strongadmin_log` VALUES (408, '/admin/paymentOption/update', '[更新成功][支付方式][id:1]', NULL, NULL, 1, '2021-09-03 19:07:40', '2021-09-03 19:07:40');
INSERT INTO `strongadmin_log` VALUES (409, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 19:23:44', '2021-09-03 19:23:44');
INSERT INTO `strongadmin_log` VALUES (410, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 19:29:27', '2021-09-03 19:29:27');
INSERT INTO `strongadmin_log` VALUES (411, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 19:45:19', '2021-09-03 19:45:19');
INSERT INTO `strongadmin_log` VALUES (412, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 19:58:06', '2021-09-03 19:58:06');
INSERT INTO `strongadmin_log` VALUES (413, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 20:05:40', '2021-09-03 20:05:40');
INSERT INTO `strongadmin_log` VALUES (414, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 20:05:42', '2021-09-03 20:05:42');
INSERT INTO `strongadmin_log` VALUES (415, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-03 20:05:52', '2021-09-03 20:05:52');
INSERT INTO `strongadmin_log` VALUES (416, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 20:06:02', '2021-09-03 20:06:02');
INSERT INTO `strongadmin_log` VALUES (417, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:04:31', '2021-09-03 21:04:31');
INSERT INTO `strongadmin_log` VALUES (418, '/admin/product/specGroup/create', '[建立成功][產品規格組][id:6]', NULL, NULL, 19, '2021-09-03 21:07:30', '2021-09-03 21:07:30');
INSERT INTO `strongadmin_log` VALUES (419, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:31:57', '2021-09-03 21:31:57');
INSERT INTO `strongadmin_log` VALUES (420, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:51:09', '2021-09-03 21:51:09');
INSERT INTO `strongadmin_log` VALUES (421, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:53:26', '2021-09-03 21:53:26');
INSERT INTO `strongadmin_log` VALUES (422, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:57:36', '2021-09-03 21:57:36');
INSERT INTO `strongadmin_log` VALUES (423, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 21:59:08', '2021-09-03 21:59:08');
INSERT INTO `strongadmin_log` VALUES (424, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 22:02:08', '2021-09-03 22:02:08');
INSERT INTO `strongadmin_log` VALUES (425, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 22:19:10', '2021-09-03 22:19:10');
INSERT INTO `strongadmin_log` VALUES (426, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 22:21:00', '2021-09-03 22:21:00');
INSERT INTO `strongadmin_log` VALUES (427, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 22:55:54', '2021-09-03 22:55:54');
INSERT INTO `strongadmin_log` VALUES (428, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 22:56:53', '2021-09-03 22:56:53');
INSERT INTO `strongadmin_log` VALUES (429, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 23:15:03', '2021-09-03 23:15:03');
INSERT INTO `strongadmin_log` VALUES (430, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-03 23:17:24', '2021-09-03 23:17:24');
INSERT INTO `strongadmin_log` VALUES (431, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 23:17:34', '2021-09-03 23:17:34');
INSERT INTO `strongadmin_log` VALUES (432, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 23:38:35', '2021-09-03 23:38:35');
INSERT INTO `strongadmin_log` VALUES (433, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 23:46:56', '2021-09-03 23:46:56');
INSERT INTO `strongadmin_log` VALUES (434, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-03 23:53:16', '2021-09-03 23:53:16');
INSERT INTO `strongadmin_log` VALUES (435, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 00:27:43', '2021-09-04 00:27:43');
INSERT INTO `strongadmin_log` VALUES (436, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 00:34:24', '2021-09-04 00:34:24');
INSERT INTO `strongadmin_log` VALUES (437, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 06:03:21', '2021-09-04 06:03:21');
INSERT INTO `strongadmin_log` VALUES (438, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 06:20:13', '2021-09-04 06:20:13');
INSERT INTO `strongadmin_log` VALUES (439, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 06:46:37', '2021-09-04 06:46:37');
INSERT INTO `strongadmin_log` VALUES (440, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 07:48:01', '2021-09-04 07:48:01');
INSERT INTO `strongadmin_log` VALUES (441, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 08:38:50', '2021-09-04 08:38:50');
INSERT INTO `strongadmin_log` VALUES (442, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 08:40:21', '2021-09-04 08:40:21');
INSERT INTO `strongadmin_log` VALUES (443, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 08:41:43', '2021-09-04 08:41:43');
INSERT INTO `strongadmin_log` VALUES (444, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 09:37:55', '2021-09-04 09:37:55');
INSERT INTO `strongadmin_log` VALUES (445, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 10:08:07', '2021-09-04 10:08:07');
INSERT INTO `strongadmin_log` VALUES (446, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 10:20:57', '2021-09-04 10:20:57');
INSERT INTO `strongadmin_log` VALUES (447, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 10:26:04', '2021-09-04 10:26:04');
INSERT INTO `strongadmin_log` VALUES (448, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 10:50:57', '2021-09-04 10:50:57');
INSERT INTO `strongadmin_log` VALUES (449, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-04 11:00:58', '2021-09-04 11:00:58');
INSERT INTO `strongadmin_log` VALUES (450, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 11:01:05', '2021-09-04 11:01:05');
INSERT INTO `strongadmin_log` VALUES (451, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 11:20:12', '2021-09-04 11:20:12');
INSERT INTO `strongadmin_log` VALUES (452, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 11:34:01', '2021-09-04 11:34:01');
INSERT INTO `strongadmin_log` VALUES (453, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 11:37:45', '2021-09-04 11:37:45');
INSERT INTO `strongadmin_log` VALUES (454, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 12:43:37', '2021-09-04 12:43:37');
INSERT INTO `strongadmin_log` VALUES (455, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:11:37', '2021-09-04 13:11:37');
INSERT INTO `strongadmin_log` VALUES (456, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:23:36', '2021-09-04 13:23:36');
INSERT INTO `strongadmin_log` VALUES (457, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:31:41', '2021-09-04 13:31:41');
INSERT INTO `strongadmin_log` VALUES (458, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:49:25', '2021-09-04 13:49:25');
INSERT INTO `strongadmin_log` VALUES (459, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:54:07', '2021-09-04 13:54:07');
INSERT INTO `strongadmin_log` VALUES (460, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 13:56:45', '2021-09-04 13:56:45');
INSERT INTO `strongadmin_log` VALUES (461, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 14:00:54', '2021-09-04 14:00:54');
INSERT INTO `strongadmin_log` VALUES (462, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 14:31:59', '2021-09-04 14:31:59');
INSERT INTO `strongadmin_log` VALUES (463, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 14:32:00', '2021-09-04 14:32:00');
INSERT INTO `strongadmin_log` VALUES (464, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 14:51:20', '2021-09-04 14:51:20');
INSERT INTO `strongadmin_log` VALUES (465, '/admin/order/confirm/close', '[成功關閉訂單][訂單管理]『id:\"10\"』『order_no:』', NULL, NULL, 19, '2021-09-04 14:53:44', '2021-09-04 14:53:44');
INSERT INTO `strongadmin_log` VALUES (466, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-04 15:11:06', '2021-09-04 15:11:06');
INSERT INTO `strongadmin_log` VALUES (467, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 15:11:27', '2021-09-04 15:11:27');
INSERT INTO `strongadmin_log` VALUES (468, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 16:15:25', '2021-09-04 16:15:25');
INSERT INTO `strongadmin_log` VALUES (469, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 16:30:15', '2021-09-04 16:30:15');
INSERT INTO `strongadmin_log` VALUES (470, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 17:04:44', '2021-09-04 17:04:44');
INSERT INTO `strongadmin_log` VALUES (471, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"11\"』', NULL, NULL, 19, '2021-09-04 17:06:10', '2021-09-04 17:06:10');
INSERT INTO `strongadmin_log` VALUES (472, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 17:18:04', '2021-09-04 17:18:04');
INSERT INTO `strongadmin_log` VALUES (473, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 17:29:53', '2021-09-04 17:29:53');
INSERT INTO `strongadmin_log` VALUES (474, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 19:06:57', '2021-09-04 19:06:57');
INSERT INTO `strongadmin_log` VALUES (475, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 20:41:49', '2021-09-04 20:41:49');
INSERT INTO `strongadmin_log` VALUES (476, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 20:45:38', '2021-09-04 20:45:38');
INSERT INTO `strongadmin_log` VALUES (477, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 21:01:36', '2021-09-04 21:01:36');
INSERT INTO `strongadmin_log` VALUES (478, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 21:51:13', '2021-09-04 21:51:13');
INSERT INTO `strongadmin_log` VALUES (479, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 21:51:17', '2021-09-04 21:51:17');
INSERT INTO `strongadmin_log` VALUES (480, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-04 22:35:48', '2021-09-04 22:35:48');
INSERT INTO `strongadmin_log` VALUES (481, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-04 22:36:01', '2021-09-04 22:36:01');
INSERT INTO `strongadmin_log` VALUES (482, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 00:19:08', '2021-09-05 00:19:08');
INSERT INTO `strongadmin_log` VALUES (483, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-05 03:38:54', '2021-09-05 03:38:54');
INSERT INTO `strongadmin_log` VALUES (484, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 03:39:00', '2021-09-05 03:39:00');
INSERT INTO `strongadmin_log` VALUES (485, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-05 07:42:55', '2021-09-05 07:42:55');
INSERT INTO `strongadmin_log` VALUES (486, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-05 07:43:02', '2021-09-05 07:43:02');
INSERT INTO `strongadmin_log` VALUES (487, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 07:46:46', '2021-09-05 07:46:46');
INSERT INTO `strongadmin_log` VALUES (488, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 09:42:26', '2021-09-05 09:42:26');
INSERT INTO `strongadmin_log` VALUES (489, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-05 09:51:56', '2021-09-05 09:51:56');
INSERT INTO `strongadmin_log` VALUES (490, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 09:52:11', '2021-09-05 09:52:11');
INSERT INTO `strongadmin_log` VALUES (491, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 10:01:06', '2021-09-05 10:01:06');
INSERT INTO `strongadmin_log` VALUES (492, '/admin/order/confirm/returned', '[確認已退貨][訂單管理]『id:\"11\"』', NULL, NULL, 19, '2021-09-05 11:42:59', '2021-09-05 11:42:59');
INSERT INTO `strongadmin_log` VALUES (493, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"9\"』', NULL, NULL, 19, '2021-09-05 11:43:26', '2021-09-05 11:43:26');
INSERT INTO `strongadmin_log` VALUES (494, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 12:06:28', '2021-09-05 12:06:28');
INSERT INTO `strongadmin_log` VALUES (495, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 12:57:58', '2021-09-05 12:57:58');
INSERT INTO `strongadmin_log` VALUES (496, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 14:27:25', '2021-09-05 14:27:25');
INSERT INTO `strongadmin_log` VALUES (497, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 14:37:17', '2021-09-05 14:37:17');
INSERT INTO `strongadmin_log` VALUES (498, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 15:20:13', '2021-09-05 15:20:13');
INSERT INTO `strongadmin_log` VALUES (499, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 15:48:59', '2021-09-05 15:48:59');
INSERT INTO `strongadmin_log` VALUES (500, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 16:21:22', '2021-09-05 16:21:22');
INSERT INTO `strongadmin_log` VALUES (501, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 17:28:34', '2021-09-05 17:28:34');
INSERT INTO `strongadmin_log` VALUES (502, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 18:11:05', '2021-09-05 18:11:05');
INSERT INTO `strongadmin_log` VALUES (503, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 20:00:50', '2021-09-05 20:00:50');
INSERT INTO `strongadmin_log` VALUES (504, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 20:12:22', '2021-09-05 20:12:22');
INSERT INTO `strongadmin_log` VALUES (505, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 20:39:09', '2021-09-05 20:39:09');
INSERT INTO `strongadmin_log` VALUES (506, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 21:00:30', '2021-09-05 21:00:30');
INSERT INTO `strongadmin_log` VALUES (507, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 21:50:45', '2021-09-05 21:50:45');
INSERT INTO `strongadmin_log` VALUES (508, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 21:51:35', '2021-09-05 21:51:35');
INSERT INTO `strongadmin_log` VALUES (509, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 22:47:22', '2021-09-05 22:47:22');
INSERT INTO `strongadmin_log` VALUES (510, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 23:09:40', '2021-09-05 23:09:40');
INSERT INTO `strongadmin_log` VALUES (511, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 23:09:41', '2021-09-05 23:09:41');
INSERT INTO `strongadmin_log` VALUES (512, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-05 23:10:16', '2021-09-05 23:10:16');
INSERT INTO `strongadmin_log` VALUES (513, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 01:26:30', '2021-09-06 01:26:30');
INSERT INTO `strongadmin_log` VALUES (514, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 01:27:59', '2021-09-06 01:27:59');
INSERT INTO `strongadmin_log` VALUES (515, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 02:00:31', '2021-09-06 02:00:31');
INSERT INTO `strongadmin_log` VALUES (516, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 08:01:23', '2021-09-06 08:01:23');
INSERT INTO `strongadmin_log` VALUES (517, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 08:25:45', '2021-09-06 08:25:45');
INSERT INTO `strongadmin_log` VALUES (518, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 08:29:34', '2021-09-06 08:29:34');
INSERT INTO `strongadmin_log` VALUES (519, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 08:49:02', '2021-09-06 08:49:02');
INSERT INTO `strongadmin_log` VALUES (520, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:00:48', '2021-09-06 09:00:48');
INSERT INTO `strongadmin_log` VALUES (521, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:03:06', '2021-09-06 09:03:06');
INSERT INTO `strongadmin_log` VALUES (522, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:14:50', '2021-09-06 09:14:50');
INSERT INTO `strongadmin_log` VALUES (523, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:17:26', '2021-09-06 09:17:26');
INSERT INTO `strongadmin_log` VALUES (524, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:19:35', '2021-09-06 09:19:35');
INSERT INTO `strongadmin_log` VALUES (525, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:22:03', '2021-09-06 09:22:03');
INSERT INTO `strongadmin_log` VALUES (526, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:32:41', '2021-09-06 09:32:41');
INSERT INTO `strongadmin_log` VALUES (527, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:54:30', '2021-09-06 09:54:30');
INSERT INTO `strongadmin_log` VALUES (528, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 09:55:32', '2021-09-06 09:55:32');
INSERT INTO `strongadmin_log` VALUES (529, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-06 10:01:01', '2021-09-06 10:01:01');
INSERT INTO `strongadmin_log` VALUES (530, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:01:11', '2021-09-06 10:01:11');
INSERT INTO `strongadmin_log` VALUES (531, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:06:00', '2021-09-06 10:06:00');
INSERT INTO `strongadmin_log` VALUES (532, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:12:04', '2021-09-06 10:12:04');
INSERT INTO `strongadmin_log` VALUES (533, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:18:00', '2021-09-06 10:18:00');
INSERT INTO `strongadmin_log` VALUES (534, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:19:52', '2021-09-06 10:19:52');
INSERT INTO `strongadmin_log` VALUES (535, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:32:33', '2021-09-06 10:32:33');
INSERT INTO `strongadmin_log` VALUES (536, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:35:17', '2021-09-06 10:35:17');
INSERT INTO `strongadmin_log` VALUES (537, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:57:35', '2021-09-06 10:57:35');
INSERT INTO `strongadmin_log` VALUES (538, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:58:06', '2021-09-06 10:58:06');
INSERT INTO `strongadmin_log` VALUES (539, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 10:58:50', '2021-09-06 10:58:50');
INSERT INTO `strongadmin_log` VALUES (540, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:05:58', '2021-09-06 11:05:58');
INSERT INTO `strongadmin_log` VALUES (541, '/admin/order/confirm/paid', '[確認付款][訂單管理]『id:\"12\"』', NULL, NULL, 19, '2021-09-06 11:07:39', '2021-09-06 11:07:39');
INSERT INTO `strongadmin_log` VALUES (542, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:27:16', '2021-09-06 11:27:16');
INSERT INTO `strongadmin_log` VALUES (543, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:29:02', '2021-09-06 11:29:02');
INSERT INTO `strongadmin_log` VALUES (544, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:33:02', '2021-09-06 11:33:02');
INSERT INTO `strongadmin_log` VALUES (545, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:45:20', '2021-09-06 11:45:20');
INSERT INTO `strongadmin_log` VALUES (546, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 11:56:59', '2021-09-06 11:56:59');
INSERT INTO `strongadmin_log` VALUES (547, '/admin/product/specGroup/create', '[建立成功][產品規格組][id:7]', NULL, NULL, 19, '2021-09-06 11:57:54', '2021-09-06 11:57:54');
INSERT INTO `strongadmin_log` VALUES (548, '/admin/product/spec/create', '[建立成功][產品規格表][id:10]', NULL, NULL, 19, '2021-09-06 11:58:21', '2021-09-06 11:58:21');
INSERT INTO `strongadmin_log` VALUES (549, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 12:07:39', '2021-09-06 12:07:39');
INSERT INTO `strongadmin_log` VALUES (550, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 12:21:31', '2021-09-06 12:21:31');
INSERT INTO `strongadmin_log` VALUES (551, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 12:25:34', '2021-09-06 12:25:34');
INSERT INTO `strongadmin_log` VALUES (552, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 12:26:23', '2021-09-06 12:26:23');
INSERT INTO `strongadmin_log` VALUES (553, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 13:36:04', '2021-09-06 13:36:04');
INSERT INTO `strongadmin_log` VALUES (554, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 13:53:14', '2021-09-06 13:53:14');
INSERT INTO `strongadmin_log` VALUES (555, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-06 14:17:29', '2021-09-06 14:17:29');
INSERT INTO `strongadmin_log` VALUES (556, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-06 14:17:44', '2021-09-06 14:17:44');
INSERT INTO `strongadmin_log` VALUES (557, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 14:18:00', '2021-09-06 14:18:00');
INSERT INTO `strongadmin_log` VALUES (558, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 16:25:15', '2021-09-06 16:25:15');
INSERT INTO `strongadmin_log` VALUES (559, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 17:18:05', '2021-09-06 17:18:05');
INSERT INTO `strongadmin_log` VALUES (560, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-06 17:29:05', '2021-09-06 17:29:05');
INSERT INTO `strongadmin_log` VALUES (561, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 17:29:11', '2021-09-06 17:29:11');
INSERT INTO `strongadmin_log` VALUES (562, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 17:57:09', '2021-09-06 17:57:09');
INSERT INTO `strongadmin_log` VALUES (563, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 18:03:47', '2021-09-06 18:03:47');
INSERT INTO `strongadmin_log` VALUES (564, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 18:05:45', '2021-09-06 18:05:45');
INSERT INTO `strongadmin_log` VALUES (565, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 18:14:32', '2021-09-06 18:14:32');
INSERT INTO `strongadmin_log` VALUES (566, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 18:47:12', '2021-09-06 18:47:12');
INSERT INTO `strongadmin_log` VALUES (567, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 19:47:02', '2021-09-06 19:47:02');
INSERT INTO `strongadmin_log` VALUES (568, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 20:15:23', '2021-09-06 20:15:23');
INSERT INTO `strongadmin_log` VALUES (569, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 20:49:05', '2021-09-06 20:49:05');
INSERT INTO `strongadmin_log` VALUES (570, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-06 23:58:31', '2021-09-06 23:58:31');
INSERT INTO `strongadmin_log` VALUES (571, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 01:06:43', '2021-09-07 01:06:43');
INSERT INTO `strongadmin_log` VALUES (572, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 08:24:52', '2021-09-07 08:24:52');
INSERT INTO `strongadmin_log` VALUES (573, '/admin/order/confirm/close', '[成功關閉訂單][訂單管理]『id:\"1\"』『order_no:』', NULL, NULL, 19, '2021-09-07 08:29:49', '2021-09-07 08:29:49');
INSERT INTO `strongadmin_log` VALUES (574, '/admin/product/category/create', '[建立成功][產品分類][id:33]', NULL, NULL, 19, '2021-09-07 08:37:43', '2021-09-07 08:37:43');
INSERT INTO `strongadmin_log` VALUES (575, '/admin/product/category/create', '[建立成功][產品分類][id:34]', NULL, NULL, 19, '2021-09-07 08:38:30', '2021-09-07 08:38:30');
INSERT INTO `strongadmin_log` VALUES (576, '/admin/product/category/create', '[建立成功][產品分類][id:35]', NULL, NULL, 19, '2021-09-07 08:39:20', '2021-09-07 08:39:20');
INSERT INTO `strongadmin_log` VALUES (577, '/admin/product/spec/create', '[建立成功][產品規格表][id:11]', NULL, NULL, 19, '2021-09-07 08:43:00', '2021-09-07 08:43:00');
INSERT INTO `strongadmin_log` VALUES (578, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 09:08:22', '2021-09-07 09:08:22');
INSERT INTO `strongadmin_log` VALUES (579, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 09:10:42', '2021-09-07 09:10:42');
INSERT INTO `strongadmin_log` VALUES (580, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 09:37:14', '2021-09-07 09:37:14');
INSERT INTO `strongadmin_log` VALUES (581, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 09:38:21', '2021-09-07 09:38:21');
INSERT INTO `strongadmin_log` VALUES (582, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 09:42:57', '2021-09-07 09:42:57');
INSERT INTO `strongadmin_log` VALUES (583, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 11:19:28', '2021-09-07 11:19:28');
INSERT INTO `strongadmin_log` VALUES (584, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 11:24:20', '2021-09-07 11:24:20');
INSERT INTO `strongadmin_log` VALUES (585, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 12:02:39', '2021-09-07 12:02:39');
INSERT INTO `strongadmin_log` VALUES (586, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 12:12:15', '2021-09-07 12:12:15');
INSERT INTO `strongadmin_log` VALUES (587, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 13:52:10', '2021-09-07 13:52:10');
INSERT INTO `strongadmin_log` VALUES (588, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 13:52:20', '2021-09-07 13:52:20');
INSERT INTO `strongadmin_log` VALUES (589, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 14:31:22', '2021-09-07 14:31:22');
INSERT INTO `strongadmin_log` VALUES (590, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 14:42:01', '2021-09-07 14:42:01');
INSERT INTO `strongadmin_log` VALUES (591, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 14:58:26', '2021-09-07 14:58:26');
INSERT INTO `strongadmin_log` VALUES (592, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 15:34:13', '2021-09-07 15:34:13');
INSERT INTO `strongadmin_log` VALUES (593, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:04:24', '2021-09-07 16:04:24');
INSERT INTO `strongadmin_log` VALUES (594, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:09:42', '2021-09-07 16:09:42');
INSERT INTO `strongadmin_log` VALUES (595, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:10:44', '2021-09-07 16:10:44');
INSERT INTO `strongadmin_log` VALUES (596, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:26:47', '2021-09-07 16:26:47');
INSERT INTO `strongadmin_log` VALUES (597, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:28:54', '2021-09-07 16:28:54');
INSERT INTO `strongadmin_log` VALUES (598, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:30:04', '2021-09-07 16:30:04');
INSERT INTO `strongadmin_log` VALUES (599, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:30:09', '2021-09-07 16:30:09');
INSERT INTO `strongadmin_log` VALUES (600, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 16:59:44', '2021-09-07 16:59:44');
INSERT INTO `strongadmin_log` VALUES (601, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 17:01:07', '2021-09-07 17:01:07');
INSERT INTO `strongadmin_log` VALUES (602, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 17:26:34', '2021-09-07 17:26:34');
INSERT INTO `strongadmin_log` VALUES (603, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 17:26:54', '2021-09-07 17:26:54');
INSERT INTO `strongadmin_log` VALUES (604, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 17:32:58', '2021-09-07 17:32:58');
INSERT INTO `strongadmin_log` VALUES (605, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 17:52:17', '2021-09-07 17:52:17');
INSERT INTO `strongadmin_log` VALUES (606, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 18:24:26', '2021-09-07 18:24:26');
INSERT INTO `strongadmin_log` VALUES (607, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-07 18:25:22', '2021-09-07 18:25:22');
INSERT INTO `strongadmin_log` VALUES (608, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-07 18:25:28', '2021-09-07 18:25:28');
INSERT INTO `strongadmin_log` VALUES (609, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-09-07 18:25:30', '2021-09-07 18:25:30');
INSERT INTO `strongadmin_log` VALUES (610, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 18:25:44', '2021-09-07 18:25:44');
INSERT INTO `strongadmin_log` VALUES (611, '/admin/adminMenu/create', '[菜單管理][新增成功][id:130]', NULL, NULL, 1, '2021-09-07 18:26:28', '2021-09-07 18:26:28');
INSERT INTO `strongadmin_log` VALUES (612, '/admin/adminMenu/create', '[菜單管理][新增成功][id:131]', NULL, NULL, 1, '2021-09-07 18:27:03', '2021-09-07 18:27:03');
INSERT INTO `strongadmin_log` VALUES (613, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-09-07 18:28:39', '2021-09-07 18:28:39');
INSERT INTO `strongadmin_log` VALUES (614, '/admin/adminMenu/update', '[菜單管理][更新成功][id:130]', NULL, NULL, 1, '2021-09-07 18:28:52', '2021-09-07 18:28:52');
INSERT INTO `strongadmin_log` VALUES (615, '/admin/adminMenu/create', '[菜單管理][新增成功][id:132]', NULL, NULL, 1, '2021-09-07 18:29:55', '2021-09-07 18:29:55');
INSERT INTO `strongadmin_log` VALUES (616, '/admin/adminMenu/create', '[菜單管理][新增成功][id:133]', NULL, NULL, 1, '2021-09-07 18:30:16', '2021-09-07 18:30:16');
INSERT INTO `strongadmin_log` VALUES (617, '/admin/adminMenu/create', '[菜單管理][新增成功][id:134]', NULL, NULL, 1, '2021-09-07 18:30:30', '2021-09-07 18:30:30');
INSERT INTO `strongadmin_log` VALUES (618, '/admin/adminMenu/create', '[菜單管理][新增成功][id:135]', NULL, NULL, 1, '2021-09-07 18:30:47', '2021-09-07 18:30:47');
INSERT INTO `strongadmin_log` VALUES (619, '/admin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-09-07 18:31:03', '2021-09-07 18:31:03');
INSERT INTO `strongadmin_log` VALUES (620, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 20:02:46', '2021-09-07 20:02:46');
INSERT INTO `strongadmin_log` VALUES (621, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 20:07:08', '2021-09-07 20:07:08');
INSERT INTO `strongadmin_log` VALUES (622, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 20:17:31', '2021-09-07 20:17:31');
INSERT INTO `strongadmin_log` VALUES (623, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 20:27:59', '2021-09-07 20:27:59');
INSERT INTO `strongadmin_log` VALUES (624, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 20:52:05', '2021-09-07 20:52:05');
INSERT INTO `strongadmin_log` VALUES (625, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-07 22:23:12', '2021-09-07 22:23:12');
INSERT INTO `strongadmin_log` VALUES (626, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 08:31:31', '2021-09-08 08:31:31');
INSERT INTO `strongadmin_log` VALUES (627, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 08:54:29', '2021-09-08 08:54:29');
INSERT INTO `strongadmin_log` VALUES (628, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 09:57:11', '2021-09-08 09:57:11');
INSERT INTO `strongadmin_log` VALUES (629, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-08 09:57:30', '2021-09-08 09:57:30');
INSERT INTO `strongadmin_log` VALUES (630, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 09:57:35', '2021-09-08 09:57:35');
INSERT INTO `strongadmin_log` VALUES (631, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 10:04:33', '2021-09-08 10:04:33');
INSERT INTO `strongadmin_log` VALUES (632, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 11:15:03', '2021-09-08 11:15:03');
INSERT INTO `strongadmin_log` VALUES (633, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-08 11:15:19', '2021-09-08 11:15:19');
INSERT INTO `strongadmin_log` VALUES (634, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 11:15:25', '2021-09-08 11:15:25');
INSERT INTO `strongadmin_log` VALUES (635, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 11:17:10', '2021-09-08 11:17:10');
INSERT INTO `strongadmin_log` VALUES (636, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 12:11:49', '2021-09-08 12:11:49');
INSERT INTO `strongadmin_log` VALUES (637, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-08 13:44:50', '2021-09-08 13:44:50');
INSERT INTO `strongadmin_log` VALUES (638, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 13:44:55', '2021-09-08 13:44:55');
INSERT INTO `strongadmin_log` VALUES (639, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 14:58:02', '2021-09-08 14:58:02');
INSERT INTO `strongadmin_log` VALUES (640, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 15:51:56', '2021-09-08 15:51:56');
INSERT INTO `strongadmin_log` VALUES (641, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 16:27:34', '2021-09-08 16:27:34');
INSERT INTO `strongadmin_log` VALUES (642, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 16:36:22', '2021-09-08 16:36:22');
INSERT INTO `strongadmin_log` VALUES (643, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-08 17:47:43', '2021-09-08 17:47:43');
INSERT INTO `strongadmin_log` VALUES (644, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-08 18:02:15', '2021-09-08 18:02:15');
INSERT INTO `strongadmin_log` VALUES (645, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 07:25:07', '2021-09-09 07:25:07');
INSERT INTO `strongadmin_log` VALUES (646, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-09 08:31:54', '2021-09-09 08:31:54');
INSERT INTO `strongadmin_log` VALUES (647, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 08:32:02', '2021-09-09 08:32:02');
INSERT INTO `strongadmin_log` VALUES (648, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 09:09:36', '2021-09-09 09:09:36');
INSERT INTO `strongadmin_log` VALUES (649, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 09:22:41', '2021-09-09 09:22:41');
INSERT INTO `strongadmin_log` VALUES (650, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 13:41:15', '2021-09-09 13:41:15');
INSERT INTO `strongadmin_log` VALUES (651, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 14:22:52', '2021-09-09 14:22:52');
INSERT INTO `strongadmin_log` VALUES (652, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 16:43:04', '2021-09-09 16:43:04');
INSERT INTO `strongadmin_log` VALUES (653, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 17:24:25', '2021-09-09 17:24:25');
INSERT INTO `strongadmin_log` VALUES (654, '/admin/user/update', '[更新成功][會員表][id:6]', NULL, NULL, 19, '2021-09-09 17:24:49', '2021-09-09 17:24:49');
INSERT INTO `strongadmin_log` VALUES (655, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 17:28:49', '2021-09-09 17:28:49');
INSERT INTO `strongadmin_log` VALUES (656, '/admin/product/spec/update', '[更新成功][產品規格表][id:11]', NULL, NULL, 19, '2021-09-09 17:29:30', '2021-09-09 17:29:30');
INSERT INTO `strongadmin_log` VALUES (657, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 17:35:53', '2021-09-09 17:35:53');
INSERT INTO `strongadmin_log` VALUES (658, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 22:07:15', '2021-09-09 22:07:15');
INSERT INTO `strongadmin_log` VALUES (659, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-09 23:23:16', '2021-09-09 23:23:16');
INSERT INTO `strongadmin_log` VALUES (660, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 00:19:48', '2021-09-10 00:19:48');
INSERT INTO `strongadmin_log` VALUES (661, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 08:21:51', '2021-09-10 08:21:51');
INSERT INTO `strongadmin_log` VALUES (662, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 10:09:21', '2021-09-10 10:09:21');
INSERT INTO `strongadmin_log` VALUES (663, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 11:28:26', '2021-09-10 11:28:26');
INSERT INTO `strongadmin_log` VALUES (664, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 13:20:39', '2021-09-10 13:20:39');
INSERT INTO `strongadmin_log` VALUES (666, '/admin/adminLog/destroy', '[刪除成功][操作日誌表]『id:[\"665\"]』', NULL, NULL, 19, '2021-09-10 15:16:28', '2021-09-10 15:16:28');
INSERT INTO `strongadmin_log` VALUES (667, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 15:20:34', '2021-09-10 15:20:34');
INSERT INTO `strongadmin_log` VALUES (668, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 15:30:37', '2021-09-10 15:30:37');
INSERT INTO `strongadmin_log` VALUES (669, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 15:31:28', '2021-09-10 15:31:28');
INSERT INTO `strongadmin_log` VALUES (670, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 15:45:05', '2021-09-10 15:45:05');
INSERT INTO `strongadmin_log` VALUES (671, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 16:40:11', '2021-09-10 16:40:11');
INSERT INTO `strongadmin_log` VALUES (672, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 18:35:58', '2021-09-10 18:35:58');
INSERT INTO `strongadmin_log` VALUES (673, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 21:50:12', '2021-09-10 21:50:12');
INSERT INTO `strongadmin_log` VALUES (674, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-10 23:34:39', '2021-09-10 23:34:39');
INSERT INTO `strongadmin_log` VALUES (675, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-11 09:53:55', '2021-09-11 09:53:55');
INSERT INTO `strongadmin_log` VALUES (676, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-11 09:53:58', '2021-09-11 09:53:58');
INSERT INTO `strongadmin_log` VALUES (677, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 09:54:02', '2021-09-11 09:54:02');
INSERT INTO `strongadmin_log` VALUES (678, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 09:58:42', '2021-09-11 09:58:42');
INSERT INTO `strongadmin_log` VALUES (679, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-11 10:09:58', '2021-09-11 10:09:58');
INSERT INTO `strongadmin_log` VALUES (680, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 10:26:39', '2021-09-11 10:26:39');
INSERT INTO `strongadmin_log` VALUES (681, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 11:27:33', '2021-09-11 11:27:33');
INSERT INTO `strongadmin_log` VALUES (682, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 15:01:01', '2021-09-11 15:01:01');
INSERT INTO `strongadmin_log` VALUES (683, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 15:17:58', '2021-09-11 15:17:58');
INSERT INTO `strongadmin_log` VALUES (684, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 17:33:45', '2021-09-11 17:33:45');
INSERT INTO `strongadmin_log` VALUES (685, '/admin/user/update', '[更新成功][會員表][id:1]', NULL, NULL, 19, '2021-09-11 17:35:07', '2021-09-11 17:35:07');
INSERT INTO `strongadmin_log` VALUES (686, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 17:37:35', '2021-09-11 17:37:35');
INSERT INTO `strongadmin_log` VALUES (687, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 18:12:52', '2021-09-11 18:12:52');
INSERT INTO `strongadmin_log` VALUES (688, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-11 23:20:51', '2021-09-11 23:20:51');
INSERT INTO `strongadmin_log` VALUES (689, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-12 01:18:17', '2021-09-12 01:18:17');
INSERT INTO `strongadmin_log` VALUES (690, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-12 14:49:34', '2021-09-12 14:49:34');
INSERT INTO `strongadmin_log` VALUES (691, '/admin/user/update', '[更新成功][會員表][id:6]', NULL, NULL, 19, '2021-09-12 14:51:36', '2021-09-12 14:51:36');
INSERT INTO `strongadmin_log` VALUES (692, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-12 23:53:58', '2021-09-12 23:53:58');
INSERT INTO `strongadmin_log` VALUES (693, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-12 23:54:52', '2021-09-12 23:54:52');
INSERT INTO `strongadmin_log` VALUES (694, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 09:26:40', '2021-09-13 09:26:40');
INSERT INTO `strongadmin_log` VALUES (695, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 10:30:07', '2021-09-13 10:30:07');
INSERT INTO `strongadmin_log` VALUES (696, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 11:40:19', '2021-09-13 11:40:19');
INSERT INTO `strongadmin_log` VALUES (697, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 13:52:07', '2021-09-13 13:52:07');
INSERT INTO `strongadmin_log` VALUES (698, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 16:22:00', '2021-09-13 16:22:00');
INSERT INTO `strongadmin_log` VALUES (699, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 16:51:53', '2021-09-13 16:51:53');
INSERT INTO `strongadmin_log` VALUES (700, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-13 22:05:27', '2021-09-13 22:05:27');
INSERT INTO `strongadmin_log` VALUES (701, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 09:33:28', '2021-09-14 09:33:28');
INSERT INTO `strongadmin_log` VALUES (702, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 10:46:14', '2021-09-14 10:46:14');
INSERT INTO `strongadmin_log` VALUES (703, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 10:55:31', '2021-09-14 10:55:31');
INSERT INTO `strongadmin_log` VALUES (704, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 14:47:16', '2021-09-14 14:47:16');
INSERT INTO `strongadmin_log` VALUES (705, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 15:20:00', '2021-09-14 15:20:00');
INSERT INTO `strongadmin_log` VALUES (706, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-14 17:26:43', '2021-09-14 17:26:43');
INSERT INTO `strongadmin_log` VALUES (707, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 10:44:26', '2021-09-15 10:44:26');
INSERT INTO `strongadmin_log` VALUES (708, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 14:37:02', '2021-09-15 14:37:02');
INSERT INTO `strongadmin_log` VALUES (709, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 16:02:05', '2021-09-15 16:02:05');
INSERT INTO `strongadmin_log` VALUES (710, '/admin/product/specGroup/create', '[建立成功][產品規格組][id:8]', NULL, NULL, 19, '2021-09-15 16:04:32', '2021-09-15 16:04:32');
INSERT INTO `strongadmin_log` VALUES (711, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 17:38:53', '2021-09-15 17:38:53');
INSERT INTO `strongadmin_log` VALUES (712, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 18:50:12', '2021-09-15 18:50:12');
INSERT INTO `strongadmin_log` VALUES (713, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 20:11:39', '2021-09-15 20:11:39');
INSERT INTO `strongadmin_log` VALUES (714, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 20:19:35', '2021-09-15 20:19:35');
INSERT INTO `strongadmin_log` VALUES (715, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-15 21:04:32', '2021-09-15 21:04:32');
INSERT INTO `strongadmin_log` VALUES (716, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-15 21:04:32', '2021-09-15 21:04:32');
INSERT INTO `strongadmin_log` VALUES (717, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-15 21:04:34', '2021-09-15 21:04:34');
INSERT INTO `strongadmin_log` VALUES (718, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 21:04:47', '2021-09-15 21:04:47');
INSERT INTO `strongadmin_log` VALUES (719, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-15 21:13:34', '2021-09-15 21:13:34');
INSERT INTO `strongadmin_log` VALUES (720, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 21:13:50', '2021-09-15 21:13:50');
INSERT INTO `strongadmin_log` VALUES (721, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 22:16:20', '2021-09-15 22:16:20');
INSERT INTO `strongadmin_log` VALUES (722, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 22:49:41', '2021-09-15 22:49:41');
INSERT INTO `strongadmin_log` VALUES (723, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 23:17:41', '2021-09-15 23:17:41');
INSERT INTO `strongadmin_log` VALUES (724, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-15 23:20:17', '2021-09-15 23:20:17');
INSERT INTO `strongadmin_log` VALUES (725, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 02:51:40', '2021-09-16 02:51:40');
INSERT INTO `strongadmin_log` VALUES (726, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:00:45', '2021-09-16 08:00:45');
INSERT INTO `strongadmin_log` VALUES (727, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:05:15', '2021-09-16 08:05:15');
INSERT INTO `strongadmin_log` VALUES (728, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:17:01', '2021-09-16 08:17:01');
INSERT INTO `strongadmin_log` VALUES (729, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:17:51', '2021-09-16 08:17:51');
INSERT INTO `strongadmin_log` VALUES (730, '/admin/user/feedback/update', '[更新成功][意見反饋表][id:1]', NULL, NULL, 19, '2021-09-16 08:22:39', '2021-09-16 08:22:39');
INSERT INTO `strongadmin_log` VALUES (731, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:25:44', '2021-09-16 08:25:44');
INSERT INTO `strongadmin_log` VALUES (732, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:41:25', '2021-09-16 08:41:25');
INSERT INTO `strongadmin_log` VALUES (733, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 08:50:07', '2021-09-16 08:50:07');
INSERT INTO `strongadmin_log` VALUES (734, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:01:07', '2021-09-16 09:01:07');
INSERT INTO `strongadmin_log` VALUES (735, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:09:23', '2021-09-16 09:09:23');
INSERT INTO `strongadmin_log` VALUES (736, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:14:25', '2021-09-16 09:14:25');
INSERT INTO `strongadmin_log` VALUES (737, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:20:18', '2021-09-16 09:20:18');
INSERT INTO `strongadmin_log` VALUES (738, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:27:08', '2021-09-16 09:27:08');
INSERT INTO `strongadmin_log` VALUES (739, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:28:13', '2021-09-16 09:28:13');
INSERT INTO `strongadmin_log` VALUES (740, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:29:23', '2021-09-16 09:29:23');
INSERT INTO `strongadmin_log` VALUES (741, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-16 09:30:47', '2021-09-16 09:30:47');
INSERT INTO `strongadmin_log` VALUES (742, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:32:55', '2021-09-16 09:32:55');
INSERT INTO `strongadmin_log` VALUES (743, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:35:50', '2021-09-16 09:35:50');
INSERT INTO `strongadmin_log` VALUES (744, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:51:17', '2021-09-16 09:51:17');
INSERT INTO `strongadmin_log` VALUES (745, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 09:55:23', '2021-09-16 09:55:23');
INSERT INTO `strongadmin_log` VALUES (746, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:01:27', '2021-09-16 10:01:27');
INSERT INTO `strongadmin_log` VALUES (747, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:06:52', '2021-09-16 10:06:52');
INSERT INTO `strongadmin_log` VALUES (748, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:10:17', '2021-09-16 10:10:17');
INSERT INTO `strongadmin_log` VALUES (749, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:15:52', '2021-09-16 10:15:52');
INSERT INTO `strongadmin_log` VALUES (750, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:18:41', '2021-09-16 10:18:41');
INSERT INTO `strongadmin_log` VALUES (751, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:23:44', '2021-09-16 10:23:44');
INSERT INTO `strongadmin_log` VALUES (752, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:30:11', '2021-09-16 10:30:11');
INSERT INTO `strongadmin_log` VALUES (753, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:34:51', '2021-09-16 10:34:51');
INSERT INTO `strongadmin_log` VALUES (754, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 10:44:13', '2021-09-16 10:44:13');
INSERT INTO `strongadmin_log` VALUES (755, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 11:08:59', '2021-09-16 11:08:59');
INSERT INTO `strongadmin_log` VALUES (756, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-16 11:17:42', '2021-09-16 11:17:42');
INSERT INTO `strongadmin_log` VALUES (757, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 11:17:53', '2021-09-16 11:17:53');
INSERT INTO `strongadmin_log` VALUES (758, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 11:20:48', '2021-09-16 11:20:48');
INSERT INTO `strongadmin_log` VALUES (759, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 11:56:01', '2021-09-16 11:56:01');
INSERT INTO `strongadmin_log` VALUES (760, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 12:29:19', '2021-09-16 12:29:19');
INSERT INTO `strongadmin_log` VALUES (761, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 14:07:21', '2021-09-16 14:07:21');
INSERT INTO `strongadmin_log` VALUES (762, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 14:27:40', '2021-09-16 14:27:40');
INSERT INTO `strongadmin_log` VALUES (763, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 14:34:39', '2021-09-16 14:34:39');
INSERT INTO `strongadmin_log` VALUES (764, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 14:35:03', '2021-09-16 14:35:03');
INSERT INTO `strongadmin_log` VALUES (765, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"13\"』', NULL, NULL, 19, '2021-09-16 14:39:09', '2021-09-16 14:39:09');
INSERT INTO `strongadmin_log` VALUES (766, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"13\"』', NULL, NULL, 19, '2021-09-16 14:39:11', '2021-09-16 14:39:11');
INSERT INTO `strongadmin_log` VALUES (767, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 14:48:50', '2021-09-16 14:48:50');
INSERT INTO `strongadmin_log` VALUES (768, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 15:15:21', '2021-09-16 15:15:21');
INSERT INTO `strongadmin_log` VALUES (769, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 15:20:42', '2021-09-16 15:20:42');
INSERT INTO `strongadmin_log` VALUES (770, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-16 16:36:06', '2021-09-16 16:36:06');
INSERT INTO `strongadmin_log` VALUES (771, '/admin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-16 16:36:15', '2021-09-16 16:36:15');
INSERT INTO `strongadmin_log` VALUES (772, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 16:36:25', '2021-09-16 16:36:25');
INSERT INTO `strongadmin_log` VALUES (773, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 16:48:21', '2021-09-16 16:48:21');
INSERT INTO `strongadmin_log` VALUES (774, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 16:54:01', '2021-09-16 16:54:01');
INSERT INTO `strongadmin_log` VALUES (775, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 16:58:45', '2021-09-16 16:58:45');
INSERT INTO `strongadmin_log` VALUES (776, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 17:07:05', '2021-09-16 17:07:05');
INSERT INTO `strongadmin_log` VALUES (777, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 17:10:39', '2021-09-16 17:10:39');
INSERT INTO `strongadmin_log` VALUES (778, '/admin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-16 19:15:05', '2021-09-16 19:15:05');
INSERT INTO `strongadmin_log` VALUES (779, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 22:22:18', '2021-09-16 22:22:18');
INSERT INTO `strongadmin_log` VALUES (780, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 22:31:32', '2021-09-16 22:31:32');
INSERT INTO `strongadmin_log` VALUES (781, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-16 23:23:56', '2021-09-16 23:23:56');
INSERT INTO `strongadmin_log` VALUES (782, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 00:43:50', '2021-09-17 00:43:50');
INSERT INTO `strongadmin_log` VALUES (783, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 05:34:54', '2021-09-17 05:34:54');
INSERT INTO `strongadmin_log` VALUES (784, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 09:03:28', '2021-09-17 09:03:28');
INSERT INTO `strongadmin_log` VALUES (785, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 09:19:48', '2021-09-17 09:19:48');
INSERT INTO `strongadmin_log` VALUES (786, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 09:47:17', '2021-09-17 09:47:17');
INSERT INTO `strongadmin_log` VALUES (787, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 10:01:04', '2021-09-17 10:01:04');
INSERT INTO `strongadmin_log` VALUES (788, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 10:24:46', '2021-09-17 10:24:46');
INSERT INTO `strongadmin_log` VALUES (789, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 10:27:45', '2021-09-17 10:27:45');
INSERT INTO `strongadmin_log` VALUES (790, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 10:39:44', '2021-09-17 10:39:44');
INSERT INTO `strongadmin_log` VALUES (791, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 13:34:39', '2021-09-17 13:34:39');
INSERT INTO `strongadmin_log` VALUES (792, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 14:59:59', '2021-09-17 14:59:59');
INSERT INTO `strongadmin_log` VALUES (793, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 15:24:53', '2021-09-17 15:24:53');
INSERT INTO `strongadmin_log` VALUES (794, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 16:03:53', '2021-09-17 16:03:53');
INSERT INTO `strongadmin_log` VALUES (795, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 16:23:20', '2021-09-17 16:23:20');
INSERT INTO `strongadmin_log` VALUES (796, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 17:27:23', '2021-09-17 17:27:23');
INSERT INTO `strongadmin_log` VALUES (797, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 17:58:16', '2021-09-17 17:58:16');
INSERT INTO `strongadmin_log` VALUES (798, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 18:14:40', '2021-09-17 18:14:40');
INSERT INTO `strongadmin_log` VALUES (799, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 18:16:31', '2021-09-17 18:16:31');
INSERT INTO `strongadmin_log` VALUES (800, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 18:18:33', '2021-09-17 18:18:33');
INSERT INTO `strongadmin_log` VALUES (801, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 21:34:46', '2021-09-17 21:34:46');
INSERT INTO `strongadmin_log` VALUES (802, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-17 23:06:41', '2021-09-17 23:06:41');
INSERT INTO `strongadmin_log` VALUES (803, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 10:49:27', '2021-09-18 10:49:27');
INSERT INTO `strongadmin_log` VALUES (804, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 13:38:07', '2021-09-18 13:38:07');
INSERT INTO `strongadmin_log` VALUES (805, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 14:08:07', '2021-09-18 14:08:07');
INSERT INTO `strongadmin_log` VALUES (806, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 17:00:56', '2021-09-18 17:00:56');
INSERT INTO `strongadmin_log` VALUES (807, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 20:05:12', '2021-09-18 20:05:12');
INSERT INTO `strongadmin_log` VALUES (808, '/admin/order/confirm/shipped', '[確認發貨][訂單管理]『id:\"18\"』', NULL, NULL, 19, '2021-09-18 20:11:19', '2021-09-18 20:11:19');
INSERT INTO `strongadmin_log` VALUES (809, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 20:55:55', '2021-09-18 20:55:55');
INSERT INTO `strongadmin_log` VALUES (810, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-18 22:50:13', '2021-09-18 22:50:13');
INSERT INTO `strongadmin_log` VALUES (811, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-19 08:48:01', '2021-09-19 08:48:01');
INSERT INTO `strongadmin_log` VALUES (812, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-19 18:21:43', '2021-09-19 18:21:43');
INSERT INTO `strongadmin_log` VALUES (813, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-19 19:23:29', '2021-09-19 19:23:29');
INSERT INTO `strongadmin_log` VALUES (814, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-19 20:56:07', '2021-09-19 20:56:07');
INSERT INTO `strongadmin_log` VALUES (815, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-19 22:29:36', '2021-09-19 22:29:36');
INSERT INTO `strongadmin_log` VALUES (816, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-20 13:51:17', '2021-09-20 13:51:17');
INSERT INTO `strongadmin_log` VALUES (817, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-20 13:56:08', '2021-09-20 13:56:08');
INSERT INTO `strongadmin_log` VALUES (818, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-20 16:20:29', '2021-09-20 16:20:29');
INSERT INTO `strongadmin_log` VALUES (819, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-21 09:46:59', '2021-09-21 09:46:59');
INSERT INTO `strongadmin_log` VALUES (820, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-21 14:48:05', '2021-09-21 14:48:05');
INSERT INTO `strongadmin_log` VALUES (821, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-21 21:31:47', '2021-09-21 21:31:47');
INSERT INTO `strongadmin_log` VALUES (822, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-21 21:41:53', '2021-09-21 21:41:53');
INSERT INTO `strongadmin_log` VALUES (823, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 09:53:50', '2021-09-22 09:53:50');
INSERT INTO `strongadmin_log` VALUES (824, '/admin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 13:11:31', '2021-09-22 13:11:31');
INSERT INTO `strongadmin_log` VALUES (825, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-22 15:19:59', '2021-09-22 15:19:59');
INSERT INTO `strongadmin_log` VALUES (826, '/strongadmin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-22 15:21:15', '2021-09-22 15:21:15');
INSERT INTO `strongadmin_log` VALUES (827, '/strongadmin/adminRole/assignPermissions', '[角色表][分配許可權]『id:2』', NULL, NULL, 1, '2021-09-22 15:22:33', '2021-09-22 15:22:33');
INSERT INTO `strongadmin_log` VALUES (828, '/strongadmin/adminMenu/update', '[菜單管理][更新成功][id:41]', NULL, NULL, 1, '2021-09-22 15:31:12', '2021-09-22 15:31:12');
INSERT INTO `strongadmin_log` VALUES (829, '/strongadmin/adminMenu/update', '[菜單管理][更新成功][id:41]', NULL, NULL, 1, '2021-09-22 15:32:56', '2021-09-22 15:32:56');
INSERT INTO `strongadmin_log` VALUES (830, '/strongadmin/user/feedback/update', '[更新成功][意見反饋表][id:1]', NULL, NULL, 1, '2021-09-22 15:42:05', '2021-09-22 15:42:05');
INSERT INTO `strongadmin_log` VALUES (831, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 16:46:23', '2021-09-22 16:46:23');
INSERT INTO `strongadmin_log` VALUES (832, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 16:46:43', '2021-09-22 16:46:43');
INSERT INTO `strongadmin_log` VALUES (833, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-22 17:09:04', '2021-09-22 17:09:04');
INSERT INTO `strongadmin_log` VALUES (834, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:09:11', '2021-09-22 17:09:11');
INSERT INTO `strongadmin_log` VALUES (835, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:21:02', '2021-09-22 17:21:02');
INSERT INTO `strongadmin_log` VALUES (836, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:24:08', '2021-09-22 17:24:08');
INSERT INTO `strongadmin_log` VALUES (837, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:25:13', '2021-09-22 17:25:13');
INSERT INTO `strongadmin_log` VALUES (838, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:49:31', '2021-09-22 17:49:31');
INSERT INTO `strongadmin_log` VALUES (839, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:52:39', '2021-09-22 17:52:39');
INSERT INTO `strongadmin_log` VALUES (840, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:53:17', '2021-09-22 17:53:17');
INSERT INTO `strongadmin_log` VALUES (841, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 17:54:57', '2021-09-22 17:54:57');
INSERT INTO `strongadmin_log` VALUES (842, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-22 17:59:52', '2021-09-22 17:59:52');
INSERT INTO `strongadmin_log` VALUES (843, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 18:00:15', '2021-09-22 18:00:15');
INSERT INTO `strongadmin_log` VALUES (844, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 18:52:10', '2021-09-22 18:52:10');
INSERT INTO `strongadmin_log` VALUES (845, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-22 22:41:06', '2021-09-22 22:41:06');
INSERT INTO `strongadmin_log` VALUES (846, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 09:11:27', '2021-09-23 09:11:27');
INSERT INTO `strongadmin_log` VALUES (847, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-23 09:27:12', '2021-09-23 09:27:12');
INSERT INTO `strongadmin_log` VALUES (848, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 09:27:19', '2021-09-23 09:27:19');
INSERT INTO `strongadmin_log` VALUES (849, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 09:40:55', '2021-09-23 09:40:55');
INSERT INTO `strongadmin_log` VALUES (850, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 10:10:59', '2021-09-23 10:10:59');
INSERT INTO `strongadmin_log` VALUES (851, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 11:18:32', '2021-09-23 11:18:32');
INSERT INTO `strongadmin_log` VALUES (852, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 11:59:25', '2021-09-23 11:59:25');
INSERT INTO `strongadmin_log` VALUES (853, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 13:42:26', '2021-09-23 13:42:26');
INSERT INTO `strongadmin_log` VALUES (854, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 14:00:17', '2021-09-23 14:00:17');
INSERT INTO `strongadmin_log` VALUES (855, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 14:13:05', '2021-09-23 14:13:05');
INSERT INTO `strongadmin_log` VALUES (856, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 14:59:39', '2021-09-23 14:59:39');
INSERT INTO `strongadmin_log` VALUES (857, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 15:49:39', '2021-09-23 15:49:39');
INSERT INTO `strongadmin_log` VALUES (858, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-23 16:24:14', '2021-09-23 16:24:14');
INSERT INTO `strongadmin_log` VALUES (859, '/strongadmin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-23 16:24:23', '2021-09-23 16:24:23');
INSERT INTO `strongadmin_log` VALUES (860, '/strongadmin/adminMenu/update', '[菜單管理][更新成功][id:36]', NULL, NULL, 1, '2021-09-23 16:25:21', '2021-09-23 16:25:21');
INSERT INTO `strongadmin_log` VALUES (861, '/strongadmin/adminMenu/update', '[菜單管理][更新成功][id:36]', NULL, NULL, 1, '2021-09-23 17:21:15', '2021-09-23 17:21:15');
INSERT INTO `strongadmin_log` VALUES (862, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 17:37:54', '2021-09-23 17:37:54');
INSERT INTO `strongadmin_log` VALUES (863, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-23 17:49:54', '2021-09-23 17:49:54');
INSERT INTO `strongadmin_log` VALUES (864, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 17:50:04', '2021-09-23 17:50:04');
INSERT INTO `strongadmin_log` VALUES (865, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-23 17:58:31', '2021-09-23 17:58:31');
INSERT INTO `strongadmin_log` VALUES (866, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 17:58:38', '2021-09-23 17:58:38');
INSERT INTO `strongadmin_log` VALUES (867, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 18:00:27', '2021-09-23 18:00:27');
INSERT INTO `strongadmin_log` VALUES (868, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 18:04:46', '2021-09-23 18:04:46');
INSERT INTO `strongadmin_log` VALUES (869, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 19:14:20', '2021-09-23 19:14:20');
INSERT INTO `strongadmin_log` VALUES (870, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-23 23:19:51', '2021-09-23 23:19:51');
INSERT INTO `strongadmin_log` VALUES (871, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-23 23:19:58', '2021-09-23 23:19:58');
INSERT INTO `strongadmin_log` VALUES (872, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 05:22:23', '2021-09-24 05:22:23');
INSERT INTO `strongadmin_log` VALUES (873, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 06:49:32', '2021-09-24 06:49:32');
INSERT INTO `strongadmin_log` VALUES (874, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 08:59:15', '2021-09-24 08:59:15');
INSERT INTO `strongadmin_log` VALUES (875, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 09:01:34', '2021-09-24 09:01:34');
INSERT INTO `strongadmin_log` VALUES (876, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 09:56:11', '2021-09-24 09:56:11');
INSERT INTO `strongadmin_log` VALUES (877, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 10:26:06', '2021-09-24 10:26:06');
INSERT INTO `strongadmin_log` VALUES (878, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 11:07:04', '2021-09-24 11:07:04');
INSERT INTO `strongadmin_log` VALUES (879, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 11:07:20', '2021-09-24 11:07:20');
INSERT INTO `strongadmin_log` VALUES (880, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 11:07:20', '2021-09-24 11:07:20');
INSERT INTO `strongadmin_log` VALUES (881, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 11:37:33', '2021-09-24 11:37:33');
INSERT INTO `strongadmin_log` VALUES (882, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 11:41:40', '2021-09-24 11:41:40');
INSERT INTO `strongadmin_log` VALUES (883, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 13:51:42', '2021-09-24 13:51:42');
INSERT INTO `strongadmin_log` VALUES (884, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 13:55:09', '2021-09-24 13:55:09');
INSERT INTO `strongadmin_log` VALUES (885, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 14:02:48', '2021-09-24 14:02:48');
INSERT INTO `strongadmin_log` VALUES (886, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 14:03:41', '2021-09-24 14:03:41');
INSERT INTO `strongadmin_log` VALUES (887, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 14:20:13', '2021-09-24 14:20:13');
INSERT INTO `strongadmin_log` VALUES (888, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 14:20:35', '2021-09-24 14:20:35');
INSERT INTO `strongadmin_log` VALUES (889, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 14:24:09', '2021-09-24 14:24:09');
INSERT INTO `strongadmin_log` VALUES (890, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 14:24:42', '2021-09-24 14:24:42');
INSERT INTO `strongadmin_log` VALUES (891, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 15:30:44', '2021-09-24 15:30:44');
INSERT INTO `strongadmin_log` VALUES (892, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 15:53:10', '2021-09-24 15:53:10');
INSERT INTO `strongadmin_log` VALUES (893, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 16:07:03', '2021-09-24 16:07:03');
INSERT INTO `strongadmin_log` VALUES (894, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 16:36:25', '2021-09-24 16:36:25');
INSERT INTO `strongadmin_log` VALUES (895, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 16:36:32', '2021-09-24 16:36:32');
INSERT INTO `strongadmin_log` VALUES (896, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 16:36:51', '2021-09-24 16:36:51');
INSERT INTO `strongadmin_log` VALUES (897, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 16:37:34', '2021-09-24 16:37:34');
INSERT INTO `strongadmin_log` VALUES (898, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 17:26:10', '2021-09-24 17:26:10');
INSERT INTO `strongadmin_log` VALUES (899, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 17:26:20', '2021-09-24 17:26:20');
INSERT INTO `strongadmin_log` VALUES (900, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 17:26:23', '2021-09-24 17:26:23');
INSERT INTO `strongadmin_log` VALUES (901, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 17:26:26', '2021-09-24 17:26:26');
INSERT INTO `strongadmin_log` VALUES (902, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-24 17:26:30', '2021-09-24 17:26:30');
INSERT INTO `strongadmin_log` VALUES (903, '/strongadmin/login', '登錄失敗次數過多：admin', NULL, NULL, 0, '2021-09-24 17:26:35', '2021-09-24 17:26:35');
INSERT INTO `strongadmin_log` VALUES (904, '/strongadmin/login', '登錄失敗次數過多：admin', NULL, NULL, 0, '2021-09-24 17:26:38', '2021-09-24 17:26:38');
INSERT INTO `strongadmin_log` VALUES (905, '/strongadmin/login', '登錄失敗次數過多：admin', NULL, NULL, 0, '2021-09-24 17:26:39', '2021-09-24 17:26:39');
INSERT INTO `strongadmin_log` VALUES (906, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 17:26:56', '2021-09-24 17:26:56');
INSERT INTO `strongadmin_log` VALUES (907, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-24 17:30:30', '2021-09-24 17:30:30');
INSERT INTO `strongadmin_log` VALUES (908, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 17:30:36', '2021-09-24 17:30:36');
INSERT INTO `strongadmin_log` VALUES (909, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 20:17:17', '2021-09-24 20:17:17');
INSERT INTO `strongadmin_log` VALUES (910, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 22:36:01', '2021-09-24 22:36:01');
INSERT INTO `strongadmin_log` VALUES (911, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-24 22:59:06', '2021-09-24 22:59:06');
INSERT INTO `strongadmin_log` VALUES (912, '/strongadmin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-25 08:17:44', '2021-09-25 08:17:44');
INSERT INTO `strongadmin_log` VALUES (913, '/strongadmin/product/create', '[admin.SuccessCreated][產品表][id:22]', NULL, NULL, 1, '2021-09-25 09:36:25', '2021-09-25 09:36:25');
INSERT INTO `strongadmin_log` VALUES (914, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-25 14:48:33', '2021-09-25 14:48:33');
INSERT INTO `strongadmin_log` VALUES (915, '/strongadmin/login', '登錄成功:admin', NULL, NULL, 1, '2021-09-25 15:35:25', '2021-09-25 15:35:25');
INSERT INTO `strongadmin_log` VALUES (916, '/strongadmin/product/update', '[admin.SuccessUpdated][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\", \"sale_price\": \"21.995\", \"is_recommend\": 1, \"wholesale_set\": \"{\\\"num\\\": [\\\"1\\\", \\\"5\\\", \\\"10\\\"], \\\"price\\\": [\\\"21.995\\\", \\\"19.324\\\", \\\"15.382\\\"]}\", \"original_price\": \"28.594\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"sale_price\": \"15.397\", \"is_recommend\": 2, \"wholesale_set\": \"{\\\"num\\\":[\\\"1\\\",\\\"5\\\",\\\"10\\\"],\\\"price\\\":[\\\"15.397\\\",\\\"13.527\\\",\\\"10.767\\\"]}\", \"original_price\": \"20.016\"}', 1, '2021-09-25 15:36:07', '2021-09-25 15:36:07');
INSERT INTO `strongadmin_log` VALUES (917, '/strongadmin/webconfig/clearcache', '[清楚快取成功][網站設定]', NULL, NULL, 1, '2021-09-25 15:36:22', '2021-09-25 15:36:22');
INSERT INTO `strongadmin_log` VALUES (918, '/strongadmin/product/update', '[admin.SuccessUpdated][產品表][id:1][sku:dress100-01-s]', '{\"img_photos\": \"[{\\\"src\\\": \\\"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\", \\\"title\\\": \\\"s-l1600 (9).jpg\\\", \\\"isImgSpec\\\": true, \\\"isImgCover\\\": true}, {\\\"src\\\": \\\"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\", \\\"title\\\": \\\"s-l1600 (10).jpg\\\", \\\"isImgSpec\\\": false, \\\"isImgCover\\\": false}]\", \"sale_price\": \"15.397\", \"is_recommend\": 2, \"wholesale_set\": \"{\\\"num\\\": [\\\"1\\\", \\\"5\\\", \\\"10\\\"], \\\"price\\\": [\\\"15.397\\\", \\\"13.527\\\", \\\"10.767\\\"]}\", \"original_price\": \"20.016\"}', '{\"img_photos\": \"[{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\\\",\\\"title\\\":\\\"s-l1600 (9).jpg\\\",\\\"isImgCover\\\":true,\\\"isImgSpec\\\":true},{\\\"src\\\":\\\"\\\\/storage\\\\/202103\\\\/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\\\",\\\"title\\\":\\\"s-l1600 (10).jpg\\\",\\\"isImgCover\\\":false,\\\"isImgSpec\\\":false}]\", \"sale_price\": \"10.778\", \"is_recommend\": \"1\", \"wholesale_set\": \"{\\\"num\\\":[\\\"1\\\",\\\"5\\\",\\\"10\\\"],\\\"price\\\":[\\\"10.778\\\",\\\"9.469\\\",\\\"7.537\\\"]}\", \"original_price\": \"14.011\"}', 1, '2021-09-25 16:02:29', '2021-09-25 16:02:29');
INSERT INTO `strongadmin_log` VALUES (919, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-25 16:34:43', '2021-09-25 16:34:43');
INSERT INTO `strongadmin_log` VALUES (920, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-25 20:42:27', '2021-09-25 20:42:27');
INSERT INTO `strongadmin_log` VALUES (921, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-25 22:37:34', '2021-09-25 22:37:34');
INSERT INTO `strongadmin_log` VALUES (922, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 01:29:06', '2021-09-26 01:29:06');
INSERT INTO `strongadmin_log` VALUES (923, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 01:29:19', '2021-09-26 01:29:19');
INSERT INTO `strongadmin_log` VALUES (924, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 09:29:21', '2021-09-26 09:29:21');
INSERT INTO `strongadmin_log` VALUES (925, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 11:49:43', '2021-09-26 11:49:43');
INSERT INTO `strongadmin_log` VALUES (926, '/strongadmin/login', '登錄密碼錯誤：demo', NULL, NULL, 0, '2021-09-26 12:03:43', '2021-09-26 12:03:43');
INSERT INTO `strongadmin_log` VALUES (927, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 12:03:50', '2021-09-26 12:03:50');
INSERT INTO `strongadmin_log` VALUES (928, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-26 12:04:24', '2021-09-26 12:04:24');
INSERT INTO `strongadmin_log` VALUES (929, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-26 12:04:28', '2021-09-26 12:04:28');
INSERT INTO `strongadmin_log` VALUES (930, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-26 12:04:32', '2021-09-26 12:04:32');
INSERT INTO `strongadmin_log` VALUES (931, '/strongadmin/login', '登錄密碼錯誤：admin', NULL, NULL, 0, '2021-09-26 12:04:33', '2021-09-26 12:04:33');
INSERT INTO `strongadmin_log` VALUES (932, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 12:04:47', '2021-09-26 12:04:47');
INSERT INTO `strongadmin_log` VALUES (933, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 13:35:05', '2021-09-26 13:35:05');
INSERT INTO `strongadmin_log` VALUES (934, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 14:02:41', '2021-09-26 14:02:41');
INSERT INTO `strongadmin_log` VALUES (935, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 14:08:29', '2021-09-26 14:08:29');
INSERT INTO `strongadmin_log` VALUES (936, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 14:49:57', '2021-09-26 14:49:57');
INSERT INTO `strongadmin_log` VALUES (937, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 15:53:00', '2021-09-26 15:53:00');
INSERT INTO `strongadmin_log` VALUES (938, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 16:17:08', '2021-09-26 16:17:08');
INSERT INTO `strongadmin_log` VALUES (939, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 16:29:38', '2021-09-26 16:29:38');
INSERT INTO `strongadmin_log` VALUES (940, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 17:09:03', '2021-09-26 17:09:03');
INSERT INTO `strongadmin_log` VALUES (941, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 17:29:14', '2021-09-26 17:29:14');
INSERT INTO `strongadmin_log` VALUES (942, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 20:54:51', '2021-09-26 20:54:51');
INSERT INTO `strongadmin_log` VALUES (943, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-26 22:21:47', '2021-09-26 22:21:47');
INSERT INTO `strongadmin_log` VALUES (944, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 08:38:53', '2021-09-27 08:38:53');
INSERT INTO `strongadmin_log` VALUES (945, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 10:40:03', '2021-09-27 10:40:03');
INSERT INTO `strongadmin_log` VALUES (946, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 14:17:30', '2021-09-27 14:17:30');
INSERT INTO `strongadmin_log` VALUES (947, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 15:27:53', '2021-09-27 15:27:53');
INSERT INTO `strongadmin_log` VALUES (948, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 16:03:19', '2021-09-27 16:03:19');
INSERT INTO `strongadmin_log` VALUES (949, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 17:24:53', '2021-09-27 17:24:53');
INSERT INTO `strongadmin_log` VALUES (950, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-27 20:17:00', '2021-09-27 20:17:00');
INSERT INTO `strongadmin_log` VALUES (951, '/strongadmin/login', '登錄成功:demo', NULL, NULL, 19, '2021-09-28 10:59:49', '2021-09-28 10:59:49');

-- ----------------------------
-- Table structure for st_strongadmin_menu
-- ----------------------------
DROP TABLE IF EXISTS `strongadmin_menu`;
CREATE TABLE `strongadmin_menu`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜單id',
                                     `level` int(1) UNSIGNED NULL DEFAULT 1 COMMENT '等級 1 一級菜單, 2 二級菜單, 3 三級菜單',
                                     `parent_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '上級菜單',
                                     `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜單名稱',
                                     `route_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜單跳轉地址',
                                     `status` int(1) UNSIGNED NULL DEFAULT 1 COMMENT '狀態 1開啟,2禁用',
                                     `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
                                     `created_at` datetime(0) NULL DEFAULT NULL COMMENT '新增時間',
                                     `updated_at` datetime(0) NULL DEFAULT NULL,
                                     `delete_allow` int(11) NOT NULL DEFAULT 1 COMMENT '是否允許刪除：1 允許，2 不允許',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜單表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_strongadmin_menu
-- ----------------------------
INSERT INTO `strongadmin_menu` VALUES (1, 1, 0, '許可權管理', NULL, 1, 2001, '2021-01-06 03:37:40', '2021-05-21 20:10:57', 2);
INSERT INTO `strongadmin_menu` VALUES (2, 2, 1, '菜單管理', 'strongadmin/adminMenu/index', 1, 200, '2021-01-06 03:38:18', '2021-09-22 14:47:43', 2);
INSERT INTO `strongadmin_menu` VALUES (3, 3, 2, '列表檢視', 'strongadmin/adminMenu/index', 1, 200, '2021-01-06 04:50:41', '2021-09-22 14:47:43', 2);
INSERT INTO `strongadmin_menu` VALUES (4, 3, 2, '新增', 'strongadmin/adminMenu/create', 1, 200, '2021-01-06 04:51:07', '2021-09-22 14:47:43', 2);
INSERT INTO `strongadmin_menu` VALUES (5, 3, 2, '更新', 'strongadmin/adminMenu/update', 1, 200, '2021-01-06 04:51:24', '2021-09-22 14:47:43', 2);
INSERT INTO `strongadmin_menu` VALUES (6, 3, 2, '刪除', 'strongadmin/adminMenu/destroy', 1, 200, '2021-01-06 04:51:52', '2021-09-22 14:47:43', 2);
INSERT INTO `strongadmin_menu` VALUES (7, 1, 0, '產品管理', NULL, 1, 2000, '2021-01-06 05:05:27', '2021-05-21 20:08:34', 1);
INSERT INTO `strongadmin_menu` VALUES (8, 2, 7, '產品列表', 'strongadmin/product/index', 1, 200, '2021-01-06 05:06:02', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (10, 3, 8, '檢視', 'strongadmin/product/index', 1, 200, '2021-01-06 05:07:49', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (11, 3, 8, '新增', 'strongadmin/product/create', 1, 200, '2021-01-06 05:08:02', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (12, 3, 8, '更新', 'strongadmin/product/update', 1, 200, '2021-01-06 05:08:18', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (13, 3, 8, '刪除', 'strongadmin/product/destroy', 1, 200, '2021-01-06 05:08:37', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (14, 2, 1, '賬號管理', 'strongadmin/adminUser/index', 1, 200, '2021-01-06 05:21:14', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (15, 3, 14, '檢視', 'strongadmin/adminUser/index', 1, 200, '2021-01-06 05:22:05', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (16, 3, 14, '更新', 'strongadmin/adminUser/update', 1, 200, '2021-01-06 05:22:45', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (17, 3, 14, '刪除', 'strongadmin/adminUser/destroy', 1, 200, '2021-01-06 07:08:39', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (18, 2, 1, '角色管理', 'strongadmin/adminRole/index', 1, 200, '2021-01-06 07:09:58', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (19, 3, 18, '檢視', 'strongadmin/adminRole/index', 1, 200, '2021-01-06 07:10:18', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (20, 3, 18, '新增', 'strongadmin/adminRole/create', 1, 200, '2021-01-06 07:10:30', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (21, 3, 18, '更新', 'strongadmin/adminRole/update', 1, 200, '2021-01-06 07:10:48', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (22, 3, 18, '刪除', 'strongadmin/adminRole/destroy', 1, 200, '2021-01-06 07:11:02', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (23, 2, 1, '操作日誌', 'strongadmin/adminLog/index', 1, 200, '2021-01-07 13:40:48', '2021-09-22 14:47:44', 2);
INSERT INTO `strongadmin_menu` VALUES (24, 3, 23, '刪除', 'strongadmin/adminLog/destroy', 1, 200, '2021-01-07 13:41:44', '2021-09-22 14:47:44', 2);
INSERT INTO `strongadmin_menu` VALUES (25, 3, 23, '檢視', 'strongadmin/adminLog/index', 1, 200, '2021-01-08 02:27:07', '2021-09-22 14:47:44', 2);
INSERT INTO `strongadmin_menu` VALUES (26, 3, 18, '分配許可權', 'strongadmin/adminRole/assignPermissions', 1, 200, '2021-01-08 13:08:33', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (36, 1, 0, '主頁', NULL, 1, 99999, '2021-01-08 14:59:46', '2021-01-09 13:58:51', 2);
INSERT INTO `strongadmin_menu` VALUES (37, 2, 36, '面板', 'strongadmin/index/panel', 1, 200, '2021-01-08 16:38:33', '2021-09-22 14:47:44', 2);
INSERT INTO `strongadmin_menu` VALUES (38, 3, 14, '建立', 'strongadmin/adminUser/create', 1, 200, '2021-01-13 15:25:40', '2021-09-22 14:47:44', 1);
INSERT INTO `strongadmin_menu` VALUES (41, 2, 1, 'Telescope', 'strongadmin/telescope/requests', 1, 200, '2021-01-19 17:19:57', '2021-09-22 15:32:56', 1);
INSERT INTO `strongadmin_menu` VALUES (42, 2, 7, '產品分類', 'strongadmin/product/category/index', 1, 200, '2021-01-28 15:29:46', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (43, 3, 42, '檢視', 'strongadmin/product/category/index', 1, 200, '2021-01-28 15:30:17', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (44, 3, 42, '建立', 'strongadmin/product/category/create', 1, 200, '2021-01-28 15:30:34', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (45, 3, 42, '更新', 'strongadmin/product/category/update', 1, 200, '2021-01-28 15:30:53', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (46, 3, 42, '刪除', 'strongadmin/product/category/destroy', 1, 200, '2021-01-28 15:31:10', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (47, 1, 0, '文章管理', NULL, 1, 1500, '2021-02-22 11:32:46', '2021-05-21 20:09:33', 1);
INSERT INTO `strongadmin_menu` VALUES (48, 2, 7, '產品規格', 'strongadmin/product/specGroup/index', 1, 200, '2021-02-22 11:35:43', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (49, 3, 48, '規格組檢視', 'strongadmin/product/specGroup/index', 1, 200, '2021-02-22 12:59:16', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (50, 3, 48, '規格組建立', 'strongadmin/product/specGroup/create', 1, 200, '2021-02-22 12:59:39', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (51, 3, 48, '更新規格組', 'strongadmin/product/specGroup/update', 1, 200, '2021-02-22 13:00:04', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (52, 3, 48, '刪除規格組', 'strongadmin/product/specGroup/destroy', 1, 200, '2021-02-22 13:00:26', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (53, 3, 48, '檢視規格', 'strongadmin/product/spec/index', 1, 200, '2021-02-22 13:22:51', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (54, 3, 48, '建立規格', 'strongadmin/product/spec/create', 1, 200, '2021-02-22 13:23:22', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (55, 3, 48, '更新規格', 'strongadmin/product/spec/update', 1, 200, '2021-02-22 13:23:38', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (56, 3, 48, '刪除規格', 'strongadmin/product/spec/destroy', 1, 200, '2021-02-22 13:23:56', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (57, 2, 7, '產品品牌', 'strongadmin/product/brand/index', 1, 200, '2021-03-15 14:38:53', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (58, 3, 57, '列表檢視', 'strongadmin/product/brand/index', 1, 200, '2021-03-15 14:39:18', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (59, 3, 57, '建立', 'strongadmin/product/brand/create', 1, 200, '2021-03-15 14:39:45', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (60, 3, 57, '修改', 'strongadmin/product/brand/update', 1, 200, '2021-03-15 14:40:02', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (61, 3, 57, '刪除', 'strongadmin/product/brand/destroy', 1, 200, '2021-03-15 14:40:50', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (62, 1, 0, '訂單管理', NULL, 1, 1800, '2021-05-20 13:54:11', '2021-05-21 20:09:05', 1);
INSERT INTO `strongadmin_menu` VALUES (63, 2, 62, '訂單列表', 'strongadmin/order/index', 1, 200, '2021-05-20 13:54:36', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (64, 2, 63, '更新訂單', 'strongadmin/order/update', 1, 200, '2021-05-20 13:54:56', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (65, 2, 63, '刪除訂單', 'strongadmin/order/destroy', 1, 200, '2021-05-20 13:55:53', '2021-09-22 14:47:45', 1);
INSERT INTO `strongadmin_menu` VALUES (66, 2, 63, '取消訂單', 'strongadmin/order/cancel', 1, 200, '2021-05-20 13:56:35', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (68, 3, 63, '檢視訂單產品', 'strongadmin/order/products', 1, 200, '2021-05-20 14:00:41', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (69, 3, 63, '檢視列表', 'strongadmin/order/index', 1, 200, '2021-05-20 14:02:49', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (72, 1, 0, '會員管理', NULL, 1, 1900, '2021-05-20 16:44:51', '2021-05-21 20:08:51', 1);
INSERT INTO `strongadmin_menu` VALUES (73, 2, 72, '會員列表', 'strongadmin/user/index', 1, 300, '2021-05-20 16:45:23', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (74, 3, 73, '檢視', 'strongadmin/user/index', 1, 200, '2021-05-20 16:45:45', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (75, 3, 73, '更新', 'strongadmin/user/update', 1, 200, '2021-05-20 16:46:01', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (76, 3, 73, '刪除', 'strongadmin/user/destroy', 1, 200, '2021-05-20 16:46:21', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (77, 2, 47, '文章分類', 'strongadmin/article/category/index', 1, 200, '2021-05-28 16:48:03', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (78, 3, 77, '文章分類檢視', 'strongadmin/article/category/index', 1, 200, '2021-05-28 16:48:46', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (79, 3, 77, '文章分類建立', 'strongadmin/article/category/create', 1, 200, '2021-05-28 16:49:51', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (80, 3, 77, '文章分類更新', 'strongadmin/article/category/update', 1, 200, '2021-05-28 16:50:13', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (81, 3, 77, '文章分類刪除', 'strongadmin/article/category/destroy', 1, 200, '2021-05-28 16:50:33', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (82, 2, 47, '文章列表', 'strongadmin/article/article/index', 1, 200, '2021-05-28 16:53:27', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (83, 3, 82, '檢視文章', 'strongadmin/article/article/index', 1, 200, '2021-05-28 16:54:00', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (84, 3, 82, '建立文章', 'strongadmin/article/article/create', 1, 200, '2021-05-28 16:54:19', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (85, 3, 82, '更新文章', 'strongadmin/article/article/update', 1, 200, '2021-05-28 16:54:32', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (86, 3, 82, '刪除文章', 'strongadmin/article/article/destroy', 1, 200, '2021-05-28 16:54:49', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (87, 2, 72, '意見反饋', 'strongadmin/user/feedback/index', 1, 200, '2021-05-29 10:58:33', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (88, 3, 87, '檢視', 'strongadmin/user/feedback/index', 1, 200, '2021-05-29 10:58:54', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (89, 3, 87, '回覆', 'strongadmin/user/feedback/update', 1, 200, '2021-05-29 10:59:10', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (90, 3, 87, '刪除', 'strongadmin/user/feedback/destroy', 1, 200, '2021-05-29 10:59:41', '2021-09-22 14:47:46', 1);
INSERT INTO `strongadmin_menu` VALUES (91, 2, 72, '會員等級', 'strongadmin/user/userRank/index', 1, 230, '2021-06-01 11:26:43', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (92, 3, 91, '檢視', 'strongadmin/user/userRank/index', 1, 200, '2021-06-01 11:27:27', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (93, 3, 91, '更新', 'strongadmin/user/userRank/update', 1, 200, '2021-06-01 11:27:41', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (94, 3, 91, '刪除', 'strongadmin/user/userRank/desctroy', 1, 200, '2021-06-01 11:28:01', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (95, 3, 91, '建立', 'strongadmin/user/userRank/create', 1, 200, '2021-06-01 11:28:21', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (103, 1, 0, '網站設定', NULL, 1, 200, '2021-08-01 20:43:33', '2021-08-01 20:43:33', 1);
INSERT INTO `strongadmin_menu` VALUES (104, 2, 103, '配送方式', 'strongadmin/shippingOption/index', 1, 200, '2021-08-01 20:44:13', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (105, 2, 103, '支付方式', 'strongadmin/paymentOption/index', 1, 200, '2021-08-02 09:52:12', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (106, 3, 105, '檢視', 'strongadmin/paymentOption/index', 1, 200, '2021-08-02 09:52:26', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (107, 3, 105, '新增', 'strongadmin/paymentOption/create', 1, 200, '2021-08-02 09:52:40', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (108, 3, 105, '更新', 'strongadmin/paymentOption/update', 1, 200, '2021-08-02 09:52:53', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (109, 2, 103, '地區管理', 'strongadmin/region/regionCountry/index', 1, 200, '2021-08-07 10:26:57', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (110, 3, 109, '國家列表', 'strongadmin/region/regionCountry/index', 1, 200, '2021-08-07 11:06:47', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (111, 3, 109, '國家檢視', 'strongadmin/region/regionCountry/show', 1, 200, '2021-08-07 11:07:29', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (112, 3, 109, '國家更新', 'strongadmin/region/regionCountry/update', 1, 200, '2021-08-07 11:07:48', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (113, 3, 109, '國家刪除', 'strongadmin/region/regionCountry/destroy', 1, 200, '2021-08-07 11:08:08', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (114, 3, 109, '大陸列表', 'strongadmin/region/regionContinent/index', 1, 200, '2021-08-07 11:08:29', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (115, 3, 109, '大陸更新', 'strongadmin/region/regionContinent/update', 1, 200, '2021-08-07 11:08:43', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (116, 3, 109, '大陸刪除', 'strongadmin/region/regionContinent/destroy', 1, 200, '2021-08-07 11:09:01', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (117, 3, 109, '大陸新增', 'strongadmin/region/regionContinent/create', 1, 200, '2021-08-07 11:09:21', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (118, 3, 109, '國家新增', 'strongadmin/region/regionCountry/create', 1, 201, '2021-08-07 11:09:38', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (120, 2, 103, '網站設定', 'strongadmin/webconfig/show', 1, 300, '2021-08-07 13:06:43', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (121, 3, 63, '關閉訂單', 'strongadmin/order/confirm/close', 1, 200, '2021-08-08 13:56:21', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (122, 3, 63, '確認訂單付款', 'strongadmin/order/confirm/paid', 1, 200, '2021-08-08 13:56:43', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (123, 3, 63, '確認訂單發貨', 'strongadmin/order/confirm/shipped', 1, 200, '2021-08-08 13:56:52', '2021-09-22 14:47:47', 1);
INSERT INTO `strongadmin_menu` VALUES (124, 3, 63, '確認訂單退貨', 'strongadmin/order/confirm/returned', 1, 200, '2021-08-08 13:57:05', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (125, 3, 63, '確認訂單完成', 'strongadmin/order/confirm/done', 1, 200, '2021-08-08 13:57:14', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (126, 3, 63, '列印訂單', 'strongadmin/order/print', 1, 200, '2021-08-08 13:57:23', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (127, 3, 63, '訂單詳情', 'strongadmin/order/show', 1, 200, '2021-08-08 13:57:31', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (128, 3, 120, '儲存網站配置', 'strongadmin/webconfig/save/config', 1, 200, '2021-08-19 18:16:48', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (129, 3, 120, '設定詳情', 'strongadmin/webconfig/show', 1, 200, '2021-08-19 18:17:49', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (130, 3, 104, '檢視', 'strongadmin/shippingOption/index', 1, 200, '2021-09-07 18:26:28', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (131, 3, 104, '更新', 'strongadmin/shippingOption/update', 1, 200, '2021-09-07 18:27:03', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (132, 3, 104, '配送區域列表', 'strongadmin/shippingOptionConfig/index', 1, 200, '2021-09-07 18:29:55', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (133, 3, 104, '配送區域建立', 'strongadmin/shippingOptionConfig/create', 1, 200, '2021-09-07 18:30:16', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (134, 3, 104, '配送區域更新', 'strongadmin/shippingOptionConfig/update', 1, 200, '2021-09-07 18:30:30', '2021-09-22 14:47:48', 1);
INSERT INTO `strongadmin_menu` VALUES (135, 3, 104, '配送區域刪除', 'strongadmin/shippingOptionConfig/destroy', 1, 200, '2021-09-07 18:30:47', '2021-09-22 14:47:48', 1);

-- ----------------------------
-- Table structure for st_strongadmin_role
-- ----------------------------
DROP TABLE IF EXISTS `strongadmin_role`;
CREATE TABLE `strongadmin_role`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
                                     `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名稱',
                                     `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '角色描述',
                                     `permissions` json NULL COMMENT '擁有的許可權(route_url)',
                                     `created_at` datetime(0) NULL DEFAULT NULL COMMENT '新增時間',
                                     `updated_at` datetime(0) NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE,
                                     UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_strongadmin_role
-- ----------------------------
INSERT INTO `strongadmin_role` VALUES (1, '管理員', '超級管理員，不可刪除', '{\"menu_id\": [\"36\", \"37\", \"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"14\", \"15\", \"16\", \"17\", \"38\", \"18\", \"19\", \"20\", \"21\", \"22\", \"26\", \"23\", \"24\", \"25\", \"7\", \"8\", \"10\", \"11\", \"12\", \"13\", \"40\"], \"menu_route_url\": [\"admin/index/panel\", \"admin/adminMenu/index\", \"admin/adminMenu/index\", \"admin/adminMenu/create\", \"admin/adminMenu/update\", \"admin/adminMenu/destroy\", \"admin/adminUser/index\", \"admin/adminUser/index\", \"admin/adminUser/update\", \"admin/adminUser/destroy\", \"admin/adminUser/create\", \"admin/adminRole/index\", \"admin/adminRole/index\", \"admin/adminRole/create\", \"admin/adminRole/update\", \"admin/adminRole/destroy\", \"admin/adminRole/assignPermissions\", \"admin/adminLog/index\", \"admin/adminLog/destroy\", \"admin/adminLog/index\", \"admin/goods/index\", \"admin/product/index\", \"admin/goods/create\", \"admin/goods/update\", \"admin/goods/destroy\", \"admin/product/test\"]}', '2021-01-06 08:18:36', '2021-08-19 18:19:37');
INSERT INTO `strongadmin_role` VALUES (2, 'demo', '僅作為演示', '{\"menu_id\": [\"36\", \"37\", \"1\", \"2\", \"3\", \"14\", \"15\", \"18\", \"19\", \"23\", \"24\", \"25\", \"41\", \"7\", \"8\", \"10\", \"11\", \"12\", \"13\", \"42\", \"43\", \"44\", \"45\", \"46\", \"48\", \"49\", \"50\", \"51\", \"52\", \"53\", \"54\", \"55\", \"56\", \"57\", \"58\", \"59\", \"60\", \"61\", \"72\", \"73\", \"74\", \"75\", \"76\", \"91\", \"92\", \"93\", \"94\", \"95\", \"87\", \"88\", \"89\", \"90\", \"62\", \"63\", \"64\", \"65\", \"66\", \"68\", \"69\", \"121\", \"122\", \"123\", \"124\", \"125\", \"126\", \"127\", \"47\", \"77\", \"78\", \"79\", \"80\", \"81\", \"82\", \"83\", \"84\", \"85\", \"86\", \"103\", \"120\", \"129\", \"104\", \"130\", \"131\", \"132\", \"133\", \"134\", \"135\", \"105\", \"106\", \"109\", \"110\", \"111\", \"114\"], \"menu_route_url\": [\"strongadmin/index/panel\", \"strongadmin/adminMenu/index\", \"strongadmin/adminMenu/index\", \"strongadmin/adminUser/index\", \"strongadmin/adminUser/index\", \"strongadmin/adminRole/index\", \"strongadmin/adminRole/index\", \"strongadmin/adminLog/index\", \"strongadmin/adminLog/destroy\", \"strongadmin/adminLog/index\", \"strongadmin/telescope/{view?}\", \"strongadmin/product/index\", \"strongadmin/product/index\", \"strongadmin/product/create\", \"strongadmin/product/update\", \"strongadmin/product/destroy\", \"strongadmin/product/category/index\", \"strongadmin/product/category/index\", \"strongadmin/product/category/create\", \"strongadmin/product/category/update\", \"strongadmin/product/category/destroy\", \"strongadmin/product/spec/index\", \"strongadmin/product/specGroup/index\", \"strongadmin/product/specGroup/create\", \"strongadmin/product/specGroup/update\", \"strongadmin/product/specGroup/destroy\", \"strongadmin/product/spec/index\", \"strongadmin/product/spec/create\", \"strongadmin/product/spec/update\", \"strongadmin/product/spec/destroy\", \"strongadmin/product/brand/index\", \"strongadmin/product/brand/index\", \"strongadmin/product/brand/create\", \"strongadmin/product/brand/update\", \"strongadmin/product/brand/destroy\", \"strongadmin/user/index\", \"strongadmin/user/index\", \"strongadmin/user/update\", \"strongadmin/user/destroy\", \"strongadmin/user/userRank/index\", \"strongadmin/user/userRank/index\", \"strongadmin/user/userRank/update\", \"strongadmin/user/userRank/desctroy\", \"strongadmin/user/userRank/create\", \"strongadmin/user/feedback/index\", \"strongadmin/user/feedback/index\", \"strongadmin/user/feedback/update\", \"strongadmin/user/feedback/destroy\", \"strongadmin/order/index\", \"strongadmin/order/update\", \"strongadmin/order/destroy\", \"strongadmin/order/cancel\", \"strongadmin/order/products\", \"strongadmin/order/index\", \"strongadmin/order/confirm/close\", \"strongadmin/order/confirm/paid\", \"strongadmin/order/confirm/shipped\", \"strongadmin/order/confirm/returned\", \"strongadmin/order/confirm/done\", \"strongadmin/order/print\", \"strongadmin/order/show\", \"strongadmin/article/category/index\", \"strongadmin/article/category/index\", \"strongadmin/article/category/create\", \"strongadmin/article/category/update\", \"strongadmin/article/category/destroy\", \"strongadmin/article/article/index\", \"strongadmin/article/article/index\", \"strongadmin/article/article/create\", \"strongadmin/article/article/update\", \"strongadmin/article/article/destroy\", \"strongadmin/webconfig/show\", \"strongadmin/webconfig/show\", \"strongadmin/shippingOption/index\", \"strongadmin/shippingOption/index\", \"strongadmin/shippingOption/update\", \"strongadmin/shippingOptionConfig/index\", \"strongadmin/shippingOptionConfig/create\", \"strongadmin/shippingOptionConfig/update\", \"strongadmin/shippingOptionConfig/destroy\", \"strongadmin/paymentOption/index\", \"strongadmin/paymentOption/index\", \"strongadmin/region/regionCountry/index\", \"strongadmin/region/regionCountry/index\", \"strongadmin/region/regionCountry/show\", \"strongadmin/region/regionContinent/index\"]}', '2021-01-06 08:19:12', '2021-09-22 15:22:33');

-- ----------------------------
-- Table structure for st_strongadmin_user
-- ----------------------------
DROP TABLE IF EXISTS `strongadmin_user`;
CREATE TABLE `strongadmin_user`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理員id',
                                     `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登錄名',
                                     `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登錄密碼',
                                     `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '記住登錄',
                                     `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '姓名',
                                     `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '郵箱',
                                     `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手機號',
                                     `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '頭像',
                                     `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '介紹',
                                     `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態 1 啟用, 2 禁用',
                                     `last_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登錄ip',
                                     `last_at` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登錄時間',
                                     `created_at` datetime(0) NULL DEFAULT NULL COMMENT '新增時間',
                                     `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     UNIQUE INDEX `uniq_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理員表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_strongadmin_user
-- ----------------------------
INSERT INTO `strongadmin_user` VALUES (1, 'admin', '$2y$10$04FiL6fFq9GLzWsoYdEuP.h8Hwy8AQeLEpCuTbdtEKA3peXZ/zivi', null, 'Admin', 'admin@qq.com', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, 1, '222.137.131.57', '2021-09-25 15:35:25', '2020-04-13 10:18:10', '2021-09-25 15:35:25');
INSERT INTO `strongadmin_user` VALUES (19, 'demo', '$2y$10$04FiL6fFq9GLzWsoYdEuP.h8Hwy8AQeLEpCuTbdtEKA3peXZ/zivi', null, 'demo', '', '', '', '', 1, '223.84.85.130', '2021-09-28 10:59:49', '2021-08-08 13:51:48', '2021-09-28 10:59:49');

-- ----------------------------
-- Table structure for st_strongadmin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `strongadmin_user_role`;
CREATE TABLE `strongadmin_user_role`  (
                                          `admin_user_id` int(11) NOT NULL,
                                          `admin_role_id` int(11) NOT NULL,
                                          PRIMARY KEY (`admin_user_id`, `admin_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_strongadmin_user_role
-- ----------------------------
INSERT INTO `strongadmin_user_role` VALUES (1, 1);
INSERT INTO `strongadmin_user_role` VALUES (4, 2);
INSERT INTO `strongadmin_user_role` VALUES (5, 1);
INSERT INTO `strongadmin_user_role` VALUES (5, 2);
INSERT INTO `strongadmin_user_role` VALUES (6, 2);
INSERT INTO `strongadmin_user_role` VALUES (7, 2);
INSERT INTO `strongadmin_user_role` VALUES (8, 2);
INSERT INTO `strongadmin_user_role` VALUES (9, 2);
INSERT INTO `strongadmin_user_role` VALUES (10, 2);
INSERT INTO `strongadmin_user_role` VALUES (11, 2);
INSERT INTO `strongadmin_user_role` VALUES (12, 2);
INSERT INTO `strongadmin_user_role` VALUES (13, 2);
INSERT INTO `strongadmin_user_role` VALUES (14, 2);
INSERT INTO `strongadmin_user_role` VALUES (15, 2);
INSERT INTO `strongadmin_user_role` VALUES (16, 2);
INSERT INTO `strongadmin_user_role` VALUES (17, 2);
INSERT INTO `strongadmin_user_role` VALUES (18, 1);
INSERT INTO `strongadmin_user_role` VALUES (18, 2);
INSERT INTO `strongadmin_user_role` VALUES (19, 2);

-- ----------------------------
-- Table structure for st_telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries`  (
                                      `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                                      `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                                      `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
                                      `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `created_at` datetime(0) NULL DEFAULT NULL,
                                      PRIMARY KEY (`sequence`) USING BTREE,
                                      UNIQUE INDEX `telescope_entries_uuid_unique`(`uuid`) USING BTREE,
                                      INDEX `telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
                                      INDEX `telescope_entries_family_hash_index`(`family_hash`) USING BTREE,
                                      INDEX `telescope_entries_created_at_index`(`created_at`) USING BTREE,
                                      INDEX `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1742257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags`  (
                                           `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           INDEX `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`) USING BTREE,
                                           INDEX `telescope_entries_tags_tag_index`(`tag`) USING BTREE,
                                           CONSTRAINT `st_telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `st_telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring`  (
    `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '會員id',
                         `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '名',
                         `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '姓',
                         `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵稱',
                         `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登錄名稱',
                         `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登錄郵箱',
                         `email_verified_at` datetime(0) NULL DEFAULT NULL COMMENT '郵箱驗證時間',
                         `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手機號碼',
                         `mobile_verified_at` datetime(0) NULL DEFAULT NULL COMMENT '手機號驗證時間',
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登錄密碼',
                         `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
                         `api_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api token',
                         `created_at` datetime(0) NULL DEFAULT NULL COMMENT '註冊時間',
                         `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                         `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                         `status` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態 1 正常, 2 禁止登錄',
                         `last_login_at` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登錄日期',
                         `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最近一次登錄ip',
                         `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '頭像',
                         `gender` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '性別 0未知, 1男, 2女',
                         `birthday` date NULL DEFAULT NULL COMMENT '生日',
                         `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '國家 code',
                         `wechat_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
                         `wechat_union_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信unionid',
                         `qq_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ開放id',
                         `weibo_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微博開放id',
                         `facebook_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Facebook開放id',
                         `google_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Google開放id',
                         `pay_credits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付積分（可用於支付）',
                         `rank_credits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '信用積分（用於評級）',
                         `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '來源',
                         `http_referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'HTTP_REFERER',
                         PRIMARY KEY (`id`) USING BTREE,
                         UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
                         UNIQUE INDEX `uniq_user_name`(`user_name`) USING BTREE,
                         UNIQUE INDEX `uniq_mobile`(`mobile`) USING BTREE,
                         UNIQUE INDEX `uniq_api_token`(`api_token`) USING BTREE,
                         UNIQUE INDEX `uniq_wechat_open_id`(`wechat_open_id`) USING BTREE,
                         UNIQUE INDEX `uniq_wechat_union_id`(`wechat_union_id`) USING BTREE,
                         UNIQUE INDEX `uniq_qq_open_id`(`qq_open_id`) USING BTREE,
                         UNIQUE INDEX `uniq_facebook_open_id`(`facebook_open_id`) USING BTREE,
                         UNIQUE INDEX `uniq_google_open_id`(`google_open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '會員表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'strong', 'shop', 'strong', NULL, 'openstrong@foxmail.com', NULL, NULL, NULL, '$2y$10$yDC4plIxBL0l9rfy6iuYtOKoLXY3v14.wPy.GTIKO1Ggemnxh9x0y', 'QNtpohASiPA4u9r1SbXr6ieLAzHf6SWB67RgtGOAOpx4W8Ucl0eU0VokQyVi', NULL, '2021-08-08 12:38:03', '2021-09-11 17:35:16', NULL, 1, '2021-09-11 17:35:16', '110.88.118.139', '', 0, NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (2, 'Karen', 'Y', '', NULL, '3232332329787@qq.com', NULL, NULL, NULL, '$2y$10$T7GtPlCF5DkpeGGEOaxPN.3J5AqF.gakhfq4emkn2V.dHNku0J8y.', 'zhn4Wt6eWLv6CPcNt0UYqCnAM53xtjlw7aQlRndyUbGQ7biQPvpr4NwUsLfe', NULL, '2021-08-11 10:55:02', '2021-09-04 13:37:46', NULL, 1, '2021-09-04 13:37:46', '112.238.6.185', '', 0, NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (3, '測', '試', '', NULL, '345154414@qq.com', NULL, NULL, NULL, '$2y$10$9vYBVJqkSLTz/8sPODrxMeMA.XPnlCaFjKOsJYp2YVfeD2Whh2ge.', 'OrVv4QrPDoef1Rkic0hKXMUBBNmYIKnJCC7UX2gQ1eNG4jYsHbWp5sYLQzFZ', NULL, '2021-09-03 11:47:29', '2021-09-05 23:03:18', NULL, 1, '2021-09-05 23:03:18', '113.116.30.127', '', 0, NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (4, 'Jacky', 'Fang', '', NULL, 'jacky@fengwoo.cn', NULL, NULL, NULL, '$2y$10$cz3sLP/i6Uh8qsXBH4hgJe3OJQNr/QDSyTyNuqfXLRRgxVChn0sQW', 'haIxpsjLXhPIJWgybu1GDGa0U3e2ZOnVHN6SHzKTcU51B7stDsrixBxaKkRO', NULL, '2021-09-05 11:52:10', '2021-09-05 11:52:10', NULL, 1, '2021-09-05 11:52:10', '111.174.38.101', '', 0, NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (5, 'myhkhk', 'myhkhk', '', NULL, 'myhkhk@163.com', NULL, NULL, NULL, '$2y$10$HbkEMz2Tyq9JF0dHF5fiteUphWeopObYBg56tbIhn1OS6mq1.rur.', 'nMcciBUs6gtfPw29UIhKpT9EK38exKuLXuhxxWsvL88cVJ6xaei3mX29tUNE', NULL, '2021-09-06 08:33:11', '2021-09-06 08:33:11', NULL, 1, '2021-09-06 08:33:11', '103.25.28.134', '', 0, NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (6, 'aa', 'bb', 'aa', NULL, '123456789@qq.com', NULL, NULL, NULL, '$2y$10$qu/OXoNJpp6E8eO4bENZF.2haWDyCeIz/ncSsY1EAKREppnhJccZK', 'KtMGNNKAPi7x0nFDOQ1fNG7je5lNceDOe5SZP8E62GzwK4Nlv7SpeZjSddHr', NULL, '2021-09-07 08:14:42', '2021-09-12 14:51:36', NULL, 1, '2021-09-07 08:54:10', '110.52.107.74', '', 0, '2021-09-12', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (7, 'p', 'd', '', NULL, '1231@qq.com', NULL, NULL, NULL, '$2y$10$ab53VPqNS7iDUb8evWn6muMc7sVc8yfRWHsc.XgdVlIQj2EjP8DGi', 'f9ndpINf7ToOKC3w9TgYGHRP9alDirkETgfIYkvlMjenQP1R7WvhMRwELTjq', NULL, '2021-09-15 17:41:33', '2021-09-15 17:41:33', NULL, 1, '2021-09-15 17:41:33', '183.69.213.197', '', 0, NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (8, 'test', 'user', '', NULL, 'test@test.com', NULL, NULL, NULL, '$2y$10$ObYHP6VTcT6eXDZsRij/6.mGCrYx9z.SAinlIMmt6iyDcyJIPDGK6', 'BTe5tbMTcxIypHc5uJeY8KXHBwoKORfgzetfSI220VjSDrJprSFSAhwnLPtH', NULL, '2021-09-16 02:48:34', '2021-09-16 02:48:34', NULL, 1, '2021-09-16 02:48:34', '123.139.140.52', '', 0, NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (9, 'Jack', 'Derek', '', NULL, '406834061@qq.com', NULL, NULL, NULL, '$2y$10$vg3PJg1vAg8DXmesOBaBXuAxax3aYqPJGnt.EvOg8Y7KqA0.1p7va', 'u0yG8dUoMQEBp1DAKmJY2jCdwR83wxvElkIkpXlPnTQ6xsh6UrEJBWLZEDqN', NULL, '2021-09-18 14:17:47', '2021-09-18 14:17:47', NULL, 1, '2021-09-18 14:17:47', '119.122.90.217', '', 0, NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (10, 'liu', 'erek', '', NULL, 'lqlluo@163.com', NULL, NULL, NULL, '$2y$10$FlMoRxZRo5Iah4TJt/CmcezYxP5Z9AJzJ33Zkr7.7o7r2HldExCVe', 'POTh6pVJCtiWzomUmzhF6QfOwfWDb9BjIijwfje7AyzyaWomlcoNyEhujw7s', NULL, '2021-09-18 20:07:40', '2021-09-18 20:07:40', NULL, 1, '2021-09-18 20:07:40', '111.15.192.161', '', 0, NULL, 'AO', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');
INSERT INTO `user` VALUES (12, '15231561', '15231561', '', NULL, 'admin@admin', NULL, NULL, NULL, '$2y$10$QxB8YE8tp0RV/XSW2gBWSOjZnTIGDPkaC1qgYa1ZLJZQMzG7pW/Ey', 'LdltPs147TJX6FiXqvQ53XpLKGXYS0WCemwLBasDIg0s9IeKA2hJXZLNZ6UM', NULL, '2021-09-26 01:30:27', '2021-09-26 01:30:27', NULL, 1, '2021-09-26 01:30:27', '14.120.78.217', '', 0, NULL, 'AS', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');

-- ----------------------------
-- Table structure for st_user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `user_id` int(11) NOT NULL DEFAULT 0,
                                 `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名',
                                 `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓',
                                 `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                 `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '聯繫電話',
                                 `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '傳真',
                                 `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '國家',
                                 `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
                                 `state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省',
                                 `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
                                 `address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1',
                                 `address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2',
                                 `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '郵編',
                                 `is_default` int(11) NOT NULL DEFAULT 2 COMMENT '預設地址 1 是，2 否',
                                 `created_at` datetime(0) NULL DEFAULT NULL,
                                 `updated_at` datetime(0) NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect`  (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '會員id',
                                 `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '產品id',
                                 `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                 `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `uniq_user_id_product_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '會員產品收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_collect
-- ----------------------------
INSERT INTO `user_collect` VALUES (1, 1, 1, '2021-08-08 13:19:29', NULL);

-- ----------------------------
-- Table structure for st_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反饋id',
                                  `parent_id` int(11) NOT NULL DEFAULT 0,
                                  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反饋型別：1 購買，2 功能， 3 其他',
                                  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反饋使用者id',
                                  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '標題',
                                  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '內容',
                                  `content_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回覆內容 (管理員回覆)',
                                  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '回覆管理員id',
                                  `more` json NULL COMMENT '更多內容',
                                  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '狀態：1 未回覆，2 已回覆',
                                  `created_at` datetime(0) NULL DEFAULT NULL,
                                  `updated_at` datetime(0) NULL DEFAULT NULL,
                                  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                                  `read_at` datetime(0) NULL DEFAULT NULL COMMENT '已讀時間',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意見反饋表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_feedback
-- ----------------------------
INSERT INTO `user_feedback` VALUES (1, 0, 1, 1, '', '你好，網站不錯哦', NULL, 0, NULL, 2, '2021-08-08 13:32:20', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (2, 1, 0, 0, '', '謝謝。期待您的更多反饋', NULL, 1, NULL, 0, '2021-08-08 13:32:47', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (3, 1, 1, 1, '', '沒問題', NULL, 0, NULL, 0, '2021-08-08 13:33:33', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (4, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:18', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (5, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:22', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (6, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:23', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (7, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:24', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (8, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:25', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (9, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:25', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (10, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:25', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (11, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:26', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (12, 1, 0, 0, '', '`112', NULL, 19, NULL, 0, '2021-09-01 18:55:26', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (13, 1, 0, 0, '', '2222', NULL, 19, NULL, 0, '2021-09-16 08:22:39', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (14, 1, 1, 1, '', '3333', NULL, 0, NULL, 0, '2021-09-20 21:59:54', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');
INSERT INTO `user_feedback` VALUES (15, 1, 0, 0, '', 'aaaaaaabbbbbbbb', NULL, 1, NULL, 0, '2021-09-22 15:42:03', '2021-09-25 16:01:21', NULL, '2021-09-25 16:01:21');

-- ----------------------------
-- Table structure for st_user_push_notification
-- ----------------------------
DROP TABLE IF EXISTS `user_push_notification`;
CREATE TABLE `user_push_notification`  (
                                           `id` int(11) NOT NULL AUTO_INCREMENT,
                                           `type` int(11) NOT NULL DEFAULT 1 COMMENT '通知型別：1 郵件，2 簡訊',
                                           `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '標題',
                                           `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '內容 ',
                                           `admin_id` int(11) NOT NULL DEFAULT 0,
                                           `send_at` datetime(0) NULL DEFAULT NULL COMMENT '推送時間',
                                           `status` int(11) NOT NULL DEFAULT 1 COMMENT '狀態：1 正常，2 取消',
                                           `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                                           `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                                           `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間',
                                           `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '備註',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '會員發送通知（郵件）記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `user_rank`;
CREATE TABLE `user_rank`  (
                              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '等級名稱',
                              `min_credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
                              `max_credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
                              `created_at` datetime(0) NULL DEFAULT NULL,
                              `updated_at` datetime(0) NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '會員等級' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_rank
-- ----------------------------
INSERT INTO `user_rank` VALUES (1, 'Lv1', 0, 9999, NULL, NULL);
INSERT INTO `user_rank` VALUES (4, 'Lv2', 10000, 49999, NULL, NULL);
INSERT INTO `user_rank` VALUES (5, 'Lv3', 50000, 199999, NULL, NULL);
INSERT INTO `user_rank` VALUES (6, 'Lv4', 200000, 499999, NULL, NULL);
INSERT INTO `user_rank` VALUES (7, 'Lv5', 500000, 4294967295, NULL, NULL);

-- ----------------------------
-- Table structure for st_webconfig
-- ----------------------------
DROP TABLE IF EXISTS `webconfig`;
CREATE TABLE `webconfig`  (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '鍵名',
                              `value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '鍵值',
                              `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
                              `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '網站設定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_webconfig
-- ----------------------------
INSERT INTO `webconfig` VALUES (1, 'notice', '免費開源的跨境電商網站。<a href=\"/admin/home\" class=\"btn btn-primary btn-sm\">進入後臺管理</a>', '2021-08-07 11:31:30', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (2, 'store_title', 'StrongShop 商城 - 免費開源的跨境電商網站', '2021-08-07 11:32:23', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (3, 'meta_keywords', '跨境電商，電商網站，Laravel商城，PHP商城，StrongShop', '2021-08-07 11:33:26', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (4, 'meta_description', 'StrongShop 是一款免費開源的跨境電商商城網站。基於 PHP Laravel6 框架開發，遵循BSD-4-Clause開源協議,免費商用，支援多語言，多貨幣，多種國際配送方式，PayPal 支付，國際信用卡支付，PC Web 端和移動端自適應。', '2021-08-07 11:35:12', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (14, 'MAIL_HOST', 'smtp.qq.com', '2021-08-13 10:35:26', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (15, 'MAIL_PORT', '465', '2021-08-13 10:35:26', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (24, 'MAIL_REPLYTO_NAME', 'StrongShop', '2021-08-13 11:26:01', '2021-08-19 18:10:28');
INSERT INTO `webconfig` VALUES (26, 'notice_email_signed', NULL, '2021-08-13 13:09:04', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (27, 'notice_email_created_order', NULL, '2021-08-13 13:09:04', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (28, 'notice_email_paid_order', NULL, '2021-08-13 13:09:04', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (29, 'notice_email_shipped_order', NULL, '2021-08-13 13:09:04', '2021-08-19 18:10:27');
INSERT INTO `webconfig` VALUES (30, 'notice_email_closed_order', NULL, '2021-08-13 13:09:05', '2021-08-19 18:10:27');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for st_migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
                               `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                               `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `batch` int(11) NOT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_08_08_100000_create_telescope_entries_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_01_21_091828_create_notifications_table', 2);
INSERT INTO `migrations` VALUES (6, '2021_06_02_122516_create_jobs_table', 3);
INSERT INTO `migrations` VALUES (7, '2021_07_18_085351_alter_table_order_add_shipping_remark', 4);
INSERT INTO `migrations` VALUES (8, '2021_07_31_192159_alter_table_user_feedback_add_parent_id_read_at', 5);
INSERT INTO `migrations` VALUES (9, '2021_08_02_104411_alter_table_shipping_option_config_add_deleted_at', 6);
INSERT INTO `migrations` VALUES (10, '2021_08_06_162530_alter_user_push_notification_add_remark', 7);
INSERT INTO `migrations` VALUES (11, '2021_08_07_103629_alter_table_region_add_time', 8);
INSERT INTO `migrations` VALUES (13, '2021_08_12_103230_init_database', 9);
INSERT INTO `migrations` VALUES (14, '2021_09_18_043426_create_strongadmin_table', 10);
INSERT INTO `migrations` VALUES (15, '2021_10_20_100850_alter_table_user_add_api_token_at_api_token_refersh_at', 11);

-- v1.4
ALTER TABLE `user`
    ADD COLUMN `api_token_at` datetime(0) NULL COMMENT 'api token 有效期至' AFTER `api_token`,
ADD COLUMN `api_token_refresh_at` datetime(0) NULL COMMENT 'api token 重新整理時間' AFTER `api_token_at`;

-- v1.5.0
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '會員id',
                                   `first_name` varchar(255) DEFAULT NULL COMMENT '會員名',
                                   `last_name` varchar(255) DEFAULT NULL COMMENT '會員姓',
                                   `country` varchar(255) DEFAULT NULL COMMENT '會員所屬國家',
                                   `at_user_id` int(11) DEFAULT '0' COMMENT '@會員id',
                                   `product_id` int(11) DEFAULT '0' COMMENT '產品id',
                                   `product_sku` varchar(100) DEFAULT '' COMMENT '產品sku',
                                   `product_spu` varchar(100) DEFAULT '' COMMENT '產品spu',
                                   `content` varchar(2000) NOT NULL DEFAULT '' COMMENT '評論內容',
                                   `pictures` json DEFAULT NULL COMMENT '圖片',
                                   `videos` json DEFAULT NULL COMMENT '視訊',
                                   `likes` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '點贊數',
                                   `star` int(11) NOT NULL DEFAULT '5' COMMENT '評論星級',
                                   `more` json DEFAULT NULL,
                                   `status` int(11) NOT NULL DEFAULT '2' COMMENT '狀態：1 審覈通過，2 待審覈，3 審覈不通過',
                                   `credits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '獲得積分獎勵',
                                   `created_at` datetime DEFAULT NULL COMMENT '建立時間',
                                   `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
                                   `deleted_at` datetime DEFAULT NULL COMMENT '刪除時間',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='產品評論表';

-- v1.5.0
ALTER TABLE `spec`
    ADD COLUMN `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間';
ALTER TABLE `spec_group`
    ADD COLUMN `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '刪除時間';

-- v1.5.0
INSERT INTO `strongadmin_menu` VALUES (136, 2, 7, '產品評論', 'strongadmin/product/comment/index', 1, 200, '2022-01-18 16:39:23', '2022-01-18 16:39:23', 1);
INSERT INTO `strongadmin_menu` VALUES (137, 3, 136, '檢視評論列表', 'strongadmin/product/comment/index', 1, 200, '2022-01-18 16:45:25', '2022-01-18 16:45:25', 1);
INSERT INTO `strongadmin_menu` VALUES (138, 3, 136, '檢視評論詳情', 'strongadmin/product/comment/show', 1, 200, '2022-01-18 16:45:53', '2022-01-18 16:45:53', 1);
INSERT INTO `strongadmin_menu` VALUES (139, 3, 136, '建立評論', 'strongadmin/product/comment/create', 1, 200, '2022-01-18 16:46:18', '2022-01-18 16:46:18', 1);
INSERT INTO `strongadmin_menu` VALUES (140, 3, 136, '更新評論', 'strongadmin/product/comment/update', 1, 200, '2022-01-18 16:46:38', '2022-01-18 16:46:38', 1);
INSERT INTO `strongadmin_menu` VALUES (141, 3, 136, '刪除評論', 'strongadmin/product/comment/destroy', 1, 200, '2022-01-18 16:46:59', '2022-01-18 16:46:59', 1);
INSERT INTO `strongadmin_menu` VALUES (142, 3, 136, '審覈通過', 'strongadmin/product/comment/approve', 1, 200, '2022-01-18 16:47:24', '2022-01-18 16:47:24', 1);
INSERT INTO `strongadmin_menu` VALUES (143, 3, 136, '審覈拒絕', 'strongadmin/product/comment/refused', 1, 200, '2022-01-18 16:48:02', '2022-01-18 16:48:02', 1);

-- v1.5.1
ALTER TABLE `article`
    ADD COLUMN `postid` varchar(100) NULL COMMENT '唯一發布標識' AFTER `title`,
DROP INDEX `cate_id`,
ADD UNIQUE INDEX(`postid`);
INSERT INTO `article` VALUES (1, 30, '{\"en\":\"Privacy & Security\",\"zh-CN\":\"\\u9690\\u79c1&\\u5b89\\u5168\"}', 'privacy', '', '{\"en\":\"<p><a href=\\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\\">Privacy &amp; Security<\\/a><br\\/><\\/p>\",\"zh-CN\":null}', 'StrongShop', 1, 200, '2022-02-10 16:57:38', '2022-02-10 16:59:36', NULL, '', '', NULL);
INSERT INTO `article` VALUES (2, 30, '{\"en\":\"About Us\",\"zh-CN\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}', 'aboutus', '', '{\"en\":\"<p>About us<\\/p>\",\"zh-CN\":null}', 'StrongShop', 1, 200, '2022-02-10 16:58:13', '2022-02-10 16:58:13', NULL, '', '', NULL);
INSERT INTO `article` VALUES (3, 30, '{\"en\":\"Delivery\",\"zh-CN\":\"\\u53d1\\u8d27\"}', 'delivery', '', '{\"en\":\"<p>delivery<\\/p>\",\"zh-CN\":\"<p>\\u53d1\\u8d27\\u53d1\\u8d27\\u53d1\\u8d27\\u53d1\\u8d27<br\\/><\\/p>\"}', 'StrongShop', 1, 200, '2022-02-10 16:58:41', '2022-02-10 16:59:08', NULL, '', '', NULL);

-- v1.5.4
INSERT INTO `payment_option` VALUES (2, 'Cash On Delivery', '這是貨到付款，收到貨后請打款到賬號：xx銀行 411838274234', 'paondelivery', 1, '{\"env\": \"sandbox\", \"rate\": null, \"business\": \"abc\", \"currency\": null}', '2022-04-13 09:56:38', '2022-04-13 09:56:38');
