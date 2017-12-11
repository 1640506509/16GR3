<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录 - 超市账单管理系统</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body class="blue-style">
<c:if test="${!empty param.detection}">
<script>
alert("登录失败！");
</script>
</c:if>
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form id="loginForm" method="post" action="UserServlet?cmd=login">
			<dl>
				<dt>用户名：</dt>
				<dd><input type="text" id="userName" name="userName" class="input-text" /></dd>
				<dt>密　码：</dt>
				<dd><input type="password" id="userPassword" name="userPassword" class="input-text" /></dd>
			</dl>
			<div class="buttons">
				<input type="button" value="登录系统" class="input-button" onclick="loginer()"/>
				<input type="reset" value="重　　填" class="input-button" />
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
function loginer() {
	var userName=document.getElementById("userName").value;
	var userPassword=document.getElementById("userPassword").value;
	if(userName != null && userName != "" && userPassword != null && userPassword != ""){
		document.getElementById("loginForm").submit();
	}else{
		alert("密码和账户不能为空！请重新登录！");
	}
}
</script>
</body>
</html>