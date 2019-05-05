<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path = request.getContextPath(); %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form id="dataBack" >
			<table align="center">
				<tr>
					<td>姓名</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="bname"> </td>
				</tr><tr>
					<td>身份证号</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="bidcard"></td>
				</tr><tr>
					<td>电话</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="bphone"></td>
				</tr><tr>
					<td>性别</td>
					<td><input type="text"  data-options="required:true" name="bsex"></td>
				</tr><tr>
					<td>岗位工作</td>
					<td><input type="text" class="easyui-textbox" name="hjob"></td>
					<td></td>
				</tr><tr>
					<td>工资</td>
					<td><input type="text"  class="easyui-numberbox" name="bwage"></td>
					<td></td>
				</tr><tr>
							
					<td>籍贯</td>
					<td><input type="text" data-options="required:true"  name="badress"></td>
					<td></td>
				</tr><tr>
					<td>添加时间</td>
	<td><input type="text"  class="easyui-numberbox" name="btime"></td>
					<td></td>
				</tr>
                      <tr>
					<td colspan="3" align="center">
						<a  class="easyui-linkbutton" id="insertBack">新增</a>
						<a  class="easyui-linkbutton" onclick="formreset()">重置</a>
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			$("#insertBack").click(function(){
			
				if($("#dataBack").form("validate")){
					var form = new FormData(document.getElementById("dataBack"));
					$.ajax({
						url:"<%=path%>/Back/addBack.action",
						data:form,
						type:"post",
						dataType:"json",
						contentType: false,
						processData: false,
						success:function(data){
							if(data.success){
								$.messager.confirm('确认','添加成功!是否继续添加!',function(r){    
								    if (r){    
								    	$("#dataBack").form("reset");
								    }else{
								    	if(!$("#tab").tabs("exists","后勤信息管理")){
									    	//不存在的情况下 添加新的选项卡
									    	$("#tab").tabs("add",{
									    		title:"后勤信息管理",
									    		closable:true,
									    		fit:true,
									    		href:"<%=path%>/Back/toBack.action"
									    	})
									    }else{
									    	//存在的话切换到选择的选项卡
									    	$("#tab").tabs("select","后勤信息查询");
									    	$('#BackData').datagrid("reload");
									    }
								    	$("#tab").tabs("close","添加后勤信息");
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
				$("#dataBack").form("reset");
			}
			$("#dataBack").form({
				novalidate:true
			});
			
			
		</script>
	</body>
</html>