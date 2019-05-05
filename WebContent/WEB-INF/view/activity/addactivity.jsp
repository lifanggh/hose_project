<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% String path=request.getContextPath(); %>
    <title>Insert title here</title>
</head>
<body>
      <form id="dataActivity" >
         <input type="hidden" id="acid" value="${activity.acid}">
     <table  align="center" >
         <tr><td>活动日期:</td>
             <td><input type="text" data-options="required:true" class="easyui-textbox" id="acdatatime" value="${activity.acdatatime}"></td>
         </tr>
         <tr><td>活动主题:</td>
             <td><input type="text"  data-options="required:true" class="easyui-textbox" id="actheme" value="${activity.actheme}" ></td>
         </tr>
         <tr><td>活动内容介绍:</td>
             <td><input type="text" class="easyui-textbox" id="accontent" value="${activity.accontent}" ></td>
         </tr>
         <tr><td>活动地点:</td>
             <td><input type="text" data-options="required:true" class="easyui-textbox" id="acwhere" value="${activity.acwhere}" ></td>
         </tr>
         <tr><td>费用:</td>
             <td><input type="text" data-options="required:true" class="easyui-numberbox" id="acmoney" value="${activity.acmoney}" ></td><td>小于1000</td>
         </tr>
         <tr><td>活动组织方:</td>
             <td><input type="text" data-options="required:true" class="easyui-textbox" id="acpeople" value="${sessionScope.user.name}" ></td>
         </tr>
         <tr><td>
               <c:choose>
                    <c:when test="${activity.acid!=null}">
                         <a class="easyui-linkbutton" id="updataActivity" >修改</a>
                    </c:when>
                    <c:otherwise>
                       <a class="easyui-linkbutton" id="insertActivity" >添加</a>
                    </c:otherwise>
               </c:choose>
               </td>
             <td><a class="easyui-linkbutton" onclick="formreset()">重置</a></td>
         </tr>
     </table>
     </form>
     <script type="text/javascript">
        	 
        	 
          $("#updataActivity").click(function(){
        	  var acdatatime=$("#acdatatime").val();
         	 var actheme=$("#actheme").val();
         	 var accontent=$("#accontent").val();
         	 var acwhere=$("#acwhere").val();
         	 var acmoney=$("#acmoney").val();
         	 var acpeople=$("#acpeople").val();
        	 var acid=$("#acid").val();
        	    $.ajax({
        		  url:"<%=path%>/ActivityManager/updaActivity.do",
					data:{"acid":acid,"acdatatime":acdatatime,"actheme":actheme,"accontent":accontent,"acwhere":acwhere,"acmoney":acmoney,"acpeople":acpeople},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.success){
							alert("修改成功");
							$("#tab").tabs("close","添加/修改公寓活动信息");
							$("#ActivityData").datagrid("reload");
						}else{
							alert("修改失败");
						}
					}
        	  })
			
          })
         $("#insertActivity").click(function(){
        	 var acdatatime=$("#acdatatime").val();
        	 var actheme=$("#actheme").val();
        	 var accontent=$("#accontent").val();
        	 var acwhere=$("#acwhere").val();
        	 var acmoney=$("#acmoney").val();
        	 var acpeople=$("#acpeople").val();
        	 $.ajax({
					url:"<%=path%>/ActivityManager/addActivity.do",
					data:{"acdatatime":acdatatime,"actheme":actheme,"accontent":accontent,"acwhere":acwhere,"acmoney":acmoney,"acpeople":acpeople},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.success){
							alert("添加成功");
							$("#tab").tabs("close","添加/修改公寓活动信息");
							$("#ActivityData").datagrid("reload");
						}else{
							alert("添加失败");
						}
					}
					})
        	 
         })
         $("#dataActivity").form({
			novalidate:true
		 });
         function formreset(){
        	 /* alert("333"); */
        	 $("#dataActivity").form("clear");
         }
     </script>
     
</body>
</html>