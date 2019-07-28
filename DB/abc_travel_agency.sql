-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2019 at 07:45 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_travel_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationId` int(11) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `Active` bit(1) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationId`, `Name`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES
(4, 'BARGUNA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(6, 'BARISAL', b'1', '2018-08-03 08:57:49', '2018-08-03 09:00:17'),
(9, 'BHOLA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(79, 'PIROJPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(78, 'PATUAKHALI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(42, 'JHALOKATI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(84, 'RANGAMATI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(30, 'FENI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(51, 'LAKSHMIPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(15, 'CHITTAGONG', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(3, 'BANDARBAN', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(13, 'CHANDPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(12, 'BRAHMANBARIA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(22, 'COXS BAZAR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(46, 'KHAGRACHHARI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(19, 'COMILLA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(75, 'NOAKHALI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(29, 'FARIDPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(72, 'NETRAKONA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(82, 'RAJBARI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(48, 'KISHOREGONJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(39, 'JAMALPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(54, 'MADARIPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(93, 'TANGAIL', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(56, 'MANIKGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(89, 'SHERPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(35, 'GOPALGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(33, 'GAZIPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(59, 'MUNSHIGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(61, 'MYMENSINGH', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(86, 'SHARIATPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(67, 'NARAYANGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(68, 'NARSINGDI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(26, 'DHAKA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(57, 'MEHERPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(44, 'JHENAIDAH', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(87, 'SATKHIRA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(47, 'KHULNA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(50, 'KUSHTIA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(55, 'MAGURA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(41, 'JESSORE', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(65, 'NARAIL', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(18, 'CHUADANGA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(1, 'BAGERHAT', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(64, 'NAOGAON', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(76, 'PABNA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(38, 'JOYPURHAT', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(81, 'RAJSHAHI', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(88, 'SIRAJGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(70, 'CHAPAI NABABGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(10, 'BOGRA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(69, 'NATORE', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(77, 'PANCHAGARH', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(85, 'RANGPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(73, 'NILPHAMARI ZILA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(27, 'DINAJPUR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(32, 'GAIBANDHA', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(52, 'LALMONIRHAT', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(49, 'KURIGRAM', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(94, 'THAKURGAON', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(58, 'MAULVIBAZAR', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(91, 'SYLHET', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(90, 'SUNAMGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49'),
(36, 'HABIGANJ', b'1', '2018-08-03 08:57:49', '2018-08-03 08:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `StatusId` int(11) NOT NULL,
  `Status` varchar(2000) NOT NULL,
  `LocationId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Access` bit(1) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`StatusId`, `Status`, `LocationId`, `UserId`, `Access`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES
(6, 'The service you have provided goes above and beyond anything we have experienced with other travel agencies and as the one responsible for arranging travel needs for the President and other corporate officers, I have especially appreciated this', 88, 1013, b'1', b'0', '2019-07-28 14:45:04', '2019-07-28 17:25:55'),
(7, 'We want to express our appreciation for the excellent service that extra special effort that you provide and as our business was built on service we know how important this quality is and we value what CrissCross Tours & Travel has to offer.', 88, 1013, b'0', b'0', '2019-07-28 14:45:26', '2019-07-28 14:45:26'),
(8, '\r\nKirpi B\r\nManiago, Italy\r\n522\r\nReviewed October 9, 2012\r\nHighly recommended! Superb experience\r\nI was extremely satisfied with Derleng Tours. Mr. Dara, the owner, has proven to be very courteous and helpful from the very beginning, trying to organize at the best our trip to Cambodia in the eight days available. The guides and drivers are very professional and friendly, the accomodations simply superb. I highly recommend it, Mr Dara will turn your trip into an unforgettable experience!', 88, 1013, b'1', b'0', '2019-07-28 14:46:12', '2019-07-28 14:46:12'),
(9, 'Today was our last day with our tour guide and driver from Derleng having started at Phnom Penh then Kampot, Battambang and finally Siem Reap. Our driver Mr Thuna and guide Chem Pissa were much much more than tour guides. Having spent so much time in their company we feel we have left behind new friends. Was sad to say goodbye to these two lovely people.', 51, 1012, b'0', b'0', '2019-07-28 15:26:02', '2019-07-28 15:26:02'),
(10, 'I was extremely satisfied with Derleng Tours. Mr. Dara, the owner, has proven to be very courteous and helpful from the very beginning, trying to organize at the best our trip to Cambodia in the eight days available. The guides and drivers are very professional and friendly, the accomodations simply superb. I highly recommend it, Mr Dara will turn your trip into an unforgettable experience!', 51, 1012, b'0', b'0', '2019-07-28 15:27:11', '2019-07-28 15:27:11'),
(11, 'Since the mountain community visit included a lecture & activities specific to weaving, I would have enjoyed a visit to an local art museum instead of visiting the Chincheros artisan market.  My daughter and niece would have welcomed at least a half-day of leisure time at the resort hotel in Paracas, in order to have ample time to swim in the pool and/or use the beach.  If they could ride the dune buggy again, they would wear their prescription eyeglasses instead of their contacts.  Even though they both wore sunglasses, it was not enough to prevent the fine sand from getting under their lenses.   ', 75, 1012, b'1', b'0', '2019-07-28 15:28:47', '2019-07-28 15:28:47'),
(12, 'Since the mountain community visit included a lecture & activities specific to weaving, I would have enjoyed a visit to an local art museum instead of visiting the Chincheros artisan market.  My daughter and niece would have welcomed at least a half-day of leisure time at the resort hotel in Paracas, in order to have ample time to swim in the pool and/or use the beach.  If they could ride the dune buggy again, they would wear their prescription eyeglasses instead of their contacts.  Even though they both wore sunglasses, it was not enough to prevent the fine sand from getting under their lenses.   ', 75, 1012, b'1', b'0', '2019-07-28 15:36:15', '2019-07-28 15:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `LastName` varchar(250) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Enabled` bit(1) NOT NULL,
  `UserKey` varchar(36) NOT NULL,
  `EnabledReset` bit(1) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Username`, `Password`, `Email`, `Phone`, `Enabled`, `UserKey`, `EnabledReset`, `CreatedDate`, `UpdatedDate`) VALUES
(1013, 'Mohammad Helal', 'Khan', 'helal.khan', '878d19121cd1749e3ead120824568d9aeace1400ff8396771ad8edf3ed5de3b82fe20e208be6bd6d', 'm.helal.k@gmail.com', '01838923219', b'1', 'b789f0f1-fd6e-45ef-a506-a66f619dff7b', b'0', '2019-07-28 12:24:01', '2019-07-28 12:24:01'),
(1012, 'Md. Omor', 'Faruk', 'omor.faruk', 'cbdc95a4623314a5c4655619a365861ec6a6221b8f89a20f2187bbbb7dd4e2609166f30b78983756', 'omorfaruk2010@gmail.com', '01724876543', b'1', '8f7dab14-c835-4a6c-b478-4be3d982779d', b'0', '2019-07-28 12:21:30', '2019-07-28 12:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `UserRoleId` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`UserRoleId`, `Username`, `Role`, `CreatedDate`, `UpdatedDate`) VALUES
(11, 'helal.khan', 'ROLE_USER', '2019-07-28 12:24:01', '2019-07-28 12:24:01'),
(10, 'omor.faruk', 'ROLE_USER', '2019-07-28 12:21:30', '2019-07-28 12:21:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationId`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`StatusId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`UserRoleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `StatusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `UserRoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
