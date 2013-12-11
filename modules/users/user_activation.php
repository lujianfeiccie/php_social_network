<?php
/*
 * 注意：此文件由tpl_engine编译型模板引擎编译生成。
 * 如果您的模板要进行修改，请修改 templates/default/modules/users/user_activation.html
 * 如果您的模型要进行修改，请修改 models/modules/users/user_activation.php
 *
 * 修改完成之后需要您进入后台重新编译，才会重新生成。
 * 如果您开启了debug模式运行，那么您可以省去上面这一步，但是debug模式每次都会判断程序是否更新，debug模式只适合开发调试。
 * 如果您正式运行此程序时，请切换到service模式运行！
 *
 * 如有您有问题请到官方论坛（http://tech.jooyea.com/bbs/）提问，谢谢您的支持。
 */
?><?php
//引入公共模块
require("foundation/module_users.php");
require("api/base_support.php");

//数据表定义区
$t_users=$tablePreStr."users";
$t_user_activation=$tablePreStr."user_activation";

//获取参数
$user_email = "";
$activation_code = short_check(get_argg('activation_code'));
if($activation_code){
	$user_email = short_check(get_argg('user_email'));
}else{
	$user_email = get_session('email');
}


$dbo=new dbex;
dbtarget('w',$dbServs);

//查询匹配的激活码信息
$this_code = getMatchActivation($dbo,$user_email);
$code = $this_code['activation_code'];
$time = strtotime($this_code['time']);
$user_id = $this_code['user_id'];
$activation_id = $this_code['activation_id'];

$code_mark = false;

//计算邮箱激活码有效时间
$day = $mailCodeLifeDay*24;
$hour = $mailCodeLifeHour;
$activation_time = ($day+$hour)*60*60;

if(($time+$activation_time)<=time()){
	$code_mark = "time";
}
elseif(!$activation_code){
	$code_mark="toEmail";
}

//匹配激活码
elseif($activation_code && $activation_code == $code){

	//删除激活码
	$sql="delete from $t_user_activation where id='$activation_id'";
	$dbo->exeUpdate($sql);

	//修改用户信息
	$sql="update $t_users set activation_id='-1' where user_id=$user_id ";
	if($dbo->exeUpdate($sql)){
		$code_mark = "ok";
	}
}
else{
	$code_mark="not_match";
}
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<base href='<?php echo $siteDomain;?>' />
<link rel="stylesheet" href="skin/<?php echo $skinUrl;?>/css/layout.css" />
</head>
<body id="iframecontent">     	
	<?php require('uiparts/guestheader.php');?>	
		<div class="mail_sess_box">
		   <div class="mail_sess">
			<?php if($code_mark == "time"){?>
			<p>激活邮件已过期，<a href='do.php?act=user_activation&user_email=<?php echo $user_email;?>'>点击重新发送</a></p>
			<?php }?>
			<?php if($code_mark == "toEmail"){?>
			<p>请到您的邮箱中激活您的账号，<a href='do.php?act=user_activation&user_email=<?php echo $user_email;?>'>重新发送激活邮件</a></p>
			<?php }?>
			<?php if($code_mark == "ok"){?>
			<p>恭喜您，激活成功</p>
			<?php }?>
			<?php if($code_mark == "not_match"){?>
			<p>激活码不正确或已失效，<a href='do.php?act=user_activation&user_email=<?php echo $user_email;?>'>点击重新获取激活码</a></p>
			<?php }?>
	    </div>   
	</div>
<?php require('uiparts/footor.php');?>
</body>
</html>