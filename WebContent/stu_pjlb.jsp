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
                                评教列表
                            </legend>
                        </div>
                        <div class="layui-field-box">
                            <form class="layui-form" >
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
                                            <th>教师名</th>
                                            <th>课程名</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                          </tr> 
                                        </thead>
                                        <tbody>
                                        <%
                                        List list = (List)sess.getAttribute("list");
                                        sess.removeAttribute("list");
                                        if (list.isEmpty() || list.size() == 0 ){
                                        	%>
                                        	<tr>
	                                            <td colspan="5" style="text-align: center;">暂无待评价列表</td>
	                                          </tr>
                                        	<%
                                        }else{
                                        	for(int i = 0 ; i < list.size() ; i++){
                                        		Map map = (Map) list.get(i);
                                        		%>
                                        		<tr>
		                                            <td><%=i+1 %></td>
		                                            <td><%=map.get("tea_name") %></td>
		                                            <td><%=map.get("kcb_name") %></td>
                                                    <td>
                                                    	<%
                                                    	 if ((int)map.get("flag") == 1){
                                                     		%>
                                                     		评教进行中
                                                     		<%
	                                                     }else if ((int)map.get("flag") == 2){
	                                                 		%>
	                                                 		评教暂停
	                                                 		<%
		                                                 }else if ((int)map.get("flag") == 3){
		                                             		%>
		                                             		评教结束
		                                             		<%
		                                             	}	%>
													</td>
                                                    <td>
                                                        <%
                                                        if ((int)map.get("zt") == 1){
                                                            %>
                                                            <div class="layui-btn list_btn" data-type="<%=map.get("id") %>">查看评价信息</div>
                                                            <%
                                                        }else if ((int)map.get("zt") == 0 && (int)map.get("flag") == 1){
                                                            %>
                                                            <a href="stu_pj?id=<%=map.get("id") %>" class="layui-btn">开始评教</a>
                                                            <%
                                                        }
                                                        %>
                                                        
                                                    </td>
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

            
            $('.list_btn').click(function(){
                var table_str = "";
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_get_pj_user',
                    dataType:'json',
                    data:{id:$(this).data('type')},
                    success:function(res){
                        
                        $.each(res[0], function(index, value){
                            table_str +='<tr><td>'+value['name']+'</td><td>'+value['fen']+'</td></tr>';
                        });


                        layer.open({
                            type: 1
                            ,title: false 
                            ,closeBtn: false
                            ,area: '500px;'
                            ,shade: 0.8
                            ,id: 'LAY_layuipro' 
                            ,btn: ['好的']
                            ,btnAlign: 'c'
                            ,moveType: 1 
                            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
                                    '<table class="layui-table"><colgroup><col><col></colgroup><thead>'+
                                            '<tr>'+
                                                '<th>内容</th>'+
                                                '<th>成绩</th>'+
                                            '</tr> '+
                                        '</thead>'+
                                        '<tbody>'+
                                                table_str+
                                        '</tbody>'+
                                        '</table>'+
                                '</div>'
                        });
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