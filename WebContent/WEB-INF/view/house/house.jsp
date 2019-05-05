<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path = request.getContextPath(); %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<!-- 引入jquery -->
		<script type="text/javascript" src="<%=path%>/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
		<!-- 引入easyUI的核心js -->
		<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
		<!-- 引入中文语言包 -->
		<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
		<!-- 引入easyUI的核心样式 -->
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4.1/themes/default/easyui.css" >
		<!-- 引入easyUI小图标 -->
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4.1/themes/icon.css" >
	</head>
	<body>
	<div id="tj">
		<hr>
			<select class="easyui-combobox" id="column">
				<option value="harea">地区</option>
				<option value="hxq">小区</option>
				<option value="hptss">配套设施</option>
				<option value="haddress">详细地址</option>
			</select>
			<input type="text" id="val" class="easyui-textbox">
			<a class="easyui-linkbutton" onclick="queryBy(1)">查询</a>
			
			面积:
			<input type="text" id="mjBegin" class="easyui-textbox" size="2">-
			<input type="text" id="mjEnd" class="easyui-textbox" size="2">
			<a class="easyui-linkbutton" onclick="queryBy(2)">查询</a>
			价格:
			<input type="text" id="jgBegin" class="easyui-textbox" size="2">-
			<input type="text" id="jgEnd" class="easyui-textbox" size="2">
			<a class="easyui-linkbutton" onclick="queryBy(3)">查询</a>
			
		<hr>
		<form id="where">
			<font color="red">地区</font>:<input type="text" name="harea" class="easyui-textbox">
			小区:<input type="text" name="hxq" class="easyui-textbox">
			楼层:<input type="text" name="hceng" class="easyui-textbox">
			面积:
			   <input type="text" name="mjBegin" class="easyui-textbox" size="2">-
			   <input type="text" name="mjEnd" class="easyui-textbox" size="2">
			价格:
			   <input type="text" name="jgBegin" class="easyui-textbox" size="2">-
			   <input type="text" name="jgEnd" class="easyui-textbox" size="2"><br>
			<b>装修:</b>
			   <input type="radio" name="hfinish" value="1">简装
			   <input type="radio" name="hfinish" value="2">精装
			   &nbsp;&nbsp;&nbsp;
			<b>朝向:</b>
			  <select class="easyui-combobox" name="horientation">
			    <option value="0">请选择</option>
				<option value="1">东</option>
				<option value="2">西</option>
				<option value="3">南</option>
				<option value="4">北</option>
			  </select>&nbsp;&nbsp;&nbsp;
			<b>双气:</b>
			   <input type="radio" name="hsq" value="1">是
			   <input type="radio" name="hsq" value="0">否
			<br>
			<b>配套设施:</b>
				<input type="checkbox" name="hptss" value="宽带">宽带
				<input type="checkbox" name="hptss" value="电视">电视
				<input type="checkbox" name="hptss" value="洗衣机">洗衣机
				<input type="checkbox" name="hptss" value="冰箱">冰箱
				<input type="checkbox" name="hptss" value="空调">空调
			&nbsp;&nbsp;&nbsp;
			<b>状态:</b>
				<input type="radio" name="hstate" value="1">未出租
			    <input type="radio" name="hstate" value="2">已出租
			    <input type="radio" name="hstate" value="3">停止出租<br>
			<b>详细地址:</b>
			<input type="text" name="haddress" class="easyui-textbox" size="100">
			<a class="easyui-linkbutton" onclick="queryByWhere()">查询</a>
			<a class="easyui-linkbutton" onclick="delById()">批量删除</a>
	    </form>
	    <div id="showHouse"></div>
	</div>
	<table id="houseData"></table>
	<script type="text/javascript">
	function delById(){
		var arr = $('#houseData').datagrid("getSelections");
		if(arr.length > 0){
			var ids = "";
			for (var i = 0; i < arr.length; i++) {
				ids+=","+arr[i].hid;
			}
			ids = ids.substr(1);
			$.post({
				url:"<%=path%>/House/delById.action",
				data:{"ids":ids},
				dataType:"json",
				success:function(data){
					if(data.success){
						$('#houseData').datagrid("reload");
					}else{
						$.messager.alert("提示","系统异常!");
					}
				}
			});
		}else{
			$.messager.alert("提示","请选择要删除的数据!");
		}
	}
	function updataHouse(hid){
		if(!$("#tab").tabs("exists","修改房屋信息")){
	    	//不存在的情况下 添加新的选项卡
	    	$("#tab").tabs("add",{
	    		title:'修改房屋信息',
	    		closable:true,
	    		fit:true,
	    		href:"<%=path%>/House/addHouse.action?hid="+hid
	    	})
	    }else{
	    	//存在的话切换到选择的选项卡
	    	$("#tab").tabs("select",'修改房屋信息')
	    }
	}
	
	function showHouse(hid){
		$("#showHouse").dialog({
			title:"详细信息",
			width: 400,    
		    height: 400,
		    href:"<%=path%>/House/toShow.action?hid="+hid
		})
	}
		function queryByWhere(){
			var arr = $("#where").serializeArray()   //序列化为数组
			var where ="{";
			var ptss="";
			for(var i =0;i<arr.length;i++){
				if(arr[i].name=="hptss"){
					ptss+=","+arr[i].value;
				}else{
					where+='"'+arr[i].name+'":"'+arr[i].value+'",';
				}
				
			}
			where +='"hptss":"'+ptss.substr(1)+'"';
			where+="}";
			where = JSON.parse(where);
			$('#houseData').datagrid({queryParams:where});
			
		}
	
		function queryBy(flag){
			if(flag==1){
				$('#houseData').datagrid("reload",{
					col:$("#column").combobox("getValue"),
					val:$("#val").textbox("getValue")
					
				});
			}else if(flag ==2){
				$('#houseData').datagrid("reload",{
					col:'hacreage',
					begin:$("#mjBegin").textbox("getValue"),
					end:$("#mjEnd").textbox("getValue")
				});
			}else if(flag ==3){
				$('#houseData').datagrid("reload",{
					col:'hprice',
					begin:$("#jgBegin").textbox("getValue"),
					end:$("#jgEnd").textbox("getValue")
				});
			}
		}
	
	$('#houseData').datagrid({    
	    url:'<%=path%>/House/getHouse.action', 
	    fit:true,
	    pagination:true,
	    pageSize:10,
	    fitColumns:true,
	    toolbar:"#tj",
	    columns:[[    
	        {field:'hid',title:'编号'},    
	        {field:'harea',title:'地区'},    
	        {field:'hxq',title:'小区'},    
	        {field:'hdy',title:'单元'},    
	        {field:'hceng',title:'楼层'},    
	        {field:'hroom',title:'房间号'},    
	        {field:'hacreage',title:'面积',formatter:function(value,row,index){
	        	return value+"m²";
	        }},    
	        {field:'horientation',title:'朝向',formatter:function(value,row,index){
	        	switch(value){
	        		case 1:return "朝东";
	        		case 2:return "朝西";
	        		case 3:return "朝南";
	        		case 4:return "朝北";
	        	}
	        }},    
	        {field:'hfinish',title:'装修',formatter:function(value,row,index){
	        	switch(value){
	        		case 1:return "简装";
	        		case 2:return "精装";
        		}
        	}},    
	        {field:'hsq',title:'双气',formatter:function(value,row,index){
	        	if(value){
	        		return "双气";
	        	}else{
	        		return "无";
	        	}
        	
       		 }},    
	        {field:'hlimit',title:'限住人数'},    
	        {field:'hptss',title:'配套设施'},    
	        {field:'hprice',title:'价格'},    
	        {field:'hstate',title:'状态',formatter:function(value,row,index){
	        	switch(value){
        		case 1:return "已出租";
        		case 2:return "待出租";
        		case 3:return "停止出租";
        	}
        }},    
	          
	        {field:'haddress',title:'详细地址'},
	        {field:'ha',title:'菜单',formatter:function(value,row,index){
	        	return '<button onclick=showHouse('+row.hid+')>查看</button><button onclick="updataHouse('+row.hid+')">修改</button> ';
        	
        }}
	    ]]    
	}); 
	</script>
	</body>
</html>