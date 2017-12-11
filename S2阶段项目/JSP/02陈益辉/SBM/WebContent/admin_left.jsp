<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body class="frame-bd">
<ul class="left-menu">
	<li><a href="admin_bill_list.jsp" target="mainFrame"><img src="images/btn_bill.gif" /></a></li>
	<c:if test="${user.type == 0 }">
	<li><a href="ProviderServlet?cmd=selectProviders" target="mainFrame"><img src="images/btn_suppliers.gif" /></a></li>
	<li><a href="UserServlet?cmd=selectUsers" target="mainFrame"><img src="images/btn_users.gif" /></a></li>
	</c:if>
	<li><a href="UserServlet?cmd=exit" onClick="javaScript:alert('这里实现退出操作！')"><img src="images/btn_exit.gif" /></a></li>
</ul>
</body>
</html>