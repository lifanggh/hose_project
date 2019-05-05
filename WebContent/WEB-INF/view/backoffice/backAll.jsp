<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入jquery -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<!-- 引入easyUI的核心js -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<!-- 引入中文语言包 -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入easyUI的核心样式 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.4.1/themes/default/easyui.css">
<!-- 引入easyUI小图标 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.4.1/themes/icon.css">
</head>
<body>
<div id="tj2">
  <hr>
	<select class="easyui-combobox" id="column">
		<option value="bname">名字</option>
		<option value="bhpone">电话</option>
		<option value="bsex">性别</option>
		<option value="bjob">岗位工作</option>
	</select>
	<input type="text" id="val" class="easyui-textbox">
	<a class="easyui-linkbutton" onclick="queryBy(1)">查询</a>
	
	工资:
	<input type="text" id="mjBegin" class="easyui-textbox" size="2">-
	<input type="text" id="mjEnd" class="easyui-textbox" size="2">
	<a class="easyui-linkbutton" onclick="queryBy(2)">查询</a>
	籍贯:
	<input type="text" id="jg" class="easyui-textbox" size="5">-
	<a class="easyui-linkbutton" onclick="queryBy(3)">查询</a>
	<hr>
	<input type="button" value="批量删除" onclick="del()">
	</div>
	<div id="up"></div>
	<div id="role"></div>
	<table id="BackData"></table>
	<script type="text/javascript">
		
			$("#BackData").datagrid({
				url:"<%=path%>/Back/getBackAll.action",
				fit:true,
				  pagination:true,
				    pageSize:10,
				    fitColumns:true,
				    toolbar:"#tj2",
			 	columns:[[    
			         
			        {field:'bid',title:'编号'},    
			        {field:'bname',title:'姓名'},    
			        {field:'bidcard',title:'身份证号'},
			        {field:'bphone',title:'电话'},
			        {field:'bsex',title:'性别'},
			        {field:'bjob',title:'岗位工作'},
			        {field:'bwage',title:'工资'},
			        {field:'badress',title:'籍贯'},
			        {field:'btime',title:'添加时间'},
			        {field:'xx',title:'功能',formatter:function(value,row,index){
return '<input type="button" value="修改" onclick="up('+row.bid+')"><input type="button" value="删除" onclick="delById('+row.bid+')">';
			        }}
			    ]]  
			}) 

					 
			
function queryBy(flag){
			if(flag==1){
				$('#BackData').datagrid("reload",{
					col:$("#column").combobox("getValue"),
					val:$("#val").textbox("getValue")
					
				});
			}else if(flag ==2){
				$('#BackData').datagrid("reload",{
					col:'bwage',
					begin:$("#mjBegin").textbox("getValue"),
					end:$("#mjEnd").textbox("getValue")
				});
			}else if(flag ==3){
				$('#BackData').datagrid("reload",{
					col:'badress',
					jg:$("#jg").textbox("getValue"),
				});
			}
		}
		
			function delById(bid){
				$.post({
					url:"<%=path%>/Back/delById.action",
					data:{"bid":bid},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#BackData").datagrid("reload");
						}
					}
				})
			}
			function del(){
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#BackData").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].bid;
				}
				ids = ids.substr(1);
				$.post({
					url:"<%=path%>/Back/delByIds.action",
					data:{"ids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#BackData").datagrid("reload");
						}
					}
				})
			}  

			function up(bid){
				$.post({
					url:"<%=path%>/Back/upBack.action?bid="+bid,
					data:{"bid":bid},
				    success:function(data){
					location="<%=path%>/Back/up.action"
				   } 
				})
			}
	
		</script>
</body>

</html>