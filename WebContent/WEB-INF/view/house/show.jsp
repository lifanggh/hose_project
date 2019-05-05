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
		<table align="center" style="padding-top: 20px">
			<tr>
				<td>地区</td>
				<td>${house.harea}</td>
				<td>小区</td>
				<td>${house.hxq}</td>
				<td>单元</td>
				<td>${house.hdy}</td>
			</tr>
			<tr>
				<td>楼层</td>
				<td>${house.hceng}</td>
				<td>房间号</td>
				<td>${house.hroom}</td>
				<td>面积</td>
				<td>${house.hacreage}m²</td>
			</tr>
			<tr>
				<td>朝向</td>
				<td>${house.horientation==1?'东':house.horientation==2?'西':house.horientation==3?'南':'北'}</td>
				<td>双气</td>
				<td>${house.hsq?'是':'否'}</td>
				<td>装修</td>
				<td>${house.hfinish==1?'简装':'精装'}</td>
			</tr>
			<tr>
				<td>配套设施</td>
				<td>${house.hptss}</td>
				<td>价格</td>
				<td>${house.hprice}</td>
				<td>状态</td>
				<td>${house.hstate==1?'已出租':house.hstate==2?'待出租':'停止出租'}</td>
			</tr>
			<tr>
				<td>图片</td>
				<td colspan="5">
					<div style="width: 200px;height: 200px">
					<img alt="图片失踪" src="<%=path%>${house.himg}" width="200px" height="200px">
					</div>
				</td>
			</tr>
			<tr>
				<td>详细地址</td>
				<td colspan="5">${house.haddress}</td>
			</tr>
		</table>
	</body>
</html>