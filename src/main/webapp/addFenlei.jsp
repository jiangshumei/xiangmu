<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<c:if test="${!(empty msg) }">
	<script>
		alert("${msg }");
	</script>
	<c:remove var="msg" scope="session" />
</c:if>
<title>添加分类</title>
</head>
<body background="images/03.jpg">
	<form action="FenleiServlet?action=addFenlei" method="post">
		<table align="center" width="400px" height="200px" cellspacing="0">
			<br>
			<br>
			<tr height="60%">
				<td align="center" colspan=2><font size="7" face="幼圆">添加分类</font><br></td>
			</tr>
			<td colspan=2>
				<table class="table table-striped table-hover table-bordered"
					width="300" height="140" align="center" cellspacing="0">
					<br>
					<tr>
						<th><font size="4"face="幼圆">请输入分类的名字</font></th>
						<th><input type="text" name="fname" /></th>
					</tr>
					<tr align="center">
						<td colspan="2"><button class="btn btn-primary btn-sm">添加</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-success btn-sm">重填</button></td>
					</tr>
				</table>
			</td>
		</table>
	</form>
</body>
</html>