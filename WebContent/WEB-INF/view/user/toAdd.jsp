<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="id" value="${user.id}">
	<table align="center" style="padding-top: 20px">
		
		<tr>
			<td>用户名</td>
			<td><input id="name" type="text" class="easyui-textbox" value="${user.name }"></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input id="pass" type="password" class="easyui-textbox" value="${user.pass }"></td>
		</tr>
	</table>
</body>
</html>