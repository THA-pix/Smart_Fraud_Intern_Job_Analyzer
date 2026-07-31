--
-- Database: `fraud_job`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL auto_increment,
  `job_title` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `prediction` varchar(50) default NULL,
  `user_feedback` varchar(50) default NULL,
  `comments` text,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `job_title`, `company`, `prediction`, `user_feedback`, `comments`, `created_at`) VALUES
(1, 'Unknown Job', 'Unknown Company', 'Fake', 'Correct', 'wdkoefhirhwijwgvkb lgweaefwv', '2026-03-24 20:36:59'),
(2, 'Unknown Job', 'Unknown Company', 'Legitimate', 'Correct', '3rt435byterfer', '2026-03-24 20:41:59'),
(3, 'cfojetgi', 'Tital', 'Legitimate', 'Wrong', 'retg3w5ywetrw3', '2026-03-24 20:48:52'),
(4, 'Developer', 'ZOHO', 'Legitimate', 'Correct', 'awdqefawsryjdshaeSQSWD', '2026-03-24 20:54:26'),
(5, 'Data Engineer', 'ABCD', 'Fake', 'Correct', 'udtykdkytdkydkydydfc', '2026-03-24 22:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

CREATE TABLE `predictions` (
  `id` int(11) NOT NULL auto_increment,
  `job_title` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `prediction` varchar(50) default NULL,
  `created_at` date default NULL,
  `username` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `predictions`
--

INSERT INTO `predictions` (`id`, `job_title`, `company`, `prediction`, `created_at`, `username`) VALUES
(1, 'Unknown Job', 'Unknown Company', 'Fake', '2026-03-24', NULL),
(2, 'Unknown Job', 'Unknown Company', 'Legitimate', '2026-03-24', NULL),
(3, 'job', 'tcs', 'Legitimate', '2026-03-24', NULL),
(4, 'job', 'tcs', 'Legitimate', '2026-03-24', NULL),
(5, 'cfojetgi', 'Tital', 'Legitimate', '2026-03-24', NULL),
(6, 'Developer', 'ZOHO', 'Legitimate', '2026-03-24', NULL),
(7, 'job', 'INFOSYS', 'Fake', '2026-03-24', NULL),
(8, 'job', 'INFOSYS', 'Fake', '2026-03-24', NULL),
(9, 'job', 'INFOSYS', 'Fake', '2026-03-24', NULL),
(10, 'job', 'INFOSYS', 'Fake', '2026-03-24', NULL),
(11, 'AI Developer', 'INFOSYS', 'Legitimate', '2026-03-24', NULL),
(12, 'Data Engineer', 'ABCD', 'Fake', '2026-03-24', NULL),
(13, 'Developer', 'ZOHO', 'Legitimate', '2026-03-24', NULL),
(14, 'Developer', 'ABCD', 'Legitimate', '2026-03-24', NULL),
(15, 'Developer', 'INFOSYS', 'Fake', '2026-03-29', 'Raj'),
(16, 'AI Developer', 'Mind IT', 'Fake', '2026-03-29', 'Raj'),
(17, 'AI Developer', 'INFOSYS', 'Fake', '2026-03-29', 'Raj'),
(18, 'AI Developer', 'Mind IT', 'Fake', '2026-03-29', 'Raj'),
(19, 'AI Developer', 'INFOSYS', 'Legitimate', '2026-03-29', 'Raj'),
(20, 'AI Developer', 'Mind IT', 'Fake', '2026-03-29', 'Raj'),
(21, 'AI Developer', 'Mind IT', 'Legitimate', '2026-03-29', 'Raj'),
(22, 'AI Developer', 'Mind IT', 'Fake', '2026-03-29', 'Raj'),
(23, 'AI Developer', 'tcs', 'Fake', '2026-03-29', 'Raj');

-- --------------------------------------------------------

--
-- Table structure for table `training_data`
--

CREATE TABLE `training_data` (
  `id` int(11) NOT NULL auto_increment,
  `job_title` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `salary` float default NULL,
  `registration_required` varchar(10) default NULL,
  `registration_fee` float default NULL,
  `label` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `training_data`
--

INSERT INTO `training_data` (`id`, `job_title`, `company`, `salary`, `registration_required`, `registration_fee`, `label`) VALUES
(1, 'Developer', 'ZOHO', 50000, 'No', 500, 'Legitimate'),
(2, 'Data Engineer', 'ABCD', 0, 'No', 0, 'Fake'),
(3, 'Unknown Job', 'Unknown Company', 0, 'No', 0, 'Fake'),
(4, 'job', 'INFOSYS', 0, 'No', 0, 'Fake');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `mobile` varchar(20) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `username`, `password`) VALUES
(1, 'Raj', 'akil@gmail.com', '8929090909', 'raj', '1234'),
(2, 'Vijay', 'vijay@gmail.com', '9876543210', 'vijay', '1234'),
(3, 'sam', 'sam@gmail.com', '9090909090', 'sam', '1234');
