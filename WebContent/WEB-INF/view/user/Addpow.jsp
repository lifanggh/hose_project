<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="pid" value="${pow.pid}">
	<table align="center" style="padding-top: 20px">
		
		<tr>
			<td>权限名</td>
			<td><input id="pname" type="text" class="easyui-textbox" value="${pow.pname}"></td>
		</tr>
		
	</table>
</body>
</html>