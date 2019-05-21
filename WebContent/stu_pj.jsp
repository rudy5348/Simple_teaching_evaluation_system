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
                        <legend style="margin-top:10px;">评教</legend>
                        <div class="layui-field-box">
                                <form class="layui-form" action="?uid=<%=sess.getAttribute("pjxxb_id") %>" method="POST">
                              <%
                              List nr = (List)sess.getAttribute("nr");
                              for(int i = 0 ; i < nr.size() ; i++){
                            	  Map temp = (Map)nr.get(i);
                            	  %>
                            	  <div class="layui-form-item">
                                        <label class="layui-form-label"><%=temp.get("name") %></label>
                                        <div class="layui-input-block">
                                            <select name="<%=temp.get("id") %>" lay-verify="required">
                                            	<option value="A">A</option>
	                                           	<option value="B">B</option>
	                                           	<option value="C">C</option>
	                                           	<option value="D">D</option>
                                           	</select>
                                        </div>
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
            });
        });
        
    </script>
</body>

</html>