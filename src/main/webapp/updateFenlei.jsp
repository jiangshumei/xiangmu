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
<title>修改分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">

window.onload=function(){//页面加载完成
	
	  ajax({ 
		method:"POST",
		url:"FenleiServlet",
		params:"action=updateShowFenlei",
		type:"xml",
		success:function(data){
			
			var select=document.getElementById("fenleiList");
			
			
			
         var fnames=data.getElementsByTagName("fname");
			
			for(var i=0;i<fnames.length;i++){
				
				var fname=fnames[i];
				
				var opt=document.createElement("option");
				
				var value;
				
				if(window.addEventListener){
					
					value=fname.textContent;
					
				}else{
					
					
					value=text;
				}
				
				opt.innerHTML=value;
				
				opt.value=value;
				
				
				select.appendChild(opt);
			
		}
		
	}
	
	
	});


};

		
/*
		var http=getXMLHttpRequest();
		
		var select=document.getElementById("fenleiList");
		
		http.open("POST","FenleiServlet",true);
		
	    http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
 		
 		http.send("action=updateShowFenlei");
 		
 		http.onreadystatechange=function(){
 			
 			
 			if(http.readyState==4 && http.status==200){
 				
 				var content=http.responseXML;
 				
 				var fnames=content.getElementsByTagName("fname");
 				
 				for(var i=0;i<fnames.length;i++){
 					
 					var fname=fnames[i];
 					
 					var opt=document.createElement("option");
 					
 					var value;
 					
 					if(window.addEventListener){
 						
 						value=fname.textContent;
 					}else{
 						
 						value=text;
 					}
 					
 					opt.innerHTML=value;
 					
 					opt.value=value;
 					
 					select.appendChild(opt);
 				}
 			}
 			
 		}
 		
 		}*/
</script>
</head>
<body background="images/03.jpg">
	<form action="FenleiServlet?action=update" method="post">
	<table align="center" width="500px" height="300px"  cellspacing="0">
	<input type='hidden' name="fid" value="${f.fid}"/>
		
		<br>
		<tr height="60%">
			<td colspan="2" align="center"><font size="7" face="幼圆">修改分类页面</font></td>
		</tr>
		
		<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"   width="260" height="150"
					align="center" cellspacing="0"></td>
			
			<tr align="center" >
			   <td><font size="4">请选择您要修改的分类</font></td>
			   <td>
			      <select name="fname" id="fenleiList" value="${f.fenlei }">			       
			      </select>
			   </td>
			</tr>
			<tr align="center">
				<td><font size="4">请输入新的分类名称:</font></td>
				<td><input type="text" name="newname"/></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" class="btn btn-primary btn-sm" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset"class="btn btn-success btn-sm"  value="清空" /></td>
			</tr>
			</table>
		</table>
	</form>
</body>
</html>