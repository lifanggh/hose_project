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
 	<input type="button" value="新增角色" onclick="addView()">
	<input type="button" value="批量删除" onclick="del()">
	<div id="add1"></div>
	<div id="role1"></div>
	<table id="UserData1"></table>
	<script type="text/javascript">
		
			$("#UserData1").datagrid({
				url:"<%=path%>/Role/getRoleAll.action",
				fit:true,
			 	columns:[[    
			        {field:'cc',checkbox:true},  
			        {field:'rid',title:'角色编号'},          
			        {field:'rname',title:'角色名'},
			        {field:'xx',title:'功能',formatter:function(value,row,index){
return '<input type="button" value="删除" onclick="delOne('+row.rid+')"><input type="button" value="修改" onclick="Up('+row.rid+',\''+row.rname+'\')"><input type="button" value="赋权限" onclick="showPow('+row.rid+')">';
			        }}
			    ]]  
			}) 
						/* 给用户赋角色 */
			function showPow(rid){
				$('#role1').dialog({    
				    title: '角色',    
				    width: 400,    
				    height: 200,
				    content:'<ul id="powMsg1"></ul>',
				    buttons:[{
	                	  text:'确定',
	                	  handler:function(){
	                		  var nodes = $('#powMsg1').tree('getChecked');/* 选中的角色的复选框 */
	                		  var ids = new Array();
	                		 
	                		  for (var i = 0; i < nodes.length; i++) {
								ids.push(nodes[i].id)                    
							  }
	                		
	                		  $.ajax({
	                			  url:"<%=path%>/pow/setPow.action",
	                			  type:"post",
	                			  data:{"rid":rid,"ids":ids},
	                			  dataType:"json",
	                			  success:function(data){
	                				  if(data.success){
	                					  $.messager.alert('提示','修改成功!');
	                					  $('#role1').dialog("close");
	                				  }else{
	                					  $.messager.alert('警告','修改失败!');
	                				  }
	                			  }
	                		  })
	                	  }
					    }
			    		]
				}); 
				$("#powMsg1").tree({
					checkbox:true,
					url:"<%=path%>/pow/getPow.action?rid="+rid
				})
				
			}
			/* 修改角色信息 */
 		 	function Up(rid,rname){
		
				$('#add1').dialog({    
				    title: '修改用户',    
				    width: 400,   
				    height: 200,    /* 点击修改时带参数 */
				    href:'<%=path%>/Role/toAddR.action?rid='+rid+'&rname='+rname,
				    buttons:[{
	                	  text:'修改',
	                	  handler:function(){
	                		  var rname = $("#rname").val();
	                		  var rid = $("#rid").val();
	                		  alert("你确定要改");
	                		  $.ajax({
	                			  url:'<%=path%>/Role/upRole.action',
	                			  type:'post',
	                			  data:{"rname":rname,"rid":rid},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add1').dialog("close");
	                					 $("#UserData1").datagrid("reload");
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
					    	  $("#rname").textbox("setText","");
					    	
					      }
					    }
			    		]
				    
				}); 
			}  
			
		 	
			function del(){
				
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#UserData1").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].rid;
				}
				ids = ids.substr(1);
			alert(ids);
				$.post({
					url:"<%=path%>/Role/delByIds.action",
					data:{"rids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData1").datagrid("reload");
						}
					}
				})
			}  
			function delOne(rid){
				alert(rid);
				$.post({
					url:"<%=path%>/Role/delOne.action",
					data:{"rid":rid},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData1").datagrid("reload");
						}
					}
				})
			}
			 
			function addView(){
				$('#add1').dialog({    
				    title: '添加用户',    
				    width: 400,    
				    height: 200,
				    href:'<%=path%>/Role/toAddR.action', /*跳转到添加页面  */
				    buttons:[{
	                	  text:'新增',
	                	  handler:function(){
	                		
	                		  var rname = $("#rname").val();
	                		  
	                		  $.ajax({
	                			  url:'<%=path%>/Role/addRole.action',     /* 添加数据 */
	                			  type:'post',
	                			  data:{"rname":rname},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add1').dialog("close");
	                					 //$('#add').dialog("clear");
	                					 $("#UserData1").datagrid("reload");
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
					    	  $("#rname").textbox("setText","");
					    	 
					      }
					    }
			    		]
				    
				});  
			}  
		</script>
</body>

</html>