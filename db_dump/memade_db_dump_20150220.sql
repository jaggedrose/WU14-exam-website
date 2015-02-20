-- phpMyAdmin SQL Dump
-- version 4.3.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 20, 2015 at 06:07 PM
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
-- Table structure for table `footer`
--

CREATE TABLE IF NOT EXISTS `footer` (
  `fid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postalcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `footer`
--

INSERT INTO `footer` (`fid`, `title`, `company`, `street`, `postalcode`, `city`, `email`, `created`) VALUES
(1, 'Don''t be shy, get in touch!', 'Me-Made Living', 'Fabric Road 1', '123 45', 'Little Village', 'info@memadeliving.com', '2015-02-20 15:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `iid` int(11) NOT NULL,
  `img_title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`iid`, `img_title`, `path`, `alt`, `caption`, `user_id`, `page_id`, `uploaded`) VALUES
(1, 'Home', 'imgs/home.jpg', 'Collage of sewing.', 'Collage from SewVember.', 1, 1, '2015-02-20 16:25:37'),
(2, 'Sewing', 'imgs/devilprincess.jpg', 'Devil princess costume.', 'Lots of love went into this me-made!', 1, 2, '2015-02-20 16:28:15'),
(3, 'Crochet', 'imgs/crochet.jpg', 'Crochet jumper.', 'Completed crochet jumper.', 1, 3, '2015-02-20 16:29:48'),
(4, 'Knitting', 'imgs/knit.jpg', 'Knitted neckwarmer WIP.', 'Knitted neckwarmer WIP.', 1, 4, '2015-02-20 16:59:38'),
(5, 'About', 'imgs/jenwedding.jpg', 'Me on my wedding day, wearing me-mades.', 'Me on my wedding day.', 1, 5, '2015-02-20 17:01:03'),
(6, 'Sew-along', 'imgs/sewalong.jpg', 'Sewalong badge.', 'Sew-alongs are a great way to learn.', 1, 6, '2015-02-20 17:03:27'),
(7, 'Sewing Projects', 'imgs/sewprojects.jpg', 'Clothing sketches.', 'So many projects, so little time...', 1, 7, '2015-02-20 17:05:59'),
(8, 'Indie Patterns', 'imgs/indiepatterns.jpg', 'Patterns from indie designers.', 'Patterns from indie designers.', 1, 8, '2015-02-20 17:07:30'),
(9, 'Crochet-along', 'imgs/ripple.jpg', 'Crocheted blanket.', 'Have you joined the Ripple-along?', 1, 9, '2015-02-20 17:08:33'),
(10, 'Crochet Projects', 'imgs/crochetprojects.jpg', 'Crocheted granny squares.', 'Crocheted granny squares.', 1, 10, '2015-02-20 17:45:10'),
(11, 'Knit-along', 'imgs/kal.jpg', 'Knit-along badge.', 'The autumn KAL is starting in October.', 1, 11, '2015-02-20 17:46:13'),
(12, 'Knitting Projects', 'imgs/knittingprojects.jpg', 'WIP knitted cardigan.', 'WIP knitted cardigan.', 1, 12, '2015-02-20 17:47:00'),
(13, 'By Hand London', 'imgs/byhandkit.jpg', 'Clothing label.', 'With every By Hand London pattern you get your own label.', 1, 13, '2015-02-20 17:48:20'),
(14, 'Colette Patterns', 'imgs/moneta.jpg', 'Sewing pattern.', 'One of the new patterns from Colette Patterns.', 1, 14, '2015-02-20 17:49:01'),
(15, 'Jennifer Lauren Vintage', 'imgs/dalloway.jpg', 'Sewing tutorial badge.', 'The Dalloway Dress pattern has a tutorial series that you can follow.', 1, 15, '2015-02-20 17:49:58'),
(16, 'Papercut Patterns', 'imgs/papercut.jpg', 'Sewing pattern.', 'Perfect autumn jacket from Papercut Patterns.', 1, 16, '2015-02-20 17:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `menu_name` varchar(255) NOT NULL,
  `machine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_name`, `machine_name`) VALUES
