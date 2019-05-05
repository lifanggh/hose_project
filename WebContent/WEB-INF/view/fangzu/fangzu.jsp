<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        
		
		<div id="fangzu">
		<hr>
	<!-- 	<form id="where">关于房屋的查询
			<font color="red">地区</font>:<input type="text" name="harea" class="easyui-textbox">
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
			<a class="easyui-linkbutton" onclick="queryByWhere()">查询</a>
		</form>
		<hr>
		<form id="qaws"  > 关于租户的查询
			租户姓名<input type="text" name="tname" class="easyui-textbox">
			手机号码<input type="text" name="tphone" class="easyui-textbox">
			性别<input type="text" name="tsex" class="easyui-textbox">
			身份证号<input type="text" name="tIDC" class="easyui-textbox">
			<a class="easyui-linkbutton" id="ssss">查询</a>
        </form>
        <hr>
        <form id="fzs"  > 关于房租的查询
			缴纳房租额<input type="text" name="tname" class="easyui-textbox">
			缴纳时间<input type="text" name="tphone" class="easyui-textbox">
			备注信息<input type="text" name="tsex" class="easyui-textbox">
			<a class="easyui-linkbutton" id="dddd">查询</a>
			 <input type="button" value="批量删除" onclick="del()">
        </form> -->
        <hr>
        </div>
        
        
		<table id="FangZuData"></table>
		
		
		
		<script type="text/javascript">
			$("#FangZuData").datagrid({
				url:"<%=path%>/FangZuManager/getFangZu.do",
				fit:true,
			 	columns:[[    
			        {field:'cc',checkbox:true},    
			        {field:'fid',title:'房租编号'},    
			        {field:'fmoney',title:'缴纳房租额'},    
			        {field:'ftime',title:'缴纳时间'},
			        {field:'fother',title:'备注信息'},
			        
			        {field:'xx',title:'功能',formatter:function(value,row,index){
			        	return '<input type="button" value="删除" onclick="delById('+row.fid+')"><input type="button" value="修改" onclick="upById('+row.fid+',\''+row.fmoney+'\',\''+row.ftime+'\',\''+row.fother+'\')"> ';
			        }}
			    ]]  
			})
			
           function queryByWhere(){
			var arr = $("#where").serializeArray()
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
			$('#FangZuData').datagrid({queryParams:where});
		}
		
		$("#ssss").click(function(){
			var arr = $("#qaws").serializeArray();
		    var qaw= '{';
		    for (var i = 0; i < arr.length; i++) {
		    	qaw+= '"'+arr[i].name + '":"' + arr[i].value + '",';
		    }
		    qaw = qaw.substr(0,qaw.length-1);
		    qaw += '}';
		    qaw = JSON.parse(qaw);
			$('#FangZuData').datagrid({queryParams:qaw});
		})	
		$("#dddd").click(function(){
			var arr = $("#fzs").serializeArray();
		    var fz= '{';
		    for (var i = 0; i < arr.length; i++) {
		    	fz+= '"'+arr[i].name + '":"' + arr[i].value + '",';
		    }
		    fz = fz.substr(0,fz.length-1);
		    fz += '}';
		    fz = JSON.parse(fz);
			$('#FangZuData').datagrid({queryParams:qaw});
		})	
		
		
		
		$("#FangZuData").datagrid({
				url:"<%=path%>/FangZuManager/getFangZu.do",
				fit:true,
				pagination:true,
			    pageSize:10,
			    fitColumns:true,
			    toolbar:"#fangzu",
			 	columns:[[    
			        {field:'cc',checkbox:true},   
			        //租户信息
			        {field:'fid',title:'房租编号'},  
			        {field:'cohid',title:'租户姓名',formatter:function(value,row,index){
			        	return row.f_tid.tname;
			        }},
			        {field:'cohid1',title:'租户性别',formatter:function(value,row,index){
			        	return row.f_tid.tsex;
			        }},
			        {field:'cohid2',title:'租户电话',formatter:function(value,row,index){
			        	return row.f_tid.tphone;
			        }},
			        {field:'cohid3',title:'租户籍贯',formatter:function(value,row,index){
			        	return row.f_tid.tnative;
			        }},
			        {field:'cohid4',title:'租户身份证号',formatter:function(value,row,index){
			        	return row.f_tid.tIDC;
			        }},
			        //房屋信息
			        {field:'cohid5',title:'房屋地区',formatter:function(value,row,index){
			      
			        		return row.f_hid.harea;
	  				
			        	
			        }},
			          {field:'cohid6',title:'房屋小区',formatter:function(value,row,index){
			        	return row.f_hid.hxq;
			        }},
			        {field:'cohid7',title:'单元',formatter:function(value,row,index){
			        	return row.f_hid.hdy;
			        }},
			        {field:'cohid8',title:'楼层',formatter:function(value,row,index){
			        	return row.f_hid.hceng;
			        }},
			        {field:'cohid9',title:'房间号',formatter:function(value,row,index){
			        	return row.f_hid.hroom;
			        }},
			        {field:'cohid10',title:'详细地址',formatter:function(value,row,index){
			        	return row.f_hid.haddress;
			        }},
			        {field:'cohid11',title:'价格',formatter:function(value,row,index){
			        	return row.f_hid.hprice;
			        }},
			        
			        {field:'fmoney',title:'缴纳金额'},    
			        {field:'ftime',title:'缴纳时间'},
			        {field:'fother',title:'备注'},
			        
			        {field:'xx',title:'功能',formatter:function(value,row,index){
			        return '<input type="button" value="删除" onclick="delById('+row.fid+')"><input type="button" value="修改" onclick="upById('+row.fid+',\''+row.fmoney+'\',\''+row.ftime+'\',\''+row.fother+'\')"> ';
			        }
			        }
			    ]]  
			})
		
		function del(){
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#FangZuData").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].tid;
				}
				ids = ids.substr(1);
				$.post({
					url:"<%=path%>/FangZuManager/delByIds.do",
					data:{"fids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#FangZuData").datagrid("reload");
						}
					}
				})
			}
	
		function delById(fid){
			alert(fid)
			$.post({
				url:"<%=path%>/FangZuManager/delById.do",
				data:{"fid":fid},
				dataType:"json",
				success:function(data){
					if(data.success){
						
						$("#FangZuData").datagrid("reload");
					}
				}
			})
		}
		
		
		
		
		function upById(fid){
		if(!$("#tab").tabs("exists","修改房租信息")){
	    	//不存在的情况下 添加新的选项卡
	    	$("#tab").tabs("add",{
	    		title:'修改房租信息',
	    		closable:true,
	    		fit:true,
	    		href:"<%=path%>/FangZuManager/toAddFangZu.do?fid="+fid
	    	})
	    }else{
	    	//存在的话切换到选择的选项卡
	    	$("#tab").tabs("select",'修改房租信息')
	    }
		
		}
		
		
		
		
		
		
		
		
			
</script>
			
</body>
</html>