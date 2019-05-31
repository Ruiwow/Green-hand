<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

	<link rel="stylesheet" href="css/media.css" />
		
  </head>
  
  <style>
		.hidden-input{
			background-color: transparent;
			border: none;
			width: 100%;
			height: 240px;
			z-index: 100;
			position: absolute;
			opacity: 0;
			
		}
		.fabu{
			background-color: transparent;
			border: none;
			border-radius: 2.85714rem;
			margin-top: 40px;
			display:block;
			margin-left: auto;
			margin-right: auto;
			
		}
		
	</style>
	<body>
		<div class="container-fluid" style=" padding: 0;">
			<form  action="" method="">
		
		<div class="form-group" >
			<img src="${map.img }" class="img-responsive" alt="Responsive image" />
		</div>
		<div class="form-group" style="padding: 15px 15px 0 15px;">
			<p style="font-size: 2.8rem;font-family: Noto Sans CJK SC;color: rgba(159,159,172,1);">食物名称</p>
			<p style="font-weight: Bold; font-size: 4.28571rem;color: rgba(66,66,91,1);">${map.articleName }</p>
		</div>

		<div class="form-group" style="margin-top:20px; padding:0 15px 15px 15px;">
			<p style="font-size: 2.8rem;color: rgba(159,159,172,1);">相关描述</p>
			<p style="font-size:2.28571rem; color: rgba(66,66,91,1); letter-spacing: 0px;">${map.text }
				
		</div>
		
		
		
		</form>
		
		
		</div>
		<div style="position: absolute;float: right;bottom: 0;right: 10px;"> <button type="button" onclick="window.location.href = 'index.jsp'" style=" background-image:url('img/174.png');height:80px;width: 80px;border-radius: 100px;background-color: transparent;border: none;outline: none; background-size: 90% 90%; background-repeat: no-repeat; float:right;margin-right:10px">
		</button></div>


	</body>
</html>
