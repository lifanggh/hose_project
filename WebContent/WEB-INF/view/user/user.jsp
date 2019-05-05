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
	<input type="button" value="新增用户" onclick="addView()">
	<input type="button" value="批量删除" onclick="del()">
	<div id="add"></div>
	<div id="role"></div>
	<table id="UserData"></table>
	<script type="text/javascript">
		
			$("#UserData").datagrid({
				url:"<%=path%>/UserManger/getUserAll.action",
				fit:true,
			 	columns:[[    
			        {field:'cc',checkbox:true},  
			        {field:'id',title:'用户编号'},    
			        {field:'name',title:'用户名'},    
			        {field:'pass',title:'密码'},
			        {field:'xx',title:'功能',formatter:function(value,row,index){
return '<input type="button" value="删除" onclick="delById('+row.id+')"><input type="button" value="修改" onclick="Up('+row.id+',\''+row.name+'\',\''+row.pass+'\')"><input type="button" value="赋角色" onclick="showRole('+row.id+')">';
			        }}
			    ]]  
			}) 
			/* 给用户赋角色 */
			function showRole(id){
				$('#role').dialog({    
				    title: '角色',    
				    width: 400,    
				    height: 200,
				    content:'<ul id="roleMsg"></ul>',
				    buttons:[{
	                	  text:'确定',
	                	  handler:function(){
	                		  var nodes = $('#roleMsg').tree('getChecked');/* 选中的角色的复选框 */
	                		  var ids = new Array();
	                		 
	                		  for (var i = 0; i < nodes.length; i++) {
								ids.push(nodes[i].id)                    
							  }
	                		
	                		  $.ajax({
	                			  url:"<%=path%>/Role/setRole.action",
	                			  type:"post",
	                			  data:{"id":id,"ids":ids},
	                			  dataType:"json",
	                			  success:function(data){
	                				  if(data.success){
	                					  $.messager.alert('提示','修改成功!');
	                					  $('#role').dialog("close");
	                				  }else{
	                					  $.messager.alert('警告','修改失败!');
	                				  }
	                			  }
	                		  })
	                	  }
					    }
			    		]
				}); 
				$("#roleMsg").tree({
					checkbox:true,
					url:"<%=path%>/Role/getRole.action?id="+id
				})
				
			}
			/* 修改用户信息 */
 			function Up(id,name,pass){
		alert("你确定要改");
				$('#add').dialog({    
				    title: '修改用户',    
				    width: 400,   
				    height: 200,
				    href:'<%=path%>/UserManger/toAdd.action?id='+id+'&name='+name+'&pass='+pass,
				    buttons:[{
	                	  text:'修改',
	                	  handler:function(){
	                		  var name = $("#name").val();
	                		  var pass = $("#pass").val();
	                		  var id = $("#id").val();
	                		  $.ajax({
	                			  url:'<%=path%>/UserManger/upUser.action',
	                			  type:'post',
	                			  data:{"name":name,"pass":pass,"id":id},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add').dialog("close");
	                					 //$('#add').dialog("clear");
	                					 $("#UserData").datagrid("reload");
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
			
		 	
			function del(){
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#UserData").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].id;
				}
				ids = ids.substr(1);
				$.post({
					url:"<%=path%>/UserManger/delByIds.action",
					data:{"ids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData").datagrid("reload");
						}
					}
				})
			} 
			function delById(id){
				$.post({
					url:"<%=path%>/UserManger/delById.action",
					data:{"id":id},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData").datagrid("reload");
						}
					}
				})
			}
			 
			function addView(){
				$('#add').dialog({    
				    title: '添加用户',    
				    width: 400,    
				    height: 200,
				    href:'<%=path%>/UserManger/toAdd.action', /*跳转到添加页面  */
				    buttons:[{
	                	  text:'新增',
	                	  handler:function(){
	                		  var name = $("#name").val();
	                		  var pass = $("#pass").val();
	                		  
	                		  $.ajax({
	                			  url:'<%=path%>/UserManger/addUser.action',     /* 添加数据 */
	                			  type:'post',
	                			  data:{"name":name,"pass":pass},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add').dialog("close");
	                					 //$('#add').dialog("clear");
	                					 $("#UserData").datagrid("reload");
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
		</script>
</body>

</html>