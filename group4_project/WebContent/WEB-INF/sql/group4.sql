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

-- group4 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `group4` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `group4`;


-- 테이블 group4의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` varchar(50) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_level` varchar(50) NOT NULL,
  `member_gender` varchar(50) NOT NULL,
  `member_address` varchar(50) NOT NULL,
  `member_date` varchar(50) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table group4.member: ~3 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_id`, `member_pw`, `member_name`, `member_level`, `member_gender`, `member_address`, `member_date`) VALUES
	('id001', 'pw001', '전재현', '관리자', '남', '전주시', '2018'),
	('id002', 'pw002', '정규룡', '관리자', '여자', '전주시', '2018-07-05 16:08:37'),
	('id003', 'pw003', '홍01', '구매자', '남자', '전주', '2018-07-05 16:08:24');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. menu_choice
CREATE TABLE IF NOT EXISTS `menu_choice` (
  `choice_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `emmber_id` varchar(50) NOT NULL,
  PRIMARY KEY (`choice_no`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `FK_menu_choice_member` FOREIGN KEY (`member_id`) REFERENCES `seller` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table group4.menu_choice: ~0 rows (대략적)
/*!40000 ALTER TABLE `menu_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_choice` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. reple
CREATE TABLE IF NOT EXISTS `reple` (
  `reple_no` int(10) NOT NULL AUTO_INCREMENT,
  `reple_content` mediumtext NOT NULL,
  `member_id` varchar(50) NOT NULL,
  PRIMARY KEY (`reple_no`),
  KEY `FK_reple_member` (`member_id`),
  CONSTRAINT `FK_reple_member` FOREIGN KEY (`member_id`) REFERENCES `member1` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=euckr;

-- Dumping data for table group4.reple: ~1 rows (대략적)
/*!40000 ALTER TABLE `reple` DISABLE KEYS */;
INSERT INTO `reple` (`reple_no`, `reple_content`, `member_id`) VALUES
	(1, '첫번째 댓글입니다', 'id001');
/*!40000 ALTER TABLE `reple` ENABLE KEYS */;


-- 테이블 group4의 구조를 덤프합니다. seller
CREATE TABLE IF NOT EXISTS `seller` (
  `sell_code` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `sell_name` varchar(50) NOT NULL,
  `sell_address` varchar(50) NOT NULL,
  `sell_category` varchar(50) NOT NULL,
  `sell_menu` varchar(50) NOT NULL,
  `sell_price` varchar(50) NOT NULL,
  `sell_date` varchar(50) NOT NULL,
  `sell_content` varchar(50) NOT NULL,
  PRIMARY KEY (`sell_code`),
  KEY `FK_seller_member` (`member_id`),
  CONSTRAINT `FK_seller_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=euckr;

-- Dumping data for table group4.seller: ~11 rows (대략적)
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` (`sell_code`, `member_id`, `sell_name`, `sell_address`, `sell_category`, `sell_menu`, `sell_price`, `sell_date`, `sell_content`) VALUES
	(112, 'id002', '초밥', '전주시 덕진구 동부대로', '일식', '초밥', '7,0000', '2018-07-05 16:13:46', '초밥'),
	(114, 'id001', '국밥집', '전주시 덕진구 동부대로', '한식', '육개장', '7,0000', '2018-07-06 10:24:40', '육개장입니다'),
	(115, 'id001', '리조또', '전주 덕진구 동부대로', '한식', '브리또', '15,000', '2018-07-06 10:25:02', '리조또'),
	(116, 'id001', '1', '1', '한식', '1', '1', '2018-07-06 10:25:10', '1'),
	(117, 'id001', '1', '1', '한식', '1', '1', '2018-07-06 10:25:16', '1'),
	(118, 'id001', '1', '1', '일식', '11', '1', '2018-07-06 10:25:24', '1'),
	(119, 'id002', '햄버거가게', '전주시 완산구', '양식', '햄버거', '7,500', '2018-07-06 11:26:50', '햄버거집'),
	(120, 'id001', '11111', '1111', '한식', '11111', '1111', '2018-07-06 13:46:25', '111111'),
	(121, 'id001', '1111', '111231', '일식', '1111', '111231', '2018-07-06 13:46:37', '1111231'),
	(122, 'id001', '1111', '56123', '일식', '456', '4231', '2018-07-06 13:46:44', '12348'),
	(123, 'id001', '187435', '132486', '일식', '1231156', '1235810', '2018-07-06 13:46:53', '12313');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
