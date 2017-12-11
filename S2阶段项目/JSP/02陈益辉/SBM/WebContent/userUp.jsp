<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>用户添加</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
userId:${requestScope.u.userId }
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<form action="UserServlet?cmd=UserFile" id="upAForm" name="upAForm" method="post" enctype="multipart/form-data">
			<div class="content">
			<input type="hidden" name="act" value="upUser"/>
			<input type="hidden" name="userId" value="${requestScope.u.userId }"/>
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
								<option value="男" >男</option>
								<option value="女" >女</option>
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

						<td><input type="radio" name="type" id="radiopt" value="1"/>普通职工
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
				<input type="button" name="button" id="button" value="确认修改"
				 onclick="CheckForm();" 	class="input-button"/> 
					<input type="button" name="button" id="button" onclick="window.location='UserServlet?cmd=selectUsers';" 
					value="返回" class="input-button" />
			</div>
		</form>
	</div>

<c:if test="${!empty requestScope.u}">
<script type="text/javascript">
			document.getElementById("userName").value = "${requestScope.u.userName }";
			document.getElementById("userPassword").value = "${requestScope.u.userPassword }";
			document.getElementById("userPassword2").value = "${requestScope.u.userPassword }";
			document.getElementById("userAge").value = "${requestScope.u.userAge }";
			document.getElementById("telephone").value = "${requestScope.u.telephone }";
			document.getElementById("address").value = "${requestScope.u.address }";
			document.getElementById("pic").value = "${requestScope.u.pic }";
			document.getElementById("userSex").value = "${requestScope.u.userSex }";
		</script>
		<c:choose>
		<c:when test="${requestScope.u.userSex eq '男'}">
		<script>
		document.getElementById("userSex")[0].selected = "selected";
		</script>
		</c:when>
		<c:when test="${requestScope.u.userSex eq '女'}">
		<script>
		document.getElementById("userSex")[1].selected = "selected";
		</script>
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${requestScope.u.type == 1  }">
		<script>
		document.getElementById("radiopt").checked = "checked";
		</script>
		</c:when>
		<c:when test="${requestScope.u.type == 0  }">
		<script>
		document.getElementById("radiojl").checked = "checked";
		</script>
		</c:when>
		</c:choose>
	</c:if>
	
	<script type="text/javascript">
		
		function CheckForm() {
			var upAForm = document.getElementById("upAForm");
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
				if (userPassword == userPassword2) {
					upAForm.submit();
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