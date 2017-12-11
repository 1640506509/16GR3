<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>用户管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("确认删除吗？")!=true)
			return;
	}
}
</script>
</head><body>
<c:if test="${!empty param.sele }">
<script type="text/javascript">
alert("用户查询失败！");
</script>
</c:if>
<c:if test="${!empty param.ups }">
<scipt>
alert("用户修改失败！");
</scipt>
</c:if>
<div class="menu">

<table>
<tbody><tr><td><form method="post" action="UserServlet?cmd=getUser">
<input name="flag" value="search" class="input-text" type="hidden">
用户名称：<input name="userName" class="input-text" type="text">&nbsp;&nbsp;&nbsp;&nbsp; <input value="查 询" type="submit">
</form></td></tr>
</tbody></table>
</div>
<div class="main">
<div class="optitle clearfix">
<em><input value="添加数据" class="input-button" onclick="window.location='userAdd.jsp'" type="button"></em>
		<div class="title">用户管理&gt;&gt;</div>
	</div>
	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
    <td width="80"><div class="STYLE1" align="center">用户名称</div></td>
    <td width="100"><div class="STYLE1" align="center">性别</div></td>
    <td width="100"><div class="STYLE1" align="center">年龄</div></td>
    <td width="150"><div class="STYLE1" align="center">电话 </div></td>
    <td width="150"><div class="STYLE1" align="center">地址 </div></td>
    <td width="150"><div class="STYLE1" align="center">权限 </div></td>
    <c:if test="${sessionScope.user.type == 0 }">
    <td width="150"><div class="STYLE1" align="center">操作 </div></td>
    </c:if>
  </tr>
  <c:forEach items="${pagebean.data }" var="user">
    <td><span class="STYLE1">${user.userId }</span></td>
    <td><span class="STYLE1">${user.userName }</a></span></td>
    <td><span class="STYLE1">${user.userSex }</span></td>
    <td><span class="STYLE1">${user.userAge }</span></td>
    <td><span class="STYLE1">${user.telephone }</span></td>
    <td><span class="STYLE1">${user.address }</span></td>
    <c:if test="${user.type == 0 }">
    <td><span class="STYLE1">管理员</span></td>
    </c:if>
     <c:if test="${user.type == 1 }">
    <td><span class="STYLE1">普通职员</span></td>
    </c:if>
    <td><span class="STYLE1"><a href="UserServlet?cmd=retrievalUser&userId=${user.userId }">修改</a>&emsp;<a href="UserServlet?cmd=delUser&userId=${user.userId }">删除</a></span></td>
  </tr>
   </c:forEach>
</tbody>
</table>
共${pagebean.count }条记录,&nbsp第${pagebean.p }页/共${pagebean.pagetotal }页&nbsp <a
			href="UserServlet?cmd=getUser&p=1&userName=${pagebean.data[0].userName }">首页</a>&nbsp <a
			href="UserServlet?cmd=getUser&p=${pagebean.p-1 }&userName=${pagebean.data[0].userName }">上一页</a>&nbsp <a
			href="UserServlet?cmd=getUser&p=${pagebean.p+1 }&userName=${pagebean.data[0].userName }">下一页</a>&nbsp <a
			href="UserServlet?cmd=getUser&p=${pagebean.pagetotal }&userName=${pagebean.data[0].userName }">尾页</a>&nbsp跳到第
			 <select id="s1" onchange=toPage(this.value);>
			 <c:set var="i" value="0"  scope="page" />
			<c:forEach begin="1" end="${pagebean.pagetotal }" step="1">
			<c:set var="i" value="${i+1 }"/>
				<option value="${i }" ${i == pagebean.p?"selected":"" }>${i }</option>
			</c:forEach>
		</select> 页
</div>
</div>
<script type="text/javascript">
function toPage(a){
	location="UserServlet?cmd=getUser&p="+a+"&userName="+${pagebean.data[0].userName };
}
function setP(){
	document.getElementById("s1").value="${pagebean.p}";
}
</script>

</body></html>         