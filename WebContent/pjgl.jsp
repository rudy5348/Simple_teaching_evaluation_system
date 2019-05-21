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
                                评教管理
                            </legend>
                            <div class="layui-col-xs2 layui-btn" id="add_pj">
                                    添加评教操作
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
                                            <th>教师</th>
                                            <th>课程</th>
                                            <th>评教班级</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                          </tr> 
                                        </thead>
                                        <tbody>
                                        <%
                                        List p = (List)sess.getAttribute("p");
                                        sess.removeAttribute("p");
                                        if (p.isEmpty() || p.size() == 0 ){
                                        	%>
                                        	<tr>
	                                            <td colspan="6" style="text-align: center;">暂无评教信息列表</td>
	                                          </tr>
                                        	<%
                                        }else{
                                        	for(int i = 0 ; i < p.size() ; i++){
                                        		Map map = (Map) p.get(i);
                                        		%>
                                        		<tr>
		                                            <td><%=i+1 %></td>
		                                            <td><%=map.get("tea_name") %></td>
		                                            <td><%=map.get("kcb_name") %></td>
                                                    <td><%=map.get("classs_name") %></td>
                                                    <td>
                                                        <%
                                                        if ((int)map.get("flag") == 0){
                                                            %>
                                                            <div class="layui-btn list_btn1" data-type="<%=map.get("id") %>">开始</div>
                                                            <%
                                                        }else if((int)map.get("flag") == 1 || (int)map.get("flag") == 2){
                                                            %>
                                                            <input type="checkbox" lay-skin="switch" lay-filter="switchTest" data-type="<%=map.get("id") %>" lay-text="进行|暂停" <%=(int)map.get("flag")==1?"checked":"" %>>
                                                            <%
                                                        }else{
                                                            %>
                                                            已结束
                                                            <%
                                                        }
                                                        %>
                                                        
                                                    </td>
                                                    <td><div class="layui-btn list_btn" data-type="<%=map.get("id") %>">删除</div>
                                                        <%
                                                        if ((int)map.get("flag") == 1 || (int)map.get("flag") == 2){
                                                            %>
                                                            <div class="layui-btn list_btn2" data-type="<%=map.get("id") %>">结束</div>
                                                            <%
                                                        }
                                                        if ((int)map.get("flag") > 0){
                                                            %>
                                                            <div class="layui-btn list_btn3" data-type="<%=map.get("id") %>">查看评价信息</div>
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

            $('#add_pj').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_add_pj_msg',
                    dataType:'json',
                    success:function(res){
                        var tea = res['tea'];
                        var classs = res['classs'];
                        var kcb = res['kcb'];
                        var tea_str = "";
                        var classs_str = "";
                        var kcb_str = "";
                        var tea_flag = 0;
                        var classs_flag = 0;
                        var kcb_flag = 0;
                        $.each(tea, function(index, value){
                            tea_str +='<option value="'+value['id']+'">'+value['name']+'</option>';
                            tea_flag = 1;
                        });
                        $.each(classs, function(index, value){
                            classs_str +='<option value="'+value['id']+'">'+value['name']+'</option>';
                            classs_flag = 1;
                        });
                        $.each(kcb, function(index, value){
                            kcb_str +='<option value="'+value['id']+'">'+value['name']+'</option>';
                            kcb_flag = 1;
                        });
                        if (tea_flag == 0) alert('暂无可调用的教师数据');
                        else if (classs_flag == 0 ) alert('暂无可调用的班级数据');
                        else if (kcb_flag == 0 )alert('暂无可调用的课程数据');
                        else {
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
                                    '<select name="bj_id" style="width:100%; font-size:20px; text-align:center; height:30px;" id="tea_ch">'+
                                        tea_str+
	                                ' </select>'+
                                    '<select name="bj_id" style="width:100%; font-size:20px; text-align:center; height:30px;" id="classs_ch">'+
                                        classs_str+
	                                ' </select>'+
                                    '<select name="bj_id" style="width:100%; font-size:20px; text-align:center; height:30px;" id="kcb_ch">'+
                                        kcb_str+
	                                ' </select>'+
                                    '</div>'
                                ,yes: function(index, layero){
                                    var tea_choose = $('#tea_ch option:selected') .val();
                                    var classs_choose = $('#classs_ch option:selected') .val();
                                    var kcb_choose = $('#kcb_ch option:selected') .val();
                                    $.ajax({
                                        async: false,
                                        type:'POST',
                                        url:'api_add_pjgl',
                                        dataType:'json',
                                        data:{tea_choose:tea_choose,classs_choose:classs_choose,kcb_choose:kcb_choose},
                                        success:function(res){
                                            if (res == 0)  alert('添加失败');
                                            else if (res == 1) window.location.reload();
                                        },
                                        error:function(res){
                                            alert('请求失败');
                                        }
                                    });
                                }
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
                    url:'api_pjxxb_change_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:4},
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
            $('.list_btn1').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_pjxxb_change_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:1},
                    success:function(res){
                        if (res == 0)  {
                        	layer.msg('开始失败', {
                                offset: '6px'
                            });
                        }
                        else if (res == 1) {
                        	layer.msg('开始成功', {
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
            $('.list_btn2').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_pjxxb_change_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:3},
                    success:function(res){
                        if (res == 0)  {
                        	layer.msg('结束失败', {
                                offset: '6px'
                            });
                        }
                        else if (res == 1) {
                        	layer.msg('结束成功', {
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
            form.on('switch(switchTest)', function(data){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_pjxxb_change_flag',
                    dataType:'json',
                    data:{id:$(this).data('type'),flag:this.checked ? '1' : '2'},
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
            $('.list_btn3').click(function(){
                $.ajax({
                    async: false,
                    type:'POST',
                    url:'api_get_pj_classs',
                    dataType:'json',
                    data:{id:$(this).data('type')},
                    success:function(res){
                        console.log(res);
                        var note = res['note'];
                        var title = res['title'];
                        var table_str = '<tr><th>姓名</th>';
                        $.each(title, function(index, value){
                            table_str +='<th>'+value['name']+'</td>';
                        });
                        table_str += '</tr>';
                        var note_str = '';
                        $.each(note, function(index, value){
                            note_str +='<tr><td>'+value['name']+'</td>';
                            $.each(title, function(index, value1){
                                if (value[value1['name']] == -1){
                                    note_str +='<th>暂未评价</td>';
                                }else{
                                    note_str +='<th>'+value[value1['name']]+'</td>';
                                }
                            });
                            note_str += '</tr>';
                        });

                        layer.open({
                            type: 1
                            ,title: false 
                            ,closeBtn: false
                            ,area: '1000px;'
                            ,shade: 0.8
                            ,id: 'LAY_layuipro' 
                            ,btn: ['好的']
                            ,btnAlign: 'c'
                            ,moveType: 1 
                            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
                                    '<table class="layui-table"><colgroup><col><col></colgroup><thead>'+
                                            table_str+
                                        '</thead>'+
                                        '<tbody>'+
                                                note_str+
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