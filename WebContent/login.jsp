<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path = request.getContextPath();%>
<style>
#zc{
 margin-bottom: 5px;
 }
</style>
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
	<body >
		<div id="dd" class="easyui-dialog" title="系统登录" style="width:300px;height:200px;">
			
			<table align="center" style="padding-top: 20px">
				<tr>
					<td>用户名</td>
					<td><input id="name" type="text" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input id="pass" type="password" class="easyui-textbox"></td>
				</tr>
				
				<tr>
			
			     
			<input type="button" value="哈哈" onclick="on()">
			
			</tr>
			
			</table>
			
		</div>  
	</body>
	<script type="text/javascript">
	
	function on(){
		location="<%=path%>/add.action";
	}
	
	
	
/* 登录 */
		$('#dd').dialog({     
		    closable:false,
		    draggable:false,
		    resizable:false,
		    buttons:[{
                	  text:'登陆',
                	  handler:function(){
                		  var name =  $("#name").val();
                		  var pass =  $("#pass").val();
                		  $.ajax({
                			 
                			  url:'<%=path%>/login.action',
                			  type:'post',
                			  data:{"name":name,"pass":pass},
                			  dataType:'json',
                			  success:function(data){
                				  if(data.success){
   
                					location="<%=path%>/index.action"  
                				  }else{
                					  alert(data.msg);
                				  }
                			  },
                			  error:function(){ }
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
	</script>
</html>