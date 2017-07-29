<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<script language="javascript">
	jQuery().ready(function(){
		jQuery('#navigation').accordion({
			header: '.head',
			navigation1: true, 
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'
		});
	});
</script>
<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
<script type="text/javascript">
	function add(){
		var position=document.getElementById("position");
		var add=document.getElementById("add");
		if(position.value=="管理员"){
			add.href="addemp.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	
	function select(){
		var position=document.getElementById("position");
		var add=document.getElementById("select");
		if(position.value=="管理员"){
			add.href="welcome.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function selectproject(){
		var position=document.getElementById("position");
		var add=document.getElementById("selectproject");
		if(position.value=="项目经理"){
			add.href="indirect.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function addproject(){
		var position=document.getElementById("position");
		var add=document.getElementById("addproject");
		if(position.value=="项目经理"){
			add.href="addproject.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function allot(){
		var position=document.getElementById("position");
		var add=document.getElementById("allot");
		if(position.value=="项目经理"){
			add.href="indirect1.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function selectprogress(){
		var position=document.getElementById("position");
		var add=document.getElementById("selectprogress");
		if(position.value=="测试员工"||position.value=="开发员工"){
			add.href="indirect2.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function submitprogress(){
		var position=document.getElementById("position");
		var add=document.getElementById("submitprogress");
		if(position.value=="测试员工" ||position.value=="开发员工"){
			add.href="indirect2.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function selectassess(){
		var position=document.getElementById("position");
		var add=document.getElementById("selectassess");
		if(position.value=="项目经理"){
			add.href="indirect3.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
	function insertassess(){
		var position=document.getElementById("position");
		var add=document.getElementById("insertassess");
		if(position.value=="项目经理"){
			add.href="indirect3.jsp";
		}else{
			alert("您没有此权限！");
		}
	}
</script>
<div>
	<input type="hidden" id="position" value="<%Map<String,Object> map=new HashMap<String,Object>();
	map=(Map<String,Object>)session.getAttribute("sessionMap");
	out.print(map.get("sPosition")); %>" />
</div>
<div  style="height:100%;">
  <ul id="navigation">
    <li> <a class="head">员工管理</a>
      <ul>
        <li><a target="rightFrame" id="add" onclick="add()">添加员工</a></li>
        <li><a target="rightFrame" id="select" onclick="select()">查看员工信息</a></li>
      </ul>
    </li>
    <li> <a class="head">项目管理</a>
      <ul>
        <li><a  target="rightFrame" id="addproject" onclick="addproject()">添加项目</a></li>
        <li><a  target="rightFrame" id="selectproject" onclick="selectproject()">查看项目信息</a></li>
        <li><a  target="rightFrame" id="allot" onclick="allot()">项目分配</a></li>
      </ul>
    </li>
    <li> <a class="head">项目进度管理</a>
      <ul>
        <li><a  target="rightFrame" id="selectprogress" onclick="selectprogress()">查看项目进度</a></li>
        <li><a  target="rightFrame" id="submitprogress" onclick="submitprogress()">提交项目进度</a></li>
      </ul>
    </li>
    <li> <a class="head">项目评价管理</a>
      <ul>
        <li><a  target="rightFrame" id="selectassess" onclick="selectassess()">查看项目评价</a></li>
        <li><a  target="rightFrame" id="insertassess" onclick="insertassess()">进行项目评价</a></li>
      </ul>
    </li>
    <li> <a class="head">版本信息</a>
      <ul>
        <li><a href="http://Www.865171.cn" target="_blank">by fengxin</a></li>
      </ul>
    </li>
  </ul>
</div>
</body>
</html>
