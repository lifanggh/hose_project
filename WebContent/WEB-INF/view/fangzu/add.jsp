<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="dataFangzu" >
			<input type="hidden" value="${fangZu.fid}" name="fid">
			<table align="center">
				<tr>
					<td>缴纳房租额</td>
					<td><input type="text" value="${fangZu.fmoney}" data-options="required:true" class="easyui-textbox" name="fmoney"> </td>
				</tr><tr>
					<td>缴纳时间</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="ftime" value="${fangZu.ftime}"></td>
				</tr>
				</tr><tr>
					<td>备注</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="fother" value="${fangZu.fother}"></td>
				</tr>
				</tr><tr>
					<td>f_tid</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="f_tid" value="${fangZu.f_tid}"></td>
				</tr>
				</tr><tr>
					<td>f_hid</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="f_hid" value="${fangZu.f_hid}"></td>
				</tr><tr>
					<td colspan="3" align="center">
						<a  class="easyui-linkbutton" id="insertFangzu">${house==null?'新增':'修改' }</a>
						<a  class="easyui-linkbutton" onclick="formreset()">重置</a>
					</td>
				</tr>
				</table>
				</form>
				<script type="text/javascript">
			$("#insertFangzu").click(function(){
				if($("#dataFangzu").form("validate")){
					var form = new FormData(document.getElementById("dataFangzu"));
					$.ajax({
						url:"<%=path%>/FangZuManager/addFangZu.do",
						data:form,
						type:"post",
						dataType:"json",
						contentType: false,
						processData: false,
						success:function(data){
							var why="";
							if(${fangZu!=null}){
								why ="修改";
							}else{
								why ="新增";
							}
							if(data.success){
								$.messager.confirm('确认',why+'成功!是否继续添加!',function(r){    
								    if (r){    
								    	$("#dataFangzu").form("reset");
								    }else{
								    	if(!$("#tab").tabs("exists","房租信息管理")){
									    	//不存在的情况下 添加新的选项卡
									    	$("#tab").tabs("add",{
									    		title:"房租信息管理",
									    		closable:true,
									    		fit:true,
									    		href:"<%=path%>/FangZuManager/toFangZu.do"
									    	})
									    }else{
									    	//存在的话切换到选择的选项卡
									    	$("#tab").tabs("select","房租信息管理");
									    	$('#dataFangzu').datagrid("reload");
									    }
								    	$("#tab").tabs("close",why+"房租信息");
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
				$("#dataFangzu").form("reset");
			}
			$("#dataFangzu").form({
				novalidate:true
			});
			
			
		</script>
</body>
</html>