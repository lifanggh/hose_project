<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <% String path=request.getContextPath(); %>
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

 
    <form id="dataContract">
          <input type="hidden" name="coid" value="${Contract.coid}"> 
		<table align="center">
		     <tr>
		        <td>房屋信息编号</td>
		        <td><input type="text" value="${Contract.cohid.hid}"
					data-options="required:true" class="easyui-numberbox" name="hid"></td>
		      </tr>
		      <tr>
		        <td>添加用户名</td>
		        <td><input type="text" value="${Contract.cotid.tname}"
		        class="easyui-textbox" data-options="required:true" name="tname"></td>
		     </tr>
			<c:choose>
				<c:when test="${Contract.coid!=null}">
					<tr>
						<td>合同修改日期</td>
						<td><input type="text" value="${Contract.codata}" data-options="required:true"
							class="easyui-textbox" name="codata"></td>
					</tr>
					<tr>
						<td>租赁开始时间</td>
						<td><input type="text" data-options="required:true" value="${Contract.cobegin}"
							class="easyui-textbox" name="cobegin"></td>
					</tr>
				</c:when>
			</c:choose>
			<tr>
				<td>租赁结束时间</td>
				<td><input type="text" class="easyui-textbox" name="coend"
					data-options="required:true" value="${Contract.coend}"></td>
			</tr>
			<tr>
				<td>房租总额</td>
				<td><input type="text" data-options="required:true"
					class="easyui-numberbox" name="cohrental" value="${Contract.cohrental}"></td>
			</tr>
			<tr>
				<td>付款方式</td>
				<td><input type="text" data-options="required:true" value="${Contract.comway}"
				class="easyui-textbox" name="comway"></td>
				<td></td>
			</tr>
			<tr>
				<td>押金</td>
				<td><input type="text" data-options="required:true"
					class="easyui-numberbox" name="coyajin" value="${Contract.coyajin}"></td>
				<td></td>
			</tr>
			<tr>
				<td>付款期数</td>
				<td><input type="text" data-options="required:true"
					class="easyui-numberbox" name="coperiods" value="${Contract.coperiods}"></td>
				<td></td>
			</tr>
			<tr>
				<td>合同签署人</td>
				<td><input type="text" data-options="required:true"
					class="easyui-textbox" name="coconpeo" value="${Contract.coconpeo}"></td>
				<td></td>
			</tr>
			<tr>
				<td>合同状态</td>
				<td>
					<input type="radio"  name="coconzt" checked value="0">未生效
					<input type="radio"  name="coconzt" ${Contract==null?'':Contract.coconzt==1?'checked':''} value="1">已生效
					</td>
				<td></td>
			</tr>
            <tr><td>
             <c:choose>
                    <c:when test="${Contract.coid!=null}">
                         <input type="button" value="修改" onclick="upContrcat()">
                    </c:when>
                    <c:otherwise>
                       <input type="button" value="添加" onclick="addContrcat()">
                    </c:otherwise>
               </c:choose>
            </td><td><input type="button" value="重置" onclick="showContrcat()"></td></tr>
		</table>
	</form>
	<script type="text/javascript">
	     function upContrcat(){  
	    	 var form1 = new FormData(document.getElementById("dataContract"));
	    	 $.ajax({
	    		 url:"<%=path%>/ContractManager/upContract.do",
					data:form1,
					type:"post",
					dataType:"json",
					contentType: false,
					processData: false,
					success:function(data){
					     if(data.success){
					    	 alert("修改成功");
							 $("#tab").tabs("select","租赁合同查询与删除");
							 $('#contractData').datagrid("reload");
						     $("#dataContract").tabs("close","租赁合同添加与编辑");
					     }else{
					    	 alert("失败");
					    	 alert(data.mags);
					     }
					}
					})
	     }
	     $("#dataContract").form({
			novalidate:true
		 });
	     function showContrcat(){
	    	 $("#dataContract").form("reset");
	     }
	     function addContrcat(){
	    	
	    	 var form1 = new FormData(document.getElementById("dataContract"));
	    	 $.ajax({
					url:"<%=path%>/ContractManager/AddContract.do",
					data:form1,
					type:"post",
					dataType:"json",
					contentType: false,
					processData: false,
					success:function(data){
					     if(data.success){
					    	 if(!$("#tab").tabs("exists","租赁合同查询与删除")){
							    	//不存在的情况下 添加新的选项卡
							    	$("#tab").tabs("add",{
							    		title:"租赁合同查询与删除",
							    		closable:true,
							    		fit:true,
							    		href:"<%=path%>/ContractManager/toContract.do"
							    	})
							    }else{
							    	//存在的话切换到选择的选项卡
							    	$("#tab").tabs("select","租赁合同查询与删除");
							    	$('#contractData').datagrid("reload");
							    }
						    	$("#dataContract").tabs("close","租赁合同添加与编辑");
					     }else{
					    	 alert(data.mags);
					     }
					}
					})
	    
	     }
	     
	</script>
</body>
</html>