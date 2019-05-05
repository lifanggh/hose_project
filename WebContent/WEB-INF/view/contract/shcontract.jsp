<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title	>Insert title here</title>
	<% String path=request.getContextPath(); %>
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
	   <input type="button" value="添加" onclick="addContract()"/>
	  <!--  <hr>
	   <form id="whereContract">
			<font>地区</font>:<input type="text" name="harea" class="easyui-textbox">
			小区:<input type="text" name="hxq" class="easyui-textbox">
			楼层:<input type="text" name="hceng" class="easyui-textbox">
			面积:
			   <input type="text" name="mjBegin" class="easyui-textbox" size="2">-
			   <input type="text" name="mjEnd" class="easyui-textbox" size="2">
			价格:
			   <input type="text" name="jgBegin" class="easyui-textbox" size="2">-
			   <input type="text" name="jgEnd" class="easyui-textbox" size="2"><br>
			装修:
			   <input type="radio" name="hfinish" value="1">简装
			   <input type="radio" name="hfinish" value="2">精装
			   &nbsp;&nbsp;&nbsp;
			朝向:
			  <select class="easyui-combobox" name="horientation">
			    <option value="0">请选择</option>
				<option value="1">东</option>
				<option value="2">西</option>
				<option value="3">南</option>
				<option value="4">北</option>
			  </select>&nbsp;&nbsp;&nbsp;
			双气:
			   <input type="radio" name="hsq" value="1">是
			   <input type="radio" name="hsq" value="0">否
			<br>
			配套设施:
				<input type="checkbox" name="hptss" value="宽带">宽带
				<input type="checkbox" name="hptss" value="电视">电视
				<input type="checkbox" name="hptss" value="洗衣机">洗衣机
				<input type="checkbox" name="hptss" value="冰箱">冰箱
				<input type="checkbox" name="hptss" value="空调">空调
			&nbsp;&nbsp;&nbsp;
			状态:
				<input type="radio" name="hstate" value="1">已出租
			    <input type="radio" name="hstate" value="2">未出租
			    <input type="radio" name="hstate" value="3">停止出租<br>
			详细地址:
			    <input type="text" name="haddress" class="easyui-textbox" size="100">
			    <hr>
			合同修改日期:
			    <input type="text" class="easyui-textbox" name="codata">
		          租赁开始时间:
		        <input type="text" class="easyui-textbox" name="cobegin">
		         租赁结束时间:
		         <input type="text" class="easyui-textbox" name="coend" >
		         房租总额:				
		         <input type="text" class="easyui-numberbox" name="cohrental">
		         付款方式:
				<input type="text" class="easyui-textbox" name="comway">
		        <br>押金:
			   <input type="text" name="micoyajin" class="easyui-textbox" size="2">-
			   <input type="text" name="macoyajin" class="easyui-textbox" size="2">
		        付款期数:
		       <input type="text" class="easyui-numberbox" name="coperiods">
		       合同签署人:
		       <input type="text" class="easyui-textbox" name="coconpeo">
		       合同状态:
		       <input type="radio"  name="coconzt" value="0">未生效
			   <input type="radio"  name="coconzt" value="1">已生效
			  <hr>
		       租户姓名:
			   <input type="text" class="easyui-textbox" name="tname">
		      手机号码:
			   <input type="text" class="easyui-textbox" name="tphone">
                           性别:
               <input type="radio" name="tsex" value="男">男
			   <input type="radio" name="tsex" value="女">女
		      籍贯:
			   <input type="text" class="easyui-textbox" name="tnative">
			   
			<a class="easyui-linkbutton" onclick="queryByWhere()">查询</a> -->
		</form>
		</div>
	   <table id="contractData"></table>
	   
	   <script type="text/javascript">
	   $("#contractData").datagrid({
			url:"<%=path%>/ContractManager/getContractAll.do",
			fit:true,
			pagination:true,
		    pageSize:10,
		    fitColumns:true,
		    toolbar:"#tj",
		 	columns:[[    
		        {field:'coid',title:'编号'},  
		        {field:'cohid',title:'房屋地理位置',formatter:function(value,row,index){
		        	return row.cohid.harea;
		        }},
		        {field:'cohid1',title:'小区名称',formatter:function(value,row,index){
		        	return row.cohid.hxq;
		        }},
		        {field:'cohid2',title:'单元楼',formatter:function(value,row,index){
		        	return row.cohid.hdy;
		        }},
		        {field:'cohid3',title:'楼层数',formatter:function(value,row,index){
		        	return row.cohid.hceng;
		        }},
		        {field:'cohid4',title:'房间号',formatter:function(value,row,index){
		        	return row.cohid.hroom;
		        }},
		        {field:'cohid5',title:'面积',formatter:function(value,row,index){
		        	return row.cohid.hacreage;
		        }}, 
		        
		        {field:'cohid8',title:'朝向',formatter:function(value,row,index){
		        	
		        	return row.cohid.horientation==1?'东':row.cohid.horientation==2?'西':row.cohid.horientation==3?'南':'北';
		        }}, 
		        {field:'cohid9',title:'装修',formatter:function(value,row,index){
		        	return row.cohid.hfinish==1?"简装":"精装";
		        }}, 
		        {field:'cohid10',title:'双气',formatter:function(value,row,index){
		        	return row.cohid.hsq==1?'有':'没有';
		        }}, 
		        {field:'cohid11',title:'限住人数',formatter:function(value,row,index){
		        	return row.cohid.hlimit;
		        }}, 
		        {field:'cohid12',title:'配套设施',formatter:function(value,row,index){
		        	return row.cohid.hptss;
		        }}, 
		        {field:'cohid13',title:'出租价格',formatter:function(value,row,index){
		        	return row.cohid.hprice;
		        }}, 
		        {field:'cohid14',title:'出租状态',formatter:function(value,row,index){
		        	return row.cohid.hstate==1?'已出租':row.cohid.hstate==2?'待出租':'停止出租';
		        }}, 
		        {field:'cohid15',title:'完整地址信息',formatter:function(value,row,index){
		        	return row.cohid.haddress;
		        }}, 
		        {field:'cohid16',title:'房屋信息添加时间',formatter:function(value,row,index){
		        	return row.cohid.createtime;
		        }}, 
		        {field:'cohid17',title:'房屋信息最后更新时间',formatter:function(value,row,index){
		        	return row.cohid.modifytime;
		        }}, 
		        {field:'cotid1',title:'租户姓名',formatter:function(value,row,index){
		        	return row.cotid.tname;
		        }},
		        {field:'cotid2',title:'手机号码',formatter:function(value,row,index){
		        	return row.cotid.tphone;
		        }},
		        {field:'cotid3',title:'性别',formatter:function(value,row,index){
		        	return row.cotid.tsex;
		        }},
		        {field:'cotid4',title:'籍贯',formatter:function(value,row,index){
		        	return row.cotid.tnative;
		        }},
		        {field:'cotid5',title:'身份证号',formatter:function(value,row,index){
		        	return row.cotid.tIDC;
		        }},
		        {field:'cotid6',title:'租户添加时间',formatter:function(value,row,index){
		        	return row.cotid.tTime;
		        }},
		        {field:'codata',title:'合同日期'},
		        {field:'cobegin',title:'租赁开始时间'},
		        {field:'coend',title:'租赁结束时间'},
		        {field:'cohrental',title:'房租总额'},
		        {field:'comway',title:'付款方式'},
		        {field:'coyajin',title:'押金'},
		        {field:'coperiods',title:'付款期数'},
		        {field:'coconpeo',title:'合同签署人'},
		        {field:'coconzt',title:'合同状态',formatter:function(value,row,index){
		        	return row.coconzt==1?'已生效':'未生效';}},
		        {field:'xx',title:'功能',formatter:function(value,row,index){
		        	return '<input type="button" value="删除" onclick="showcontract(\''+row.coid+'\')"><input type="button" value="修改" onclick="upcontract(\''+row.coid+'\')">';
		        }}
		    ]]  
		})
		function queryByWhere(){
		   //whereContract
		   //var form1 = new FormData(document.getElementById("whereContract"));
		    var arr = $("#whereContract").serializeArray()
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
			$('#contractData').datagrid({queryParams:where});
	   }
	   function upcontract(coid){
		   
		   if(!$("#tab").tabs("exists","租赁合同添加与编辑")){
		    	//不存在的情况下 添加新的选项卡
		    	$("#tab").tabs("add",{
		    		title:'租赁合同添加与编辑',
		    		closable:true,
		    		fit:true,
		    		href:'<%=path%>/ContractManager/toAContract.do?coid='+coid,
		    	})
		    }else{
		    	//存在的话切换到选择的选项卡
		    	$("#tab").tabs("select",'租赁合同添加与编辑');
		    }
	   }
		
	   function showcontract(coid){
		  $.ajax({
			  url:'<%=path%>/ContractManager/delById.do',
			  type:'post',
			  dataType:'json',
			  data:{"coid":coid},
			  success:function(data){
				  if(data.success){
					  alert("删除成功");
					  $("#contractData").datagrid("reload");
				  }else{
					  alert("删除失败");
				  }
			  }
			  
		  })
	   } 
	   function addContract(coid){
		   if(!$("#tab").tabs("exists","租赁合同添加与编辑")){
		    	//不存在的情况下 添加新的选项卡
		    	$("#tab").tabs("add",{
		    		title:'租赁合同添加与编辑',
		    		closable:true,
		    		fit:true,
		    		href:'<%=path%>/ContractManager/toAddContract.do?coid='+coid
		    	})
		    }else{
		    	//存在的话切换到选择的选项卡
		    	$("#tab").tabs("select",'租赁合同添加与编辑');
		    }				
	   }
	    
	   </script>
	</body>
</html>