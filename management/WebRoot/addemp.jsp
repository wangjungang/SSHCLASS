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
<form method="post" id="myform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
        <div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">密码</span></div></td>
        <td width="13%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年龄</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">性别</span></div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系方式</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">职位</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox2" id="checkbox2" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19"><input type="text" name="sLoginName"/></span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="sPassword"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="iAge"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
        		<select name="sSex">
        			<option value="男">男</option><option value="女">女</option><option value="保密">保密</option>
       			</select></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" name="sPhone"/></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
        		<select name="sPosition">
        			<option value="测试员工">测试员工</option><option value="开发员工">开发员工</option><option value="项目经理">项目经理</option><option value="管理员">管理员</option>
       			</select></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"><input type="button" value="添加" onclick="myAdd()" /> </div></td>
      </tr>
	</table></td>
	</tr>
</table>
</form>
</body>
<script type="text/javascript">
	function myAdd(){
		var myform=document.getElementById("myform");
		myform.action="addemp.action";
		myform.submit();
	}
</script>
</html>