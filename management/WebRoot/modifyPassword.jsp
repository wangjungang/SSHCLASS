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
<form method="post" id="modifyform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
        </div></td>
        <td><center><table>
        	<tr><td><center><h3><input type="hidden" value="<%
        	Map<String,Object> map=new HashMap<String,Object>();
        	map=(Map<String,Object>)session.getAttribute("sessionMap");
        	out.print(map.get("iId")); %>" name="updateId"/></h3></center></td></tr>
        	<tr><td><center><h3>用户名：<input type=text name="sLoginName" value="<%out.print(map.get("sName"));%>"></h3></center></td></tr>
        	<tr><td><center><h3>原密码：<%out.print(map.get("sPassword")); %></h3></center></td></tr>
        	<tr><td><center><h3>新密码：<input type="text" id="sPassword" name="sPassword"></h3></center></td></tr>
        	<tr><td><center><table>
        	<tr>
        		<td><input type="reset" value="重置"></td>
        		<td><input type="button" value="确定" onclick="modifyPassword()" ></td>
        	</tr>	
        	</table></center></td></tr>
        </table></center></td>
      </tr>
        </table></td>
      </tr>
    </table>
    </form>
</body>
<script type="text/javascript">
	function modifyPassword(){
		var modifyform=document.getElementById("modifyform");
		modifyform.action="updateRow.action";
		modifyform.submit();
	}
</script>
</html>
