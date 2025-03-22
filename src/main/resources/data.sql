USE PMS_DATABASE;
/*
INSERT INTO `댓글` (`id`, `creator_id`, `post_id`, `project_id`, `comment`, `created_at`, `parent_id`, `writer_ip`)
VALUES
    (1, 1, 1, 1, '댓글 내용 1', NOW(), NULL, '192.168.1.1'),
    (2, 2, 2, 2, '댓글 내용 2', NOW(), NULL, '192.168.1.2'),
    (3, 3, 3, 3, '댓글 내용 3', NOW(), NULL, '192.168.1.3'),
    (4, 4, 4, 4, '댓글 내용 4', NOW(), NULL, '192.168.1.4'),
    (5, 5, 5, 5, '댓글 내용 5', NOW(), NULL, '192.168.1.5'),
    (6, 6, 6, 6, '댓글 내용 6', NOW(), NULL, '192.168.1.6'),
    (7, 7, 7, 7, '댓글 내용 7', NOW(), NULL, '192.168.1.7'),
    (8, 8, 8, 8, '댓글 내용 8', NOW(), NULL, '192.168.1.8'),
    (9, 9, 9, 9, '댓글 내용 9', NOW(), NULL, '192.168.1.9'),
    (10, 10, 10, 10, '댓글 내용 10', NOW(), NULL, '192.168.1.10');

INSERT INTO `로그` (`id`, `entity_type`, `bigint(20)`, `change_type`, `changed_at`, `changed_by`, `id2`, `comapny_id`)
VALUES
    (1, 'USER', 1, 'CREATE', NOW(), 1, 1, 1),
    (2, 'PROJECT', 2, 'UPDATE', NOW(), 2, 2, 2),
    (3, 'COMPANY', 3, 'DELETE', NOW(), 3, 3, 3),
    (4, 'POST', 4, 'CREATE', NOW(), 4, 4, 4),
    (5, 'COMMENT', 5, 'UPDATE', NOW(), 5, 5, 5),
    (6, 'CHECKLIST', 6, 'DELETE', NOW(), 6, 6, 6),
    (7, 'PHASE', 7, 'CREATE', NOW(), 7, 7, 7),
    (8, 'PROJECT', 8, 'UPDATE', NOW(), 8, 8, 8),
    (9, 'COMPANY', 9, 'DELETE', NOW(), 9, 9, 9),
    (10, 'USER', 10, 'CREATE', NOW(), 10, 10, 10);
*/
INSERT INTO `users` (`id`, `company_id`, `name`, `password`, `email`, `phone`, `created_at`)
VALUES
    (1, 1, '김철수', 'hashed_pw1', 'user1@example.com', '010-1234-5678', NOW()),
    (2, 2, '이영희', 'hashed_pw2', 'user2@example.com', '010-2345-6789', NOW()),
    (3, 3, '박민수', 'hashed_pw3', 'user3@example.com', '010-3456-7890', NOW()),
    (4, 4, '최서연', 'hashed_pw4', 'user4@example.com', '010-4567-8901', NOW()),
    (5, 5, '정지훈', 'hashed_pw5', 'user5@example.com', '010-5678-9012', NOW()),
    (6, 6, '한예슬', 'hashed_pw6', 'user6@example.com', '010-6789-0123', NOW()),
    (7, 7, '김도훈', 'hashed_pw7', 'user7@example.com', '010-7890-1234', NOW()),
    (8, 8, '송지효', 'hashed_pw8', 'user8@example.com', '010-8901-2345', NOW()),
    (9, 9, '서강준', 'hashed_pw9', 'user9@example.com', '010-9012-3456', NOW()),
    (10, 10, '차은우', 'hashed_pw10', 'user10@example.com', '010-0123-4567', NOW());
