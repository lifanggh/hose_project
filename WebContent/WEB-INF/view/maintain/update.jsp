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
					<td><input type="text" class="easyui-numberbox" class="easyui-textbox" id="mpid" value="${maintain.mpid}"> </td>
				</tr>
				<tr>
					<td>维修说明</td>
					<td><input type="text"  class="easyui-textbox" id="mexplain" size="10" value="${maintain.mexplain}"></td>
				
				</tr>
				<tr>
					<td>时间</td>
					<td><input type="text" class="easyui-textbox" id="mtime" value="${maintain.mtime}" ></td>				
					</tr>
					<tr>
					<td>用户信息号</td>
					<td><input type="text" class="easyui-textbox" id="mhouse"  size="3" value="${maintain.mhouse}"></td>				
				</tr>
				<tr>
					<td>维修结果</td>
					<td><input type="text" class="easyui-textbox" id="mresult" size="20"  value="${maintain.mresult}"></td>
				   </tr>
					<tr>
				    <td>备注</td>
					<td><input type="text"  class="easyui-textbox" id="mbz" size="20" value="${maintain.mbz}"></td>
				</tr>
									
			</table>
		</form>
		<script type="text/javascript">

			
		</script>
	</body>
</html>