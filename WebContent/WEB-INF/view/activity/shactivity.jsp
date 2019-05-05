<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title	>Insert title here</title>
	<% String path=request.getContextPath(); %>
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
<body>
     <hr>
      <input type="button" value="添加" onclick="addActivity()"> 
     <hr>
     <table id="ActivityData"></table>
     <script type="text/javascript">
     $("#ActivityData").datagrid({
			url:"<%=path%>/ActivityManager/getActivityAll.do",
			fit:true,
		 	columns:[[    
		        {field:'acid',title:'编号'},    
		        {field:'acdatatime',title:'活动日期'},    
		        {field:'actheme',title:'活动主题'},
		        {field:'accontent',title:'活动内容介绍'},
		        {field:'acwhere',title:'活动地点'},
		        {field:'acmoney',title:'费用'},
		        {field:'acpeople',title:'活动组织方'},
		        {field:'xx',title:'功能',formatter:function(value,row,index){
		        	return '<input type="button" value="删除" onclick="delById('+row.acid+')"><input type="button" value="修改" onclick="upById('+row.acid+')"> ';
		        }}
		    ]]  
		})
		
		function upById(acid){
    	 alert(acid)
    	 if(!$("#tab").tabs("exists","添加/修改公寓活动信息")){
		    	//不存在的情况下 添加新的选项卡
		    	$("#tab").tabs("add",{
		    		title:'添加/修改公寓活动信息',
		    		closable:true,
		    		fit:true,
		    		href:'<%=path%>/ActivityManager/toAddActivity.do?acid='+acid
		    	})
		    }else{
		    	//存在的话切换到选择的选项卡
		    	$("#tab").tabs("select",'添加/修改公寓活动信息')
		    }
       }
		function delById(acid){
    	 $.messager.confirm('确认',"是否删除",function(r){    
			    if (r){    
			    	$.ajax({
			    		url:'<%=path%>/ActivityManager/delByAcid.do',
			    		type:'post',
			    		data:{"acid":acid},
			    		dataType:'json',
			    		success:function(){
			    			if(data){
			    				alert("删除成功");
			    				
			    				 $("#ActivityData").datagrid("reload");
			    				
			    			}else{
			    				alert("删除失败");
			    			}
			    		}
			    	})
			    }else{
			    	
			    }    
			}); 
			
        }
		function addActivity(){
    	 if(!$("#tab").tabs("exists","添加/修改公寓活动信息")){
		    	//不存在的情况下 添加新的选项卡
		    	$("#tab").tabs("add",{
		    		title:'添加/修改公寓活动信息',
		    		closable:true,
		    		fit:true,
		    		href:'<%=path%>/ActivityManager/toAddActivity.do'
		    	})
		    }else{
		    	//存在的话切换到选择的选项卡
		    	$("#tab").tabs("select",'添加/修改公寓活动信息')
		    }
       }
     </script>
</body>
</html>