<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>用户添加</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<form action="UserServlet?cmd=UserFile&act=insertUser" id="useraddForm" name="useraddForm" method="post" enctype="multipart/form-data">
			<div class="content">
			<input type="hidden" name="act" value="insertUser"/>
				<table class="box">
					<tr>
						<td class="field">用户名称：</td>
						<td><input type="text" name="userName" class="text"
							id="userName" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户密码：</td>

						<td><input type="password" name="userPassword" class="text"
							id="userPassword" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input type="password" name="userPassword2"
							id="userPassword2" class="text" /> <font color="red">*</font></td>
					</tr>

					<tr>
						<td class="field">用户性别：</td>
						<td><select name="userSex" id="userSex">
								<option value="男">男</option>
								<option value="女">女</option>
						</select></td>
					</tr>

					<tr>
						<td class="field">用户年龄：</td>
						<td><input type="text" name="userAge" class="text"
							id="userAge" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><input type="text" name="telephone" class="text"
							id="telephone" /> <font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td><textarea name="address" id="address" class="text"
								cols="45" rows="5"></textarea></td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>

						<td><input type="radio" name="type" id="radiopt" value="1"/>普通用户
						 <input type="radio" name="type" id="radiojl" value="0" />经理&emsp;&emsp;
						 <font color="red">*</font>
						 </td>
					</tr>
					<tr>
						<td class="field">用户头像：</td>
						<td><input type="file" name="pic" id="pic" class="text" /></td>

					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="button" name="button" id="button" value="数据提交"
				 onclick="CheckForm();" 	class="input-button"/> 
					<input type="button" name="button" id="button" value="返回" class="input-button" onclick="window.location='UserServlet?cmd=selectUsers';"  />
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function CheckForm() {
			var useraddForm = document.getElementById("useraddForm");
			var userPassword = document.getElementById("userPassword").value;
			var userPassword2 = document.getElementById("userPassword2").value;
			if (
					CheckItems("userName") 
					&& CheckItems("userSex")
					&& CheckItems("userAge") 
					&& CheckItems("telephone")
					&& CheckItems("address")
					&& CheckItems("pic") 
					&& CheckItems("userPassword")
					&& CheckItems("userPassword2")
					) 
			{
				alert("添加");
				if (userPassword == userPassword2) {
						useraddForm.submit();
				} else {
					alert("两次密码不一致，请重新输入！");
				}
			} else {
				alert("请填写完成的信息！");
			}
		}
		function CheckItems(id) {
			var ider = document.getElementById(id).value;
			if (ider != null && ider != "") {
				return true;
			} else {
				return false;
			}
		}
	</script>

</body>
</html>