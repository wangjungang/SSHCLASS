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
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center"><span class="STYLE10">用户id</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">密码</span></div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">性别</span></div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年龄</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户联系方式</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户职位</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <form method="post" id="updateform">
      	<tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><input type="hidden" name="updateId" value="<c:out value="${iId}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" name="sLoginName" value="<c:out value="${sName}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="sPassword" value="<c:out value="${sPassword}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
        		<select name="sSex">
        			</option><option value="<c:out value="${sSex}"/>"><c:out value="${sSex}"/></option><option value="男">男</option><option value="女">女</option><option value="保密">保密</option>
       			</select></div></td></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="iAge" value="<c:out value="${iAge}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="sPhone" value="<c:out value="${sPhone}"/>"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
        		<select name="sPosition">
        			<option value="<c:out value="${sPosition}"/>"><c:out value="${sPosition}"/></option><option value="测试员工">测试员工</option><option value="开发员工">开发员工</option><option value="项目经理">项目经理</option><option value="管理员">管理员</option>
       			</select></div></td></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21">
        	<input type="button" value="修改" onclick="myupdate()" /></div></td>
     	 </tr>
      </form>
    </table></td>
  </tr>
</table>

</body>
<script type="text/javascript">
	function myupdate(){
		var updateform=document.getElementById("updateform");
		updateform.action="updateRow.action";
		alert("确定修改！");
		updateform.submit();
	}
</script>
</html>