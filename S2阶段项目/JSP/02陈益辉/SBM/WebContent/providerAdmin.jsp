<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>供应商管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("确认删除吗？")!=true)
			return;
	}
	window.location = "provider.do?id="+id+"&flag="+flag;
}
</script>
</head>
<body onload="setP();">
<c:if test="${!empty param.ins }">
<script>
alert("数据添加失败！");
</script>
</c:if>
<c:if test="${!empty param.sel }">
<script>
alert("数据查询失败！");
</script>
</c:if>
<c:if test="${!empty param.sels }">
<script>
alert("数据查询失败！");
</script>
</c:if>
<div class="menu">

<table>
<tbody><tr><td><form method="post" action="ProviderServlet?cmd=getproviderByInfo">
<input name="flag" value="search" type="hidden">
供应商名称：<input name="providerName" class="input-text" type="text"> &nbsp;&nbsp;&nbsp;&nbsp;供应商描述：<input name="providerDetail" class="input-text" type="text">&nbsp;&nbsp;&nbsp;&nbsp;<input value="组 合 查 询" type="submit">
</form></td></tr>
</tbody></table>
</div>
<div class="main">
<div class="optitle clearfix">
<em><input value="添加数据" class="input-button" onclick="window.location='providerUp.jsp?act=insertprovider'" type="button"></em>
		<div class="title">供应商管理&gt;&gt;</div>
	</div>

	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
    <td width="80"><div class="STYLE1" align="center">供应商名称</div></td>
    <td width="100"><div class="STYLE1" align="center">供应商描述</div></td>
    <td width="100"><div class="STYLE1" align="center">联系人</div></td>

    <td width="100"><div class="STYLE1" align="center">电话</div></td>
    <td width="100"><div class="STYLE1" align="center">地址</div></td>
    <td width="100"><div class="STYLE1" align="center">操作</div></td>
  </tr>
  <c:forEach items="${pagebean.data }" var="pagebean">
  <tr>
  	<td>${pagebean.providerId }</td>
  	<td>${pagebean.providerName }</td>
  	<td>${pagebean.providerDetail }</td>
  	<td>${pagebean.contact }</td>
  	<td>${pagebean.telephone }</td>
  	<td>${pagebean.address }</td>
  	<td><a href="ProviderServlet?cmd=getproviderById&providerId=${pagebean.providerId }&act=Updateprovider" style="text-decoration: none;"><font style="font-size: 14px">修改</font></a></td>
  </tr>
  </c:forEach>
</tbody></table>
共${pagebean.count }条记录,&nbsp第${pagebean.p }页/共${pagebean.pagetotal }页&nbsp <a
			href="ProviderServlet?cmd=selectProviders&p=1">首页</a>&nbsp <a
			href="ProviderServlet?cmd=selectProviders&p=${pagebean.p-1 }">上一页</a>&nbsp <a
			href="ProviderServlet?cmd=selectProviders&p=${pagebean.p+1 }">下一页</a>&nbsp <a
			href="ProviderServlet?cmd=selectProviders&p=${pagebean.pagetotal }">尾页</a>&nbsp跳到第
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
function toPage(){
	location="ProviderServlet?cmd=selectProviders&p="+${pagebean.p};
}
function setP(){
	document.getElementById("s1").value="${pagebean.p}";
}
</script>
</body></html>         