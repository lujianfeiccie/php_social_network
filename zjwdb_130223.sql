-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 11 日 05:41
-- 服务器版本: 5.1.33-community
-- PHP 版本: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zjwdb_130223`
--

-- --------------------------------------------------------

--
-- 表的结构 `isns_admin`
--

CREATE TABLE IF NOT EXISTS `isns_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) NOT NULL,
  `admin_password` char(32) NOT NULL,
  `admin_group` varchar(20) DEFAULT NULL,
  `is_pass` tinyint(2) unsigned DEFAULT '1',
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_admin`
--

INSERT INTO `isns_admin` (`admin_id`, `admin_name`, `admin_password`, `admin_group`, `is_pass`, `active_time`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 1, '2013-09-12 20:13:36');

-- --------------------------------------------------------

--
-- 表的结构 `isns_album`
--

CREATE TABLE IF NOT EXISTS `isns_album` (
  `album_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `album_name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `album_info` varchar(150) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `album_skin` varchar(150) DEFAULT NULL,
  `photo_num` smallint(5) unsigned DEFAULT '0',
  `is_pass` tinyint(2) DEFAULT '1',
  `privacy` varchar(200) DEFAULT NULL,
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_album`
--

INSERT INTO `isns_album` (`album_id`, `album_name`, `user_id`, `user_name`, `album_info`, `add_time`, `update_time`, `album_skin`, `photo_num`, `is_pass`, `privacy`, `comments`, `tag`) VALUES
(1, '临时图片', 1, 'lujianfei', '用于存放临时图片', '2013-10-14 11:49:18', '2013-10-14 11:49:47', 'uploadfiles/album/logo.jpg', 1, 1, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_album_comment`
--

CREATE TABLE IF NOT EXISTS `isns_album_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `album_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask`
--

CREATE TABLE IF NOT EXISTS `isns_ask` (
  `ask_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL COMMENT '提问者id',
  `user_name` varchar(15) NOT NULL COMMENT '提问者名字',
  `title` varchar(200) NOT NULL COMMENT '问题',
  `detail` text COMMENT '详细',
  `replenish` text COMMENT '问题补充',
  `type_id` mediumint(6) NOT NULL COMMENT '问题分类id',
  `type_name` varchar(20) NOT NULL COMMENT '类别名',
  `reward` smallint(8) NOT NULL DEFAULT '0' COMMENT '悬赏积分',
  `reply_num` smallint(8) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `view_num` smallint(8) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '问题状态 0待解决 1已解决',
  `add_time` datetime NOT NULL COMMENT '提问时间',
  `reply_time` datetime DEFAULT NULL COMMENT '最后回答时间',
  `solved_time` datetime DEFAULT NULL COMMENT '解决时间',
  PRIMARY KEY (`ask_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask_reply`
--

CREATE TABLE IF NOT EXISTS `isns_ask_reply` (
  `reply_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `ask_id` int(8) NOT NULL COMMENT '问题id',
  `user_id` mediumint(8) NOT NULL COMMENT '回答者id',
  `user_name` varchar(15) NOT NULL COMMENT '回答者名字',
  `user_ico` varchar(150) NOT NULL COMMENT '回答者头像',
  `content` text NOT NULL COMMENT '回答内容',
  `add_time` datetime NOT NULL COMMENT '回答时间',
  `edit_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_answer` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否满意答案 0否 1是',
  PRIMARY KEY (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回答表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask_type`
--

CREATE TABLE IF NOT EXISTS `isns_ask_type` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `order_num` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `isns_ask_type`
--

INSERT INTO `isns_ask_type` (`id`, `name`, `order_num`) VALUES
(1, '创业起步', 1),
(2, '市场营销', 2),
(3, '企业管理', 3),
(4, '财务/资本', 4),
(5, '法律咨询', 5),
(6, '人力资源', 6),
(7, '工作/生活', 7),
(9, '其他', 8);

-- --------------------------------------------------------

--
-- 表的结构 `isns_backgroup`
--

CREATE TABLE IF NOT EXISTS `isns_backgroup` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog`
--

CREATE TABLE IF NOT EXISTS `isns_blog` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `log_title` varchar(80) DEFAULT NULL,
  `log_sort` mediumint(8) NOT NULL DEFAULT '0',
  `is_pass` tinyint(2) NOT NULL DEFAULT '1',
  `log_sort_name` varchar(30) DEFAULT NULL,
  `log_content` text,
  `add_time` datetime DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `privacy` varchar(200) DEFAULT NULL,
  `hits` mediumint(8) DEFAULT '0',
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `log_sort` (`log_sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_blog`
--

INSERT INTO `isns_blog` (`log_id`, `user_id`, `user_name`, `user_ico`, `log_title`, `log_sort`, `is_pass`, `log_sort_name`, `log_content`, `add_time`, `edit_time`, `privacy`, `hits`, `comments`, `tag`) VALUES
(1, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '停机后再想打电话怎么办？', 0, 1, '', '<p><strong>漏洞 让我们手机永远不用交费<br />\r\n</strong>停机后再想打电话怎么办？<br />\r\n中国移动近来赚得话费达数千亿！我们只知道每月甚至每个星期傻傻的充一次话费，少则几十，多则几百！<br />\r\n&nbsp;&nbsp; 现在教你如何用欠费手机拨打电话。首先要用移动卡、欠费的，拨打10086接通之后不需要听语音提示，连续按7次#号健，再按*#10086+你手机号码#，你会听到确认和取消，按确认键之后挂掉电话。之后再拨打任何一个号码，竟然通了！这就说明搞定了！<br />\r\n&nbsp;&nbsp; 十天之后又会欠费，只要重复操作又可以拨打任何一个号码！转到自己空间让更多的人知道吧！不要在让10086赚我们的钱了！！</p>\r\n<p><br />\r\n&nbsp;让我们手机永远不用交费" 如何停机后继续打电话 、当不喜欢别人打搅自己的时候，又不想关机，给大家一个办法，使自己的号码变成空号。<br />\r\n输入 **21*999999# ，按打电话时候的拨出键 。当别人拨打你的电话时候就你的号码就变成空号了。再输入 ##21#，在按拨出键又正常了。<br />\r\nPS：这个功能移动公司是不收费的，应该是手机号码的一个漏洞。可以当场实验，如果觉得好用就转给你好友，以后不想接听那个令你伤心的她/或他的电话的时候，就用得到了。<br />\r\n2、 识别手机质量的好坏<br />\r\n先按*#06#，然后在你的手机上会出现一个序列号给你，你就数到第七个和第八个数。假如你的第七个和第八个数是下面对应的两个数，那么你的手机质量的好坏就确定了。<br />\r\n0、2 或 2、0，是很差的手机<br />\r\n0、8 或 8、0，是好一点儿的手机<br />\r\n0、1 或 1、0，是非常好的手机<br />\r\n0、0 代表是原产公司生产的，是质量最好的手机（原装手机）<br />\r\n1、3 代表是阿赛拜疆生产的，是非常非常差的手机<br />\r\n3、隐形的备用电池 <br />\r\n　　你的手机电量不足了，为了让它能够继续使用，按*3370#键，手机会重新启动，启动完毕后，你就会发现电量增加了50%。这部分隐藏的备用电量用完了你就必须得充电了，再次充电的时候，隐形的备用电池也同时充电，下次电量低的时候又可以用这个方法。知道这个在紧急情况下如果手机电量不足非常管用。<br />\r\n4、车用遥控器落在车里了？ <br />\r\n　　你的车用遥控能打开吧？如果可以，在你有一天将车用遥控器落在车里而且备用的遥控又在家里的话，你会发现有个手机真方便，用手机拨通家里人的手机，将你的手机拿在离车门一英尺的地方，同时家里人拿着遥控器在他的手机旁边按响遥控器上的开锁键，这边你的车门就可以打开了。这个方法不管你把车开得离家有多远都奏效。<br />\r\n5、紧急情况<br />\r\n全世界的手机都可以拨打的共同紧急救援号码是112，假如你发现自己所在的地区无手机信号覆盖，同时你又遇到了紧急状况，用你的手机拨打112准没错，因为这时候你的手机会自动搜索所有可用的网络并建立起紧急呼叫。特别有趣的是，即使你的手机是在键盘锁定的状态，你同样可以拨打112。试试吧！<br />\r\n6、手机被偷了？ <br />\r\n　　有个办法让小偷也用不了，嘿嘿！查看手机的序列号，只需键入* # 0 6 #， 15位序列号会出现在手机屏幕上，全世界的每一台手机都有一个独一无二的序列号，把这个序列号记录下来并保存好。有一天如果你的手机不幸被偷了，打电话给手机提供商，并提供你的手机序列号，他们会帮你把手机屏蔽，这样即使小偷换了SIM卡，仍然无法使用，你的手机对小偷来说变得一无是处。如果全世界每个手机持有者都这么做，那么偷手机就没有意义了。在澳洲，警方甚至建立了一个被盗手机数据库，如果你的手机被找到了，就可以归还给你了。<br />\r\n日常维护必用： </p>\r\n<p>　1、手机电池不要等到没电才充电。 <br />\r\n　　一般我们都会有一种想法就是手机的电池电力要全部放完再充电比较好基本上是没错的，因为我们在以前使用的充电电池大部分是镍氢(NiH)电池，而镍氢电池有所谓的记忆效应若不放完电再充的话会导致电池寿命急速减少。因此我们才会用到最后一滴电才开始充电。但现在的手机及一般IA产品大部分都用锂(Li)电池，而锂电池的话就没有记忆效应的问题。若大家还是等到全部用完电后再充的话反而会使得锂电池内部的化学物质无法反应而寿命减少。最好的方法就是没事就充电让它随时随地保持最佳满格状态，这样你的电池就可用的又长又久喔。这是从厂商那得到的讯息，并经过本身测试而得。<br />\r\n2、当手机正在充电时，请勿接电话！！ <br />\r\n　　原因是手机在充电时，来电接听的话会有潜在的危险。印度有一个31岁在保险公司任职业务经理的年轻人，十几天前在手机还接着充电器的时候接听电话，过了几秒大量的电流经过手机，这个年轻人被摔落到地面，家人发现时，手指烧伤，心跳微弱，并且已经失去意识。经紧急送到医院后，医生宣布到院死亡。行动电话是目前大家最常使用的现代发明。然而，我们也必须要警觉到仪器致死的危险。<br />\r\n3、手机剩一格时不要使用 <br />\r\n　　收讯满格与只剩一格时相比,发射强度竟然相差1000倍以上.所以……常讲手机的人……要注意哦……^0^、昨天从一位手机商那儿获得一项很重要的讯息,那就是当你发现手机的收讯强度只剩下一格的时候,宁可挂断不谈或者是改用公用电话.千万不要再滔滔不绝、口沫横飞、浓情蜜意、欲罢不能、没完没了…为什幺呢?大家都知道手机的电磁波一直是让人担心的问题.而手机的设计为了在收讯较差的地区仍能保有相当的通话质量,会加强手机的电磁波发射强度.当收讯满格与只剩一格时相比,发射强度竟然相差1000倍以上.电磁波强度高达0.6W(瓦特).0.6W究竟有多强呢?我无法具体描述它对你的脑袋会有什幺不良影响,但可以换成两个例子来比较：<br />\r\n1）把喇叭直径约4公分左右的小型收音机音量开到最大然后贴在耳朵上,那样的噪音能量一般为0.25W,不到0.5W。 <br />\r\n2）把手指头放在输出强度0.1W的雷射光前面(相当于光纤网络的?D干线能量)几秒钟内你会有灼痛的感觉,你能长时间忍受上述这两种状况吗?<br />\r\n3)那你又如何确认0.6W的电磁波紧贴在你的耳朵上会没事呢?<br />\r\n4.12593+电话号码=陷阱 <br />\r\n　　你是不是把外地朋友的电话用17951+电话号码的格式储存在电话号码本里?而不是单独拨?那么收费就会从0.39元每分钟变成1.3元每分钟.我也向1860查询过了他们的解释是如果储存在电话号码本里?系统将无法识别。所以无法获得资费优惠，必须每次在键盘上直接按12xxx。神州行用户如此?动感地带用户,全球通也一样。如果你是一个中国移动用户，当你知道中国移动为你设置以下的陷阱的时候，便不再惊讶于你的话费为何会像长了翅膀一样的飞走。用12593+电话号码可以优惠，但如果你预先将“12593+电话号码“存在手机的电话本，使用的时候调出来然后拔打出去，这时中国移动不承认你使用了12593这种优惠的拔打方式，而按照直接拔打的方式计费。如果你是在漫游，两种计费方式可以相差7倍之多！当我得知如此计费之后，我真的不知如何表达我的愤怒，后来打10086咨询时，如果不是主动冶询问这个问题，工号为6608的小姐根本就不告诉我这样的计费。<br />\r\n5、手机费的寄生虫 <br />\r\n　　手机莫名其妙定置了无用短信,强烈建议大家都看一下自己有没有中招，最简单方法退订每月偷你手机费的寄生虫！中国移动在3.15被迫推出一项新业务，如果您是中国移动的手机用户，键入数字“0000“，发送短信至10086，数秒钟内将自动回复一条短信列表，显示您的手机上究竟订制了哪些短信服务，究竟是哪些短信服务商明着、暗着每月扣除您的手机费；键入数字“00000“，发送短信至186201，即可退订所有短信服务。<br />\r\n6、不要赶着凑正好1分钟 <br />\r\n我们打电话的时候常常会为了正好赶在1:00前结束而庆幸,但其实并不是这样的,据一位中国移动的工作人员说,其实在你通话到0:55的时候就已经算一分钟了,所以0:55~1:00的通话时间其实是算你2分钟的钱~<br />\r\n7、手机一进水，请切记不要作任何按键动作，尤其是关机(一按任何动作，水马上会跟着电路板流串)，正确的方法为马上打开外盖，直接将电池拿下，直接强迫断电，可保主机板不被水侵袭。这个常识非常重要，故转告各位，使大家的手机可用久一点。学一学吧！以后以备不时之需啊！<br />\r\n8、如何让手机电池起死回生 <br />\r\n当你的行动电话电池使用时间变短(记忆效应或老化)时,你是否会再买一颗电池来更换呢? <br />\r\n　　下次当你碰到这种情况时请省下你的钱,告诉你一个很有效的方法不妨试试看：<br />\r\n1）把电池用报纸包起来再放进塑料袋裹包好放入冷冻库三天(报纸可吸收多余水份) <br />\r\n　　2）三天后取出常温下放二天 <br />\r\n　　3）二天后将电池充电,充饱后装进行动电话裹测试(预估可救回80%-90%) <br />\r\n　　本讯息由知名电池厂商工程师透露,根据测试过的朋友指出效果相当有效. <br />\r\n　　至于有没有效果,反正电池快没用了,而且冰箱人人有,各位朋友不妨试试看吧!<br />\r\n9、给你的手机做个CPR吧！ <br />\r\n　　手机是否常断电？或是明明充饱了电没多久就又没电了？ <br />\r\n　　一定怀疑过是不是手机的寿命终了？<br />\r\n　　别担心，它只是一时“心跳停止”，只要一块小小的橡皮擦就能起死回生了！ <br />\r\n　　把电池取出后用橡皮擦把电池上的接点(黄铜片)擦干净，再装回手机上，你会发现真是太神奇了！它竟然活过来了！还像颗新的呢！ <br />\r\n　　真的很有用，提供大家做参考<br />\r\n10、教你如何消除手机屏幕刮痕 <br />\r\n　　大家是否常常会遇到手机屏幕有刮痕而不知如何处理的情况呢？ <br />\r\n　　告诉大家一个好用的秘方....(前几天在电视上看到的) <br />\r\n　　把牙膏适量挤在湿抹布上后用力在手机屏幕刮伤处前后左右来回用力涂匀..... <br />\r\n　　你将发现.....手机的屏幕刮痕会因此而消失....很神奇吧...!! <br />\r\n　　更神奇的事....在用干净的抹布或卫生纸擦干净后..手机屏幕还会变得更亮哦.... <br />\r\n　　台大化学教授表示：原理为牙膏它只是刷牙的辅助用品，具有磨擦作用(修补作用) 和去除菌斑，清洁抛光牙面，因此使用在手机屏幕上面会有同样的效果。<br />\r\n</p>\r\n<p>&nbsp;</p>', '2013-10-14 11:43:52', '2013-10-14 11:44:45', '', 1, 0, ''),
(2, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '为什么医生不献血 请你认真的看完 对你有好处', 0, 1, '', '<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">如果你是学生或者正打算去献血，那么你一定要看完，因为大部分学生太幼稚了。 一位有良心的老医生为你揭开献血惊人内幕：我作为一个有良知的人，不得不为我的朋友们告知这一事实，耐心看完，你会心寒。最近关于无偿献血无损于身体的谬论铺天盖地，作为一个普通的医务工作者，我有义务做一个合理的解释。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、首先什么是血液？血液所含的三种血细胞分别是；红细胞，白细胞，血小板。血液的每一种组成都它特殊的功能。......以下省略，我挑主要的说。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、献血会造成血液功能的弱化甚至丧失。简单的讲，红细胞的减少会使身体各部分器官得不到足够的氧气，细胞的各项生命功能无法正常发挥，献血后产生头晕现象就是因为脑部没有得到足够的氧气。白细胞减少会是身体抵抗病毒的能力下降，容易生病。献血后虚弱就是这个原因，免疫能力的下降就使本来无足轻重的感冒病毒有机可趁。血小板的减少会使伤口难以愈合。白血病产生的最主要原因就是血小板减少。也许你会说，大家都会说献血后身体会产生出足够的血液补充，可是你知道所有的血细胞均在骨髓内有造血干细胞分化而成。造血干细胞是有寿命的。书上说，献血后2周，血液的容量会补充完整（但请注意：补充的什么？是血浆，血液和血浆是2个概念）。献血后会感到口渴，就是要补充血浆，血站会无偿提供糖水或牛奶也就是这个原因。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<img src="http://ftp130223.host125.web522.com/uploadfiles/album/2013/10/14/2013101411494717.jpg" width="420" onload="parent.fixImage(this,420,0)" /><a style="padding-bottom:0px;widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;margin:0px;padding-left:0px;padding-right:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#946652;word-spacing:0px;text-decoration:none;padding-top:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" href="http://ks.cn.yahoo.com/question/1310051301402_3.html#tc_qz_original=138189220" target="_blank"><wbr></a><a style="padding-bottom:0px;widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;margin:0px;padding-left:0px;padding-right:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#946652;word-spacing:0px;text-decoration:none;padding-top:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" href="http://b41.photo.store.qq.com/http_imgload.cgi?/rurl4_b=0192fdd88c03103d7733cb6cbfe711e5600f42f2885259ca8d09558a085f5bb138a959ed1916eae9ccc52b8017aea9cb8487b04c6d516a8ace58669e4155b29fb625777a98b32b86b1b876bddc3317e09c256428&amp;a=41&amp;b=41&amp;rf=2-9" target="_blank"></a><wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">也许你还会说，你说的我都知道，但为了广大病患得幸福我还是要献的。但这位在医院呆的时间比你年龄还大的阁老还要告诉你一个更令你意想不到的事实：</span><span style="widows:2;text-transform:none;background-color:#ffffff;font-variant:normal;font-style:normal;text-indent:0px;font-family:Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;font-size:medium;font-weight:normal;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">正是因为无偿献血者的热情使病人承担了更高的用血成本。</span><span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">因为血液的暴利，政府就垄断了采血的渠道（其实这句话我不赞同，应该是规范采血渠道，保证采血质量)在没有血站的时候，每200mm血液价格是70元人民币，现在的价格是每200mm大约200元人民币。而且以前还要付给献血者相应经济补偿，现在都是无偿献血，不用付给献血者任何经济补偿。我们医院去血站买血那可都是真金白银，少一分钱也不行，这些成本只有转嫁到患者身上去，其实我们也是没办法。并且由于无偿献血者人数众多，原来靠卖血接济贫穷生活的农民和下岗职工现在又断了一条财路，造孽啊！有人说了：不是无偿献血者可以免费用血的吗？对，先到医院把用血的钱交了，然后到院办公室开证明，然后找到医生签字，拿上你的身份证、病历、手术通知、无偿献血证，然后到卫生局盖个章，再到血站办理退款（还要祈祷经办人都在），并且有的地方还规定，必须使病人亲自来办理！我倒是见了很多病人，最后放弃到血站退血费，自认倒霉了。还有人说：献血至少可以免费检查。我很负责任的告诉你，血站只做最常规的血和 乙肝检查。甚至有一篇报道，我没核实，大家看看。无偿献血 不需要体检？2004.08.24大众网－大众日报 献血前咋不体检了？日前，笔者参加了一次无偿献血，血站的工作人员在没有对无偿献血者进行实质性体检的情况下，就开始了繁忙的抽血工作。面对诸多人的提问，血站工作人员解释：从实施《献血法》以来，就不体检了，全国都如此。最后，血站对无偿来献血的是什么态度呢？这个就不好说了，反正成都倒掉了几十万CC，还有一些血被卖到药厂作原料，基本上有问题就成批倒掉，没曝光的这种事每个城市都有。血站的人基本上都是当兵退伍的或社会闲散人员，医学院毕业的属于凤毛麟角，福利好得出奇，年终奖上万的发，那些采血车都上百万一辆，信不信由你。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 三、你真的见过有医生经常无偿献血的吗？血站普通员工年薪25万，这事听着有点悬乎，不能不使人怀疑其真实性。然而，如果果真如此的话，人们当做何想呢？从网友发贴反映的情况看，血站员工之所以能拿高薪，是因为血站占有无偿血源这块公共资源，是利用垄断的公共资源做着无本的生意。公众免费献血 ，血站向医院收费供血，采血过程中虽然肯定有成本，但没有血站卖给医院的价格高，这就给血站带来了丰厚的收入。据了解，现在广州医院用血的标准血价为：全血每200毫升220元，50或100毫升的小剂量全血每袋加收分装费20元；其它稀有血型全血，每200毫升660元。血站从中能赚多少钱，只有天知道。一些网友发贴揭露期间的猫腻。有位网友说，“自己听小姨（湖南某血站工作人员）说，规定抽200毫升的血，血站私底下会抽取250毫升，扣起50毫升作地下交易。单单这一项，血站每年每人就能分到好万元”。有医学根据以及实际情况表明，不论你体质强弱，献血都是会损伤你的身体，而且几乎是一种无法弥补的损伤，可能立马显现，也可能很多年之后才表现出来。　宣传所说的对身体没有损害，纯粹是西医的一面之词，就算真的无害，又有多少医生会献血呢？答案是很少，因为他们知道献血对身体的损害。其实，只要稍微留意一下，大家都能知道这些道理，但媒体不会公开报道，因为，如果大家都知道了，谁还去献血？各地医院和新闻媒体不道德的地方就在于，明明献血对身体是不利的，而医院为了打消献血人的顾虑，竟然说献血还有利于身体，我觉得这是医生和新闻从业者的耻辱，应该公开澄清事实真像，让群众献血也献的明白，献的确实是心甘情愿的。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<wbr style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;"><span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#ff3399;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">献血对人体的危害大致有六点:</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　1. 献血造成的血管破损是终身无法修复的。由于献血 造成的血管创伤在发生不可知的外力挤压下，有可能造成血管破裂。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　2. 献血会上瘾。经常性的献血，会造成体内造血功能强化，导致时常会有血管膨胀的感觉，唯有经常性的抽血才能够降低这种不适感。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　3. 献血后，体内血量减少，导致脑部供氧不足，此时，体内会产生一种酸性成分，提高血液带氧量，而这种酸性成分，对人体的脑细胞有巨大的不良作用，所以献血后人会觉得头晕。长期献血者会造成反应迟钝，思维敏捷性降低。所以，对于需要脑力工作者来说，最好不要献血 。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　4. 人体总共大约4000-5000cc的血液，其中脏器存有20％左右的库存血液，在人体发生意外伤害的时候，可以迅速进行补充。但是，人的器官是会老化的，在年龄老化和体质虚弱下，发生意外伤害的时候，体内不再像年轻的时候那样快速的造血。此时，你会因为出血量过多而供血不足造成死亡率的增高。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　5. 增加过多的被感染机率，诸如爱滋、乙肝等等高致病性传染性疾病。尽管已有安全防护，可是难免万无一失。感染机率总是存在的。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;display:inline !important;font:14px/22px Tahoma;white-space:normal;orphans:2;float:none;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">　　6. 其他：未经科学证明，但网络上有不少献血者表示，经常性献血对体重有促进作用。换句话说，经常性的献血容易导致发胖。关于此点，网上有不少献血者的评说。有的献血者说自己体重是缓慢增长的，也有的说是体重直线上升的。</span><br style="widows:2;text-transform:none;background-color:#ffffff;text-indent:0px;font:14px/22px Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#444444;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;" />\r\n<span style="widows:2;text-transform:none;background-color:#ffffff;font-variant:normal;font-style:normal;text-indent:0px;font-family:Tahoma;white-space:normal;orphans:2;letter-spacing:normal;color:#ff3399;font-size:large;font-weight:normal;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;">大家看完要转，让你的朋友们也知道！</span><br />\r\n<img src="http://ftp130223.host125.web522.com/uploadfiles/album/2013/10/14/2013101411494717.jpg" width="1" onload="parent.fixImage(this,420,0)" /><br />\r\n<br />\r\n<br />', '2013-10-14 11:45:47', '2013-10-14 11:50:53', '', 2, 0, ''),
(3, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '134种花的花语', 0, 1, '', '<p>1.桔梗花的花语是——真诚不变的爱 <br />\r\n2.白玫瑰的花语是——我足以与你相配 <br />\r\n3.熏衣草的花语是——等待爱情 <br />\r\n4.红色的风信子的花语是——让人感动的爱 <br />\r\n5.时钟花的花语是——爱在你身边 <br />\r\n6.狗尾巴草的花语--暗恋 </p>\r\n<p><br />\r\n7.油桐花的花语是——情窦初开 <br />\r\n8.樱花的花语是—— 生命/等你回来 <br />\r\n9.黑色曼佗罗的花语是——无间的爱和复仇，绝望的爱，不可预知的死亡和爱 <br />\r\n10.向日葵的花语是——沉默的爱<br />\r\n11.蓝色妖姬----相守是一种承诺,人世轮回中,怎样才能拥有一份温柔的情意!<br />\r\n12.双枝蓝色妖姬 花语：相遇是一种宿命，心灵的交汇让我们有诉不尽的浪漫情怀。<br />\r\n13.三枝蓝色妖姬,送花人表达的是另一种情愫——你是我最深的爱恋希望永远铭记我们这段<br />\r\n美丽的爱情故事! <br />\r\n14.红蔷薇的花语是——热恋 <br />\r\n15.粉蔷薇的花语是——爱的誓言 <br />\r\n16.白蔷薇的花语是——纯洁的爱情 <br />\r\n17.黄蔷薇的花语是——永恒的微笑<br />\r\n18.深红色蔷薇的花语是——只想和你在一起 <br />\r\n19.粉红色蔷薇的花语是——我要与你过你辈子 <br />\r\n20.圣诞蔷薇的花语是——追忆的爱情 <br />\r\n21.野蔷薇的花语是——浪漫的爱情 <br />\r\n22.水仙花的花语是——只爱自己 <br />\r\n23.仙人掌的花语是——坚硬坚强<br />\r\n24.三叶草的花语是——一叶代表祈求 二叶代表希望 三叶代表爱情 四叶代表幸福 <br />\r\n25.彼岸花的花语是——悲伤的回忆（日本）/相互思念（韩国）<br />\r\n26.栀子花的花语——永恒的爱/一生的守侯/我们的爱<br />\r\n27.蔷薇的花语——爱的思念 <br />\r\n28.蒲公英的花语——无法停留的爱<br />\r\n29.昙花的花语——刹那的美丽，一瞬间永恒<br />\r\n30.桔梗：真诚不变的爱<br />\r\n31.波斯菊的花语——永远快乐 <br />\r\n32.卡萨布兰卡的花语: [1]伟大的爱 [2]一种充满回忆的花,花语是淡泊的永恒 [3]易变的<br />\r\n[4]不要放弃一个你深爱着的人 [5]死亡,一种盛开的很傲然,厌世的花 [6]一种永恒的美<br />\r\n[7]负担不起的爱<br />\r\n33.鸢尾的花语----绝望的爱<br />\r\n34.蓝色鸢尾的花语----宿命中的游离和破碎的激情，精致的美丽，可是易碎且易逝... <br />\r\n35.迷迭香花语----回忆不想忘记得过去,纪念 <br />\r\n36.龙舌兰的花语----是为爱付出一切 <br />\r\n37.蔷薇的花语----你的一切都很可爱<br />\r\n38.松虫草的花语－－寡妇的悲哀 <br />\r\n39.含羞草的花语－－自卑 <br />\r\n40.夜来香的花语－－在危险边缘寻乐 <br />\r\n41.向日葵的花语－－爱慕 </p>\r\n<p><br />\r\n42.非洲菊的花语是--永远快乐 <br />\r\n43.香槟玫瑰的花语——我只钟情你一个&amp;爱上你是我今生最大的幸福，想你是我最甜蜜的痛<br />\r\n苦,和你在一起是我的骄傲，没有你的我就像一只迷失了航线的船。 <br />\r\n44.山樱花的花语——纯洁/高尚/淡薄/<br />\r\n45.百合的花语——纯洁/神圣 <br />\r\n46.菖蒲－相信者的幸福 <br />\r\n47.木棉花------珍惜眼前的幸福<br />\r\n48.德国菖蒲的花语——婚姻完美<br />\r\n49.雏菊——隐藏爱情 <br />\r\n50.茉莉花——你是我的 <br />\r\n51.密蒙花--请幸福到来<br />\r\n52.紫滕花---对你执着，最幸福的时刻<br />\r\n53.蝴蝶花---相信就是幸福<br />\r\n54.龙胆花的花语－－－喜欢看忧伤时的你 <br />\r\n55.蝴蝶兰--我爱你 <br />\r\n56.旭日藤--爱的锁链 <br />\r\n57.风信子--永远的怀念 <br />\r\n58.星辰花--永不变心 <br />\r\n59.爱丽丝--想你 <br />\r\n60.火百合--热烈的爱 <br />\r\n61.紫玫瑰--珍惜的爱 <br />\r\n62.鳞托菊--永远的爱 <br />\r\n63.麦杆菊--永恒的记忆 <br />\r\n64.杨柳--依依不舍 <br />\r\n65.牵牛花--爱情永固 <br />\r\n66.黄玫瑰--腿色的爱 <br />\r\n67.白日菊--永失我爱 <br />\r\n68.野荀麻花--相爱 <br />\r\n69.茉莉--莫离 <br />\r\n70.丁香－－－回忆 <br />\r\n71.紫云英——没有爱的期待 <br />\r\n72.茉莉--幸福,就是你属于我 <br />\r\n73.蓝色水菊---善变固执无情的你 <br />\r\n74.红色天竺葵---你在我的脑海挥之不去 <br />\r\n75.粉红色天竺葵---很高兴能陪在你身边 <br />\r\n76.红色仙客---你真漂亮 <br />\r\n77.粉红色山茶花---是你的爱让我越变越美丽 <br />\r\n78.白色菊花---真实坦诚 <br />\r\n79.红色素菊,玫瑰---我爱你 <br />\r\n80.白色花束---把我的一切都奉献给你 <br />\r\n81.雪莲花---祈愿愿望达成后的安慰 <br />\r\n82.蓝色玫瑰---无法得到的东西 <br />\r\n83.四叶幸运草---梦想成真 <br />\r\n84.香水百合---纯洁,高贵 <br />\r\n85.白色的铃兰---幸福即将到来 <br />\r\n86.香摈玫瑰---梦幻的感觉 <br />\r\n87.郁金香---热情的爱 <br />\r\n88.风铃草---温柔的爱<br />\r\n89.百慕达奶油花---坚韧.顽强 <br />\r\n90.三叶--幸福 <br />\r\n91.四叶--奇迹 <br />\r\n92.波斯菊——天天快乐<br />\r\n93.圣诞花 ---美满冷漠，会受苦 <br />\r\n94.茶花 ---你值得敬慕 <br />\r\n95.杜鹃花 ----为了我保重你自己，温暖的，脆的，强烈的感情 <br />\r\n96.连翘 ---预料<br />\r\n97.大岩酮 ---一见钟情 高贵大方，有福气<br />\r\n98.金鱼草 ---欺骗，高尚的女士，力量 <br />\r\n99.紫罗兰 ---感情的监禁，机敏，对我而言你永远那么美<br />\r\n100.天竺葵 ---偶然的相遇 <br />\r\n101.薄荷 ---美德 <br />\r\n102.金凤花 ---智慧 <br />\r\n103.曼佗罗 ---不可欲知的死亡和爱 <br />\r\n104.爱丽丝花 ---好消息 想你 <br />\r\n105.三色堇---美丽的.红色花卉，花语是‘思虑’，属性火。 <br />\r\n106.黄色三色堇---有着黄色花瓣的三色堇，花语是‘忧喜参半’，属性土。 <br />\r\n107.紫色三色堇---有着紫色花瓣的三色堇，花语是‘沉默不语’，属性暗。<br />\r\n108.彩叶草 ---绝望的恋情 <br />\r\n109.矢车菊 ---单身的幸福<br />\r\n110.海芋---希望,雄壮之美 <br />\r\n111.仙人掌 ---你是我的天使 / 温暖<br />\r\n112.大波斯菊 ---少女真实的心 <br />\r\n113.迷失香 ---留住回忆 <br />\r\n114.情人草 ---完美爱情 <br />\r\n115.银莲花 ---失去的希望 <br />\r\n116.小苍兰 ---纯洁、幸福、清新舒畅 <br />\r\n117.大理花----华丽、优雅 <br />\r\n118.翠菊---追想可靠的爱情、请相信我 <br />\r\n119.虞美人 ---安慰 <br />\r\n120.蓍草 ---安慰 <br />\r\n121.玉簪花 ---恬静!宽和 <br />\r\n122.时钟花 ---爱在你身边 <br />\r\n123.刺槐 ---友谊<br />\r\n124.忘忧草 ---放下他(她)放下忧愁 <br />\r\n125.石竹---奔放、幻想<br />\r\n126.杨柳---依依不舍 <br />\r\n127.红枫 ---热忱<br />\r\n128.牵牛花---爱情永固 <br />\r\n129.香雪兰---纯洁 <br />\r\n130.红豆 ---相思<br />\r\n131.荼蘼--- 末路的美<br />\r\n132.天堂鸟---自由、幸福、吉祥<br />\r\n133.白玫瑰---我足以与你相配，你是唯一与我相配的人 <br />\r\n134.欧石楠----孤独与背叛 </p>', '2013-10-14 11:52:37', NULL, '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog_comment`
--

CREATE TABLE IF NOT EXISTS `isns_blog_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `log_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `log_id` (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog_sort`
--

CREATE TABLE IF NOT EXISTS `isns_blog_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event`
--

CREATE TABLE IF NOT EXISTS `isns_event` (
  `event_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `location` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(60) NOT NULL DEFAULT '',
  `poster_thumb` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `member_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follow_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `view_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(3) NOT NULL DEFAULT '0',
  `photo_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `limit_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `allow_pic` tinyint(1) NOT NULL DEFAULT '0',
  `allow_post` tinyint(1) NOT NULL DEFAULT '0',
  `allow_invite` tinyint(1) NOT NULL DEFAULT '0',
  `allow_fellow` tinyint(1) NOT NULL DEFAULT '0',
  `is_pass` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`),
  KEY `grade` (`grade`),
  KEY `member_num` (`member_num`),
  KEY `user_id` (`user_id`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_comment`
--

CREATE TABLE IF NOT EXISTS `isns_event_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_invite`
--

CREATE TABLE IF NOT EXISTS `isns_event_invite` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `to_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_user_name` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`,`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_members`
--

CREATE TABLE IF NOT EXISTS `isns_event_members` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `user_sex` tinyint(2) NOT NULL DEFAULT '0',
  `user_ico` varchar(150) NOT NULL DEFAULT '',
  `reside_province` varchar(30) NOT NULL DEFAULT '',
  `reside_city` varchar(30) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fellow` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `user_id` (`user_id`,`dateline`),
  KEY `event_id` (`event_id`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_photo`
--

CREATE TABLE IF NOT EXISTS `isns_event_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `photo_src` varchar(200) DEFAULT NULL,
  `photo_name` varchar(20) NOT NULL,
  `photo_information` varchar(200) DEFAULT NULL,
  `photo_thumb_src` varchar(200) DEFAULT NULL,
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_type`
--

CREATE TABLE IF NOT EXISTS `isns_event_type` (
  `type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(100) NOT NULL DEFAULT '',
  `poster_thumb` varchar(100) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `display_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_event_type`
--

INSERT INTO `isns_event_type` (`type_id`, `type_name`, `poster`, `poster_thumb`, `template`, `display_order`) VALUES
(1, '生活/聚会', '0', '', '<P><BR>费用说明:<BR>集合地点:<BR>着装要求:<BR>联系方式:<BR>注意事项:<BR></P>', 1),
(2, '出行/旅游', '', '', '<P>路线说明:<BR>费用说明:<BR>装备要求:<BR>交通工具:<BR>集合地点:<BR>联系方式:<BR>注意事项:<BR></P>', 2),
(3, '比赛/运动', '0', '', '<P>费用说明：<BR>集合地点：<BR>着装要求：<BR>场地介绍：<BR>联系方式：<BR>注意事项：<BR></P>', 3),
(4, '电影/演出', '', '', '剧情介绍：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项:<BR>', 4),
(5, '教育/讲座', '', '', '主办单位：<BR>活动主题：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项：<BR>', 5),
(6, '其它', '0', '', '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `isns_frontgroup`
--

CREATE TABLE IF NOT EXISTS `isns_frontgroup` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_groups`
--

CREATE TABLE IF NOT EXISTS `isns_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `add_userid` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) NOT NULL DEFAULT '1',
  `member_count` mediumint(8) unsigned DEFAULT '1',
  `group_name` varchar(50) DEFAULT NULL,
  `group_resume` varchar(100) DEFAULT NULL,
  `group_time` datetime DEFAULT NULL,
  `group_manager_name` varchar(60) DEFAULT NULL,
  `group_manager_id` varchar(20) DEFAULT NULL,
  `group_req_id` text,
  `group_creat_name` varchar(20) DEFAULT NULL,
  `group_logo` varchar(150) DEFAULT NULL,
  `group_join_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_type` varchar(20) DEFAULT NULL,
  `group_type_id` smallint(5) unsigned DEFAULT NULL,
  `affiche` varchar(200) DEFAULT NULL,
  `tag` varchar(80) DEFAULT NULL,
  `subjects_num` mediumint(8) unsigned DEFAULT '0',
  `comments` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `add_userid` (`add_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_members`
--

CREATE TABLE IF NOT EXISTS `isns_group_members` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  `role` tinyint(2) DEFAULT '2',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_subject`
--

CREATE TABLE IF NOT EXISTS `isns_group_subject` (
  `subject_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `hits` int(5) unsigned DEFAULT '0',
  `comments` int(5) unsigned DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_subject_comment`
--

CREATE TABLE IF NOT EXISTS `isns_group_subject_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `subject_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_type`
--

CREATE TABLE IF NOT EXISTS `isns_group_type` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_num` mediumint(8) unsigned DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `isns_group_type`
--

INSERT INTO `isns_group_type` (`id`, `order_num`, `name`) VALUES
(1, 1, '时尚生活'),
(2, 2, '影视天地'),
(3, 3, '极品音乐'),
(4, 4, '旅游天下'),
(5, 5, '运动休闲'),
(6, 6, '校园联盟'),
(7, 7, '网络互联'),
(8, 8, '至爱宠物'),
(9, 9, '明星粉丝'),
(10, 10, '文学艺术'),
(11, 11, '同城同乡'),
(12, 12, '两性情感'),
(13, 13, '游戏动漫'),
(14, 14, '投资理财'),
(15, 15, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `isns_guest`
--

CREATE TABLE IF NOT EXISTS `isns_guest` (
  `guest_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `guest_user_id` mediumint(8) unsigned NOT NULL,
  `guest_user_name` varchar(20) DEFAULT NULL,
  `guest_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`guest_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `isns_guest`
--

INSERT INTO `isns_guest` (`guest_id`, `guest_user_id`, `guest_user_name`, `guest_user_ico`, `user_id`, `add_time`) VALUES
(1, 2, 'twelvecai', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-09-15 23:20:00'),
(11, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 2, '2013-10-22 15:32:52');

-- --------------------------------------------------------

--
-- 表的结构 `isns_hi`
--

CREATE TABLE IF NOT EXISTS `isns_hi` (
  `hi_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `hi` tinyint(2) DEFAULT NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`hi_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_hi`
--

INSERT INTO `isns_hi` (`hi_id`, `from_user_id`, `from_user_name`, `from_user_ico`, `hi`, `to_user_id`, `add_time`, `readed`) VALUES
(1, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 2, 2, '2013-09-16 00:11:01', 0),
(2, 2, 'twelvecai', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, 1, '2013-09-24 13:44:16', 0),
(3, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 2, 2, '2013-10-01 11:55:20', 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_integral`
--

CREATE TABLE IF NOT EXISTS `isns_integral` (
  `operation` varchar(20) DEFAULT NULL,
  `integral` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_integral`
--

INSERT INTO `isns_integral` (`operation`, `integral`) VALUES
('blog', 2),
('photo', 1),
('com_sub', 1),
('subject', 2),
('com_msg', 1),
('login', 10),
('invited', 20),
('one_ico', 40),
('del_blog', -2),
('del_photo', -1),
('del_subject', -2),
('del_com_msg', -1),
('del_com_sub', -1),
('convert', 100),
('upgrade', 5),
('poll', 2),
('del_poll', -2),
('share', 2),
('del_share', -2);

-- --------------------------------------------------------

--
-- 表的结构 `isns_invite_code`
--

CREATE TABLE IF NOT EXISTS `isns_invite_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sendor_id` mediumint(8) NOT NULL,
  `code_txt` varchar(20) NOT NULL,
  `is_admin` tinyint(2) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_txt` (`code_txt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_mood`
--

CREATE TABLE IF NOT EXISTS `isns_mood` (
  `mood_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_ico` varchar(150) NOT NULL,
  `mood` text,
  `comments` int(5) unsigned DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mood_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `isns_mood`
--

INSERT INTO `isns_mood` (`mood_id`, `user_id`, `user_name`, `user_ico`, `mood`, `comments`, `add_time`) VALUES
(1, 2, 'twelvecai', 'skin/default/jooyea/images/d_ico_1_small.gif', '[em_2]hello !!', 2, '2013-09-15 23:19:23'),
(2, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '太好啦，终于拥有属于自己的网站啦[em_1]', 2, '2013-09-16 00:13:08'),
(3, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '当别人问我，你为什么不抽烟，我都说对身体不好，后来仔细一想，其实是我不想依赖这东西，因为依赖手机和电脑已经很痛苦了[em_43]', 0, '2013-10-08 09:37:58'),
(4, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '奶奶，挺住啊', 0, '2013-10-14 09:57:25'),
(5, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '此次武汉之旅还算顺利[em_1]', 0, '2013-10-22 15:32:48');

-- --------------------------------------------------------

--
-- 表的结构 `isns_mood_comment`
--

CREATE TABLE IF NOT EXISTS `isns_mood_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mood_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `isns_mood_comment`
--

INSERT INTO `isns_mood_comment` (`comment_id`, `mood_id`, `host_id`, `visitor_id`, `visitor_name`, `content`, `add_time`, `visitor_ico`, `is_hidden`) VALUES
(1, 1, 2, 1, 'lujianfei', 'Oh yeah，这算是一个历史性的时刻了[em_2]', '2013-09-15 23:31:12', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 0),
(2, 1, 2, 1, 'lujianfei', '兄弟加个头像上去吧', '2013-09-17 12:43:11', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 0),
(3, 2, 1, 2, 'twelvecai', '必须弄的更叼的！[em_32]', '2013-09-24 13:48:22', 'uploadfiles/photo_store/2013/09/24/2013092401465793_ico_small.jpg', 0),
(5, 2, 1, 1, 'lujianfei', '回复twelvecai:那是，一定得是屌炸天的', '2013-10-01 21:28:18', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_msgboard`
--

CREATE TABLE IF NOT EXISTS `isns_msgboard` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `message` text,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`mess_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_msg_inbox`
--

CREATE TABLE IF NOT EXISTS `isns_msg_inbox` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mess_title` varchar(70) DEFAULT NULL,
  `mess_content` varchar(500) DEFAULT NULL,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `mesinit_id` mediumint(8) unsigned DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `isns_msg_inbox`
--

INSERT INTO `isns_msg_inbox` (`mess_id`, `mess_title`, `mess_content`, `from_user_id`, `from_user`, `from_user_ico`, `user_id`, `add_time`, `mesinit_id`, `readed`) VALUES
(1, 'twelvecai添加您为好友', 'twelvecai添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 2, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-09-15 23:17:56', 0, 1),
(2, 'lujianfei添加您为好友', 'lujianfei添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 1, '系统发送', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 2, '2013-09-15 23:30:14', 0, 0),
(3, '您的2343445帐号已被锁定', '很抱歉，您的帐号2343445因违反本站协议已被锁定。', 3, '系统发送', 'skin/default/jooyea/images/d_ico_0_small.gif', 3, '2013-09-19 21:30:37', 0, 0),
(4, '您的2343445帐号已被锁定', '很抱歉，您的帐号2343445因违反本站协议已被锁定。', 3, '系统发送', 'skin/default/jooyea/images/d_ico_0_small.gif', 3, '2013-09-19 21:30:41', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_msg_outbox`
--

CREATE TABLE IF NOT EXISTS `isns_msg_outbox` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mess_title` varchar(70) DEFAULT NULL,
  `mess_content` varchar(500) DEFAULT NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `to_user` varchar(20) DEFAULT NULL,
  `to_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `state` tinyint(2) DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_online`
--

CREATE TABLE IF NOT EXISTS `isns_online` (
  `online_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `birth_year` varchar(6) DEFAULT NULL,
  `birth_province` varchar(30) DEFAULT NULL,
  `birth_city` varchar(30) DEFAULT NULL,
  `reside_province` varchar(30) DEFAULT NULL,
  `reside_city` varchar(30) DEFAULT NULL,
  `active_time` int(10) DEFAULT '0',
  `hidden` tinyint(2) DEFAULT '0',
  `session_code` char(32) DEFAULT NULL,
  PRIMARY KEY (`online_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `isns_online`
--

INSERT INTO `isns_online` (`online_id`, `user_id`, `user_name`, `user_sex`, `user_ico`, `birth_year`, `birth_province`, `birth_city`, `reside_province`, `reside_city`, `active_time`, `hidden`, `session_code`) VALUES
(28, 1, 'lujianfei', 1, 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '1989', '广西', '柳州', '广东', '深圳', 1384781231, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_def_sort`
--

CREATE TABLE IF NOT EXISTS `isns_pals_def_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_num` smallint(5) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_pals_def_sort`
--

INSERT INTO `isns_pals_def_sort` (`id`, `order_num`, `name`) VALUES
(1, 1, '亲朋'),
(2, 2, '好友'),
(3, 3, '同学');

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_mine`
--

CREATE TABLE IF NOT EXISTS `isns_pals_mine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `pals_id` mediumint(8) unsigned NOT NULL,
  `pals_sort_id` smallint(5) DEFAULT '0',
  `pals_sort_name` varchar(20) DEFAULT NULL,
  `pals_name` varchar(20) DEFAULT NULL,
  `pals_sex` tinyint(2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `pals_ico` varchar(150) DEFAULT NULL,
  `accepted` tinyint(2) NOT NULL DEFAULT '0',
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pals_id` (`pals_id`),
  KEY `pals_sort_id` (`pals_sort_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `isns_pals_mine`
--

INSERT INTO `isns_pals_mine` (`id`, `user_id`, `pals_id`, `pals_sort_id`, `pals_sort_name`, `pals_name`, `pals_sex`, `add_time`, `pals_ico`, `accepted`, `active_time`) VALUES
(1, 2, 1, 0, NULL, 'lujianfei', 1, '2013-09-15 23:17:56', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 2, '2013-10-22 15:32:48'),
(2, 1, 2, 0, NULL, 'twelvecai', 1, '2013-09-15 23:30:14', 'uploadfiles/photo_store/2013/09/24/2013092401465793_ico_small.jpg', 2, '2013-09-24 13:47:14');

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_request`
--

CREATE TABLE IF NOT EXISTS `isns_pals_request` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `req_id` mediumint(8) unsigned NOT NULL,
  `req_name` varchar(20) DEFAULT NULL,
  `req_sex` tinyint(2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `req_ico` varchar(150) DEFAULT NULL,
  `from_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_sort`
--

CREATE TABLE IF NOT EXISTS `isns_pals_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `count` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `isns_pals_sort`
--

INSERT INTO `isns_pals_sort` (`id`, `name`, `user_id`, `count`) VALUES
(1, '亲朋', 1, 0),
(2, '好友', 1, 0),
(3, '同学', 1, 0),
(4, '亲朋', 2, 0),
(5, '好友', 2, 0),
(6, '同学', 2, 0),
(7, '亲朋', 3, 0),
(8, '好友', 3, 0),
(9, '同学', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_photo`
--

CREATE TABLE IF NOT EXISTS `isns_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `photo_name` varchar(20) DEFAULT NULL,
  `photo_information` text,
  `add_time` datetime DEFAULT NULL,
  `photo_src` varchar(150) DEFAULT NULL,
  `photo_thumb_src` varchar(150) DEFAULT NULL,
  `album_id` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `privacy` varchar(200) DEFAULT NULL,
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_photo`
--

INSERT INTO `isns_photo` (`photo_id`, `user_id`, `user_name`, `photo_name`, `photo_information`, `add_time`, `photo_src`, `photo_thumb_src`, `album_id`, `is_pass`, `privacy`, `comments`, `tag`) VALUES
(1, 1, 'lujianfei', NULL, NULL, '2013-10-14 11:49:47', 'uploadfiles/album/2013/10/14/2013101411494717.jpg', 'uploadfiles/album/2013/10/14/thumb_2013101411494717.jpg', 1, 1, '', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `isns_photo_comment`
--

CREATE TABLE IF NOT EXISTS `isns_photo_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_plugins`
--

CREATE TABLE IF NOT EXISTS `isns_plugins` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `valid` tinyint(2) DEFAULT '0',
  `autoorder` tinyint(2) DEFAULT '0',
  `reg_date` datetime NOT NULL,
  `image` varchar(150) NOT NULL,
  `comment_num` mediumint(8) unsigned DEFAULT '0',
  `use_num` mediumint(8) unsigned DEFAULT '0',
  `info` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_plugin_url`
--

CREATE TABLE IF NOT EXISTS `isns_plugin_url` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `layout_id` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sequence` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_poll`
--

CREATE TABLE IF NOT EXISTS `isns_poll` (
  `p_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `subject` varchar(80) DEFAULT '',
  `voternum` mediumint(8) unsigned DEFAULT '0',
  `comments` int(5) unsigned DEFAULT '0',
  `multiple` tinyint(2) DEFAULT '0',
  `maxchoice` tinyint(3) DEFAULT '0',
  `sex` tinyint(2) DEFAULT '0',
  `noreply` tinyint(2) DEFAULT '0',
  `credit` smallint(5) unsigned DEFAULT '0',
  `percredit` smallint(5) unsigned DEFAULT '0',
  `expiration` date DEFAULT NULL,
  `lastvote` datetime DEFAULT NULL,
  `dateline` datetime DEFAULT NULL,
  `message` text,
  `summary` text,
  `option` text,
  `is_pass` tinyint(2) DEFAULT '1',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_polloption`
--

CREATE TABLE IF NOT EXISTS `isns_polloption` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_polluser`
--

CREATE TABLE IF NOT EXISTS `isns_polluser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) DEFAULT '',
  `pid` mediumint(8) unsigned DEFAULT '0',
  `option` text,
  `dateline` datetime DEFAULT NULL,
  `anony` tinyint(2) NOT NULL DEFAULT '0',
  KEY `pid` (`pid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_poll_comment`
--

CREATE TABLE IF NOT EXISTS `isns_poll_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` mediumint(8) unsigned DEFAULT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `p_id` mediumint(8) unsigned DEFAULT NULL,
  `host_id` mediumint(8) unsigned DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` text,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `p_id` (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_recent_affair`
--

CREATE TABLE IF NOT EXISTS `isns_recent_affair` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(2) DEFAULT '0',
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `for_content_id` mediumint(8) DEFAULT '0',
  `mod_type` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `mod_type` (`mod_type`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `isns_recent_affair`
--

INSERT INTO `isns_recent_affair` (`id`, `type_id`, `title`, `content`, `user_id`, `user_name`, `user_ico`, `date_time`, `update_time`, `for_content_id`, `mod_type`) VALUES
(1, 1, '头像更新为', '<img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/photo_store/2013/09/15/2013091511065810_ico.jpg" align="top">', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-09-15 23:07:16', '2013-09-15 23:07:16', 0, 7),
(2, 1, '心情更新', '[em_2]hello !!', 2, 'twelvecai', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-09-15 23:19:23', '2013-09-15 23:19:23', 1, 6),
(3, 1, '心情更新', '太好啦，终于拥有属于自己的网站啦[em_1]', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-09-16 00:13:08', '2013-09-16 00:13:08', 2, 6),
(4, 4, '分享了链接<a href="http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml" target="_blank">联通称iPhone5s/5c网上预约量已破10万|联通|网上营业厅|电子商务_通讯与电讯_新浪科技_新浪网</a>', '<a href="http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml" target="_blank">http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml</a><div class="clear"></div><div class="left_g left"></div><div class="center_g left">这尼玛也太火爆了吧</div><div class="right_g left"></div><div class="clear"></div>', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-09-16 00:19:15', '2013-09-16 00:19:15', 1, 5),
(5, 1, '头像更新为', '<img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/photo_store/2013/09/24/2013092401465793_ico.jpg" align="top">', 2, 'twelvecai', 'uploadfiles/photo_store/2013/09/24/2013092401465793_ico_small.jpg', '2013-09-24 13:47:14', '2013-09-24 13:47:14', 0, 7),
(6, 1, '心情更新', '当别人问我，你为什么不抽烟，我都说对身体不好，后来仔细一想，其实是我不想依赖这东西，因为依赖手机和电脑已经很痛苦了[em_43]', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-08 09:37:58', '2013-10-08 09:37:58', 3, 6),
(7, 1, '心情更新', '奶奶，挺住啊', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-14 09:57:25', '2013-10-14 09:57:25', 4, 6),
(8, 3, '写了新日志<a href="home.php?h=1&app=blog&id=1" target=_blank>停机后再想打电话怎么办？</a>', ' ', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-14 11:43:52', '2013-10-14 11:43:52', 1, 0),
(9, 3, '写了新日志<a href="home.php?h=1&app=blog&id=2" target=_blank>为什么医生不献血 请你认真的看完 对你有好处</a>', '如果你是学生或者正打算去献血，那么你一定要看完，因为大部分学生太幼稚了。 一位有良心的老医生为你揭开献血惊人内幕：我作为一个有良知的人，不得不为我的朋友们告知这一事实，耐心看完，你会.....', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-14 11:45:47', '2013-10-14 11:45:47', 2, 0),
(10, 2, '在相册<a href="home.php?h=1&app=photo_list&album_id=1" target="_blank">临时图片</a>中上传了新照片', '<a href="home.php?h=1&app=photo&photo_id=1&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/10/14/thumb_2013101411494717.jpg"></a>', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-14 11:49:49', '2013-10-14 11:49:49', 1, 3),
(11, 3, '写了新日志<a href="home.php?h=1&app=blog&id=3" target=_blank>134种花的花语</a>', '1.桔梗花的花语是——真诚不变的爱 \r\n2.白玫瑰的花语是——我足以与你相配 \r\n3.熏衣草的花语是——等待爱情 \r\n4.红色的风信子的花语是——让人感动的爱 \r\n5.时钟花的花语是——爱在你身边 \r\n6.狗.....', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-14 11:52:37', '2013-10-14 11:52:37', 3, 0),
(13, 4, '分享了链接<a href="http://bbs.weiphone.com/read-htm-tid-6920061.html" target="_blank">IOS7是否耗电，最权威的解答</a>', '<a href="http://bbs.weiphone.com/read-htm-tid-6920061.html" target="_blank">http://bbs.weiphone.com/read-htm-tid-6920061.html</a><div class="clear"></div><div class="left_g left"></div><div class="center_g left">看来我的4s是最好不要升iOS7了</div><div class="right_g left"></div><div class="clear"></div>', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-22 15:31:38', '2013-10-22 15:31:38', 3, 5),
(14, 1, '心情更新', '此次武汉之旅还算顺利[em_1]', 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '2013-10-22 15:32:48', '2013-10-22 15:32:48', 5, 6);

-- --------------------------------------------------------

--
-- 表的结构 `isns_recommend`
--

CREATE TABLE IF NOT EXISTS `isns_recommend` (
  `recommend_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `guest_num` mediumint(8) DEFAULT '0',
  `user_sex` tinyint(2) DEFAULT '0',
  `rec_class` tinyint(2) DEFAULT '0',
  `rec_order` tinyint(2) DEFAULT '0',
  `show_ico` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`recommend_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_recommend`
--

INSERT INTO `isns_recommend` (`recommend_id`, `user_id`, `user_name`, `user_ico`, `is_pass`, `guest_num`, `user_sex`, `rec_class`, `rec_order`, `show_ico`) VALUES
(1, 3, '2343445', 'skin/default/jooyea/images/d_ico_0_small.gif', 1, 0, 0, 0, 0, 'skin/default/jooyea/images/d_ico_0_small.gif');

-- --------------------------------------------------------

--
-- 表的结构 `isns_remind`
--

CREATE TABLE IF NOT EXISTS `isns_remind` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `type_id` tinyint(2) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `is_focus` tinyint(2) NOT NULL,
  `from_uid` mediumint(8) unsigned NOT NULL,
  `from_uname` varchar(20) NOT NULL,
  `from_uico` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `count` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`is_focus`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `isns_remind`
--

INSERT INTO `isns_remind` (`id`, `user_id`, `type_id`, `date`, `content`, `is_focus`, `from_uid`, `from_uname`, `from_uico`, `link`, `count`) VALUES
(3, 2, 0, '2013-09-17 12:43:11', '在心情<a href={link} onclick={js} target=_blank>[em_2]hello !!</a>中回复了您', 1, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 'home.php?h=2&app=mood_more&remind=1&mod=1', 2),
(8, 2, 4, '2013-10-01 11:55:20', '{num}个招呼', 0, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 'modules.php?app=user_hi', 1),
(5, 3, 1, '2013-09-19 21:30:41', '{num}个通知', 0, 3, '2343445', 'skin/default/jooyea/images/d_ico_0_small.gif', 'modules.php?app=msg_notice', 2),
(9, 2, 0, '2013-10-01 21:28:18', '在心情<a href={link} onclick={js} target=_blank>太好啦，终于拥有属于自己的网站啦[em_1]</a>中回复了您', 1, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 'home.php?h=1&app=mood_more&remind=1&mod=2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_report`
--

CREATE TABLE IF NOT EXISTS `isns_report` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `reason` varchar(150) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `reported_id` mediumint(8) unsigned DEFAULT NULL,
  `userd_id` mediumint(8) unsigned DEFAULT NULL,
  `rep_num` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_share`
--

CREATE TABLE IF NOT EXISTS `isns_share` (
  `s_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(2) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `content` text,
  `s_title` varchar(300) DEFAULT NULL,
  `out_link` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `for_content_id` mediumint(8) unsigned DEFAULT NULL,
  `comments` int(5) unsigned DEFAULT '0',
  `movie_thumb` varchar(255) DEFAULT NULL,
  `movie_link` varchar(255) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_share`
--

INSERT INTO `isns_share` (`s_id`, `type_id`, `user_id`, `user_name`, `user_ico`, `content`, `s_title`, `out_link`, `add_time`, `for_content_id`, `comments`, `movie_thumb`, `movie_link`, `is_pass`, `tag`) VALUES
(1, 5, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '<a href="http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml" target="_blank">http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml</a><div class="clear"></div><div class="left_g left"></div><div class="center_g left">这尼玛也太火爆了吧</div><div class="right_g left"></div><div class="clear"></div>', '分享了链接<a href="http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml" target="_blank">联通称iPhone5s/5c网上预约量已破10万|联通|网上营业厅|电子商务_通讯与电讯_新浪科技_新浪网</a>', 'http://tech.sina.com.cn/t/2013-09-15/21428741372.shtml', '2013-09-16 00:19:15', 1, 0, '', '', 1, 'iPhone 智能手机'),
(3, 5, 1, 'lujianfei', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', '<a href="http://bbs.weiphone.com/read-htm-tid-6920061.html" target="_blank">http://bbs.weiphone.com/read-htm-tid-6920061.html</a><div class="clear"></div><div class="left_g left"></div><div class="center_g left">看来我的4s是最好不要升iOS7了</div><div class="right_g left"></div><div class="clear"></div>', '分享了链接<a href="http://bbs.weiphone.com/read-htm-tid-6920061.html" target="_blank">IOS7是否耗电，最权威的解答</a>', 'http://bbs.weiphone.com/read-htm-tid-6920061.html', '2013-10-22 15:31:38', 2, 0, '', '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_share_comment`
--

CREATE TABLE IF NOT EXISTS `isns_share_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` mediumint(8) unsigned DEFAULT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `s_id` mediumint(8) unsigned DEFAULT NULL,
  `host_id` mediumint(8) unsigned DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` text,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_tag`
--

CREATE TABLE IF NOT EXISTS `isns_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `count` mediumint(8) DEFAULT '0',
  `hot` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `isns_tag`
--

INSERT INTO `isns_tag` (`id`, `name`, `count`, `hot`) VALUES
(1, 'iPhone', 1, 0),
(2, '智能手机', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_tag_relation`
--

CREATE TABLE IF NOT EXISTS `isns_tag_relation` (
  `id` mediumint(8) unsigned NOT NULL,
  `mod_id` mediumint(8) NOT NULL,
  `content_id` mediumint(8) NOT NULL,
  KEY `id` (`id`),
  KEY `mod_id` (`mod_id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_tag_relation`
--

INSERT INTO `isns_tag_relation` (`id`, `mod_id`, `content_id`) VALUES
(1, 3, 1),
(2, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_tmp_file`
--

CREATE TABLE IF NOT EXISTS `isns_tmp_file` (
  `mod_id` mediumint(8) unsigned NOT NULL,
  `mod_count` mediumint(8) unsigned DEFAULT '0',
  `affair_array` text,
  `data_array` text,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_uploadfile`
--

CREATE TABLE IF NOT EXISTS `isns_uploadfile` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `file_src` varchar(150) DEFAULT NULL,
  `file_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `isns_uploadfile`
--

INSERT INTO `isns_uploadfile` (`id`, `user_id`, `add_time`, `file_src`, `file_name`) VALUES
(1, 1, '2013-09-15 23:06:58', 'uploadfiles/photo_store/2013/09/15/2013091511065810.jpg', 'me_handsome.jpg'),
(2, 2, '2013-09-24 13:46:57', 'uploadfiles/photo_store/2013/09/24/2013092401465793.jpg', 'IMG_2088.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `isns_users`
--

CREATE TABLE IF NOT EXISTS `isns_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pws` char(32) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `birth_province` varchar(30) DEFAULT NULL,
  `birth_city` varchar(30) DEFAULT NULL,
  `reside_province` varchar(30) DEFAULT NULL,
  `reside_city` varchar(30) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `user_add_time` datetime DEFAULT NULL,
  `birth_year` char(6) DEFAULT NULL,
  `birth_month` char(4) DEFAULT NULL,
  `birth_day` char(4) DEFAULT NULL,
  `creat_group` varchar(150) DEFAULT NULL,
  `join_group` varchar(150) DEFAULT NULL,
  `guest_num` mediumint(8) unsigned DEFAULT '0',
  `integral` mediumint(8) DEFAULT '10',
  `access_limit` tinyint(2) DEFAULT '0',
  `access_questions` varchar(100) DEFAULT NULL,
  `access_answers` varchar(100) DEFAULT NULL,
  `inputmess_limit` tinyint(2) DEFAULT '0',
  `palsreq_limit` tinyint(2) DEFAULT '0',
  `lastlogin_datetime` datetime DEFAULT NULL,
  `invite_from_uid` mediumint(8) unsigned DEFAULT NULL,
  `hidden_pals_id` text,
  `hidden_type_id` text,
  `login_ip` char(15) DEFAULT NULL,
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0',
  `dressup` varchar(20) DEFAULT '0',
  `use_plugins` varchar(1000) DEFAULT NULL,
  `use_apps` varchar(1000) DEFAULT NULL,
  `user_group` varchar(30) DEFAULT 'base',
  `forget_pass` varchar(50) DEFAULT NULL,
  `activation_id` int(8) DEFAULT '-1' COMMENT '激活码id值',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_users`
--

INSERT INTO `isns_users` (`user_id`, `user_email`, `user_name`, `user_pws`, `user_sex`, `birth_province`, `birth_city`, `reside_province`, `reside_city`, `user_ico`, `is_pass`, `user_add_time`, `birth_year`, `birth_month`, `birth_day`, `creat_group`, `join_group`, `guest_num`, `integral`, `access_limit`, `access_questions`, `access_answers`, `inputmess_limit`, `palsreq_limit`, `lastlogin_datetime`, `invite_from_uid`, `hidden_pals_id`, `hidden_type_id`, `login_ip`, `is_recommend`, `dressup`, `use_plugins`, `use_apps`, `user_group`, `forget_pass`, `activation_id`) VALUES
(1, '475573105@qq.com', 'lujianfei', '59d77388b93fe12eb0ef423fbe297044', 1, '广西', '柳州', '广东', '深圳', 'uploadfiles/photo_store/2013/09/15/2013091511065810_ico_small.jpg', 1, '2013-09-15 22:57:07', '1989', '5', '22', NULL, NULL, 1, 204, 0, NULL, NULL, 0, 0, '2013-11-18 21:27:09', 0, NULL, NULL, '183.12.154.227', 0, '0', NULL, NULL, 'base', NULL, -1),
(2, 'twelve.cai@gmail.com', 'twelvecai', '82546b2ac61283fa4a7f3b849bf9c9e4', 1, '广东', '潮阳', '广东', '深圳', 'uploadfiles/photo_store/2013/09/24/2013092401465793_ico_small.jpg', 1, '2013-09-15 23:17:50', '', '', '', NULL, NULL, 1, 61, 0, NULL, NULL, 0, 0, '2013-09-24 13:43:57', 0, NULL, NULL, '219.133.178.122', 0, '0', NULL, NULL, 'base', NULL, -1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_activation`
--

CREATE TABLE IF NOT EXISTS `isns_user_activation` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `time` datetime NOT NULL COMMENT '时间戳',
  `activation_code` varchar(100) NOT NULL COMMENT '激活码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户激活注册表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_info`
--

CREATE TABLE IF NOT EXISTS `isns_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'user表ID',
  `info_id` int(10) NOT NULL DEFAULT '0' COMMENT '信息表ID',
  `info_value` text COMMENT '信息值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `isns_user_info`
--

INSERT INTO `isns_user_info` (`id`, `user_id`, `info_id`, `info_value`) VALUES
(1, 1, 1, '单身'),
(2, 1, 2, 'A'),
(3, 1, 3, '475573105'),
(4, 2, 1, '保密'),
(5, 2, 2, '保密');

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_information`
--

CREATE TABLE IF NOT EXISTS `isns_user_information` (
  `info_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `info_name` varchar(255) NOT NULL COMMENT '信息名称',
  `input_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息input类型 0:text,1:select,2:radio,3:checkbox',
  `info_values` text COMMENT '信息值 一行代表一个',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示排序',
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_user_information`
--

INSERT INTO `isns_user_information` (`info_id`, `info_name`, `input_type`, `info_values`, `sort`) VALUES
(1, '婚恋状态', 1, '保密\r\n单身\r\n非单身', 0),
(2, '血型', 1, '保密\r\nA\r\nB\r\nO\r\nAB', 0),
(3, 'QQ', 0, '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
