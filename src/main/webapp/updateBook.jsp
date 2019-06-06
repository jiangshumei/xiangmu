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
<title>修改图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body background='imgs/11.jpg'>
	<form action="updatebook" method="post">
		<table width="500px" height="550px" cellspacing="0" align="center">
			<input type='hidden' name="id" value="${b.id}" />
			<input type='hidden' name="_method" value="PUT" />
			<br>
			<tr height="20%">
				<td colspan="2" align="center"><font size="7" face="幼圆">修改图书</font></td>
			</tr>
			<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"
					width="500px" height="300px" align="center" cellspacing="0">
					</td>

					<tr align="center">
						<td>分类名称:</td>
						<td colspan="2"><input type="text" name="fname" id="fname"
							value="${b.fname }" /></td>
						</td>
					</tr>

					<tr align="center">
						<td>图书名称:</td>
						<td colspan="2"><input type="text" name="name" id="name"
							value="${b.name }" /></td>
					</tr>

					<tr align="center">
						<td>图书价格:</td>
						<td colspan="2"><input type="text" name="price" id="price"
							value="${b.price }" /></td>
					</tr>

					<tr align="center">
						<td>出版社:</td>
						<td colspan="2"><input type="text" name="chuban" id="chuban"
							value="${b.chuban }" /></td>
					</tr>

					<tr align="center">
						<td>状态:</td>
						<td colspan="2"><input type="radio" checked name="zhuangtai"
							value="未借出" />未借出<input type="radio" name="zhuangtai" value="借出" />借出</td>
					</tr>

					<tr align="center">
						<td>借书人:</td>
						<td colspan="2"><input type="text" name="jieshuren"
							id="jieshuren" value="${b.jieshuren }" /></td>
					</tr>
					<tr align="center">
						<td>fId:</td>
						<td colspan="2"><select name="fId" class="form-control" value="${b.fId}"  id="fId" >
								<c:forEach items="${fList}" var="f" >

									<c:if test="${f.fid==book.fenlei.fid}">

										<option value="${f.fid}" selected="selected">${f.fname}</option>
									</c:if>
									<c:if test="${f.fid!=book.fenlei.fid}">
										<option value="${f.fid}">${f.fname}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr align="center">
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-primary btn-sm" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" class="btn btn-success btn-sm" value="清空" /></td>
					</tr>
				</table>
		</table>
	</form>
</body>
</html>