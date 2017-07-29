<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 管理人员基本信息列表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkbox11" id="checkbox11" />
           	   全选      &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> 添加   &nbsp; <img src="images/del.gif" width="10" height="10" /> 删除    &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> 编辑   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">用户id</td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
        <td width="13%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年龄</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户职位</span></div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系方式</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">添加时间</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">修改时间</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <c:forEach items="${emplist}" var="map" varStatus="listStatus">
      	<tr>
        <td height="20" bgcolor="#FFFFFF">${map.iId}</td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19">${map.sName}</span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.iAge}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.sPosition}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.sPhone}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.dtInsert}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.dtUpdate}</div></td>
        <td height="20" bgcolor="#FFFFFF">
        	<input type="button" value="修改" onclick='myupdate(this.parentNode.parentNode)' />
        	<input type="button" value="删除" onclick='mydelete(this.parentNode.parentNode)' />  
        	<input type="button" value="查看" onclick='mydetails(this.parentNode.parentNode)' /></td>
     	 </tr>
      </c:forEach>
    </table></td>
  </tr>
  <form method="post" id="form">
      <div style="visibility:none">
     	 <tr><td><input type="hidden" id="lookId" name="iId"></td></tr>
      </div>
   </form>
   <form method="post" id="updateform">
      <div style="visibility:none">
     	 <tr><td><input type="hidden" id="updateId" name="iId"></td> </tr>
      </div>
   </form>
   <form method="post" id="deleteform">
      <div style="visibility:none">
     	 <tr><td><input type="hidden" id="deleteId" name="deleteId"></td></tr>
      </div>
   </form>
</table>
<div>
	<input type="hidden" id="position" value="<%Map<String,Object> map=new HashMap<String,Object>();
	map=(Map<String,Object>)session.getAttribute("sessionMap");
	out.print(map.get("sPosition")); %>" />
</div>
</body>
<script type="text/javascript">
	function myupdate(row){
		document.getElementById("updateId").value = row.cells[0].innerHTML;
		var position=document.getElementById("position");
		if(position.value=="管理员"){
			var updateform=document.getElementById("updateform"); 
			updateform.action="getRow.action";
			updateform.submit();  
		}else{
			alert("您没有此权限！");
		}          
	}
	
	function mydelete(row){
		document.getElementById("deleteId").value = row.cells[0].innerHTML;
		var position=document.getElementById("position");
		if(position.value=="管理员"){
			var myform=document.getElementById("deleteform");
			myform.action="deleteRow.action";
			myform.submit();  
		}else{
			alert("您没有此权限！");
		}    
	}
	
	function mydetails(row){
		document.getElementById("lookId").value = row.cells[0].innerHTML;
		var position=document.getElementById("position");
		if(position.value=="管理员"){
			var myform=document.getElementById("form");
			myform.action="getDetails.action";
			myform.submit();
		}else{
			alert("您没有此权限！");
		} 
	}
</script>
</html>