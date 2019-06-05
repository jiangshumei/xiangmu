<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {

		$(".deleteId").click(function() {

			var $url = this.href;

			$("#deleteForm").attr("action", $url);

			//提交表单 

			$("#deleteForm").submit();

			return false;

		});

	});
	
	
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var chek = document.getElementsByName("ids");

			for (var i = 0; i < chek.length; i++) {

				chek[i].checked = true;
			}
		};

		var noselectAll = document.getElementById("noselectAll");

		noselectAll.onclick = function() {

			var chek = document.getElementsByName("ids");

			for (var i = 0; i < chek.length; i++) {

				chek[i].checked = false;
			}
		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var chek = document.getElementsByName("ids");

			for (var i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {

					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}

			}
		};

		var deleteFenlei = document.getElementById("fenlei_delete");

		deleteFenlei.onclick = function() {

			var chek = document.getElementsByName("ids");

			var flag = false;

			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}

			if (flag == false) {
				alert("请你至少勾选一项进行删除");
				return;
			}

			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {

					str += chek[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);

			alert(str);

			//发送给服务器
			var queren = confirm("你确定要删除这些分类吗？");

			if (queren == true) {

				location.href = "deleteFenlei/&ids" + str;
			} else {
				location.reload();
			}

		}
	};
	
/* 	
	var outAll = document.getElementById("outAll");

	outAll.onclick = function() {

		var flag = confirm("你确定要导出全部的用户信息吗？");

		if (flag) {

			window.location.href = "OutPutUserServlet?action=all"

		}

	};

	var outSelect = document.getElementById("outSelect");

	outSelect.onclick = function() {

		var chek = document.getElementsByName("ids");

		var flag = false;

		for (var i = 0; i < chek.length; i++) {
			if (chek[i].checked == true) {
				flag = true;
				break;
			}
		}

		if (flag == false) {
			alert("请你至少勾选一项进行导出");
			return;
		}

		var str = "";
		for (var i = 0; i < chek.length; i++) {
			if (chek[i].checked == true) {

				str += chek[i].value + ",";
			}
		}

		str = str.slice(0, str.length - 1);

		//alert(str);

		//发送给服务器
		var flag = confirm("你确定要导出勾选的分类信息吗？");

		if (flag) {

			location.href = "OutPutUserServlet?action=outSelect&ids=" + str;
		} else {
			location.reload();
		}

	} */


	
	
</script>

</head>
<body background="images/03.jpg">
	<div class="container">
		<h1 align="center">图书管理系统----分类列表页</h1>
		<hr width="1300px">

		<table class="table table-bordered table-hover table-striped">
			<tr>
				<td>选择</td>
				<td>编号</td>
				<td>id</td>
				<td>分类名称</td>
				<td>删除</td>
				<td>修改</td>
			</tr>
			<c:forEach items="${pb.beanList}" var="s" varStatus="ss">
				<tr>
				<td><input type="checkbox" name="ids" value="${s.fid }" /></td>
				  <td>${ss.index+1 }</td>
					<td>${s.fid}</td>
					<td>${s.fname}</td>
					<td><a href="http://localhost/xiangmu/fenlei_delete/${s.fid}"
						class="deleteId btn btn-danger">删除</a></td>
					<td><a href="http://localhost/xiangmu/fenlei/${s.fid}"
						class="btn btn-success">修改</a></td>
				</tr>
			</c:forEach>

			<tr>
				<td><button class="btn btn-info btn-xs" id="selectAll">全选</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-info btn-xs" id="noselectAll">全不选</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-info btn-xs" id="fanxuan">反选</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-info btn-xs" id="outSelect">导出选中</button>&nbsp;&nbsp;&nbsp;&nbsp;
			        <button class="btn btn-info btn-xs" id="outAll">导出全部</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-info btn-xs" id="fenlei_delete">删除</button></td>
			</tr>
			
		</table>
		<!-- 准备一个隐藏表单 -->
		<form action="" method="POST" id="deleteForm">

			<input type="hidden" name="_method" value="DELETE">
		</form>


		<center>
			<p>
			<p>第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="http://localhost/xiangmu/fenleis/1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;

				<c:if test="${pb.pageNow>1}">
					<li><a href="http://localhost/xiangmu/fenleis/${pb.pageNow-1}">上一页</a></li>
				</c:if>
				&nbsp;&nbsp;

				<!-- 分页两种情况:
		     如果页面小于10；
		     如果页面大于10
		 -->
				<c:choose>
					<c:when test="${pb.pages<=10}">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pb.pages}"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pageNow-5}"></c:set>
						<c:set var="end" value="${pb.pageNow+4}"></c:set>
						<c:if test="${begin<=1}">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="10"></c:set>
						</c:if>
						<c:if test="${end>=pb.pages}">
							<c:set var="begin" value="${pb.pages-9 }"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<c:choose>
						<c:when test="${pb.pageNow==i}">
							<li class="active"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="http://localhost/xiangmu/fenleis/${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages}">
					<li><a href="http://localhost/xiangmu/fenleis/${pb.pageNow+1}">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="http://localhost/xiangmu/fenleis/${pb.pages}">尾页</a></li>
			</ul>

		</center>
		<!-- <p align="left">
			<a href="addUI" class="btn btn-primary">添加分类</a> -->

		<hr>


	</div>
</body>
</html>