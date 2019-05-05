<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path = request.getContextPath(); %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title	>Insert title here</title>
	<!-- 引入jquery -->
	<script type="text/javascript" src="<%=path%>/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
	<!-- 引入easyUI的核心js -->
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<!-- 引入中文语言包 -->
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<!-- 引入easyUI的核心样式 -->
	<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4.1/themes/default/easyui.css" >
	<!-- 引入easyUI小图标 -->
	<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4.1/themes/icon.css" >
	</head>
	<body class="easyui-layout">
		<div data-options="region:'north'" style="height:100px;background:#eee;">
			<h1>智游公寓管理系统</h1>
			<a href="<%=path%>/Quit/quit.action" ><input type="button" value="退出系统"  style=" float: right;height: 24px;">
		    </a>

		</div>   
	    <div data-options="region:'west',title:'菜单栏'"  style="width:12%;background:#eee;">
	    	<div id="aa" class="easyui-accordion"  data-options="fit:true">   
	    		<c:forEach items="${pow}" var="p">
	    			<div title="${p.pname}" pid="${p.pid}">
	    				<ul id="tree${p.pid}"></ul>
	    			</div>
	    		</c:forEach>
	    	</div>
	    </div>   
	    <div data-options="region:'center'" style="background:#eee;">
	    	<div id="tab" class="easyui-tabs" data-options="fit:true,border:false"></div>
	    </div> 
	</body>
	<script type="text/javascript">
		$("#aa").accordion({
			onSelect:function(title,index){
				//获取pid
				var pid =  $("#aa").accordion("getSelected").attr("pid");
				//加载二级菜单
				$('#tree'+pid).tree({   
					//获取菜单数据
				    url:'<%=path%>/getMenu.action?pid='+pid,
				  	//绑定单击事件
				    onClick:function(node){
				    	//判断选项卡是否已经存在
					    if(!$("#tab").tabs("exists",node.text)){
					    	//不存在的情况下 添加新的选项卡
					    	$("#tab").tabs("add",{
					    		title:node.text,
					    		closable:true,
					    		fit:true,
					    		href:"<%=path%>"+node.url  //获取权限中的路径  --->展示所有信息
					    	})
					    }else{
					    	//存在的话切换到选择的选项卡
					    	$("#tab").tabs("select",node.text)
					    }
				    	
				    }
				}); 
				
			}
		})
	</script>
</html>