<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账单管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<c:if test="${!empty param.sele }">
<script>
alert("数据查询失败！");
</script>
</c:if>
<c:if test="${!empty param.bill }">
<script>
alert("添加失败！");
</script>
</c:if>
<c:if test="${!empty param.del }">
<script>
alert("删除失败！");
</script>
</c:if>
<c:if test="${!empty param.upAc }">
<script>
alert("修改失败！");
</script>
</c:if>
<div class="menu">
	<form method="post" action="AccountServlet?cmd=selAccount">
		商品名称：<input type="text" name="goodsName" class="input-text" value="${param.goodsName }" />&nbsp;&nbsp;&nbsp;&nbsp;
		是否付款：<select name="isPayed">
			<option value="">请选择</option>
			<option value="1">已付款</option>
			<option value="0">未付款</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit" value="组合查询" class="button" />
	</form>
</div>
<div class="main">
	<div class="optitle clearfix">
		<em><input type="button" name="button" value="添加数据" class="input-button" onclick="location.href='ProviderServlet?cmd=getprovider&act=add'" /></em>
		<div class="title">账单管理&gt;&gt;</div>
	</div>
	<div class="content">
		<table class="list">
			<tr>
				<td>账单编号</td>
				<td>商品名称</td>
				<td>交易数量</td>
				<td>交易金额</td>
				<td>是否付款</td>
				<td>供应商名称</td>
				<td>商品描述</td>
				<td>账单时间</td>
				<c:if test="${user.type == 0}">
				<td>操作</td>
				</c:if>
			</tr>
			<c:forEach items="${pagebean.data }" var="accountretrieval">
			<tr>
				<td>${accountretrieval.accountId }</td>
				<td>${accountretrieval.goodsName }</td>
				<td>${accountretrieval.businessNum }</td>
				<td>${accountretrieval.totalPrice }</td>
				<c:if test="${accountretrieval.isPayed == 1 }">
				<td>已付款</td>
				</c:if>
				<c:if test="${accountretrieval.isPayed == 0 }">
				<td>未付款</td>
				</c:if>
				<td>${accountretrieval.providerName }</td>
				<td>${accountretrieval.goodsIntro }</td>
				<td>${accountretrieval.accountDate }</td>
				<c:if test="${user.type == 0}">
				<td><a href="ProviderServlet?cmd=getprovider&act=upA&accountId=${accountretrieval.accountId  }">修改</a>&emsp;<a href="AccountServlet?cmd=delAccount&accountId=${accountretrieval.accountId  }">删除</a></td>
				</c:if>
			</tr>
	</c:forEach>
		</table>
		<c:if test="${empty sl }">
		共${pagebean.count }条记录,&nbsp第${pagebean.p }页/共${pagebean.pagetotal }页&nbsp <a
			href="AccountServlet?cmd=getPageBean&p=1&addd=yes">首页</a>&nbsp <a
			href="AccountServlet?cmd=getPageBean&p=${pagebean.p-1 }&addd=yes">上一页</a>&nbsp <a
			href="AccountServlet?cmd=getPageBean&p=${pagebean.p+1 }&addd=yes">下一页</a>&nbsp <a
			href="AccountServlet?cmd=getPageBean&p=${pagebean.pagetotal }&addd=yes">尾页</a>&nbsp跳到第
			 <select id="s1" onchange=toPage(this.value);>
			 <c:set var="i" value="0"  scope="page" />
			<c:forEach begin="1" end="${pagebean.pagetotal }" step="1">
			<c:set var="i" value="${i+1 }"/>
				<option value="${i }" ${i == pagebean.p?"selected":"" }>${i }</option>
			</c:forEach>
		</select> 页
		</c:if>
	</div>
</div>
<script type="text/javascript">
function toPage(a){
	location="AccountServlet?cmd=getPageBean&p="+a+"&addd=yes";
}
function setP(){
	document.getElementById("s1").value="${pagebean.p}";
// 	var all_options = document.getElementById("s1").options;
// 	for(var i=0;i<all_options.length;i++){
// 		if(all_options[i].value==${pagebean.p}){
// 			all_options[i].selected = true;
// 	}
}
</script>
</body>
</html>