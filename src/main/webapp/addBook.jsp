<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
 
<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">

	$(function() {
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				fname : {
					validators : {
						notEmpty : {
							message : '书名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{1,20}$/,
							message : '书名必须是1~20个汉字'
						},
					}
				},
				price : {
					validators : {
						notEmpty : {
							message : '书的价格不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '书的价格必须是数字'
						},

					}
				},

				chuban : {
					validators : {
						notEmpty : {
							message : '出版社不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{5,10}$/,
							message : '出版社必须是5~10位汉字'
						},
					}
				},
				zhuangtai : {
					validators : {
						notEmpty : {
							message : '必须选择书籍的状态'
						},
					}
				},
				
				jieshuren : {
					validators : {
						notEmpty : {
							message : '借书人不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '借书人的名字必须是2~10位汉字'
						},
					}
				}
			
		
			
		}

		
	});
	});
</script>
<meta charset="UTF-8">
<title>添加图书</title>


</head>
<body background="imgs/11.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login"  action="addbook"  method="post">
					<h3 class="text-center text-success">添加图书</h3>
					
						<div class="form-group">
						
						<label for="fenlei" class="col-sm-4 control-label">分&nbsp;&nbsp;类&nbsp;&nbsp;名&nbsp;&nbsp;称</label>
			
					<input name="fname" id="fenlei" class="form-control" />
				
				
				</div>	
			
					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="name" class="form-control" />
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" class="form-control" />
					</div>
					
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chuban" class="form-control" />
					</div>

					<div class="form-group">
						<label>状&nbsp;&nbsp;态：</label>
						<div class="radio">
							<label class="radio-inline"><input type="radio"
								name="zhuangtai" value="未借出" />未借出</label> <label class="radio-inline"><input
								type="radio" name="zhuangtai" value="借出" />借出</label>
						</div>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label>
						 <input
							type="text" name="jieshuren" class="form-control" />
					</div>
				
				<div>
					<label>分类Id</label> 
					
					 <select name="fId" class="form-control">
					 
					  <c:forEach items="${fList}" var="f">
					  
					  <option value="${f.fid}">${f.fname}</option>
					  
					 </c:forEach>
					</select>
					</div>
					<br>
					<br>
					<div class="form-group">
				<div class="col-sm-12">
				  <center>
					<button type="submit" class="btn btn-info">添加图书</button>
					</center>
				</div>
			</div>
			
			<br>
					<br>
					<div class="form-group">
				<div class="col-sm-12">
				  <center>
					<button type="reset" class="btn btn-info">重置</button>
					</center>
				</div>
			</div>
			
			
			
				</form>

			</div>

		</div>

	</div>
	
</body>
</html>