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
		<form action="ProviderServlet?cmd=Updateprovider" id="PupForm"  method="post">
			<div class="content">
			<input type="hidden" name="act" value="${param.act }"/>
			<input type="hidden" name="providerId" value="${provider.providerId }"/>
				<table class="box">
					<tr>
						<td class="field">供应商名称：</td>
						<td><input type="text" name="providerName" class="text"
							id="providerName" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">供应商描述：</td>

						<td><input type="text" name="providerDetail" class="text"
							id="providerDetail" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">联  系  人：</td>
						<td><input type="text" name="contact" class="text"
							id="contact" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">供应商电话：</td>
						<td><input type="text" name="telephone" class="text"
							id="telephone" /> <font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">供应商传真：</td>
						<td><textarea name="facsimile" id="facsimile" class="text"
								cols="45" rows="5"></textarea></td>
					</tr>
					<tr>
						<td class="field">供应商地址：</td>
						<td><textarea name="address" id="address" class="text"
								cols="45" rows="5"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="buttons">
			<c:if test="${param.act eq 'insertprovider' }">
			<input type="button" name="button" id="button" value="确认添加" onclick="CheckFrom()" class="input-button"/> 
			</c:if>
			<c:if test="${param.act eq 'Updateprovider' }">
				<input type="button" name="button" id="button" value="确认修改" onclick="CheckFrom()" class="input-button"/> 
				</c:if>
					<input type="button" name="button" id="button" onclick="window.location='ProviderServlet?cmd=selectProviders';" 
					value="返回" class="input-button" />
			</div>
		</form>
	</div>
	<c:if test="${!empty provider }">
	<script type="text/javascript">
	document.getElementById("providerName").value="${provider.providerName}";
	document.getElementById("providerDetail").value="${provider.providerDetail}";
	document.getElementById("contact").value="${provider.contact}";
	document.getElementById("telephone").value="${provider.telephone}";
	document.getElementById("facsimile").value="${provider.facsimile}";
	document.getElementById("address").value="${provider.address}";
	</script>
	</c:if>
	<script type="text/javascript">
	function CheckFrom() {
		var PupForm = document.getElementById("PupForm");
		if(
			CheckItems("providerName")&&
			CheckItems("providerDetail")&&
			CheckItems("contact")&&
			CheckItems("telephone")&&
			CheckItems("facsimile")&&
			CheckItems("address")
		){
			PupForm.submit();
			}
		else{
			alert("数据修改不允许空值");
		}
	}
	
	function CheckItems(id) {
		var ider=document.getElementById(id).value;
		if(ider != null && ider != ""){
			return true;
		}else{
			return false;
		}
	}	
	</script>
</body>
</html>