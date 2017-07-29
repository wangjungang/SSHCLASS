<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>项目管理工作平台 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/js.js"></script>
</head>
<body>
<div id="top"> </div>
<form id="login" method="post">
  <div id="center">
    <div id="center_left"></div>
    <div id="center_middle">
      <div class="user">
        <label>用户名：
        <input type="text" name="sLoginName" id="username" />
        </label>
      </div>
      <div class="user">
        <label>密　码：
        <input type="password" name="sPassword" id="password" />
        </label>
      </div>
    </div>
    <div id="center_middle_right"></div>
    <div id="center_submit">
      <div class="button"> 
      	 <img src="images/dl.gif" width="57" height="20" onclick="return doSubmit(1)" > 
      </div>
      <div class="button"> 
     	 <img src="images/cz.gif" width="57" height="20" onclick="form_reset()" > 
      </div>
    </div>
    <div id="center_right"></div>
  </div>
</form>
<center>
<h3>
<c:out value="${msg }"/>
</h3>
</center>
<div id="footer"></div>
	<script type="text/javascript">
		function doSubmit(obj) {
    		if (document.getElementById("username").value == ""
  					|| document.getElementById("password").value == "") {
  					alert("用户名和密码必须填写");
  					return false;
  			}
    		var login = document.getElementById("login");
    		if (obj == 1) {
    			login.action = "login.action?name=fengxin&pwd=123456";
    			login.submit();
    		} else {
    			login.action = "login.action";
    			
    		}
    	}
	</script>
</body>
</html>
