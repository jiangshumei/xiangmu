<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();

	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/"
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="<%=base%>bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="<%=base%>bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="<%=base%>bootstrap/js/bootstrap.js"></script>
<title>查看所有分类</title>

<script>
	window.onload = function() {
		var selectAll = document.getElementById("selectAll");
		selectAll.onclick = function() {
			var chek = document.getElementsByName("fids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = true;
			}
		};
		var noSelectAll = document.getElementById("noSelectAll");
		noSelectAll.onclick = function() {
			var chek = document.getElementsByTagName("input");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = false;
			}
		};
		var fanxuan = document.getElementById("fanxuan");
		fanxuan.onclick = function() {
			var chek = document.getElementsByName("fids");
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}
			}
		};
		var deleteFenlei = document.getElementById("deleteFenlei");
		deleteFenlei.onclick = function() {
			var chek = document.getElementsByName("fids");		
			alert(chek.length);
			var flag = false;
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}
			
			
			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}
			
			str = str.slice(0, str.length - 1);
			alert(str);
			var queren = confirm("您确认要删除这些分类吗");
			if (queren == true) {
				location.href = "<%=base%>FenleiServlet?action=delete&fids="+ str;
			} else {
				location.reload();
			}
		}
	};
</script>
</head>
<body background="<%=base%>/images/03.jpg">

	<table id="t" align="center" width="900" height="700" cellspacing="0">

		<tr height="20%">
			<td align="center" colspan=2><font size="7" face="幼圆">查看所有分类</font><br></td>
		</tr>

		<td colspan=2 valign="top">
			<table class="table table-striped table-hover table-bordered"
				width="800" height="300" align="center" cellspacing="0">
			
				<tr align="center">

					<td>编号</td>
					<td>分类名称</td>
					<td>删除</td>
					<td>修改</td>

				</tr>
				<c:forEach items="${pb.beanList}" var="fenlei" varStatus="s">
					<tr align="center">
						<td>${s.index+1 }</td>
						<td>${fenlei.fname }</td>
						<td><input type="checkbox" name="fids" value="${fenlei.fid}" /></td>
						<td><a href="<%=base%>updateFenlei.jsp" />修改</a></td>
					</tr>
				</c:forEach>
				
				<tr align="center">

					<td colspan="6"><button class="btn btn-success btn-sm"
							id="selectAll">全选</button>
						<button class="btn btn-success btn-sm" id="noSelectAll">全不选</button>
						<button class="btn btn-success btn-sm" id="fanxuan">反选</button>
						<button class="btn btn-success btn-sm" id="deleteFenlei">删除</button></td>
				</tr>
				
			</table> <br> <br> <br>
			
			<center>
				第${pb.pageNow}页/共${pb.pages}页&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

				<ul class="pagination">
					<li><a
						href="<%=base%>FenleiServlet?action=showFenleiByPage&pageNow=1">首页</a></li>
					&nbsp; &nbsp;
					<c:if test="${pb.pageNow>1 }">
						<li><a
							href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
					</c:if>
					&nbsp; &nbsp;
					<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        -->
					<c:choose>
						<c:when test="${pb.pages<=10 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
							<c:set var="end" value="${pb.pageNow+4 }"></c:set>
							<c:if test="${begin<=1 }">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="10"></c:set>
							</c:if>
							<c:if test="${end>=pb.pages }">
								<c:set var="begin" value="${pb.pages-9 }"></c:set>
								<c:set var="end" value="${pb.pages }"></c:set>
							</c:if>
						</c:otherwise>
					</c:choose>
					<!-- 循环十个数 -->
					<c:forEach begin="${begin }" end="${end }" var="i">
						<c:choose>
							<c:when test="${pb.pageNow==i }">
								<li class="active"><span>${i}</span></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					&nbsp;

					<c:if test="${pb.pageNow<pb.pages }">
						<li><a
							href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
					</c:if>
					&nbsp; &nbsp;
					<li><a
						href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pages}">尾页</a></li>
				</ul>
			</center>
			<p>
			<table align="center">
				<tr align="center">
					<br>
					<td><font size="4" color="#4682B4">没有您想要的分类？您可以点击这里</font><a
						class="btn btn-primary btn-sm" href="<%=base%>addFenlei.jsp">添加分类</a></td>
				</tr>
			</table>
	</table>
</body>
</html>