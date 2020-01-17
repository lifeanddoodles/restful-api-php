-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2020 at 05:18 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `knowledgecity`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_users`
--

CREATE TABLE `api_users` (
  `api_user_id` int(11) NOT NULL,
  `api_user_username` varchar(45) NOT NULL,
  `api_user_pass` varchar(255) NOT NULL,
  `api_user_fname` varchar(45) DEFAULT NULL,
  `api_user_lname` varchar(45) DEFAULT NULL,
  `api_user_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_users`
--

INSERT INTO `api_users` (`api_user_id`, `api_user_username`, `api_user_pass`, `api_user_fname`, `api_user_lname`, `api_user_email`) VALUES
(1, 'username1', '123456', '', '', ''),
(2, 'username2', '123456', '', '', ''),
(3, 'username3', '123456', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Business'),
(2, 'Computer'),
(3, 'Safety'),
(4, 'Compliance'),
(5, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `course_desc` varchar(45) DEFAULT NULL,
  `fk_teacher_id` int(11) NOT NULL,
  `fk_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_desc`, `fk_teacher_id`, `fk_category_id`) VALUES
(1, 'Management', 'Lorem ipsum dolor', 1, 1),
(2, 'Leadership', 'Lorem ipsum dolor', 2, 1),
(3, 'Communication Skills', 'Lorem ipsum dolor', 3, 1),
(4, 'Sales', 'Lorem ipsum dolor', 4, 1),
(5, 'Microsoft Office', 'Lorem ipsum dolor', 5, 2),
(6, 'Adobe Creative Cloud', 'Lorem ipsum dolor', 6, 2),
(7, 'Accounting Software', 'Lorem ipsum dolor', 7, 2),
(8, 'Computer Programming', 'Lorem ipsum dolor', 8, 2),
(9, 'Workplace Physical Safety', 'Lorem ipsum dolor', 9, 3),
(10, 'Workplace Area Safety', 'Lorem ipsum dolor', 9, 3),
(11, 'Workplace Equipment Safety', 'Lorem ipsum dolor', 9, 3),
(12, 'General Safety', 'Lorem ipsum dolor', 9, 3),
(13, 'Sexual Harassment Prevention', 'Lorem ipsum dolor', 9, 4),
(14, 'HIPAA Rules and Compliance', 'Lorem ipsum dolor', 9, 4),
(15, 'Hazard Communication', 'Lorem ipsum dolor', 9, 4),
(16, 'Federal Laws and Regulations', 'Lorem ipsum dolor', 9, 4),
(17, 'Treasury Management', 'Lorem ipsum dolor', 9, 5),
(18, 'Regulatory & Compliance', 'Lorem ipsum dolor', 9, 5),
(19, 'Accounting Principles', 'Lorem ipsum dolor', 10, 5),
(20, 'Finance and Investing', 'Lorem ipsum dolor', 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_email` varchar(45) NOT NULL,
  `student_pass` varchar(255) NOT NULL,
  `student_fname` varchar(45) NOT NULL,
  `student_lname` varchar(45) NOT NULL,
  `student_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_email`, `student_pass`, `student_fname`, `student_lname`, `student_active`) VALUES
(1, 'sahillen@email.com', '123456', 'Sergey', 'Ahillen', 1),
(2, 'oandrewsen@email.com', '123456', 'Omar', 'Andrewsen', 1),
(3, 'narias@email.com', '123456', 'Noemi', 'Arias', 1),
(4, 'jarreola@email.com', '123456', 'Javier', 'Arreola', 1),
(5, 'bashley@email.com', '123456', 'Bryan', 'Ashley', 0),
(6, 'tbartelt@email.com', '123456', 'Tasha', 'Bartelt', 1),
(7, 'abueche@email.com', '123456', 'Amanda', 'Bueche', 1),
(8, 'jdalby@email.com', '123456', 'Juan', 'Dalby', 1),
(9, 'jfarmer@email.com', '123456', 'Janet', 'Farmer', 1),
(10, 'sfrench@email.com', '123456', 'Samantha', 'French', 1),
(11, 'tgiles@email.com', '123456', 'Timothy', 'Giles', 1),
(12, 'ygodsey@email.com', '123456', 'Yocelyn', 'Godsey', 1),
(13, 'mgonzalez@email.com', '123456', 'Melody', 'Gonzalez', 1),
(14, 'ahill@email.com', '123456', 'Alan', 'Hill', 1),
(15, 'vizvekov@email.com', '123456', 'Victoria', 'Izvekov', 0),
(16, 'rjohnson@email.com', '123456', 'Raynie', 'Johnson', 1),
(17, 'jjuarez@email.com', '123456', 'James', 'Juarez', 1),
(18, 'nluevano@email.com', '123456', 'Nazeer', 'Luevano', 0),
(19, 'bmorris@email.com', '123456', 'Brent', 'Morris', 1),
(20, 'amurillo@email.com', '123456', 'Adrianna', 'Murillo', 1),
(21, 'jnakhlah@email.com', '123456', 'Jasmine', 'Nakhlah', 1),
(22, 'modonnell@email.com', '123456', 'Michael', 'O\'Donnell', 1),
(23, 'bperalta@email.com', '123456', 'Brianna', 'Peralta', 0),
(24, 'trick@email.com', '123456', 'Timothy', 'Rick', 1),
(25, 'arodriguez@email.com', '123456', 'Ashleigh', 'Rodriguez', 1),
(26, 'dsimpson@email.com', '123456', 'Damian', 'Simpson', 1),
(27, 'stchetchet@email.com', '123456', 'Sabrina', 'Tchetchet', 1),
(28, 'rturing@email.com', '123456', 'Rogelio', 'Turing', 0),
(29, 'nvillalobos@email.com', '123456', 'Nicole', 'Villalobos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_fname` varchar(45) NOT NULL,
  `teacher_lname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_fname`, `teacher_lname`) VALUES
(1, 'Vince', 'Carter'),
(2, 'Diana', 'Rangaves'),
(3, 'Thena', 'Franssen'),
(4, 'Tami', 'Glasco'),
(5, 'Lori', 'Robinson'),
(6, 'Carolyn', 'O\'Barr'),
(7, 'Valerie', 'Chau'),
(8, 'Kyle', 'Muldrow'),
(9, 'KnowledgeCity', ''),
(10, 'Nikki', 'Paraiso'),
(11, 'Mary', 'Dee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_users`
--
ALTER TABLE `api_users`
  ADD PRIMARY KEY (`api_user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_teacher_id` (`fk_teacher_id`),
  ADD KEY `fk_category_id` (`fk_category_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_users`
--
ALTER TABLE `api_users`
  MODIFY `api_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`fk_category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_teacher_id` FOREIGN KEY (`fk_teacher_id`) REFERENCES `teachers` (`teacher_id`);
