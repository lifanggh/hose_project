<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
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
        <div id="qq">
        <form id="qaws"  >
         <input type="button" value="批量删除" onclick="del()">
			租户姓名<input type="text" name="tname" class="easyui-textbox">
			手机号码<input type="text" name="tphone" class="easyui-textbox">
			性别<input type="text" name="tsex" class="easyui-textbox">
			身份证号<input type="text" name="tIDC" class="easyui-textbox">
			<a class="easyui-linkbutton" id="ssss">查询</a>
        </form>
        </div>
		<table id="TenantData"></table>
		<script type="text/javascript">
		$("#ssss").click(function(){
			var arr = $("#qaws").serializeArray();
		    var qaw= '{';
		    for (var i = 0; i < arr.length; i++) {
		    	qaw+= '"'+arr[i].name + '":"' + arr[i].value + '",';
		    }
		    qaw = qaw.substr(0,qaw.length-1);
		    qaw += '}';
		    qaw = JSON.parse(qaw);
			$('#TenantData').datagrid({queryParams:qaw});
		})
	
			$("#TenantData").datagrid({
				url:"<%=path%>/TenantManager/getTenant.do",
				fit:true,
				pagination:true,
			    pageSize:10,
			    fitColumns:true,
			    toolbar:"#qq",
			 	columns:[[    
			        {field:'cc',checkbox:true},    
			        {field:'tid',title:'租户编号'},    
			        {field:'tname',title:'租户姓名'},    
			        {field:'tphone',title:'手机号码'},
			        {field:'tsex',title:'性别'},
			        {field:'tnative',title:'籍贯'},
			        {field:'tIDC',title:'身份证号'},
			        {field:'tTime',title:'添加时间'},
			        {field:'xx',title:'功能',formatter:function(value,row,index){
			        return '<input type="button" value="删除" onclick="delById('+row.tid+')"><input type="button" value="修改" onclick="upById('+row.tid+',\''+row.tname+'\',\''+row.tphone+'\',\''+row.tsex+'\',\''+row.tnative+'\',\''+row.tIDC+'\',\''+row.tTime+'\')"> ';
			        }
			        }
			    ]]  
			})
		
		
	
			
			function del(){
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#TenantData").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].tid;
				}
				ids = ids.substr(1);
				$.post({
					url:"<%=path%>/TenantManager/delByIds.do",
					data:{"tids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#TenantData").datagrid("reload");
						}
					}
				})
			}
			function delById(tid){
				$.post({
					url:"<%=path%>/TenantManager/delById.do",
					data:{"tid":tid},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#TenantData").datagrid("reload");
						}
					}
				})
			}
			
			function upById(tid){
				if(!$("#tab").tabs("exists","修改租户信息")){
			    	//不存在的情况下 添加新的选项卡
			    	$("#tab").tabs("add",{
			    		title:'修改租户信息',
			    		closable:true,
			    		fit:true,
			    		href:"<%=path%>/TenantManager/toAddTenant.do?tid="+tid
			    	})
			    }else{
			    	//存在的话切换到选择的选项卡
			    	$("#tab").tabs("select",'修改租户信息')
			    }
			}
		
			
			
			
			
			
			
			
			
			
			
			
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>