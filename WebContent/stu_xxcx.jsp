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
                        <div class="layui-row">
                            <legend class="layui-col-xs9">
                                学生信息管理
                            </legend>
                        </div>
                        <div class="layui-field-box">
                            <form class="layui-form">
                                <table class="layui-table">
                                        <colgroup>
                                          <col>
                                          <col>
                                          <col>
                                          <col>
                                        </colgroup>
                                        <thead>
                                          <tr>
                                            <th>序号</th>
                                            <th>学号</th>
                                            <th>姓名</th>
                                            <th>电话</th>
                                            <th>班级</th>
                                            <th>是否允许登录</th>
                                            <th>操作</th>
                                          </tr> 
                                        </thead>
                                        <tbody>
                                        <%
                                        List stu_list = (List)sess.getAttribute("stu_list");
                                        sess.removeAttribute("stu_list");
                                        if (stu_list.isEmpty() || stu_list.size() == 0 ){
                                        	%>
                                        	<tr>
	                                            <td colspan="7" style="text-align: center;">暂无注册学生</td>
	                                          </tr>
                                        	<%
                                        }else{
                                        	for(int i = 0 ; i < stu_list.size() ; i++){
                                        		Map map = (Map) stu_list.get(i);
                                        		%>
                                        		<tr>
		                                            <td><%=i+1 %></td>
		                                            <td><%=map.get("username") %></td>
		                                            <td><%=map.get("name") %></td>
		                                            <td><%=map.get("tel") %></td>
		                                            <td><%=map.get("bj") %></td>
		                                            <td><input type="checkbox" lay-skin="switch" lay-filter="switchTest" data-type="<%=map.get("id") %>" lay-text="允许|禁止" <%=(int)map.get("flag")==0?"checked":"" %>></td>
		                                            <td><div class="layui-btn list_btn" data-type="<%=map.get("id") %>">删除</div></td>
		                                          </tr>
                                        		<%
                                        	}
                                        }
                                        %>
                                        </tbody>
                                      </table>
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

            //监听指定开关
            form.on('switch(switchTest)', function(data){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_change_user_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:this.checked ? '0' : '3'},
                    success:function(res){
                        if (res == 0)  {
                        	layer.msg('修改状态失败', {
                                offset: '6px'
                            });
                        }
                        else if (res == 1) {
                        	layer.msg('修改状态成功', {
                                offset: '6px'
                            });
                        }
                    },
                    error:function(res){
                        alert('请求失败');
                    }
                });
                
            });

           
            $('.list_btn').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_change_user_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:5},
                    success:function(res){
                        if (res == 0)  {
                        	layer.msg('删除失败', {
                                offset: '6px'
                            });
                        }
                        else if (res == 1) {
                        	layer.msg('删除成功', {
                                offset: '6px'
                            });
                            window.location.reload();
                        }
                    },
                    error:function(res){
                        alert('请求失败');
                    }
                });
            });

        });
        
    </script>
</body>

</html>