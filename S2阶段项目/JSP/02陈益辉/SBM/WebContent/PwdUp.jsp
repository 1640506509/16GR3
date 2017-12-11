<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>供应商添加</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<c:if test="${! empty param.PwdUp }">
<script type="text/javascript">
alert("密码修改失败！");
</script>
</c:if>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">密码修改&gt;&gt;</div>
	</div>
	<form id="upPwdform" name="upPwdform" method="post" action="UserServlet?cmd=upPwd">
		<div class="content">
		<font color="red"></font>
<input name="flag" value="doAdd" type="hidden">
			<table class="box">
			<tbody><tr>
					<td class="field">用户名称：</td>
					<td>${param.userName }</td>
				</tr>
				<tr>
					<td class="field">密码：</td>
					<td><input name="userPassword" id="userPassword" class="text" type="password"> <font color="red">*</font></td>

				</tr>
			<tr>
					<td class="field">确认密码：</td>
					<td><input name="userPassword2" id="userPassword2" class="text" type="password"> <font color="red">*</font></td>
			</tbody></table>
		</div>

		<div class="buttons">
			<input name="button" id="button" value="提交" class="input-button" type="button" onclick="CheckPwd();"> 
			<input name="button" id="button" onclick="history.back();" value="返回" class="input-button" type="button"> 
		</div>
	</form>
</div>
<script type="text/javascript">
function CheckPwd(){
	var upPwdform=document.getElementById("upPwdform");
	var userPassword =document.getElementById("userPassword").value;
	var userPassword2 =document.getElementById("userPassword2").value;
	if(userPassword !="" && userPassword2 != "" ){
		if(userPassword == userPassword2){
			upPwdform.submit();
		}else{
			alert("密码必须一致才可修改！！！");
		}
	}else{
		alert("内容为空，请重新填写！");
	}
}
</script>
</body>
</html>