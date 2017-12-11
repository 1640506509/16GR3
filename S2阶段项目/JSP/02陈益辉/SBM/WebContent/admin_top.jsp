<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
a{
text-decoration:none;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="header">
	<div class="title"></div>
	<div class="welcome">欢迎您：${user.userName }&emsp;&emsp;&emsp;<a href="PwdUp.jsp?userName=${user.userName }" target="mainFrame">修改密码</a>&emsp;&emsp;&emsp;&emsp;&emsp;当前在线人数为:${fn:length(users) }<br/>
	分别是：<c:forEach items="${users }" var="v">
		${v.userName }&emsp;
	</c:forEach>
	</div>
</div>
</body>
</html>
          