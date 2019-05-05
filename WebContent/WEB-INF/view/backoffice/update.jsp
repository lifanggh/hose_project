<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="dataHouse2" method="post">
		<input type="hidden" id="bid" value="${back.bid}" name="bid">
		<table align="center">
			<tr>
				<td>姓名</td>
				<td><input type="text" id="bname" class="easyui-textbox"value="${back.bname}" name="bname"></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input type="text" id="bidcard" class="easyui-textbox"
					value="${back.bidcard}" name="bidcard"></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" id="bphone" class="easyui-textbox"
					value="${back.bphone}" name="bphone"></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="text" id="bsex" name="bsex" value="${back.bsex}"></td>
			</tr>
			<tr>
				<td>岗位工作</td>
				<td><input type="text" class="easyui-textbox" id="bjob"
					value="${back.bjob}" name="bjob"></td>

			</tr>
			<tr>
				<td>工资</td>
				<td><input type="text" class="easyui-numberbox" id="bwage"
					value="${back.bwage}" name="bwage"></td>

			</tr>
			<tr>

				<td>籍贯</td>
				<td><input type="text" name="badress" id="badress" value="${back.badress}"></td>
				<td></td>
			</tr>
			<tr>
				<td>添加时间</td>
				<td><input type="text" class="easyui-numberbox" name="btime"id="btime"
					value="${back.btime}"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button" value="修改"
					onclick="set()"> <input type="button" value="重置"
					onclick="formreset()"></td>
			</tr>
		</table>
		
	</form>
	<script type="text/javascript">
		
         function set(){        
         
        	 if($("#dataHouse2").form("validate")){
					var form = new FormData(document.getElementById("dataHouse2"));
					$.ajax({
						url:"<%=path%>/Back/updata.action",
						data:form,
						type:"post",
						dataType:"json",
						contentType: false,
						processData: false,
						success:function(data){
							if(data.success){
								alert("修改成功");
								window.close();
								$("#BackData").datagrid("reload");
							}
								}
							
					})}}
         
     	function formreset(){
			$("#dataHouse2").form("reset");
		}
		$("#dataHouse2").form({
			novalidate:true
		});
		</script>
</body>
</html>