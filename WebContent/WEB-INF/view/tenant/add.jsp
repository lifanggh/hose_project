<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="dataTenant">
		<input type="hidden" value="${tenant.tid}" name="tid">
		<table align="center">
			<tr>
				<td>租户姓名</td>
				<td><input type="text" value="${tenant.tname}"
					data-options="required:true" class="easyui-textbox" name="tname">
				</td>
			</tr>

			<tr>
				<td>手机号码</td>
				<td><input type="text" value="${tenant.tphone}"
					data-options="required:true" class="easyui-textbox" name="tphone">
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="text" value="${tenant.tsex}"
					data-options="required:true" class="easyui-textbox" name="tsex">
				</td>
			</tr>
			<tr>
				<td>籍贯</td>
				<td><input type="text" value="${tenant.tnative}"
					data-options="required:true" class="easyui-textbox" name="tnative">
				</td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input type="text" value="${tenant.tIDC}"
					data-options="required:true" class="easyui-textbox" name="tIDC">
				</td>
			</tr>
			<tr>
				<td>添加时间</td>
				<td><input type="text" value="${tenant.tTime}"
					class="easyui-textbox" name="tTime"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><a class="easyui-linkbutton"
					id="insertTenant">${tenant==null?'新增':'修改' }</a> <a
					class="easyui-linkbutton" onclick="formreset()">重置</a></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
			 $("#insertTenant").click(function(){
				if($("#dataTenant").form("validate")){
					var form = new FormData(document.getElementById("dataTenant"));
					
					$.ajax({
						url:"<%=path%>/TenantManager/addTenant.do",
						data:form,
						type:"post",
						dataType:"json",
						 processData: false,//这个必须有，不然会报错
		                 contentType: false,//这个必须有，不然会报错
						success:function(data){
							var why="";
							if(${tenant.tid!=null}){
								why ="修改";
							}else{
								why ="新增";
							}
							if(data.success){
								$.messager.confirm('确认',why+'成功!是否继续!',function(r){    
								    if (r){    
								    	$("#dataTenant").form("reset");
								    }else{
								    	if(!$("#tab").tabs("exists","租户信息管理")){
									    	//不存在的情况下 添加新的选项卡
									    	$("#tab").tabs("add",{
									    		title:"租户信息管理",
									    		closable:true,
									    		fit:true,
									    		href:"<%=path%>/TenantManager/toTenant.do"
									    	})
									    }else{
									    	//存在的话切换到选择的选项卡
									    	$("#tab").tabs("select","租户信息管理");
									    	$('#TenantData').datagrid("reload");
									    }
								    	$("#tab").tabs("close",why+"租户信息");
								    }    
								});
							}else{
								$.messager.alert('警告','系统异常!');    
							}
						}
					})
				}
			}) 
			
			function formreset(){
				$("#dataTenant").form("reset");
			}
			$("#dataTenant").form({
				novalidate:true
			});
			
			
		</script>
</body>
</html>