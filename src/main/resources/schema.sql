CREATE DATABASE IF NOT EXISTS PMS_DATABASE;
USE PMS_DATABASE;

-- 기존 테이블 삭제
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS change_logs;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS user_project;
DROP TABLE IF EXISTS checklists;
DROP TABLE IF EXISTS checklist_progress;
DROP TABLE IF EXISTS checklist_comments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS project_posts;
DROP TABLE IF EXISTS project_managers;
DROP TABLE IF EXISTS companies;

CREATE TABLE `project_posts` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NULL,
    `content` VARCHAR(500) NULL,
    `project_post_status` ENUM("NORMAL", "NOTIFICATION","QUESTION") NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL ON DELETE CURRENT_TIMESTAMP,
    `parent_id` BIGINT(20) NULL,
    `creator_id` BIGINT(20) NOT NULL,
    `modifier_id` BIGINT(20) NULL,
    `deleter_id` BIGINT(20) NULL,
    `writer_ip` VARCHAR(255) NULL,
     CONSTRAINT `fk_project_posts_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
     CONSTRAINT `fk_project_posts_modifier_id` FOREIGN KEY (`modifier_id`) REFERENCES `users` (`id`),
     CONSTRAINT `fk_project_posts_deleter_id` FOREIGN KEY (`deleter_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `checklist_comments` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `checklist_id` BIGINT(100) NOT NULL,
    `comment` VARCHAR(200) NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL ON DELETE CURRENT_TIMESTAMP,
    `approved` BOOLEAN NULL,
    `creator_id` BIGINT(20) NOT NULL,
    `modifier_id` BIGINT(20) NULL,
    `deleter_id` BIGINT(20) NULL,
    CONSTRAINT `fk_checklist_comments_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_checklist_comments_modifier_id` FOREIGN KEY (`modifier_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_checklist_comments_deleter_id` FOREIGN KEY (`deleter_id`) REFERENCES `users` (`id`)

);

CREATE TABLE `user_project` (
    `user_id` BIGINT(20) NOT NULL,
    `project_id` BIGINT(20) NOT NULL,
    PRIMARY KEY (`user_id`, `project_id`)
);

CREATE TABLE `companies` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NULL,
    `business_number` VARCHAR(50) NULL,
    `address` VARCHAR(50) NULL,
    `phone` VARCHAR(20) NULL,
    `email` VARCHAR(50) NULL,
    `company_role` ENUM("ADMIN","DEVELOPER","CUSTOMER") NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL ON DELETE CURRENT_TIMESTAMP
);

CREATE TABLE `notifications` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(100) NULL,
    `content` VARCHAR(200) NULL,
    `notification_status` ENUM("PROJECT_CREATED","PROJECT_UPDATED","PROJECT_DELETED") NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `is_read` BOOLEAN NULL,
    `receiver_id` BIGINT(20) NOT NULL
);

CREATE TABLE `change_logs` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `entity_type` ENUM("USER","COMPANY","PROJECT","PHASE","CHECKLIST","POST","COMMENT") NOT NULL,
    `entity_id` BIGINT(20) NOT NULL,
    `change_type` ENUM("CREATE","UPDATE","DELETE") NOT NULL,
    `changed_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `changed_by` BIGINT(20) NOT NULL,
    `company_id` BIGINT(20) NOT NULL
);

CREATE TABLE `checklist_progress` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `project_id` BIGINT(20) NOT NULL,
    `name` VARCHAR(10) NULL,
    `step_order` BIGINT(10) NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL,
    `is_deleted` BOOLEAN NULL,
    `creator_id` BIGINT(20) NOT NULL,
    `modifier_id` BIGINT(20) NULL,
    `deleter_id` BIGINT(20) NULL ON DELETE CURRENT_TIMESTAMP
);

CREATE TABLE `project_managers` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role` ENUM("CLIENT","DEVELOPER") NOT NULL,
    `project_id` BIGINT(20) NOT NULL,
    `project_manager_id` BIGINT(20) NOT NULL,
    `created_at` DATETIME NOT NULL
);

CREATE TABLE `checklists` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `project_progress_id` BIGINT(20) NOT NULL,
    `project_id` BIGINT(20) NOT NULL,
    `title` VARCHAR(20) NULL,
    `file` VARCHAR(20) NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL,
    `is_deleted` BOOLEAN NULL,
    `creator_id` BIGINT(20) NOT NULL,
    `modifier_id` BIGINT(20) NULL,
    `deleter_id` BIGINT(20) NULL
);

CREATE TABLE `users` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `company_id` BIGINT(20) NOT NULL,
    `name` VARCHAR(50) NULL,
    `password` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(13) NULL,
    `password_modified_at` DATETIME NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL,
    `is_deleted` BOOLEAN NULL
);

CREATE TABLE `projects` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NULL,
    `description` VARCHAR(200) NULL,
    `status` ENUM("ACTIVE","ARCHIVED","DELETED") NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL,
    `is_deleted` BOOLEAN NULL
);

CREATE TABLE `comments` (
                            `id`	BIGINT(20)	NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            `creator_id`	BIGINT(20)	NOT NULL,
                            `post_id`	BIGINT(20)	NOT NULL,
                            `project_id`	BIGINT	NOT NULL,
                            `comment`	VARCHAR(200)	NULL,
                            `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                            `modified_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                            `deleted_at`	DATETIME	NULL,
                            `is_deleted` BOOLEAN NULL,
                            `parent_id`	BIGINT	    NULL,
                            `writer_ip`	VARCHAR(50)	NULL
);
