<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String path = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="<%=path%>/js/jquery-3.2.1/jquery-3.2.1.js""></script>
<title>Insert title here</title>
<script type="text/javascript">
function show(){
var name=$('#name').val();
var pass=$('#pass').val();
	$.ajax({
		url:"<%=path%>/addResgister.action",
		data:{"name":name,"pass":pass},
		dataType:'json',
		type:'post',
		success:function(data){
			location="<%=path%>/login.action"
		}
	})
	
}
</script>
<style type="text/css">
.body {
	margin: 0, atuo;
}
</style>
</head>
<body>
	
		<table>
			<tr>
				<td>姓名</td>
				<td><input id="name" type="text"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="pass"type="password"></td>
			</tr>
			<tr>
			<td>
			<td><input type="submit" value="提交" onclick="show()"></td>
			</tr>
		</table>
	
</body>
</html>