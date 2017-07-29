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
                <td width="94%" valign="bottom"><span class="STYLE1"> 项目基本信息列表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkbox11" id="checkbox11" />
           	   全选      &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> 
           	   添加   &nbsp; <img src="images/del.gif" width="10" height="10" /> 
           	   删除    &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" />
           	    编辑   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center"><span class="STYLE10">项目id</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">项目名</span></div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">项目类型</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工1</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工2</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工3</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工4</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工5</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <form method="post" id="updateform">
      	<tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><input type="hidden" name="updateId" value="<c:out value="${iId}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" name="sPname" value="<c:out value="${sPname}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><c:out value="${sType}"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" name="iPerson1" value="<c:out value="${iPerson1}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="iPerson2" value="<c:out value="${iPerson2}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" name="iPerson3" value="<c:out value="${iPerson3}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="iPerson4" value="<c:out value="${iPerson4}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="iPerson5" value="<c:out value="${iPerson5}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21">
        	<input type="button" value="分配" onclick="myupdate()" /></div></td>
     	 </tr>
      </form>
    </table></td>
  </tr>
  <tr>
  	<td>
  		<table>
  		<tr><td colspan="3">通过下面的表选择（1-5个），不能重复，可以为空.</td></tr>
  			<tr><td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center"><span class="STYLE10">员工id</span></div></td>
        		<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工姓名</span></div></td>
        		<td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">员工职位</span></div></td>
        	</tr>
        <c:forEach items="${emplist}" var="map" varStatus="listStatus">
      	<tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.iId }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.sName}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${map.sPosition}</div></td>
      </c:forEach>
  	</td>
  </tr>
</table>

</body>
<script type="text/javascript">
	function myupdate(){
		var updateform=document.getElementById("updateform");
		updateform.action="updateprojectRow.action";
		alert("确定分配！");
		updateform.submit();
	}
</script>
</html>
