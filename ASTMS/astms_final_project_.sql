-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 11:30 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astms(final_project)`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_data_stu_table` (IN `stu_id` INT, IN `stu_f_name` VARCHAR(255), IN `stu_l_name` VARCHAR(255), IN `stu_contract` INT, IN `stu_another_contract` INT, IN `current_semester` INT, IN `gender` VARCHAR(255), IN `birth_date` VARCHAR(255))  INSERT INTO student_details(stu_id, stu_f_name, stu_l_name, stu_contract, stu_another_contract, current_semester, gender, birth_date) VALUES (stu_id,stu_f_name,stu_l_name,stu_contract,stu_another_contract,current_semester,gender,birth_date)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_course_info` (IN `c_id` INT)  SELECT  course_name, course_t_id, course_t_name FROM courses WHERE course_id = c_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reg_course_id` (IN `reg_id` INT)  SELECT course_id from s_course_registration where s_id = reg_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stu_info` (IN `s_id` INT)  SELECT  stu_f_name, stu_l_name, stu_contract, stu_another_contract, current_semester, gender, birth_date FROM student_details WHERE stu_id = s_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_t_info` (IN `t` INT)  SELECT  t_f_name, t_l_name, contract, a_contract, address, gender, sallary FROM teachers WHERE t_id = t$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `s_login_pass` (IN `s_u_n` VARCHAR(255))  SELECT  s_pass FROM student_login_data WHERE s_user_name =  s_u_n$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_data`
--

CREATE TABLE `admin_login_data` (
  `email` varchar(255) NOT NULL,
  `admin_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_login_data`
--

INSERT INTO `admin_login_data` (`email`, `admin_pass`) VALUES
('meraj@346gmail.com', ' 098765'),
('naim', ' 123456'),
('hasan@334gmail.com', ' 28844rhf'),
('ofjn@gmail.com', ' 62tdfbhnw3f'),
('xyz@abc.com', ' 8eyhfbw32'),
('chowa@54376@gmail.com', ' chowa243');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(50) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_t_id` int(50) NOT NULL,
  `course_t_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_t_id`, `course_t_name`) VALUES
(0, '', 0, ''),
(311, 'Database Management System', 3546, 'Md. Jahangir Alam'),
(1234, 'AI', 4321, 'Tasnim Tabassum'),
(1289, 'Test.course_name', 2398, 'test.teacher_name'),
(9123, 'test.course', 55687, 'test.name'),
(9129, 'test.course', 55687, 'test.name'),
(9871, 'Computer Network', 5678, 'Mst.Fatema tuj zohra');

--
-- Triggers `courses`
--
DELIMITER $$
CREATE TRIGGER `courses_trigger` AFTER INSERT ON `courses` FOR EACH ROW INSERT INTO courses_trigger(Details_id,course_id, course_name,course_t_id,course_t_name, time, Event_details) VALUES (null,new.course_id,new.course_name ,new.course_t_id,new.course_t_name,NOW(),'Course-DATA_inserted')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `courses_trigger`
--

