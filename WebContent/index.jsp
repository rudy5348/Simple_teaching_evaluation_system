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
	Map user = (Map)sess.getAttribute("user");
	int user_flag = (int)user.get("flag");
	String user_name = (String)user.get("name");
%>
<!DOCTYPE html>
<html>

<head>
    <title>鹿苑学校网络评教系统</title>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="layui/layui.js"></script>
    <script src="js/jquery.qrcode.min.js"></script>
    <style>
        .head_title{
            background : #e2e2e2;
            height: 25px;
            padding-top: 5px;
        }
        .head_logo{
            height: 60px;
            margin-top: 10px;
        }
        .head_logo_font{
            font-size: 40px;
        }
        .head_bnv{
            background: #393D49;
        }
        .body_all_bg{
            background : #e2e2e2;
        }
        .textalign_c{
            text-align: center;
        }
        .quan{
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
    <div class="layui-row head_title">
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-xs11">
                    欢迎访问鹿苑学校网络评教系统
                </div>
                <div class="layui-col-xs1 textalign_c">
                    <div data-method="notice" data-type="login" class="click_class"><a href="logout"><%=user_name %></a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row head_logo">
        <form class="layui-form" action="" >
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-xs12 head_logo_font">鹿苑学校网络评教系统</div>
            </div>
        </div>
        </form>
    </div>
    <div class="layui-row head_bnv">
        <div class="layui-container">
            <ul class="layui-nav">
                <li class="layui-nav-item"><a href="index">修改信息</a></li>
                <%
                if (user_flag == 2){
                	%>
                	<li class="layui-nav-item"><a href="pjgl">评教管理</a></li>
                    <li class="layui-nav-item"><a href="bjgl">班级管理</a></li>
                    <li class="layui-nav-item"><a href="pjnrgl">评教内容管理</a></li>
                    <li class="layui-nav-item"><a href="kcxxgl">课程信息管理</a></li>
                    <li class="layui-nav-item"><a href="stu_xxcx">学生信息管理</a></li>
                    <li class="layui-nav-item"><a href="tea_xxcx">教师信息管理</a></li>
                    <%
                }else if (user_flag == 1){
                	%>
                	<li class="layui-nav-item"><a href="tea_pjlb">评教列表</a></li>
                    <%
                }else if (user_flag == 0){
                	%>
                	<li class="layui-nav-item"><a href="stu_pjlb">评教列表</a></li>
                    <%
                }
                %>
            </ul>
        </div>
    </div>
    <div class="layui-row body_all_bg">
        <div class="layui-container">
            <div class="layui-row">
                    <fieldset class="layui-elem-field" style="padding: 20px;">
                        <legend style="margin-top:10px;">修改个人信息</legend>
                        <div class="layui-field-box">
                                <form class="layui-form" action="">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">用户名</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="username" required  lay-verify="required" autocomplete="off" class="layui-input" disabled="disabled" value="<%=user.get("username") %>"/>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">密码</label>
                                        <div class="layui-input-block">
                                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="<%=user.get("password") %>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">姓名</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required  lay-verify="required" autocomplete="off" class="layui-input" value="<%=user.get("name") %>"/>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">电话</label>
                                        <div class="layui-input-block">
                                            <input type="tel" name="tel" required  lay-verify="required" autocomplete="off" class="layui-input" value="<%=user.get("tel") %>"/>
                                        </div>
                                    </div>
                                    <%
                                    if (user_flag == 0) {
                                    	%>
                                    	<div class="layui-form-item">
	                                        <label class="layui-form-label">班级</label>
	                                        <div class="layui-input-inline">
	                                            <select name="bj_id" lay-verify="required">
	                                            <%
	                                            Map one = (Map)sess.getAttribute("one_cl");
	                                            %>
	                                                <option value="<%=one.get("id") %>"><%=one.get("name") %></option>
	                                            <%
	                                            List cl_list = (List)sess.getAttribute("cl_list");
	                                            if (cl_list.isEmpty() || cl_list.size() == 0 ){
	                                            	
	                                            }else{
	                                            	for(int i = 0 ; i < cl_list.size() ; i++){
	                                            		Map temp = (Map) cl_list.get(i);
	                                            		if ((int)temp.get("id") != (int)one.get("id"))
	                                            		%>
	                                            		<option value="<%=temp.get("id") %>"><%=temp.get("name") %></option>
	                                            		<%
	                                            	}
	                                            	%>
	                                            	
	                                            	<%
	                                            }
	                                            %>
	                                            </select>
	                                        </div>
	                                        <div class="layui-form-mid layui-word-aux">班级修改后可能无法撤回</div>
	                                    </div>
                                    	<%
                                    }
                                    %>
                                    
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                        </div>
                                    </div>
                                </form>
                        </div>
                    </fieldset>
            </div>
        </div>
    </div>
    <script>
        layui.use(['element' , 'form' , 'layer'], function(){


            var element = layui.element; 
            
            //监听导航点击
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
            });

            var layer = layui.layer;
            var form = layui.form;
  
            //监听提交
            form.on('submit(formDemo)', function(data){
                $.ajax({
						async: false,
						type:'POST',
						url:'api_change_user_msg',
						dataType:'json',
						data:data.field,
						success:function(res){
							if (res == 0)  alert('修改失败');
							else if (res == -1) alert("提交信息未查询到注册用户");
							else if (res == 1) {
                                alert('修改成功');
                                window.location.reload();
                            }
						},
						error:function(res){
							alert('请求失败');
						}
					});
                return false;
            });
        });
        
    </script>
</body>

</html>