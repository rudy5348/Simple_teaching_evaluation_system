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
                                评价内容管理
                            </legend>
                            <div class="layui-col-xs2 layui-btn" id="add_classs">
                                    添加内容
                            </div>
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
                                            <th>内容</th>
                                            <th>操作</th>
                                          </tr> 
                                        </thead>
                                        <tbody>
                                        <%
                                        List pj = (List)sess.getAttribute("pj");
                                        sess.removeAttribute("pj");
                                        if (pj.isEmpty() || pj.size() == 0 ){
                                        	%>
                                        	<tr>
	                                            <td colspan="3" style="text-align: center;">暂无评价内容</td>
	                                          </tr>
                                        	<%
                                        }else{
                                        	for(int i = 0 ; i < pj.size() ; i++){
                                        		Map map = (Map) pj.get(i);
                                        		%>
                                        		<tr>
		                                            <td><%=i+1 %></td>
		                                            <td><%=map.get("name") %></td>
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

            $('#add_classs').click(function(){
                layer.open({
                    type: 1
                    ,title: false 
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' 
                    ,btn: ['确定' , '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
                        '<input type="text" name="title" required  lay-verify="required" placeholder="请输入评价内容" autocomplete="off" class="layui-input" id="pj_name">'+
                        '</div>'
                    ,yes: function(index, layero){
                        var pj_name =  $("#pj_name").val();
                        if (pj_name != ''){
                            $.ajax({
                                async: false,
                                type:'POST',
                                url:'api_add_pj',
                                dataType:'json',
                                data:{name:pj_name},
                                success:function(res){
                                    if (res == 0)  alert('添加失败');
                                    else if (res == 1) window.location.reload();
                                },
                                error:function(res){
                                    alert('请求失败');
                                }
                            });
                        }                        
                        layer.close(index);
                    }
                });
            });
            $('.list_btn').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_del_pj',
                    dataType:'json',
                    data:{id:$(this).data('type')},
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