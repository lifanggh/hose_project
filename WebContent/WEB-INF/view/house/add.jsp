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
		<form id="dataHouse" >
			<table align="center">
				<tr>
					<td>地区</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="harea" value="${house.harea}" }> </td>
				</tr><tr>
					<td>小区</td>
					<td><input type="text" data-options="required:true" class="easyui-textbox" name="hxq" value="${house.hxq}"></td>
				</tr><tr>
					<td>单元</td>
					<td><input type="text" class="easyui-textbox" name="hdy" value="${house.hdy}"></td>
				</tr><tr>
					<td>楼层</td>
					<td><input type="text" data-options="required:true" class="easyui-numberbox"name="hceng" value="${house.hceng}"></td>
				</tr><tr>
					<td>房间号</td>
					<td><input type="text" class="easyui-textbox" name="hroom" value="${house.hroom}"></td>
					<td></td>
				</tr><tr>
					<td>面积</td>
					<td><input type="text" data-options="required:true" class="easyui-numberbox" name="hacreage" value="${house.hacreage}"></td>
					<td></td>
				</tr><tr>
					<td>朝向</td>
					<td>
						<select  class="easyui-combobox" name="horientation" ${house.horientation}>
							<option value="0">请选择</option>
							<option value="1">东</option>
							<option value="2">西</option>
							<option value="3">南</option>
							<option value="4">北</option>
						</select>
					</td>
					<td></td>
				</tr><tr>
					<td>装修</td>
					<td>
						<input type="radio" name="hfinish" checked value="1">简装
						<input type="radio" name="hfinish" value="2">精装
					</td>
					<td></td>
				</tr><tr>
					<td>是否双气</td>
					<td>
						<input type="radio"  name="hsq" checked value="1">是
						<input type="radio"  name="hsq" value="0">否
					</td>
					<td></td>
				</tr><tr>
					<td>限住人数</td>
					<td><input type="text" class="easyui-numberbox" name="hlimit" ${house.hlimit}></td>
					<td></td>
				</tr><tr>
					<td>价格</td>
					<td><input type="text" data-options="required:true" class="easyui-numberbox" name="hprice" ${house.hprice}></td>
					<td></td>
				</tr><tr>
					<td>状态</td>
					<td>
						<input type="radio"  name="hstate" value="1">已出租
						<input type="radio"  checked name="hstate" value="2">待出租
						<input type="radio"  name="hstate" value="3">停止出租
					</td>
					<td></td>
				</tr><tr>
					<td>房屋图片</td>
					<td><input type="text"  data-options="buttonText:'选择图片',buttonAlign:'left'" class="easyui-filebox" name="img"></td>
					<td></td>
				</tr><tr>
					<td>完整地址</td>
					<td><input type="text" class="easyui-textbox" name="haddress" ${house.haddress}></td>
					<td></td>
				</tr><tr>
					<td>配套设施</td>
					<td>
						<input type="checkbox" ${house.hptss.contains('宽带')?'checked':'' } name="hptss" value="宽带">宽带
						<input type="checkbox" ${house.hptss.contains('电视')?'checked':'' }name="hptss" value="电视">电视
						<input type="checkbox" ${house.hptss.contains('洗衣机')?'checked':'' } name="hptss" value="洗衣机">洗衣机
						<input type="checkbox" ${house.hptss.contains('冰箱')?'checked':'' } name="hptss" value="冰箱">冰箱
						<input type="checkbox" ${house.hptss.contains('空调')?'checked':'' } name="hptss" value="空调">空调
					</td>
					<td></td>
				</tr><tr>
					<td colspan="3" align="center">
						<a  class="easyui-linkbutton" id="insertHouse">${house==null?'新增':'修改' }</a>
						<a  class="easyui-linkbutton" onclick="formreset()">重置</a>
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			$("#insertHouse").click(function(){
				if($("#dataHouse").form("validate")){
					var form = new FormData(document.getElementById("dataHouse"));
					$.ajax({
						url:"<%=path%>/House/addHouses.action",
						data:form,
						type:"post",
						dataType:"json",
						contentType: false,
						processData: false,
						success:function(data){
							var why="";
							if(${house!=null}){
								why ="修改";
							}else{
								why ="新增";
							}
							if(data.success){
								$.messager.confirm('确认',why+'成功!是否继续添加!',function(r){    
								    if (r){    
								    	$("#dataHouse").form("reset");
								    }else{
								    	if(!$("#tab").tabs("exists","房屋信息查询")){
									    	//不存在的情况下 添加新的选项卡
									    	$("#tab").tabs("add",{
									    		title:"房屋信息查询",
									    		closable:true,
									    		fit:true,
									    		href:"<%=path%>/House/toHouse.action"
									    	})
									    }else{
									    	//存在的话切换到选择的选项卡
									    	$("#tab").tabs("select","房屋信息查询");
									    	$('#houseData').datagrid("reload");
									    }
								    	$("#tab").tabs("close",why+"房屋信息");
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
				$("#dataHouse").form("reset");
			}
			$("#dataHouse").form({
				novalidate:true
			});
			
			
		</script>
	</body>
</html>