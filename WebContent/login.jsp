<%@page import="java.util.Map"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	HttpSession sess = request.getSession();
	String message = (String) sess.getAttribute("mes");

	if (message == "" || message == null) {
%>
<%
	} else {
%>
<script>alert("<%=message%>");</script>
<%
	sess.removeAttribute("mes");
	}
%>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>鹿苑学校网络评教系统</title>
	<meta charset="UTF-8" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link href="css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<h1>鹿苑学校网络评教系统</h1>
	<div class="container-agille">
		<div class="formBox level-login">
			<div class="box boxShaddow"></div>
			<div class="box loginBox">
				<h3>登录</h3>
				<form class="form" action="#" method="post">
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="请填写教师编号或学号" name="name" id="login_username">
					</div>
					<div class="f_row-2 last">
						<input type="password" name="password" placeholder="请填写密码" class="input-field" id="login_password">
					</div>
					<input class="submit-w3" type="button" value="登录" id="login_sub">
					<div class="f_link">
						<a href="" class="resetTag">忘记密码？</a>
					</div>
				</form>
			</div>
			<div class="box forgetbox agile">
					<a href="#" class="back icon-back">
							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							 viewBox="0 0 199.404 199.404" style="enable-background:new 0 0 199.404 199.404;" xml:space="preserve">
								<polygon points="199.404,81.529 74.742,81.529 127.987,28.285 99.701,0 0,99.702 99.701,199.404 127.987,171.119 74.742,117.876 
					  199.404,117.876 " />
							</svg>
						</a>
					<h3>忘记密码</h3>
					<h3 style="font-size:15px;">如果您忘记登陆密码，可在本页面提供相关信息完成修改。</h3>
					<form class="form" action="#" method="post">
						<div class="f_row-2">
							<input type="text" class="input-field" placeholder="请填写教师编号或学号" name="name" id="repassword_username">
						</div>
						<div class="f_row-2 last">
							<input type="tel" placeholder="电话" class="input-field" id="repassword_tel">
						</div>
						<div class="f_row-2 last">
							<select class="input-field" id="repassword_flag" >
									<option value="0">学生</option>
									<option value="1">教师</option>
									<option value="2">管理员</option>
							</select>
						</div>
						<div class="f_row-2 last">
							<input type="password" name="password" placeholder="请输入新密码" class="input-field" id="repassword_password">
						</div>
						<input class="submit-w3" type="button" value="确认提交修改" id="repassword_sub">
					</form>
			</div>
			<div class="box registerBox wthree">
				<span class="reg_bg"></span>
				<h3>注册</h3>
				<form class="form" action="#" method="post">
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="请填写教师编号或学号" name="name" id="regedit_username">
					</div>
					<div class="f_row-2 last">
						<input type="password" name="password" placeholder="请输入密码" class="input-field" id="regedit_password">
					</div>
					<div class="f_row-2 last">
						<input type="password" name="password" placeholder="确认密码" class="input-field" id="regedit_repassword">
					</div>
					<div class="f_row-2 last">
						<input type="text"  placeholder="姓名" class="input-field" id="regedit_name">
					</div>
					<div class="f_row-2 last">
						<input type="tel"  placeholder="电话" class="input-field" id="regedit_tel">
					</div>
					<div class="f_row-2 last">
						<select class="input-field" id="regedit_flag">
								<option value="0" id="stu_flag">学生</option>
								<option value="1" id="tea_flag">教师</option>
						</select>
					</div>
					<div class="f_row-2 last hi">
							<select class="input-field hi" id="regedit_bj_id">
								<%
								List cl_list = (List)sess.getAttribute("cl_list");
								int cl_flag = 1;
								if (cl_list.isEmpty() || cl_list.size() == 0 ){
									cl_flag = 0 ;
									%>
									<option>暂无开发注册班级，学生无法注册</option>
									<%
								}else{
									for(int i = 0 ; i < cl_list.size() ; i++){
										Map temp = (Map)cl_list.get(i);
										%>
										<option value="<%=temp.get("id")%>"><%=temp.get("name")%></option>
										<%
									}
								}
								%>
							</select>
					</div>
					<input class="submit-w3" type="button" value="注册" id="regedit_btn">
				</form>
			</div>
			<a href="#" class="regTag icon-add">
				<i class="fa fa-repeat" aria-hidden="true"></i>

			</a>
		</div>
	</div>
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/input-field.js"></script>
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
		}
			$('#login_sub').click(function(){
				var login_username = $('#login_username').val();
				var login_password = $('#login_password').val();
				if (login_username == '') alert('请填写教师编号或学号');
				else if (login_password == '') alert("请填写密码");
				else {
					$.ajax({
						async: false,
						type:'POST',
						url:'api_login',
						dataType:'json',
						data:{login_username:login_username,login_password:login_password},
						success:function(res){
							if (res == -1) alert("用户名不存在");
							else if (res == 0)  alert('密码错误');
							else if (res == 2) alert('账户暂停服务');
							else if (res == 1) window.location.href='index';
						},
						error:function(res){
							alert('登录请求失败');
						}
					});
				}
			})
			$('#repassword_sub').click(function(){
				var repassword_username = $('#repassword_username').val();
				var repassword_password = $('#repassword_password').val();
				var repassword_tel = $('#repassword_tel').val();
				var repassword_flag = $('#repassword_flag').val();
				if (repassword_username == '') alert('请填写注册的教师编号或学号');
				else if (repassword_tel == '') alert("请填写注册时电话");
				else if (repassword_flag == '') alert("请填写注册时身份");
				else if (repassword_password == '') alert("请填写想要修改的新密码");
				else {
					$.ajax({
						async: false,
						type:'POST',
						url:'api_repassword',
						dataType:'json',
						data:{repassword_username:repassword_username,repassword_password:repassword_password,repassword_tel:repassword_tel,repassword_flag:repassword_flag},
						success:function(res){
							if (res == 0)  alert('修改密码失败');
							else if (res == -1) alert("提交信息未查询到注册用户");
							else if (res == 1) alert('密码修改成功，请登录');
						},
						error:function(res){
							alert('请求失败');
						}
					});
				}
			});
			$("#regedit_btn").click(function(){
				var cl_flag = <%=cl_flag %>;
				
				var regedit_username = $("#regedit_username").val();
				var regedit_password = $("#regedit_password").val();
				var regedit_repassword = $("#regedit_repassword").val();
				var regedit_tel = $("#regedit_tel").val();
				var regedit_name = $("#regedit_name").val();
				var regedit_flag = $('#regedit_flag option:selected') .val();
				if (regedit_flag == 0 && cl_flag == 0 ) {
					alert('暂无开发注册班级，学生无法注册');
				}else {
					var regedit_bj_id = $('#regedit_bj_id option:selected') .val();
					if (regedit_username == '') alert('请填写教师编号或学号');
					else if (regedit_password == '') alert('请填写密码');
					else if (regedit_password != regedit_repassword) alert('两次密码不一样，请检查核对');
					else if (regedit_name == '') alert('请输入姓名');
					else if (regedit_tel == '') alert('请填写手机号码');
					else {
						$.ajax({
							async: false,
							type:'POST',
							url:'api_regedit',
							dataType:'json',
							data:{regedit_username:regedit_username,regedit_password:regedit_password,regedit_tel:regedit_tel,regedit_flag:regedit_flag,regedit_bj_id:regedit_bj_id,regedit_name:regedit_name},
							success:function(res){
								if (res == 0)  alert('注册失败');
								else if (res == 1) alert('注册成功');
								else if (res == 3) alert('教师编号或学号已被注册');
								else if (res == 4) alert('电话已被注册');
							},
							error:function(res){
								alert("注册失败");
							}
						});
					}
				}
			});
			$('#stu_flag').click(function(){
				$('.hi').show();
			});
			$('#tea_flag').click(function(){
				$('.hi').hide();
			});
	</script>


</body>

</html>