<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="bootstrap/js/ajax.js"></script>
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>添加分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<!-- <script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>--> 
<script type="text/javascript">

$(function(){
	  $(".form-horizontal").bootstrapValidator({
		  
		  feedbackIcons:{
			  
			  valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
		  },
		  
		  fields:{
			  
			  fname:{
				  
				  validators :{
					  
					  notEmpty : {
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5_A-z0-9]{1,15}$/,
							message : '分类名称必须由长度为1-15的汉字字母数字下划线组成'
						},
					  
						remote:{
						  message:'该分类已被添加，请重新输入',
						  
						  url:"validate",
						
						  type:'post',
						  
						  data:function(validator){
							  
							  return{
								  
								  fname:$("input[name=fname]").val()
							  }
						  }
					  }
					 
				  }
			  }
			  
		  }
	  });
}); 



</script>

<!-- <script type="text/javascript">
$(function(){	
	 $(".form-horizontal").bootstrapValidator({		  
		  feedbackIcons:{			  
			  valid : "glyphicon glyphicon-ok",
			  invalid : "glyphicon glyphicon-remove",
			  validating : "glyphicon glyphicon-refresh"			  
		  },		  
		 fields:{	  
	    fname:{		  
			  validators :{			  
				   notEmpty : {
						message : '分类名不能为空'
					},
					 regexp : {
						regexp : /^[\u4e00-\u9fa5]{1,15}$/,
						message : '分类名必须是1-15位的汉字'

					},    
				  
					remote:{
					 
						message:'该分类已被添加，请重新输入',
					    url:"queryone",
					
					    type:'post',
					  
					    data:function(validator){
						  
						  return{
							  
							  fname:$("input[name=fname]").val()
						  }
					  }
				  }
				 
			  }
		  }
	  }
});
	 
	 
}); 


</script> -->
</head>
<body background="imgs/14.jpg">
	<div class="container">
		<h1 align="center">图书管理系统----添加分类页面</h1>

         <hr width="1000px">

		<form action="fenlei"  class="form-horizontal" method="post" >

			

			<!-- <div class="form-group">
				<label for="fid" class="col-sm-4 control-label">分类编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fid"
						name="fid">
				</div>
			</div> -->

			<div class="form-group">
				<label for="fname" class="col-sm-4 control-label">分类名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fname" name="fname">
				</div>
			</div>

			

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">添加分类</button>
					<button type="reset" class="btn btn-primary">重置</button>
				</div>
			</div>

		</form>

	</div>
</body>
</html> --%>










<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- <script type="text/javascript" src="bootstrap/js/ajax.js"></script> -->
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>添加分类</title>
<script type="text/javascript" src="js/ajax.js"></script> 
<!-- <script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script> --> 
<script type="text/javascript">


 $(function(){
	  $(".form-horizontal").bootstrapValidator({
		  
		  feedbackIcons:{
			  
			  valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
		  },
		  
		  fields:{
			  
			  fname:{
				  
				  validators :{
					  
					  notEmpty : {
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5_A-z0-9]{1,15}$/,
							message : '分类名称必须由长度为1-15的汉字字母数字下划线组成'
						},
					  
						remote:{
						  message:'该分类已被添加，请重新输入',
						  
						  url:"validate",
						
						  type:'post',
						  
						  data:function(validator){
							  
							  return{
								  
								  fname:$("input[name=fname]").val()
							  }
						  }
					  }
					 
				  }
			  }
			  
		  }
	  });
}); 



	/* var flag;

	function validateName() {

		var name = document.fenlei.name;

		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{2,15}$/;

		var NameMsg = document.getElementById("NameMsg");

		ajax({
			method : "POST",
			url : "FenleiServlet",
			params : "action=validateName&name=" + name.value,
			type : "text",
			success : function(data) {

				if (nameReg.test(name.value)) {

					if (data == "0") {//图书名称已经存在

						NameMsg.style.color = "red";

						NameMsg.innerHTML = "此分类名称已经存在";

						name.focus();

						flag = false;

					} else {//图书名称不存在

						NameMsg.style.color = "darkcyan";

						NameMsg.innerHTML = "此分类名称可以添加";

						flag = true;

					}

				} else {

					NameMsg.style.color = "red";

					NameMsg.innerHTML = "必须是长度为2-15的汉字字母数字下划线";
					
					name.focus();

					flag = false;
				}
			}
		})
	}

	
	function Fenlei() {

		//alert(flag);
		return (flag);
	};
	 */

	$(function(){
		   
		   $("tr:even").css("background-color","transparent");
		   
		   $("tr:odd").css("background-color","transparent");
		   
		   //事件
		   $("tr").mouseover(function(){
			   
			   $(this).css("background-color","LightYellow");
		   });
		   
		   $("tr").mouseout(function(){
			   
			   $("tr:even").css("background-color","transparent");
			   
			   $("tr:odd").css("background-color","transparent");
		   });
	   });
</script>
</head>
<body background="imgs/14.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
	<form action="fenlei" method="post" class="form-horizontal">
		<br>
					<br>
						<h1 class="text-center text-danger"><font face="幼圆">添加分类</font></h1>
						<hr>
	                <div class="form-group">
						<label>请输入分类的名称:</label> 
					    <input type="text" name="fname" id="fname" class="form-control" placeholder="分类名称" />
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">添加</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">重填</button></li>
						</ul>
						</div>
					
					</form>
					</div>
					</div>
					</div>
</body>
</html>