/*
CREATE TABLE `알림` (
                      `id` BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                      `title` VARCHAR(100) NOT NULL,
                      `content` VARCHAR(500) NULL,
                      `notification_status` ENUM('UNREAD', 'READ', 'ARCHIVED') NULL,
                      `created_at` DATETIME NULL,
                      `is_read` BOOLEAN DEFAULT FALSE,
                      `receiver_id` BIGINT(20) NOT NULL,
                      FOREIGN KEY (`receiver_id`) REFERENCES `사용자 데이터`(`id`) ON DELETE CASCADE
);

INSERT INTO `중간테이블` (`user_id`, `project_id`)
VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO `체크리스트` (`id`, `project_progress_id`, `project_id`, `title`, `file`, `created_at`, `creator_id`)
VALUES
    (1, 1, 1, '체크리스트 1', 'file1.pdf', NOW(), 1),
    (2, 2, 1, '체크리스트 2', 'file2.pdf', NOW(), 2),
    (3, 3, 2, '체크리스트 3', 'file3.pdf', NOW(), 3),
    (4, 4, 2, '체크리스트 4', 'file4.pdf', NOW(), 4),
    (5, 5, 3, '체크리스트 5', 'file5.pdf', NOW(), 5),
    (6, 6, 3, '체크리스트 6', 'file6.pdf', NOW(), 6),
    (7, 7, 4, '체크리스트 7', 'file7.pdf', NOW(), 7),
    (8, 8, 4, '체크리스트 8', 'file8.pdf', NOW(), 8),
    (9, 9, 5, '체크리스트 9', 'file9.pdf', NOW(), 9),
    (10, 10, 5, '체크리스트 10', 'file10.pdf', NOW(), 10);

INSERT INTO `체크리스트 댓글` (`id`, `checklist_id`, `comment`, `created_at`, `approved`, `creator_id`)
VALUES
    (1, 1, '체크리스트 댓글 1', NOW(), 1, 1),
    (2, 2, '체크리스트 댓글 2', NOW(), 0, 2),
    (3, 3, '체크리스트 댓글 3', NOW(), 1, 3),
    (4, 4, '체크리스트 댓글 4', NOW(), 0, 4),
    (5, 5, '체크리스트 댓글 5', NOW(), 1, 5),
    (6, 6, '체크리스트 댓글 6', NOW(), 0, 6),
    (7, 7, '체크리스트 댓글 7', NOW(), 1, 7),
    (8, 8, '체크리스트 댓글 8', NOW(), 0, 8),
    (9, 9, '체크리스트 댓글 9', NOW(), 1, 9),
    (10, 10, '체크리스트 댓글 10', NOW(), 0, 10);

INSERT INTO `체크리스트단계` (`id`, `project_id`, `name`, `order`, `created_at`, `creator_id`)
VALUES
    (1, 1, '요구사항 분석', 1, NOW(), 1),
    (2, 1, '화면 설계', 2, NOW(), 2),
    (3, 2, '디자인', 3, NOW(), 3),
    (4, 2, '퍼블리싱', 4, NOW(), 4),
    (5, 3, '개발', 5, NOW(), 5),
    (6, 3, '테스트', 6, NOW(), 6),
    (7, 4, '배포', 7, NOW(), 7),
    (8, 4, '운영', 8, NOW(), 8),
    (9, 5, '유지보수', 9, NOW(), 9),
    (10, 5, '종료', 10, NOW(), 10);

INSERT INTO `프로젝트` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `created_at`)
VALUES
    (1, '프로젝트 A', '프로젝트 설명 1', 'ACTIVE', '2025-01-01', '2025-12-31', NOW()),
    (2, '프로젝트 B', '프로젝트 설명 2', 'ARCHIVED', '2024-01-01', '2024-12-31', NOW()),
    (3, '프로젝트 C', '프로젝트 설명 3', 'DELETED', '2023-01-01', '2023-12-31', NOW()),
    (4, '프로젝트 D', '프로젝트 설명 4', 'ACTIVE', '2025-02-01', '2025-11-30', NOW()),
    (5, '프로젝트 E', '프로젝트 설명 5', 'ARCHIVED', '2024-02-01', '2024-11-30', NOW()),
    (6, '프로젝트 F', '프로젝트 설명 6', 'DELETED', '2023-02-01', '2023-11-30', NOW()),
    (7, '프로젝트 G', '프로젝트 설명 7', 'ACTIVE', '2025-03-01', '2025-10-30', NOW()),
    (8, '프로젝트 H', '프로젝트 설명 8', 'ARCHIVED', '2024-03-01', '2024-10-30', NOW()),
    (9, '프로젝트 I', '프로젝트 설명 9', 'DELETED', '2023-03-01', '2023-10-30', NOW()),
    (10, '프로젝트 J', '프로젝트 설명 10', 'ACTIVE', '2025-04-01', '2025-09-30', NOW());


INSERT INTO `프로젝트 게시글` (`id`, `title`, `content`, `project_post_status`, `created_at`, `parent_id`, `creator_id`, `writer_ip`)
VALUES
    (1, '게시글 제목 1', '게시글 내용 1', 'NORMAL', NOW(), NULL, 1, '192.168.1.1'),
    (2, '게시글 제목 2', '게시글 내용 2', 'QUESTION', NOW(), NULL, 2, '192.168.1.2'),
    (3, '게시글 제목 3', '게시글 내용 3', 'NOTIFICATION', NOW(), NULL, 3, '192.168.1.3'),
    (4, '게시글 제목 4', '게시글 내용 4', 'NORMAL', NOW(), NULL, 4, '192.168.1.4'),
    (5, '게시글 제목 5', '게시글 내용 5', 'QUESTION', NOW(), NULL, 5, '192.168.1.5'),
    (6, '게시글 제목 6', '게시글 내용 6', 'NOTIFICATION', NOW(), NULL, 6, '192.168.1.6'),
    (7, '게시글 제목 7', '게시글 내용 7', 'NORMAL', NOW(), NULL, 7, '192.168.1.7'),
    (8, '게시글 제목 8', '게시글 내용 8', 'QUESTION', NOW(), NULL, 8, '192.168.1.8'),
    (9, '게시글 제목 9', '게시글 내용 9', 'NOTIFICATION', NOW(), NULL, 9, '192.168.1.9'),
    (10, '게시글 제목 10', '게시글 내용 10', 'NORMAL', NOW(), NULL, 10, '192.168.1.10');

INSERT INTO `프로젝트 담당자들` (`id`, `role`, `project_id`, `project_manager_id`, `created_at`)
VALUES
    (1, 'CLIENT', 1, 1, NOW()),
    (2, 'DEVELOPER', 1, 2, NOW()),
    (3, 'CLIENT', 2, 3, NOW()),
    (4, 'DEVELOPER', 2, 4, NOW()),
    (5, 'CLIENT', 3, 5, NOW()),
    (6, 'DEVELOPER', 3, 6, NOW()),
    (7, 'CLIENT', 4, 7, NOW()),
    (8, 'DEVELOPER', 4, 8, NOW()),
    (9, 'CLIENT', 5, 9, NOW()),
    (10, 'DEVELOPER', 5, 10, NOW());


INSERT INTO `회사 데이터` (`id`, `name`, `business_number`, `address`, `phone`, `email`, `company_role`, `created_at`)
VALUES
    (1, '회사 A', '123-45-67890', '서울', '02-1234-5678', 'a@example.com', 'ADMIN', NOW()),
    (2, '회사 B', '234-56-78901', '부산', '051-2345-6789', 'b@example.com', 'DEVELOPER', NOW()),
    (3, '회사 C', '345-67-89012', '대구', '053-3456-7890', 'c@example.com', 'CUSTOMER', NOW());


*/

