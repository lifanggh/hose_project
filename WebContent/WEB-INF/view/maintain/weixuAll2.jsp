<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div id="tj3">
		<hr>
		<select class="easyui-combobox" id="column">
			<option value="h.harea">地区</option>
			<option value="h.hxq">小区</option>
		</select>
		 <input type="text" id="val" class="easyui-textbox"> <a
			class="easyui-linkbutton" onclick="queryBy(1)">查询</a>
			 维修人员: <input
			type="text" id="jg" class="easyui-textbox" size="5"> <a
			class="easyui-linkbutton" onclick="queryBy(2)">查询</a> 
			时间: <input
			type="text" id="jgBegin" class="easyui-textbox" size="3"> <input
			type="text" id="jgEnd" class="easyui-textbox" size="3"> <a
			class="easyui-linkbutton" onclick="queryBy(3)">查询</a>
			 详细地址: <input
			type="text" id="jgd" class="easyui-textbox" size="7"><a
			class="easyui-linkbutton" onclick="queryBy(4)">查询</a>
		<hr>
		<!-- <form id="where">
			<input name="mid" type="hidden">
			 维修人员:<input type="text" name="back" class="easyui-textbox"> 
			维修结果:<input type="text" name="mresult" class="easyui-textbox"> 
		维修时间:<input type="text" name="mjBegin" class="easyui-textbox"> 
		      <input type="text" name="mjEnd" class="easyui-textbox">
		<font color="red">地区</font>:
		<input type="text" name="house" class="easyui-textbox"> 
		小区:<input  type="text" name="house" class="easyui-textbox"> 
		<b>详细地址:</b>
			<input type="text" name="haddress" class="easyui-textbox" size="100">
			<a class="easyui-linkbutton" onclick="queryByWhere()">查询</a>
			<button onclick="delById()">删除</button>
		</form> -->
		<div id="showHouse"></div>

	</div>
	<table id="houseData3"></table>
	<script type="text/javascript">
	
	
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
			$('#houseData3').datagrid({queryParams:where});
			
		}
	
		function queryBy(flag){
			if(flag==1){
				$('#houseData3').datagrid("reload",{
					col:$("#column").combobox("getValue"),
					val:$("#val").textbox("getValue")
					
				});
			}else if(flag==2){
				$('#houseData3').datagrid("reload",{
					col:'b.bname',
					jg:$("#jg").textbox("getValue")
				});
			}else if(flag==3){
				$('#houseData3').datagrid("reload",{
					col:'m.mtime',
					begin:$("#jgBegin").textbox("getValue"),
					end:$("#jgEnd").textbox("getValue")
				});
			}else if(flag==4){
				$('#houseData3').datagrid("reload",{
					col:'h.haddress',
					jgd:$("#jgd").textbox("getValue")
					
				});
			}
		}
	
	$('#houseData3').datagrid({    
	    url:'<%=path%>/Maintain/getAllmaintain2.action', 
	    fit:true,
	    pagination:true,
	    pageSize:10,
	    fitColumns:true,
	    toolbar:"#tj3",
	    columns:[[    
	        {field:'mid',title:'编号'},    
   			{field:'back',title:'维修人员',formatter:function(value,row,index){
  					if(row.back!=null){
  						return row.back.bname;
  					}
   					 
  					}
	        },  
	        {field:'mexplain',title:'维修说明'},    
	        {field:'mresult',title:'维修结果'},    
	        {field:'mbz',title:'维修备注'},    
	        {field:'mtime',title:'维修时间'},    
	        {field:'house1',title:'地区',formatter:function(value,row,index){
	        	return row.house.harea; }},    //harea
	          {field:'house2',title:'小区',formatter:function(value,row,index){
	        	return row.house.hxq; }},    // hxq
	        		{field:'house3',title:'单元',formatter:function(value,row,index){
	        	return row.house.hdy; }},    // hdy
	        {field:'house4',title:'楼层',formatter:function(value,row,index){
	        	return row.house.hceng; }},   // hceng
	        	    {field:'house7',title:'房间号',formatter:function(value,row,index){
	        	return row.house.hroom; }},      //   hroom   hptss
	        	  {field:'house5',title:'配套设施',formatter:function(value,row,index){
	        	return row.house.hptss; }} ,        
	      {field:'house6',title:'详细地址',formatter:function(value,row,index){
	        	return row.house.haddress; }}//haddress
	       /*  {field:'ha',title:'菜单',formatter:function(value,row,index){
	        	return '<button onclick="updataHouse('+row.mid+')">修改</button> ';
	        }}  */
        
	    ]]    
	}); 
	 function delById(){ //delById
		 alert(0000)
		var arr = $('#houseData3').datagrid("getSelections");
		if(arr.length > 0){
			var ids = "";
			for (var i = 0; i < arr.length; i++) {
				ids+=","+arr[i].mid;
			}
			ids = ids.substr(1);
			alert(ids)
			$.post({
				url:"<%=path%>/Maintain/delByIds.action",
					data : {
						"ids" : ids
					},
					dataType : "json",
					success : function(data) {
						if (data.success) {
							alert(删除成功);
							$('#houseData3').datagrid("reload");
						} else {
							$.messager.alert("提示", "系统异常!");
						}
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的数据!");
			}
		}
	</script>
</body>
</html>