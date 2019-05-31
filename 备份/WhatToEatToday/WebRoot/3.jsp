<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我要推荐</title>
    
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
	<script src="js/exif.js"></script>
	<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

	<link rel="stylesheet" href="css/media.css" />
	
  </head>
  
  <style>
		html{
			background-color: #F0F8FF;
		}
		.hidden-input{
			background-color: transparent;
			border: none;
			
			
			position: absolute;
			opacity: 0;
			
		}
		.fabu{
			background-color: transparent;
			border: none;
			border-radius: 4rem;
			margin-top: 40px;
			display:block;
			margin-left: auto;
			margin-right: auto;
			
		}
		label{

		font-size: 2.71428rem;
		font-family: Noto Sans CJK SC;
		color: rgba(66,66,91,1);
		letter-spacing: 0px;
		}
		input,textarea{
			border:1px solid rgba(206,232,255,1)!important;
			border-radius: 8px!important;
		}
		
	
</style>

	<body>
		<div class="container-fluid" style="background-color: #F0F8FF; margin-top: 40px; padding: 15px;">
			<form enctype="multipart/form-data" action="UserAdd.do" method="post">
		<div class="form-group" >
			<label>食物名称</label>
			<input style="height:50px; font-size: 20px;" type="text" class="form-control"  onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"  required oninvalid="setCustomValidity('食物名称不能为空')" oninput="setCustomValidity('')" name="foodname">
		</div>
		
		<div class="form-group"  style="margin-top: 40px;" >
			<label>相关描述</label>
			<textarea style="height: 200px;font-size: 20px" class="form-control" name="description"  onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" required oninvalid="setCustomValidity('相关描述不能为空')" oninput="setCustomValidity('')"></textarea>
		</div>

		<div class="form-group" style="margin-top: 35px;">
			<div class="panel panel-default"  style="border:1px solid rgba(206,232,255,1)!important;position:relative;overflow:hidden" >
  				<input class="hidden-input"  style="height:100%;width: 95%; z-index:999;" type="file" accept="image/*"   name="photo" onchange="changepic(this)" required="required" />
  				<img  id="show" class="img-responsive" style=" display: flex; margin: auto;" src="img/176.png" />
  		
			</div>
		</div>
		
		<div class="footer" style="margin: 40px;">
			<button type="submit" onclick="" class="fabu"><span class="badge" style="box-shadow: 0px 6px 10px 0px rgba(67,133,255,0.5); border-radius: 4.85714rem; line-height:5.5rem;  width:25.71428rem; height:6.42857rem; background-color: rgba(67,133,255,1);font-size:2.71428rem;">发布推荐</span></button>
		</div>
		</form>
		
		</div>

<script>


    function changepic(obj) {
  
             //console.log(obj.files[0]);//这里可以获取上传文件的name
             var newsrc=getObjectURL(obj.files[0]);
            
             var p= document.getElementById('show');
             document.getElementById('show').src=newsrc;
             p.style.width=100+'%';

             EXIF.getData(obj.files[0], function() { // file input[type=file]的文件
         		EXIF.getAllTags(this);

         var Orientation = EXIF.getTag(this, 'Orientation');
        
        
     	if (Orientation == 3)
     	{
     	console.log(Orientation)
     	             $('#show').css({"transform":"rotate(180deg)"}) 
     	}						
        	if (Orientation == 6)
     	{
     	console.log(Orientation)
     	             $('#show').css({"transform":"rotate(90deg)"}) 
     	}
     	if (Orientation == 8)
     {
     	console.log(Orientation)
     	             $('#show').css({"transform":"rotate(270deg)"}) 
     	}
     
        
     }); 
             
         
    }
    //建立一个可存取到file的url
    function getObjectURL(file) {
        var url = null ;
        // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>

	</body>
</html>