CREATE TABLE `courses_trigger` (
  `Details_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_t_id` int(11) NOT NULL,
  `course_t_name` varchar(50) NOT NULL,
  `time` datetime NOT NULL,
  `Event_details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses_trigger`
--

INSERT INTO `courses_trigger` (`Details_id`, `course_id`, `course_name`, `course_t_id`, `course_t_name`, `time`, `Event_details`) VALUES
(1, 1289, 'Test.course_name', 2398, 'test.teacher_name', '2022-04-05 00:19:55', 'Course-DATA_inserted'),
(2, 9123, 'test.course', 55687, 'test.name', '2022-04-07 14:18:09', 'Course-DATA_inserted'),
(3, 9129, 'test.course', 55687, 'test.name', '2022-04-07 14:20:49', 'Course-DATA_inserted'),
(4, 0, '', 0, '', '2022-04-07 14:21:53', 'Course-DATA_inserted');

-- --------------------------------------------------------

--
-- Stand-in structure for view `course_id`
-- (See below for the actual view)
--
CREATE TABLE `course_id` (
`s_id` int(50)
,`course_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `delete_stu_info_trigger`
--

CREATE TABLE `delete_stu_info_trigger` (
  `Details_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `reg_date` varchar(50) NOT NULL,
  `course_teacher_id` int(11) NOT NULL,
  `course_teacher_name` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `Eventname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delete_stu_info_trigger`
--

INSERT INTO `delete_stu_info_trigger` (`Details_id`, `s_id`, `transaction_id`, `reg_date`, `course_teacher_id`, `course_teacher_name`, `course_id`, `time`, `Eventname`) VALUES
(1, 3578, 64243, '14th-february', 6754, 'aa', 311, '2022-04-09 01:10:56', 'Data Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `stu_id` int(50) NOT NULL,
  `stu_f_name` varchar(50) NOT NULL,
  `stu_l_name` varchar(50) NOT NULL,
  `stu_contract` int(11) NOT NULL,
  `stu_another_contract` int(11) NOT NULL,
  `current_semester` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`stu_id`, `stu_f_name`, `stu_l_name`, `stu_contract`, `stu_another_contract`, `current_semester`, `gender`, `birth_date`) VALUES
(0, '', '', 0, 0, 0, '', '0000-00-00'),
(3099, ' lamia', 'lamia', 193883973, 146378338, 12, 'Female', '0000-00-00'),
(3146, 'md', 'yasin', 1536773834, 187374782, 7, 'male', '0000-00-00'),
(3235, 'Shagor', 'Ali', 164855523, 197464784, 7, 'male', '0000-00-00'),
(3578, 'Sazia', 'Tahosin', 17388645, 0, 7, 'Female', '0000-00-00'),
(3725, 'Abdullah', 'Al mamun', 16478945, 17547834, 4, 'male', '0000-00-00'),
(3876, 'md.Fahad', 'Islam', 167748224, 317617834, 5, 'male', '0000-00-00'),
(34567, 'Shoiyeb', 'Al Roxy', 156378276, 163578284, 7, 'male', '0000-00-00'),
(35721, 'Badhon', 'Deb', 176848744, 156357245, 7, 'male', '0000-00-00'),
(76722, 'aEFWE', '3EF', 1738648455, 1567263733, 6, 'male', '0000-00-00'),
(108436, 'rhd', 'bhai', 163974732, 193863321, 11, 'male', '0000-00-00'),
(124987, ' t.f', 't.f', 193883973, 146378338, 10, 'male', '0000-00-00'),
(743578, 'yedydf', 'jyhwdsf', 1738648455, 187325647, 7, 'male', '0000-00-00'),
(12498724, 'wetr', 'etw54', 193883973, 146378338, 6, 'male', '2000-05-17');

--
-- Triggers `student_details`
--
DELIMITER $$
CREATE TRIGGER `student_details_trigger` AFTER INSERT ON `student_details` FOR EACH ROW INSERT INTO student_details_trigger(Details,stu_id, stu_f_name,stu_l_name,stu_contract,stu_another_contract,current_semester,
                            gender,birth_date, time,Event_details) VALUES (null,new.stu_id,new.stu_f_name ,new.stu_l_name,new.stu_contract,new.stu_another_contract,new.current_semester,new.gender,new.birth_date
                                                                           ,NOW(),'student_info_inserted')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_s_details_trigger` AFTER UPDATE ON `student_details` FOR EACH ROW INSERT INTO update_s_details_trigger(Details_id, stu_id, stu_f_name, stu_l_name, stu_contract, stu_another_contract, current_semester, gender, birth_date, time) VALUES (null,new.stu_id,new.stu_f_name,new.stu_l_name,new.stu_contract,new.stu_another_contract,new.current_semester,new.gender,new.birth_date,NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_details_trigger`
--

CREATE TABLE `student_details_trigger` (
  `Details` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `stu_f_name` varchar(50) NOT NULL,
  `stu_l_name` varchar(40) NOT NULL,
  `stu_contract` int(11) NOT NULL,
  `stu_another_contract` int(11) NOT NULL,
  `current_semester` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `time` datetime NOT NULL,
  `Event_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details_trigger`
--

INSERT INTO `student_details_trigger` (`Details`, `stu_id`, `stu_f_name`, `stu_l_name`, `stu_contract`, `stu_another_contract`, `current_semester`, `gender`, `birth_date`, `time`, `Event_details`) VALUES
(1, 124987, 'test', 'test.last', 176546579, 186545776, 7, 'male', '0000-00-00', '2022-04-05 00:39:07', 'student_info_inserted'),
(4, 0, '', '', 0, 0, 0, '', '0000-00-00', '2022-04-07 12:21:18', 'student_info_inserted'),
(5, 3099, 'abcd', 'efgh', 1738648455, 187325647, 7, 'male', '0000-00-00', '2022-04-07 12:27:20', 'student_info_inserted'),
(6, 76722, 'aEFWE', '3EF', 1738648455, 1567263733, 6, 'male', '0000-00-00', '2022-04-09 13:11:44', 'student_info_inserted'),
(7, 108436, 'rhd', 'bhai', 163974732, 193863321, 11, 'male', '0000-00-00', '2022-04-09 19:13:58', 'student_info_inserted'),
(8, 743578, 'yedydf', 'jyhwdsf', 1738648455, 187325647, 7, 'male', '0000-00-00', '2022-04-09 20:20:56', 'student_info_inserted'),
(9, 12498724, 'wetr', 'etw54', 193883973, 146378338, 6, 'male', '2000-05-17', '2022-04-10 22:04:33', 'student_info_inserted'),
(10, 0, '', '', 0, 0, 0, '', '0000-00-00', '2022-04-11 20:46:52', 'student_info_inserted');

-- --------------------------------------------------------

--
-- Table structure for table `student_login_data`
--

CREATE TABLE `student_login_data` (
  `s_user_name` varchar(50) NOT NULL,
  `s_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_login_data`
--

INSERT INTO `student_login_data` (`s_user_name`, `s_pass`) VALUES
('naim@gmailcom', '0uyus'),
('rayhbecdunwf@gmail.com', '12344'),
('naim', '123456'),
('79Pa0nv/4x(q!Hfl', '1234567'),
('79Pa0nv/4x(q!Hfl', '12ed'),
('chowa@gmail.com', '134263'),
('nai@123gmail.com', '13w1ed'),
('rahadislamqe2369@gmail.com', '142rfdw'),
('test@test.gmail.com', '1w3528084dsfv'),
('Rahat1369@gmail.com', '24qrwd'),
('mishkat', '27yhdsw'),
('naim@gmai;com', '2ydbhnw j2f'),
('4r2wedw', '3qrwd'),
('rabag@gmqil.com', '42tger'),
('ragajjue', '6efev'),
('naim@363.gmailcom', '7368nedd'),
('naim', '85rfgbhjmk,kfcdxz'),
('shaoun@ie4hf', '8hdw'),
('kjwenfiew jf@gmai.com', '8o37qwdjnm'),
('naimqEDUXIJC', 'aegwd'),
('rahadislam369@gmail.cefom', 'eqwd23rwdx'),
('q3rw3ref', 'gvdred'),
('Rahat13r2dae69@gmail.com', 'q3efd'),
('naim@dgedce35.com', 'qegffw'),
('Rahat13r2dq69@gmail.com', 'qre21qd'),
('naim@fkkk.gmail.com', 'qwuedn'),
('Rahat132469@gmail.com', 'r1`3`e'),
('raj=kib357@gmail.com', 'rahadz2k18'),
('rahat@diu.edu.bd', 'rghheufs'),
('naim15-3624@diu.edu.bd', 't7i5edfg'),
('rafiul@ooo', 'tdrbv'),
('rahat@diu.edu.bd', 'tgrec'),
('q13wd', 'uwed'),
('Rahat1369@gmail.com', 'wategdv'),
('Rahat13Q3RF69@gmail.com', 'wEFCW34G'),
('naim@gmai;com', 'WERSDFGR'),
('naim', 'wydgywb');

--
-- Triggers `student_login_data`
--
DELIMITER $$
CREATE TRIGGER `s_login_trigger` AFTER INSERT ON `student_login_data` FOR EACH ROW INSERT INTO s_login_trigger(DetailsNo, s_user_name, s_pass, Time, eventname) VALUES (null,new.s_user_name,new.s_pass ,NOW(),'lOGIN-DATA_inserted')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `s_course_registration`
--

CREATE TABLE `s_course_registration` (
  `s_id` int(50) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `reg_date` varchar(50) NOT NULL,
  `course_teacher_id` int(40) NOT NULL,
  `course_teacher_name` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_course_registration`
--

INSERT INTO `s_course_registration` (`s_id`, `transaction_id`, `reg_date`, `course_teacher_id`, `course_teacher_name`, `course_id`) VALUES
(3099, 3674, '25th-february', 4321, 'Tasnim Tabassum', 1234),
(3146, 242474, '29th-february', 37891, 'Ta', 9129),
(76722, 25435, '', 4321, 'Tasnim Tabassum', 1234),
(76722, 25435, '', 4321, 'Tasnim Tabassum', 1234);

--
-- Triggers `s_course_registration`
--
DELIMITER $$
CREATE TRIGGER `delete_stu_info_trigger` AFTER DELETE ON `s_course_registration` FOR EACH ROW INSERT INTO delete_stu_info_trigger(Details_id, s_id, transaction_id, reg_date, course_teacher_id, course_teacher_name, course_id, time, Eventname) VALUES (null,OLD.s_id,OLD.transaction_id,OLD.reg_date,OLD.course_teacher_id,OLD.course_teacher_name,OLD.course_id,NOW(),'Data Deleted')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `s_course_registration_trigger` AFTER INSERT ON `s_course_registration` FOR EACH ROW INSERT INTO s_course_registration_trigger(DetailsNo,s_id, transaction_id,reg_date,course_teacher_id,	course_teacher_name,course_id,time,Event_details) VALUES (null,new.s_id,new.transaction_id,new.reg_date,new.course_teacher_id,new.course_teacher_name,new.course_id
                                                                          ,NOW(),'registration_info_inserted')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `s_course_registration_trigger`
--

CREATE TABLE `s_course_registration_trigger` (
  `DetailsNo` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `reg_date` varchar(40) NOT NULL,
  `course_teacher_id` int(11) NOT NULL,
  `course_teacher_name` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `Event_details` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_course_registration_trigger`
--

INSERT INTO `s_course_registration_trigger` (`DetailsNo`, `s_id`, `transaction_id`, `reg_date`, `course_teacher_id`, `course_teacher_name`, `course_id`, `time`, `Event_details`) VALUES
(1, 3235, 8738341, '3rd January', 4321, 'Tasnim Tabassum', 1234, '2022-04-05 00:53:21', 'registration_info_inserted'),
(2, 3099, 3674, '25th-february', 4321, 'Tasnim Tabassum', 1234, '2022-04-09 00:43:39', 'registration_info_inserted'),
(3, 3146, 242474, '29th-february', 37891, 'Ta', 9129, '2022-04-09 00:45:43', 'registration_info_inserted'),
(4, 3578, 64243, '14th-february', 6754, 'aa', 311, '2022-04-09 00:46:59', 'registration_info_inserted'),
(5, 76722, 25435, '', 4321, 'Tasnim Tabassum', 1234, '2022-04-09 13:13:18', 'registration_info_inserted'),
(6, 76722, 25435, '', 4321, 'Tasnim Tabassum', 1234, '2022-04-09 13:15:24', 'registration_info_inserted');

-- --------------------------------------------------------

--
-- Table structure for table `s_login(trig)`
--

CREATE TABLE `s_login(trig)` (
  `DetailsNo` int(11) NOT NULL,
  `s_user_name` varchar(50) NOT NULL,
  `s_pass` varchar(50) NOT NULL,
  `Time` datetime NOT NULL,
  `eventname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `s_login_trigger`
--

CREATE TABLE `s_login_trigger` (
  `DetailsNo` int(11) NOT NULL,
  `s_user_name` varchar(50) NOT NULL,
  `s_pass` varchar(50) NOT NULL,
  `Time` datetime NOT NULL,
  `eventname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_login_trigger`
--

INSERT INTO `s_login_trigger` (`DetailsNo`, `s_user_name`, `s_pass`, `Time`, `eventname`) VALUES
(1, 'chowa@gmail.com', '134263', '2022-04-01 22:55:16', 'lOGIN-DATA_inserted'),
(2, 'naim', 'wydgywb', '2022-04-04 20:44:09', 'lOGIN-DATA_inserted'),
(3, 'test@test.gmail.com', '1w3528084dsfv', '2022-04-05 00:31:23', 'lOGIN-DATA_inserted'),
(4, 'kjwenfiew jf@gmai.com', '8o37qwdjnm', '2022-04-07 02:58:33', 'lOGIN-DATA_inserted'),
(5, 'rayhbecdunwf@gmail.com', '12344', '2022-04-07 03:05:33', 'lOGIN-DATA_inserted'),
(6, 'raj=kib357@gmail.com', 'rahadz2k18', '2022-04-07 11:38:07', 'lOGIN-DATA_inserted'),
(7, 'rabag@gmqil.com', '42tger', '2022-04-07 15:34:26', 'lOGIN-DATA_inserted'),
(8, 'nai@123gmail.com', '13w1ed', '2022-04-08 00:49:07', 'lOGIN-DATA_inserted'),
(9, 'q3rw3ref', 'gvdred', '2022-04-08 00:51:02', 'lOGIN-DATA_inserted'),
(10, 'naimqEDUXIJC', 'aegwd', '2022-04-08 00:51:52', 'lOGIN-DATA_inserted'),
(11, 'rahadislam369@gmail.cefom', 'eqwd23rwdx', '2022-04-08 04:11:14', 'lOGIN-DATA_inserted'),
(12, 'Rahat1369@gmail.com', '24qrwd', '2022-04-08 11:28:25', 'lOGIN-DATA_inserted'),
(13, 'naim@dgedce35.com', 'qegffw', '2022-04-08 11:52:37', 'lOGIN-DATA_inserted'),
(14, 'Rahat1369@gmail.com', 'wategdv', '2022-04-08 14:25:40', 'lOGIN-DATA_inserted'),
(15, 'Rahat13Q3RF69@gmail.com', 'wEFCW34G', '2022-04-08 14:26:50', 'lOGIN-DATA_inserted'),
(16, 'naim@gmai;com', '2ydbhnw j2f', '2022-04-08 22:36:23', 'lOGIN-DATA_inserted'),
(17, 'naim@gmai;com', 'WERSDFGR', '2022-04-08 22:40:56', 'lOGIN-DATA_inserted'),
(18, 'naim15-3624@diu.edu.bd', 't7i5edfg', '2022-04-09 00:20:07', 'lOGIN-DATA_inserted'),
(19, 'Rahat132469@gmail.com', 'r1`3`e', '2022-04-09 13:10:59', 'lOGIN-DATA_inserted'),
(20, 'rahadislamqe2369@gmail.com', '142rfdw', '2022-04-09 14:58:07', 'lOGIN-DATA_inserted'),
(21, 'Rahat13r2dq69@gmail.com', 'qre21qd', '2022-04-09 19:17:07', 'lOGIN-DATA_inserted'),
(22, 'Rahat13r2dae69@gmail.com', 'q3efd', '2022-04-09 19:31:13', 'lOGIN-DATA_inserted'),
(23, 'naim@gmailcom', '0uyus', '2022-04-09 22:47:52', 'lOGIN-DATA_inserted'),
(24, 'naim@363.gmailcom', '7368nedd', '2022-04-10 21:57:31', 'lOGIN-DATA_inserted'),
(25, 'naim@fkkk.gmail.com', 'qwuedn', '2022-04-11 20:10:26', 'lOGIN-DATA_inserted'),
(26, '79Pa0nv/4x(q!Hfl', '1234567', '2022-04-11 20:22:42', 'lOGIN-DATA_inserted'),
(27, 'rahat@diu.edu.bd', 'tgrec', '2022-04-11 20:32:16', 'lOGIN-DATA_inserted'),
(28, '4r2wedw', '3qrwd', '2022-04-11 20:46:41', 'lOGIN-DATA_inserted'),
(29, 'mishkat', '27yhdsw', '2022-04-11 23:19:34', 'lOGIN-DATA_inserted'),
(30, 'q13wd', 'uwed', '2022-04-12 09:27:52', 'lOGIN-DATA_inserted'),
(31, 'shaoun@ie4hf', '8hdw', '2022-04-12 09:51:36', 'lOGIN-DATA_inserted'),
(32, 'ragajjue', '6efev', '2022-04-12 10:12:41', 'lOGIN-DATA_inserted'),
(33, 'rafiul@ooo', 'tdrbv', '2022-04-12 10:19:44', 'lOGIN-DATA_inserted'),
(34, '79Pa0nv/4x(q!Hfl', '12ed', '2022-04-24 14:31:02', 'lOGIN-DATA_inserted');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `t_id` int(11) NOT NULL,
  `t_f_name` varchar(50) NOT NULL,
  `t_l_name` varchar(50) NOT NULL,
  `contract` varchar(40) NOT NULL,
  `a_contract` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `sallary` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`t_id`, `t_f_name`, `t_l_name`, `contract`, `a_contract`, `address`, `gender`, `sallary`) VALUES
(3546, 'Md.jahangir', 'Alam', '0149747893', '', 'Mirpur,Shewrapara', 'male', 0),
(4321, 'Mst.Tasnim', 'Tabassum', '0167349224', '', 'Shamoli', 'Female', 0),
(5678, 'Mst.Ftema', 'tuz zuhra', '0398482124', '03762791344', 'Savar', 'Female', 0),
(6754, 'test.first', 'test.last', '017678342', '016733452', 'Ashuliya,Dattapara', 'male', 0),
(37891, 't.firstname1', 't.lastname1', '0178477584', '0147287493', 'abc......', 'male', 29000),
(55687, 'test.first', 'test.last', '0897523598', '0146766576', 'Savar', 'male', 763445),
(388474, 'test.first', 'test.last', '017676233', '018734133', 'Ashuliya,Dattapara', 'male', 73445);

--
-- Triggers `teachers`
--
DELIMITER $$
CREATE TRIGGER `teachers_trigger` AFTER INSERT ON `teachers` FOR EACH ROW INSERT INTO teachers_trigger VALUES (null,new.t_id,new.t_f_name ,new.	t_l_name,new.contract,new.a_contract,new.	address,new.gender,new.sallary
                                                                           ,NOW(),'student_info_inserted')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teachers_trigger`
--

CREATE TABLE `teachers_trigger` (
  `DetailsNo` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `t_f_name` varchar(50) NOT NULL,
  `t_l_name` varchar(40) NOT NULL,
  `contract` varchar(11) NOT NULL,
  `a_contract` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `sallary` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `Event name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers_trigger`
--

INSERT INTO `teachers_trigger` (`DetailsNo`, `t_id`, `t_f_name`, `t_l_name`, `contract`, `a_contract`, `address`, `gender`, `sallary`, `time`, `Event name`) VALUES
(1, 388474, 'test.first', 'test.last', '017676233', '018734133', 'Ashuliya,Dattapara', 'male', 73445, '2022-04-05 01:06:34', 'student_info_inserted'),
(2, 37891, 't.firstname1', 't.lastname1', '0178477584', '0147287493', 'abc......', 'male', 29000, '2022-04-07 14:24:21', 'student_info_inserted');

-- --------------------------------------------------------

--
-- Table structure for table `t_department`
--

CREATE TABLE `t_department` (
  `t_id` int(11) NOT NULL,
  `t_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_department`
--

INSERT INTO `t_department` (`t_id`, `t_dept`) VALUES
(3546, 'cse'),
(4321, 'CSE'),
(5678, 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `update_s_details_trigger`
--

CREATE TABLE `update_s_details_trigger` (
  `Details_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `stu_f_name` varchar(50) NOT NULL,
  `stu_l_name` varchar(50) NOT NULL,
  `stu_contract` int(50) NOT NULL,
  `stu_another_contract` int(50) NOT NULL,
  `current_semester` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `time` datetime NOT NULL,
  `Event_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `update_s_details_trigger`
--

INSERT INTO `update_s_details_trigger` (`Details_id`, `stu_id`, `stu_f_name`, `stu_l_name`, `stu_contract`, `stu_another_contract`, `current_semester`, `gender`, `birth_date`, `time`, `Event_name`) VALUES
(1, 3099, ' lamia', 'lamia', 193883973, 146378338, 12, 'Female', '0000-00-00', '2022-04-08 12:17:00', '');

-- --------------------------------------------------------

--
-- Structure for view `course_id`
--
DROP TABLE IF EXISTS `course_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_id`  AS SELECT `s_course_registration`.`s_id` AS `s_id`, `s_course_registration`.`course_id` AS `course_id` FROM `s_course_registration` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login_data`
--
ALTER TABLE `admin_login_data`
  ADD UNIQUE KEY `admin_pass` (`admin_pass`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `courses_trigger`
--
ALTER TABLE `courses_trigger`
  ADD PRIMARY KEY (`Details_id`);

--
-- Indexes for table `delete_stu_info_trigger`
--
ALTER TABLE `delete_stu_info_trigger`
  ADD PRIMARY KEY (`Details_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`stu_id`);

--
-- Indexes for table `student_details_trigger`
--
ALTER TABLE `student_details_trigger`
  ADD PRIMARY KEY (`Details`);

--
-- Indexes for table `student_login_data`
--
ALTER TABLE `student_login_data`
  ADD UNIQUE KEY `s_pas` (`s_pass`);

--
-- Indexes for table `s_course_registration`
--
ALTER TABLE `s_course_registration`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `course_teacher_id` (`course_teacher_id`);

--
-- Indexes for table `s_course_registration_trigger`
--
ALTER TABLE `s_course_registration_trigger`
  ADD PRIMARY KEY (`DetailsNo`);

--
-- Indexes for table `s_login(trig)`
--
ALTER TABLE `s_login(trig)`
  ADD PRIMARY KEY (`DetailsNo`);

--
-- Indexes for table `s_login_trigger`
--
ALTER TABLE `s_login_trigger`
  ADD PRIMARY KEY (`DetailsNo`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `teachers_trigger`
--
ALTER TABLE `teachers_trigger`
  ADD PRIMARY KEY (`DetailsNo`);

--
-- Indexes for table `t_department`
--
ALTER TABLE `t_department`
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `update_s_details_trigger`
--
ALTER TABLE `update_s_details_trigger`
  ADD PRIMARY KEY (`Details_id`),
  ADD KEY `stu_id` (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses_trigger`
--
ALTER TABLE `courses_trigger`
  MODIFY `Details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delete_stu_info_trigger`
--
ALTER TABLE `delete_stu_info_trigger`
  MODIFY `Details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_details_trigger`
--
ALTER TABLE `student_details_trigger`
  MODIFY `Details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `s_course_registration_trigger`
--
ALTER TABLE `s_course_registration_trigger`
  MODIFY `DetailsNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `s_login(trig)`
--
ALTER TABLE `s_login(trig)`
  MODIFY `DetailsNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_login_trigger`
--
ALTER TABLE `s_login_trigger`
  MODIFY `DetailsNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `teachers_trigger`
--
ALTER TABLE `teachers_trigger`
  MODIFY `DetailsNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `update_s_details_trigger`
--
ALTER TABLE `update_s_details_trigger`
  MODIFY `Details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `s_course_registration`
--
ALTER TABLE `s_course_registration`
  ADD CONSTRAINT `s_course_registration_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student_details` (`stu_id`),
  ADD CONSTRAINT `s_course_registration_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `s_course_registration_ibfk_3` FOREIGN KEY (`course_teacher_id`) REFERENCES `teachers` (`t_id`);

--
-- Constraints for table `t_department`
--
ALTER TABLE `t_department`
  ADD CONSTRAINT `t_department_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teachers` (`t_id`);

--
-- Constraints for table `update_s_details_trigger`
--
ALTER TABLE `update_s_details_trigger`
  ADD CONSTRAINT `update_s_details_trigger_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student_details` (`stu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
