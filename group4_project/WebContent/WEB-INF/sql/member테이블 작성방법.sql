-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 group4의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` varchar(50) NOT NULL,
  `member_pw` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `member_level` varchar(50) DEFAULT NULL,
  `member_gender` varchar(50) DEFAULT NULL,
  `member_address` varchar(50) DEFAULT NULL,
  `member_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table group4.member: ~1 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_id`, `member_pw`, `member_name`, `member_level`, `member_gender`, `member_address`, `member_date`) VALUES
	('id001', 'pw001', '홍01', '관리자', '남', '전주', '2018-06-29 16:51:30');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. menu_choice
CREATE TABLE IF NOT EXISTS `menu_choice` (
  `choice_no` int(10) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `choice1` int(11) DEFAULT NULL,
  `choice2` int(11) DEFAULT NULL,
  `choice3` int(11) DEFAULT NULL,
  `choice4` int(11) DEFAULT NULL,
  `choice5` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_no`),
  KEY `FK_menu_choice_member` (`member_id`),
  KEY `FK_menu_choice_seller` (`choice1`),
  KEY `FK_menu_choice_seller_2` (`choice2`),
  KEY `FK_menu_choice_seller_3` (`choice3`),
  KEY `FK_menu_choice_seller_4` (`choice4`),
  KEY `FK_menu_choice_seller_5` (`choice5`),
  CONSTRAINT `FK_menu_choice_seller_3` FOREIGN KEY (`choice3`) REFERENCES `seller` (`sell_code`),
  CONSTRAINT `FK_menu_choice_seller_4` FOREIGN KEY (`choice4`) REFERENCES `seller` (`sell_code`),
  CONSTRAINT `FK_menu_choice_seller_5` FOREIGN KEY (`choice5`) REFERENCES `seller` (`sell_code`),
  CONSTRAINT `FK_menu_choice_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_menu_choice_seller` FOREIGN KEY (`choice1`) REFERENCES `seller` (`sell_code`),
  CONSTRAINT `FK_menu_choice_seller_2` FOREIGN KEY (`choice2`) REFERENCES `seller` (`sell_code`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table group4.menu_choice: ~1 rows (대략적)
/*!40000 ALTER TABLE `menu_choice` DISABLE KEYS */;
INSERT INTO `menu_choice` (`choice_no`, `member_id`, `choice1`, `choice2`, `choice3`, `choice4`, `choice5`) VALUES
	(1, 'id001', 100, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `menu_choice` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. reple
CREATE TABLE IF NOT EXISTS `reple` (
  `reple_no` int(10) NOT NULL,
  `reple_content` mediumtext NOT NULL,
  `member_id` varchar(50) NOT NULL,
  PRIMARY KEY (`reple_no`),
  KEY `FK_reple_member` (`member_id`),
  CONSTRAINT `FK_reple_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table group4.reple: ~0 rows (대략적)
/*!40000 ALTER TABLE `reple` DISABLE KEYS */;
INSERT INTO `reple` (`reple_no`, `reple_content`, `member_id`) VALUES
	(1, '첫번째 댓글입니다', 'id001');
/*!40000 ALTER TABLE `reple` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. seller
CREATE TABLE `seller` (
	`sell_code` INT(10) NOT NULL AUTO_INCREMENT,
	`member_id` VARCHAR(50) NULL DEFAULT NULL,
	`sell_name` VARCHAR(50) NULL DEFAULT NULL,
	`sell_address` VARCHAR(50) NULL DEFAULT NULL,
	`sell_category` VARCHAR(50) NULL DEFAULT NULL,
	`sell_menu` VARCHAR(50) NULL DEFAULT NULL,
	`sell_price` VARCHAR(50) NULL DEFAULT NULL,
	`sell_date` VARCHAR(50) NULL DEFAULT NULL,
	`sell_content` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`sell_code`),
	INDEX `FK_seller_member` (`member_id`),
	CONSTRAINT `FK_seller_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
;


-- Dumping data for table group4.seller: ~1 rows (대략적)
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` (`sell_code`, `member_id`, `sell_name`, `sell_address`, `sell_category`, `sell_menu`, `sell_price`, `sell_date`, `sell_content`) VALUES
	(100, 'id001', '더짜글', '전주', '한식', '짜글이', '6000', '2018-06-29 16:56:52', '짜글이입니다.');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
