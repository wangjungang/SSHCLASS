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
<form method="post" id="form">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" bgcolor="d3eaef" class="STYLE10"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <h3>用户详细信息:</h3></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
        </div></td>
        <td><center><table>
        	<tr><td><center><h3>用户id:<%Map<String,Object> map=new HashMap<String,Object>();
        				map=(Map<String,Object>)session.getAttribute("sessionMap"); 
        				out.print(map.get("iId"));%></h3></center></td></tr>
        	<tr><td><center><h3>用户名：<%out.print(map.get("sName"));%></h3></center></td></tr>
        	<tr><td><center><h3>密码：<%out.print(map.get("sPassword"));%></h3></center></td></tr>
        	<tr><td><center><h3>性别：<%out.print(map.get("sSex"));%></h3></center></td></tr>
        	<tr><td><center><h3>年龄：<%out.print(map.get("iAge"));%></h3></center></td></tr>
        	<tr><td><center><h3>职位：<%out.print(map.get("sPosition"));%></h3></center></td></tr>
        	<tr><td><center><h3>电话：<%out.print(map.get("sPhone"));%></h3></center></td></tr>
        	<tr><td><center><h3>增加时间：<%out.print(map.get("dtInsert"));%></h3></center></td></tr>
        	<tr><td><center><h3>修改时间：<%out.print(map.get("dtUpdate"));%></h3></center></td></tr>
        	<tr><td><center><table>
        	<tr>
        		<td><a href="welcome.jsp">返回</a></td>
        	</tr>	
        	</table></center></td></tr>
        </table></center></td>
      </tr>
        </table></td>
      </tr>
    </table>
    </form>
</body>
</html>
