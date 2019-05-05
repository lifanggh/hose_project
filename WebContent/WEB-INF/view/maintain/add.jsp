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
		<input type="hidden" id="mid" value="${maintain.mid}">
		
			<table align="center">
				<tr>
					<td>维修人员</td>
					<td><input type="text" class="easyui-numberbox" class="easyui-textbox" id="mpid" "> </td>
				</tr>
				<tr>
					<td>维修说明</td>
					<td><input type="text"  class="easyui-textbox" id="mexplain" size="10"></td>
				
				</tr>
				<tr>
					<td>时间</td>
					<td><input type="text" class="easyui-textbox" data-options="required:true" id="mtime"  ></td>				
					</tr>
					<tr>
					<td>用户信息号</td>
					<td><input type="text" class="easyui-textbox" id="mhouse"  size="3"></td>				
				</tr>
				<tr>
					<td>维修结果</td>
					<td><input type="text" class="easyui-textbox" id="mresult" size="20" ></td>
				   </tr>
					<tr>
				    <td>备注</td>
					<td><input type="text"  class="easyui-textbox" id="mbz" size="20"></td>
				</tr>
									
			<!-- 	<tr>
					<td colspan="4" align="center">
						<a  class="easyui-linkbutton" id="insertHouse">新增</a>
						<a  class="easyui-linkbutton" onclick="formreset()">重置</a>
					</td>
				</tr> -->
			</table>
		</form>
		<script type="text/javascript">
			<%-- ("#insertHouse").click(function(){
			
				if($("#dataHouse4").form("validate")){
					var form = new FormData(document.getElementById("dataHouse4"));
					$.ajax({
						url:"<%=path%>/Maintain/addMaintain.action",
						data:form,
						type:"post",
						dataType:"json",
						contentType: false,
						processData: false,
						success:function(data){
							if(data.success){
								$.messager.confirm('确认','添加成功!是否继续添加!',function(r){    
								    if (r){    
								    	$("#dataHouse4").form("reset");
								    }else{
								    	if(!$("#tab").tabs("exists","维修记录信息")){
									    	//不存在的情况下 添加新的选项卡
									    	$("#tab").tabs("add",{
									    		title:"房屋信息查询",
									    		closable:true,
									    		fit:true,
									    		href:"<%=path%>/House/toHouse.action"
									    	})
									    }else{
									    	//存在的话切换到选择的选项卡
									    	$("#tab").tabs("select","维修记录信息");
									    	$('#houseData4').datagrid("reload");
									    }
								    	$("#tab").tabs("close","添加维修信息");
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
				$("#dataHouse4").form("reset");
			}
			$("#dataHouse4").form({
				novalidate:true
			});
			 --%>
			
		</script>
	</body>
</html>