('menu main menu', 'menu-main-menu');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`mlid`, `title`, `path`, `menu`, `plid`, `placement`) VALUES
(1, 'Home', '1', 'menu-main-menu', NULL, 0),
(2, 'Sewing', '2', 'menu-main-menu', NULL, 1),
(3, 'Crochet', '3', 'menu-main-menu', NULL, 2),
(4, 'Knitting', '4', 'menu-main-menu', NULL, 3),
(5, 'About', '5', 'menu-main-menu', NULL, 4),
(6, 'Sew-along', '6', 'menu-main-menu', 2, 1),
(7, 'Sewing Projects', '7', 'menu-main-menu', 2, 2),
(8, 'Indie Pattern Companies', '8', 'menu-main-menu', 2, 3),
(9, 'Crochet-along', '9', 'menu-main-menu', 3, 1),
(10, 'Crochet Projects', '10', 'menu-main-menu', 3, 2),
(11, 'Knit-along', '11', 'menu-main-menu', 4, 1),
(12, 'Knitting Projects', '12', 'menu-main-menu', 4, 2),
(13, 'By Hand London', '13', 'menu-main-menu', 8, 1),
(14, 'Colette Patterns', '14', 'menu-main-menu', 8, 2),
(15, 'Jennifer Lauren Vintage', '15', 'menu-main-menu', 8, 3),
(16, 'Papercut Patterns', '16', 'menu-main-menu', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pid`, `title`, `body`, `user_id`, `created`) VALUES
(1, 'Welcome to Me-Made Living!', '<p>A look into the life of a designer/maker and her me-made wardrobe. I still have alot of RTW items in my wardrobe, but I am trying (quite slowly it seems) to replace the majority of clothing with me-made items. I hope you enjoy following my journey, feel free to join me!</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>', 1, '2015-02-20 15:46:45'),
(2, 'Sewing', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>', 1, '2015-02-20 15:51:37'),
(3, 'Crochet', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>', 1, '2015-02-20 15:55:14'),
(4, 'Knitting', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>', 1, '2015-02-20 15:57:47'),
(5, 'About', '<h4>Why I love sewing and how it all began....</h4>\r\n\r\n<p>I was obsessed with the British tv series, <a href="http://en.wikipedia.org/wiki/The_House_of_Eliott" target="_blank">The House of Eliott</a>. With all those gorgeous dresses, how could I not be interested! I wanted to learn, not only about the fashion of the 1920''s, but also how to make my own clothes. I really got into sewing when I was 13 and moved to Sweden, we had sewing as a class, something I didn''t have at school in England.</p>\r\n<p>I was hooked, I went on to study fashion design and pattern drafting in college, and after that I studied advanced pattern drafting and Stage Costumes/Historical Costumes at The Cutters Academy in Malmo and Gothenburg. When I’m not sewing I crochet (taught myself about 7 years ago) I’m also learning how to knit, I just made my first cardigan! That''s me in the photo on my wedding day, wearing a dress I made myself, with a vintage lace top over that I altered and my handmade birdcage veil.</p>\r\n\r\n<h4>My greatest sewing achievement so far</h4>\r\n\r\n<p>I’m very proud of my historic stage costumes and the first bespoke dress I made and got paid for. But I think I’d have to say my greatest achievement is the 3 piece collection I made in collaboration with an artist’s gallery opening. The artist was a customer and friend and I’ve always been inspired by her work, so I talked two friends into modeling with me on the opening day and started creating. To make a long story short, one friend was pregnant and I only had one fitting early on with a toile, so I’m damn proud of how well everything fit. I love my costume the most, I spent two full days on the skirt, cutting, sewing and hand stitching the fluffy life into it.</p>', 1, '2015-02-20 16:02:21'),
(6, 'Sew-along', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:06:35'),
(7, 'Sewing Projects', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:07:36'),
(8, 'Indie Pattern Companies', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>', 1, '2015-02-20 16:08:09'),
(9, 'Crochet-along', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:09:12'),
(10, 'Crochet Projects', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:09:57'),
(11, 'Knit-along', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:10:56'),
(12, 'Knitting Projects', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a.</p>\n<p>Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo. Ut a nunc ut purus tempor pretium ac et augue. Aliquam aliquam dignissim egestas. In pharetra pretium sem eget imperdiet. Donec elementum quam vulputate tortor imperdiet, ut feugiat nisl accumsan. Nulla facilisi. Nullam ut quam eu leo venenatis vulputate eget quis orci. Curabitur ac lacinia sapien, eget consequat enim. Ut laoreet, eros porttitor vestibulum maximus, orci libero dignissim diam, vel hendrerit dui nisl at lorem. Aenean ultrices porttitor pretium. In hac habitasse platea dictumst. Pellentesque leo massa, efficitur id consectetur eu, imperdiet eu elit. Praesent egestas efficitur sapien id laoreet. Pellentesque iaculis turpis vel mi lacinia, in vestibulum mi auctor.</p>', 1, '2015-02-20 16:12:34'),
(13, 'By Hand London', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a.</p>\n<p>Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus. Pellentesque eu consectetur libero. Maecenas nec sem consectetur, efficitur enim vel, consequat justo.</p>', 1, '2015-02-20 16:13:29'),
(14, 'Colette Patterns', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>', 1, '2015-02-20 16:14:19'),
(15, 'Jennifer Lauren Vintage', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a. Nullam egestas ipsum malesuada magna imperdiet facilisis. In dolor arcu, ullamcorper in sem eu, rutrum laoreet purus. Donec pulvinar vel leo et fermentum. Nam id libero ex. Aenean dignissim faucibus magna vel ultrices. Etiam enim arcu, gravida eget sapien a, vestibulum condimentum lectus.</p>', 1, '2015-02-20 16:14:57'),
(16, 'Papercut Patterns', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam ligula, congue rutrum sem id, vehicula aliquam risus. Pellentesque eget elit urna. Proin ut sapien sit amet magna interdum consectetur. Sed et urna varius, lacinia turpis mattis, convallis ipsum. Aliquam velit enim, euismod sed pulvinar eu, convallis vel dui. Aliquam luctus malesuada leo a convallis. Nullam tincidunt ex quis odio malesuada malesuada. Proin porttitor turpis elit, ut vulputate augue maximus id.</p>\n<p>Etiam felis mi, maximus a venenatis non, lacinia sit amet elit. Suspendisse leo tellus, accumsan vitae ultricies id, faucibus vel ante. Integer in mauris suscipit, lobortis nisi quis, condimentum nisi. Ut maximus dapibus posuere. Integer at arcu nec sapien facilisis consequat. Quisque condimentum orci ligula, id dignissim felis gravida at. Proin ac imperdiet felis. Suspendisse elementum metus leo, at feugiat lacus euismod a.</p>', 1, '2015-02-20 16:15:24');

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
(1, 'Jennie', 'Rowe', 'jennie@memadeliving.com', 'Jro', 'Owner', '2015-02-20 15:40:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`iid`), ADD KEY `user_id` (`user_id`), ADD KEY `page_id` (`page_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
  MODIFY `mlid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`),
ADD CONSTRAINT `images_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `pages` (`pid`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
