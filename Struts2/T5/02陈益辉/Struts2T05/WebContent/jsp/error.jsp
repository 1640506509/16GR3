<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center" style="color: red;">错误页面</h2><br />
<s:property value="user.toString()"/><br>
<br>
<s:property value="user.birthday"/><br>

<s:property value="exception.message"/><br>
<s:property value="exceptionStack"/>
</body>
</html>