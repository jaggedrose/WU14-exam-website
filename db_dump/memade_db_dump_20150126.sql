-- phpMyAdmin SQL Dump
-- version 4.3.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2015 at 09:53 AM
-- Server version: 5.6.22
-- PHP Version: 5.4.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `memade_magazine`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `menu_name` varchar(255) NOT NULL,
  `machine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `mlid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `plid` int(11) DEFAULT NULL,
  `placement` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pid`, `title`, `body`, `img_id`, `user_id`, `video_id`, `created`) VALUES
(1, 'Test Page', '<h2>This is a test page</h2><p>Cupcake ipsum dolor sit amet ice cream sweet roll. I love pie cake. Danish macaroon dragée jelly tootsie roll sugar plum ice cream cookie I love. I love jelly beans sugar plum. Ice cream sugar plum ice cream cupcake. Liquorice bonbon carrot cake biscuit soufflé apple pie. Jelly I love sugar plum I love sugar plum. Bonbon oat cake chupa chups danish liquorice gingerbread. Icing tiramisu bear claw. Sesame snaps I love jelly cookie pudding macaroon chocolate cake croissant. Jelly beans pudding chocolate cake jujubes icing unerdwear.com. Sesame snaps liquorice candy tart gummi bears. Chocolate ice cream applicake jelly beans lemon drops brownie. Lollipop jelly beans caramels I love carrot cake apple pie croissant tootsie roll.</p>', NULL, 1, NULL, '2015-01-23 12:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `aid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `description` text,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `email`, `pass`, `description`, `joined`) VALUES
(1, 'Jennie', 'Rowe', 'jrowe@mail.com', 'Jro', NULL, '2015-01-23 10:24:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`machine_name`);

--
-- Indexes for table `menu_links`
--
ALTER TABLE `menu_links`
  ADD PRIMARY KEY (`mlid`), ADD KEY `menu` (`menu`), ADD KEY `plid` (`plid`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pid`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
  ADD PRIMARY KEY (`aid`), ADD KEY `pid` (`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
  MODIFY `mlid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_links`
--
ALTER TABLE `menu_links`
ADD CONSTRAINT `menu_links_ibfk_1` FOREIGN KEY (`menu`) REFERENCES `menus` (`machine_name`),
ADD CONSTRAINT `menu_links_ibfk_2` FOREIGN KEY (`plid`) REFERENCES `menu_links` (`mlid`);

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`);

--
-- Constraints for table `url_alias`
--
ALTER TABLE `url_alias`
ADD CONSTRAINT `url_alias_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `pages` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
