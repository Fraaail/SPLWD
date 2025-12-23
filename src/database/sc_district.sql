/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.4.28-MariaDB : Database - sc_district
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sc_district` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `sc_district`;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `june` int(11) NOT NULL,
  `july` int(11) NOT NULL,
  `aug` int(11) NOT NULL,
  `sept` int(11) NOT NULL,
  `oct` int(11) NOT NULL,
  `nov` int(11) NOT NULL,
  `dece` int(11) NOT NULL,
  `jan` int(11) NOT NULL,
  `feb` int(11) NOT NULL,
  `mar` int(11) NOT NULL,
  `apr` int(11) NOT NULL,
  `may` int(11) NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `bir` */

DROP TABLE IF EXISTS `bir`;

CREATE TABLE `bir` (
  `bir` int(11) NOT NULL AUTO_INCREMENT,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `principal` varchar(255) NOT NULL,
  `baseline` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `with_` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `self` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `objective` varchar(255) NOT NULL,
  `bir_intervention` varchar(255) NOT NULL,
  `school_year` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`bir`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `bir_intervention` */

DROP TABLE IF EXISTS `bir_intervention`;

CREATE TABLE `bir_intervention` (
  `bir_intervention_id` int(11) NOT NULL AUTO_INCREMENT,
  `bir_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  `antecedent` varchar(255) NOT NULL,
  `observable` varchar(255) NOT NULL,
  `consequence` varchar(255) NOT NULL,
  `intervention_done` varchar(255) NOT NULL,
  `proactive` varchar(255) NOT NULL,
  `reactive` varchar(255) NOT NULL,
  `antecedent_2` varchar(255) NOT NULL,
  `antecedent_3` varchar(255) NOT NULL,
  `observable_2` varchar(255) NOT NULL,
  `observable_3` varchar(255) NOT NULL,
  `consequence_2` varchar(255) NOT NULL,
  `consequence_3` varchar(255) NOT NULL,
  `intervention_done_2` varchar(255) NOT NULL,
  `intervention_done_3` varchar(255) NOT NULL,
  `proactive_2` varchar(255) NOT NULL,
  `proactive_3` varchar(255) NOT NULL,
  `reactive_2` varchar(255) NOT NULL,
  `reactive_3` varchar(255) NOT NULL,
  PRIMARY KEY (`bir_intervention_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `folder` */

DROP TABLE IF EXISTS `folder`;

CREATE TABLE `folder` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_year` varchar(100) NOT NULL,
  `lrn` int(11) NOT NULL,
  `teacher` int(11) NOT NULL,
  `date_added` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_barriers` */

DROP TABLE IF EXISTS `iep_barriers`;

CREATE TABLE `iep_barriers` (
  `barrier_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `barrier_1` varchar(255) NOT NULL,
  `barrier_2` varchar(255) NOT NULL,
  `barrier_3` varchar(255) NOT NULL,
  `barrier_4` varchar(255) NOT NULL,
  PRIMARY KEY (`barrier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_difficulty` */

DROP TABLE IF EXISTS `iep_difficulty`;

CREATE TABLE `iep_difficulty` (
  `iep_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `d_seeing` varchar(255) NOT NULL,
  `d_hearing` varchar(255) NOT NULL,
  `d_com` varchar(255) NOT NULL,
  `d_moving` varchar(255) NOT NULL,
  `d_concentrating` varchar(255) NOT NULL,
  `d_remembering` varchar(255) NOT NULL,
  `others` varchar(255) NOT NULL,
  `others_2` varchar(255) NOT NULL,
  `medical_diagnos` varchar(255) NOT NULL,
  `date_meeting` varchar(255) NOT NULL,
  `date_last_iep` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `review_date` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `d_other` varchar(255) NOT NULL,
  PRIMARY KEY (`iep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_functional` */

DROP TABLE IF EXISTS `iep_functional`;

CREATE TABLE `iep_functional` (
  `functional_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `functional_1` varchar(255) NOT NULL,
  `functional_2` varchar(255) NOT NULL,
  `functional_3` varchar(255) NOT NULL,
  `functional_4` varchar(255) NOT NULL,
  `functional_5` varchar(255) NOT NULL,
  `functional_1_2` varchar(255) NOT NULL,
  `functional_1_3` varchar(255) NOT NULL,
  `functional_2_2` varchar(255) NOT NULL,
  `functional_2_3` varchar(255) NOT NULL,
  `functional_3_2` varchar(255) NOT NULL,
  `functional_3_3` varchar(255) NOT NULL,
  `functional_4_2` varchar(255) NOT NULL,
  `functional_4_3` varchar(255) NOT NULL,
  `functional_5_2` varchar(255) NOT NULL,
  `functional_5_3` varchar(255) NOT NULL,
  PRIMARY KEY (`functional_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_goals` */

DROP TABLE IF EXISTS `iep_goals`;

CREATE TABLE `iep_goals` (
  `goal_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `interest` varchar(255) NOT NULL,
  `goal` varchar(255) NOT NULL,
  `intervention` varchar(255) NOT NULL,
  `timeline` varchar(255) NOT NULL,
  `individual_responsible` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `progress` varchar(255) NOT NULL,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_special_factor` */

DROP TABLE IF EXISTS `iep_special_factor`;

CREATE TABLE `iep_special_factor` (
  `special_factor_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `factor_1` varchar(255) NOT NULL,
  `factor_2` char(3) NOT NULL,
  `factor_3` varchar(255) NOT NULL,
  `comment_3` varchar(255) NOT NULL,
  `factor_4` varchar(255) NOT NULL,
  `comment_4` varchar(255) NOT NULL,
  `factor_5` varchar(255) NOT NULL,
  `comment_5` varchar(255) NOT NULL,
  `factor_6` varchar(255) NOT NULL,
  `comment_6` varchar(255) NOT NULL,
  `factor_7` varchar(255) NOT NULL,
  `comment_7` varchar(255) NOT NULL,
  `factor_8` varchar(255) NOT NULL,
  `comment_8` varchar(255) NOT NULL,
  `factor_8_type` varchar(255) NOT NULL,
  `factor_9` varchar(255) NOT NULL,
  `comment_9` varchar(255) NOT NULL,
  PRIMARY KEY (`special_factor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_team` */

DROP TABLE IF EXISTS `iep_team`;

CREATE TABLE `iep_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `psych` varchar(255) NOT NULL,
  `nurse` varchar(255) NOT NULL,
  `therapist` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `if_regular` varchar(255) NOT NULL,
  `date` varchar(100) NOT NULL,
  `guidance` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `principal` varchar(255) NOT NULL,
  `if_1` varchar(255) NOT NULL,
  `dis_1` varchar(255) NOT NULL,
  `sp_teacher` varchar(255) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `iep_transition` */

DROP TABLE IF EXISTS `iep_transition`;

CREATE TABLE `iep_transition` (
  `transition_id` int(11) NOT NULL AUTO_INCREMENT,
  `iep_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `interest` varchar(255) NOT NULL,
  `work` varchar(255) NOT NULL,
  `skills` varchar(255) NOT NULL,
  `individual_responsible` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`transition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilmp` */

DROP TABLE IF EXISTS `ilmp`;

CREATE TABLE `ilmp` (
  `ilmpID` int(11) NOT NULL AUTO_INCREMENT,
  `ilmp_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `learning_area` varchar(255) NOT NULL,
  `learner_need` varchar(255) NOT NULL,
  `intervention` varchar(255) NOT NULL,
  `monitoring_date` varchar(111) NOT NULL,
  `insignificant` varchar(255) NOT NULL,
  `significant` varchar(255) NOT NULL,
  `mastery` varchar(255) NOT NULL,
  PRIMARY KEY (`ilmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilmp_group` */

DROP TABLE IF EXISTS `ilmp_group`;

CREATE TABLE `ilmp_group` (
  `ilmp_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `c_1` varchar(11) NOT NULL,
  `c_2` varchar(11) NOT NULL,
  `c_3` varchar(11) NOT NULL,
  `ilmp_date` varchar(255) NOT NULL,
  PRIMARY KEY (`ilmp_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilp` */

DROP TABLE IF EXISTS `ilp`;

CREATE TABLE `ilp` (
  `ilp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `school_year` varchar(100) NOT NULL,
  `principal` varchar(100) NOT NULL,
  `educ_history` varchar(1000) NOT NULL,
  `interview_learner` varchar(1000) NOT NULL,
  `strenght_1` varchar(1000) NOT NULL,
  `need_1` varchar(1000) NOT NULL,
  `strenght_2` varchar(1000) NOT NULL,
  `need_2` varchar(1000) NOT NULL,
  `strenght_3` varchar(1000) NOT NULL,
  `need_3` varchar(1000) NOT NULL,
  `strenght_4` varchar(1000) NOT NULL,
  `need_4` varchar(1000) NOT NULL,
  `strenght_5` varchar(1000) NOT NULL,
  `need_5` varchar(1000) NOT NULL,
  `strenght_6` varchar(1000) NOT NULL,
  `need_6` varchar(1000) NOT NULL,
  `strenght_7` varchar(1000) NOT NULL,
  `need_7` varchar(1000) NOT NULL,
  PRIMARY KEY (`ilp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilp_assessment` */

DROP TABLE IF EXISTS `ilp_assessment`;

CREATE TABLE `ilp_assessment` (
  `assessment_id` int(11) NOT NULL AUTO_INCREMENT,
  `ilp_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `type_assessment` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `chronological_age` int(11) NOT NULL,
  `administrator` varchar(100) NOT NULL,
  `result` varchar(255) NOT NULL,
  `date_interview` varchar(255) NOT NULL,
  `date_interview_student` varchar(255) NOT NULL,
  `adviser` varchar(255) NOT NULL,
  PRIMARY KEY (`assessment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilp_priority` */

DROP TABLE IF EXISTS `ilp_priority`;

CREATE TABLE `ilp_priority` (
  `priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `ilp_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `priority1` varchar(1000) NOT NULL,
  `priority2` varchar(100) NOT NULL,
  `priority3` varchar(100) NOT NULL,
  `priority4` varchar(100) NOT NULL,
  `priority5` varchar(100) NOT NULL,
  `priority6` varchar(100) NOT NULL,
  `priority7` varchar(100) NOT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `ilp_transition` */

DROP TABLE IF EXISTS `ilp_transition`;

CREATE TABLE `ilp_transition` (
  `transition_id` int(11) NOT NULL AUTO_INCREMENT,
  `ilp_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `transition1` varchar(1000) NOT NULL,
  `transition2` varchar(255) NOT NULL,
  `transition3` varchar(100) NOT NULL,
  `transition4` varchar(100) NOT NULL,
  `transition5` varchar(100) NOT NULL,
  PRIMARY KEY (`transition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `action_type` varchar(100) NOT NULL,
  `previous` varchar(100) NOT NULL,
  `updated` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `school` varchar(100) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date_time` varchar(100) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `new_student` */

DROP TABLE IF EXISTS `new_student`;

CREATE TABLE `new_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `m_tounge` varchar(255) NOT NULL,
  `student_code` varchar(100) NOT NULL,
  `birth_date` varchar(100) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `guardian` varchar(255) NOT NULL,
  `work` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `guardian_mtounge` varchar(255) NOT NULL,
  `gurdian_contact` varchar(100) NOT NULL,
  `school` varchar(100) NOT NULL,
  `teacher` varchar(100) NOT NULL,
  `enroll_status` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `parent_observation` */

DROP TABLE IF EXISTS `parent_observation`;

CREATE TABLE `parent_observation` (
  `observation_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`observation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `progress_report` */

DROP TABLE IF EXISTS `progress_report`;

CREATE TABLE `progress_report` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `progress_index` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `q5` varchar(100) NOT NULL,
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `birth_date` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `guardian` varchar(100) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `img` varchar(255) NOT NULL,
  `category` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `student_files` */

DROP TABLE IF EXISTS `student_files`;

CREATE TABLE `student_files` (
  `student_files` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `school` varchar(100) NOT NULL,
  `doc` varchar(255) NOT NULL,
  PRIMARY KEY (`student_files`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `teacher_history` */

DROP TABLE IF EXISTS `teacher_history`;

CREATE TABLE `teacher_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `lrn` int(11) NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `mname` varchar(1) NOT NULL,
  `birth_date` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `school` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `category` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `teachers_remark` */

DROP TABLE IF EXISTS `teachers_remark`;

CREATE TABLE `teachers_remark` (
  `remark_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `lrn` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `remark_q1` varchar(255) NOT NULL,
  `remark_q2` varchar(255) NOT NULL,
  `remark_q3` varchar(255) NOT NULL,
  `remark_q4` varchar(255) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
