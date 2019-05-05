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
	<div id="add12"></div>
	<div id="role1"></div>
	<table id="UserData12"></table>
	<script type="text/javascript">
		
			$("#UserData12").datagrid({
				url:"<%=path%>/pow/getPowAll.action",
				fit:true,
			 	columns:[[    
			        {field:'cc',checkbox:true},  
			        {field:'pid',title:'权限编号'},          
			        {field:'pname',title:'权限名'},
			        {field:'xx',title:'功能',formatter:function(value,row,index){
return '<input type="button" value="删除" onclick="delOne('+row.pid+')"><input type="button" value="修改" onclick="Up('+row.pid+',\''+row.pname+'\')">';
			        }}
			    ]]  
			}) 
<%-- 		/* 给用户赋角色 */
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
				$("#powMsg1").tree({
					checkbox:true,
					url:"<%=path%>/pow/getPow.action?rid="+rid
				})
				
			} --%>
			/* 修改角色信息 */
 		 	function Up(pid,pname){
		
				$('#add12').dialog({    
				    title: '修改用户',    
				    width: 400,   
				    height: 200,    /* 点击修改时带参数 */
				    href:'<%=path%>/pow/toAddpow.action?pid='+pid+'&pname='+pname,
				    buttons:[{
	                	  text:'修改',
	                	  handler:function(){
	                		  var pname = $("#pname").val();
	                		  var pid = $("#pid").val();
	                		  alert("你确定要改");
	                		  $.ajax({
	                			  url:'<%=path%>/pow/upPow.action',
	                			  type:'post',
	                			  data:{"pname":pname,"pid":pid},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add12').dialog("close");
	                					 //$('#add').dialog("clear");
	                					 $("#UserData12").datagrid("reload");
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
					    	  $("#pname").textbox("setText","");
					    	
					      }
					    }
			    		]
				    
				}); 
			}  
			
		 	
			function del(){
				
				//获取所有被选中的行   返回值为一个数组  数组中放的row对象
				//row 代表一整行的数据
				var rows =  $("#UserData12").datagrid("getSelections")
				//拼接id
				var ids='';
				for (var i = 0; i < rows.length; i++) {
					ids+=","+rows[i].pid;
				}
				ids = ids.substr(1);
				$.post({
					url:"<%=path%>/pow/delByIds.action",
					data:{"ids":ids},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData12").datagrid("reload");
						}
					}
				})
			}  
			function delOne(pid){
				
				$.post({
					url:"<%=path%>/pow/delOne.action",
					data:{"pid":pid},
					dataType:"json",
					success:function(data){
						if(data.success){
							$("#UserData12").datagrid("reload");
						}
					}
				})
			}
			 
			function addView(){
				$('#add12').dialog({    
				    title: '添加权限',    
				    width: 400,    
				    height: 200,
				    href:'<%=path%>/pow/toAddpow.action', /*跳转到添加页面  */
				    buttons:[{
	                	  text:'新增',
	                	  handler:function(){
	                		
	                		  var pname = $("#pname").val();
	                		  
	                		  $.ajax({
	                			  url:'<%=path%>/pow/addpow.action',     /* 添加数据 */
	                			  type:'post',
	                			  data:{"pname":pname},
	                			  dataType:'json',
	                			  success:function(data){
	                				 if(data.success){
	                					 $('#add12').dialog("close");
	                					 //$('#add').dialog("clear");
	                					 $("#UserData12").datagrid("reload");
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
					    	  $("#pname").textbox("setText","");
					    	 
					      }
					    }
			    		]
				    
				});  
			}  
		</script>
</body>

</html>