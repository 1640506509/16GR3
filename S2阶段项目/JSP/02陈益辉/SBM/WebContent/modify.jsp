<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>账单</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="menu">
</div>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">账单管理&gt;&gt;</div>
	</div>
	<form action="AccountServlet?cmd=insertRoupAccount" method="post">
		<div class="content">
			<table class="box">
			<c:if test="${param.act eq 'add'}">
				<tr>
					<td class="field">商品名字：</td>
					<td><input type="text" name="goodsName" class="text" /></td>
				</tr>
				</c:if>
				<tr>
					<td class="field">交易数量：</td>
					<td><input type="text" name="businessNum" class="text" /></td>
				</tr>
				<tr>
					<td class="field">供应商：</td>
					<td><select name="providerid">
					<c:forEach items="${providers }" var="provider">
					<option value="${provider.providerId }">${provider.providerName }</option>
					</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="field">是否付款：</td>
					<td><select name="isPayed">
						<option selected="selected" value="1">是</option>
                        <option value="0">否</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="submit" value="确认" class="input-button" />
			<input type="button" name="button" value="返回" class="input-button" onclick="history.back();" />
		</div>
		<input type="hidden" name="accountId" value="${param.accountId }"/>
	</form>
</div>
</body>
</html>