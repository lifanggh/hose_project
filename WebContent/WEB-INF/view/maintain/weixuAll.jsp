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
	<div id="tj">
		<<!-- !-- 		<hr>
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
		<hr> -->
	<!-- 	<form id="where">
			<input  name="mid"  type="hidden">
			维修人员:<input type="text" name="mid" class="easyui-textbox">
			维修结果:<input type="text" name="mid" class="easyui-textbox">
			维修时间:<input type="text" name="mid" class="easyui-textbox"> <font
				color="red">地区</font>:<input type="text" name="harea"
				class="easyui-textbox"> 小区:<input type="text" name="hxq"
				class="easyui-textbox">  <b>详细地址:</b> <input
				type="text" name="haddress" class="easyui-textbox" size="100">
			<a class="easyui-linkbutton" onclick="queryByWhere()">查询</a>
		</form> --> -->
		<input type="button" value="新增记录" onclick="addView()">
		<div id="showHouse"></div>
	<div id="addm"></div>  <!-- 用来点击显示一个弹框 -->
	</div>
	<table id="houseData2"></table>
	<script type="text/javascript">
	function addView(){
		$('#addm').dialog({    
		    title: '添加信息',    
		    width: 500,    
		    height: 400,
		    
		    href:'<%=path%>/Maintain/toAdd.action', /*跳转到添加页面  */
		    buttons:[{
            	  text:'新增',
            	  handler:function(){
            		  var mpid = $("#mpid").val();
            		  var mexplain = $("#mexplain").val();
            		  var mresult= $("#mresult").val();
            		  var mbz= $("#mbz").val();
            		  var mtime = $("#mtime").val();
            		  var mhouse= $("#mhouse").val();
            		 
            		  $.ajax({
            			  url:'<%=path%>/Maintain/addMaintain.action',     /* 添加数据 */
            			  type:'post',
            			  data:{"mpid":mpid,
            				  "mexplain":mexplain,"mresult":mresult,"mbz":mbz,"mtime":mtime,"mhouse":mhouse},
            			  
            			  dataType:'json',
            			  success:function(data){
            				 if(data.success){
            					 $('#addm').dialog("close");
            					 //$('#add').dialog("clear");
            					 $("#houseData2").datagrid("reload");
            				 }else{
            					 $.messager.alert('警告','添加失败!');
            				 }
            			  },
            			  error:function(){
            				  $.messager.alert('警告','系统异常!');
            			  }
            		  })
            		}
			    },{
			      text:'重置',
			      handler:function(){
			    	  //掉用textbox中的setText方法  清空文本中的内容
			    	  $("#name").textbox("setText","");
			    	  $("#pass").textbox("setText","");
			      }
			    }
	    		]
		    
		}); 
	} 
	function updataHouse(mid){
		alert(mid)
		$('#addm').dialog({    
		    title: '修改信息',    
		    width: 500,    
		    height: 400,
		    href:'<%=path%>/Maintain/toUpdate.action?mid='+mid, /*跳转到添加页面  */
		    buttons:[{
            	  text:'修改',
            	  handler:function(){
            		  var mid=$("#mid").val();
            		  var mpid = $("#mpid").val();
            		  var mexplain = $("#mexplain").val();
            		  var mresult= $("#mresult").val();
            		  var mbz= $("#mbz").val();
            		  var mtime = $("#mtime").val();
            		  var mhouse= $("#mhouse").val();
            		 
            		  $.ajax({
            			  url:'<%=path%>/Maintain/toUpdate2.action',     /* 修改数据 */
            			  type:'post',
            			  data:{"mid":mid,"mpid":mpid,
            				  "mexplain":mexplain,"mresult":mresult,"mbz":mbz,"mtime":mtime,"mhouse":mhouse},
            			  
            			  dataType:'json',
            			  success:function(data){
            				 if(data.success){
            					 $('#addm').dialog("close");
            					 //$('#add').dialog("clear");
            					 $("#houseData2").datagrid("reload");
            				 }else{
            					 $.messager.alert('警告','修改失败!');
            				 }
            			  },
            			  error:function(){
            				  $.messager.alert('警告','系统异常!');
            			  }
            		  })
            		}
			    },{
			      text:'重置',
			      handler:function(){
			    	  //掉用textbox中的setText方法  清空文本中的内容
			    	  $("#name").textbox("setText","");
			    	  $("#pass").textbox("setText","");
			      }
			    }
	    		]
		    
		}); 
	} 
	function delById(mid){
		$.post({
			url:"<%=path%>/Maintain/delById.action",
			data:{"mid":mid},
			dataType:"json",
			success:function(data){
				if(data.success){
					$("#houseData2").datagrid("reload");
				}
			}
		})
	}
	
	
<%-- 	function showHouse(hid){
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
	 --%>
	$('#houseData2').datagrid({    
	    url:'<%=path%>/Maintain/getAllmaintain.action', 
	    fit:true,
	    pagination:true,
	    pageSize:10,
	    fitColumns:true,
	    toolbar:"#tj",
	    columns:[[    
	        {field:'mid',title:'编号'},    
	        {field:'mpid',title:'维修人员'},    
	        {field:'mexplain',title:'维修说明'},    
	        {field:'mresult',title:'维修结果'},    
	        {field:'mbz',title:'维修备注'},    
	        {field:'mtime',title:'维修时间'},
	        {field:'mhouse',title:'房屋信息'}, 
	        {field:'ha',title:'菜单',formatter:function(value,row,index){
	        	return '<button onclick=delById('+row.mid+')>删除</button><button onclick="updataHouse('+row.mid+')">修改</button> ';
        	
        }}
	    ]]    
	}); 
	</script>
</body>
</html>