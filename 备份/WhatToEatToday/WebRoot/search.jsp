<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String text = (String)request.getParameter("search");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>今天吃啥</title>
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
	<script src="https://cdn.bootcss.com/vue/2.6.10/vue.js"></script>
	<script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
	<link rel="stylesheet" href="css/media.css" />
	<script type="text/javascript" src="js/toucher.js" ></script>
	<script src="https://cdn.bootcss.com/jquery/1.8.3/jquery.js"></script>
	
  </head>
  
  <style type="text/css">
	html{
		background-color: #F6F7FD;
	}
		h3 {
			margin-left: 2rem;
			font-size: 3.42857rem;
			font-family: Noto Sans CJK SC;
			color: rgba(66, 66, 91, 1);
			letter-spacing: 0px;
			color: rgba(66,66,91,1);
			font-weight: bold;
			margin-top:20px;
			
		}
		.btn{
			background-color: transparent;
			border: none;
			width: 15px;
			height: 15px;
			 padding: 0;
			
			
			 
			
		}
		.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
    outline: none;
    border-color: transparent;
    box-shadow:none;
}
.user{
float: left;
 margin-left: 2.85714rem;
 font-size: 2.71428rem;
font-family: Noto Sans CJK SC;
color: rgba(66,66,91,1);
letter-spacing: 0px;
margin-top: 4px;

}
span{

font-size: 13px;
font-family: Noto Sans CJK SC;
color: rgba(159,159,172,1);
letter-spacing: 0px;
}
.footer{
 margin:auto;
 left:0;
 right:0;
 top:0;
 bottom:0;
	  position:fixed;
           width:122px;
           	top:90%;
            outline: none;
           
}
.tuijian{
	background-color: transparent;
	border: none;
	border-radius: 2.85714rem;
	
	
}

	.time:hover,.hot:hover {
    color: rgba(32,203,175,1);
   
    
}

.sort{ -webkit-filter: grayscale(100%); /* Chrome, Safari, Opera */
    filter: grayscale(100%);
		}
		.time:hover img,.hot:hover img 
		{-webkit-filter: grayscale(0%); /* Chrome, Safari, Opera */
    	filter: grayscale(0%);}
    .banner{
    	border-radius: 5px;
    }
    #lunbobox {
	
	height:230px;
	position:relative;
}

.lunbo img {
	width:500px;
	height:300px;
	position:absolute;
	top:0px;
	left:0px;
}
#lunbobox ul {
	width:240px;
	position:absolute;
	bottom:1rem;
	right:0px;
	z-index:5;
}
#lunbobox ul li {
	cursor:pointer;
	width:10px;
	height:10px;
	border:1px solid #cccccc;
	border-radius:10px;
	float:left;
	list-style:none;
	
	text-align:center;
	margin:0px 5px 0px 0px;
}
#toleft {
	display:none;
	width:30px;
	height:100px;
	font-size:40px;
	line-height:100px;
	text-align:center;
	color:#f4f4f4;
	/*background:#cccccc;
	*/
    /*background:url("../images/toleft.jpg")no-repeat center;
	*/
    position:absolute;
	top:90px;
	left:12px;
	cursor:pointer;
	z-index:99;
	opacity:0.4;
}
#toright {
	display:none;
	width:30px;
	height:100px;
	font-size:40px;
	line-height:100px;
	text-align:center;
	color:#f4f4f4;
	/*background:#cccccc;
	*/
    position:absolute;
	top:90px;
	right:0px;
	cursor:pointer;
	z-index:99;
	opacity:0.4;
}


	</style> 


	<body>
		<div id="app" style="background-color:#F6F7FD;" >
		<h3 style="font-size: 24px;
font-family: Noto Sans CJK SC;
color: rgba(66,66,91,1);
letter-spacing: 0px;">搜索结果</h3>
		
		<!--大家推荐-->
		<!--app为vue控制div-->



<div id="pop" style="display:none; color: rgb(159, 159, 172); line-height: 80px; text-align: center; font-size: 20px; position: sticky; /*! bottom: 50%; margin-top: 60px;">
<img class="img-responsive" src=img/no.png style="width: 55%;margin: 0 auto;">
还没有人吃过这个呢</div>
			
			
			<!--各个推荐模板-->
			<div class="panel"  style="margin:30px 18px 18px;border-radius:15px 15px 5px 5px;" v-for="item in searchlist"  >
				<!--推荐的图片-->
				
					<div class="panel-heading" style="margin-top: -10px; padding: 0;">
					<img :src="item.textImg"  class="img-responsive " alt="Responsive image"style="width:100%;height:auto;   border-radius:5px 5px 0 0;"></img>
					</div>
					<!--推荐的名字和内容-->
				
					<div class="panel-body" style=" margin-left: 8px;">
					<p style=" color: rgba(66,66,91,1);font-size: 2.71428rem; font-weight: bold; ">{{item.articleName}}</p>
					<p style="color: rgba(66,66,91,1);">{{item.text}}</p>
				
					 <!--点赞-->
   					<button  class="btn" @click.once.capture="item.likeNum++,item.likeTotal++" style="float: right;margin-right: 25px;"   >
   					<img  islike="9999"  :id='item.articleId' style="margin-right: 5px; width: 15px;height: 13px;"  onclick="changeImg1(this)" src="img/1010.png">
   					<span style=" color: rgba(66,66,91,1);pointer-events: none;cursor: default;font-size:14px;line-height:13px; position:absolute;">{{item.likeNum}}
   					</span>
   					</img>
   					</button>
 						<!--点差评-->
 					<button  class="btn"  @click.once.capture="item.unLike++"   style="float: right;margin-right: 40px;" >
 					<img islike="9999"  :id='item.articleId'  style="margin-right: 5px;width: 15px;height: 13px;" onclick="changeImg2(this)" src="img/13.png">
 					<span style="pointer-events: none;cursor: default; color: rgba(66,66,91,1);font-size:14px;line-height:13px;position:absolute;">{{item.unLike}}
 					</span>
 					</button>
	
			
				</div>
				<!--发表用户及总共点赞数-->
				<div class="panel-footer" style="background-color: white; border: 1px solid rgba(241,241,243,1);border-bottom: none;border-left: none; border-right: none;" >
				<div class="row" >		
					<img class="img-circle img-responsive"   style="margin-left: 2rem; float: left; width:56px;height:56px "  :src="item.userHead" alt="Responsive image"/>
					<div class="user" style="margin-top: 8px;">
					{{item.realName}}<br>
					<p style="margin-top:5px; font-size: 13px;color: rgba(159,159,172,1);letter-spacing: 0px;">{{item.className}}</p></div>	
						
					<span class="badge"  style="border-radius: 15px; margin-right:20px; margin-top: 25px; line-height: 1.5; background-color:rgba(254,181,36,1); float: right; " >已获得{{item.likeTotal}}个<img style=" margin-left: 5px; width: 12px; height: 10px;" src="img/sj.png"/></span>
				</div>	
				</div>
			</div>
		</div>
		
		</div>
		<div style="position: fixed;float: right;bottom: 0;right: 10px;"> <button type="button" onclick="window.location.href = 'index.jsp'" style=" background-image:url('img/174.png');height:80px;width: 80px;border-radius: 100px;background-color: transparent;border: none;outline: none; background-size: 90% 90%; background-repeat: no-repeat; float:right;margin-right:10px">
		</button></div>
		
		
		<div class="key" style="display:none">	<%out.print(text); %></div>
		
	

		<script type="text/javascript">
			//点差后改变图片的效果
		function	changeImg2(data) {	
			 var	articleId=data.id;
				
				     $(data).parent('button').prev().find('img').attr("islike","like");//改变islike属性值
				      $(data).parent('button').prev().attr("disabled", "true");
				      $(data).parent('button').attr("disabled", "true");
				    $(data).parent('button').prev().removeAttr('onclick');
				  	$(data).parent('button').prev().children().removeAttr('onclick');
				  	$(data).removeAttr("onclick");
				    if( $(data).attr("islike")!="islike"){
		    				$(data).attr("src", "img/1313.png");
		
			 	}
		 $.ajax({
		 type:"post",
		 url:"/WhatToEatToday/AddUnLike.do",

		 data:{articleId:articleId},
		 
		 success: function(result){
			
			 //alert(result);
		 
	 	if(result == "failed"){
	 		alert("failed");
	 	}
         
	 },
	  error:function(result){
	  	alert("ajax数据错误没有进入success");
	  },
	 
 });
 
}


		//点赞评改变图片的效果
		function	changeImg1(data) {
			 var articleId=data.id;
			 $(data).parent('button').next().find('img').attr("islike","islike");
				$(data).parent('button').next().attr("disabled", "true");
				 $(data).parent('button').attr("disabled", "true");
				 $(data).parent('button').removeAttr('onclick');
				$(data).parent('button').next().removeAttr('onclick');
				$(data).parent('button').next().children().removeAttr('onclick');
			 	$(data).removeAttr("onclick");
				if( $(data).attr("islike")!="like"){
					//bian
					$(data).attr("src", "img/10.png"); 
					
				}
			/* for(var i=0;i<x.length;i++){
				var articleId=a[i]
			alert(articleId);
			} */
			//articleId
		 $.ajax({
			 type:"post",
		 	url:"/WhatToEatToday/AddLike.do",

		

		 data:{articleId:articleId},
		 
		 success: function(result){
			
			 //alert(result);
		 	
		 	if(result == "failed"){
		 		alert("failed");
		 	}
             
		 },
		  error:function(result){
		  	alert("ajax数据错误没有进入success");
		  },
		 
	 });
			
     
}

var vm = new Vue({
	el: '#app',
	data: {
		
		
		 searchlist:[],
		
		
	},
	  created(){ //这个函数与vue的生命周期有关，data和methods初始化后，会执行该函数
		this.search();	
				
	}, //created结束
	
	methods: {
	/* 搜索 */
		search (){
			var key=$(".key").text();
			 console.log(key);
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/Index.do",
				 dataType:"json",
				 data:{key:key},
				 success: function(mapList){
					 if (mapList.length==1){
						 $("#pop").css("display","table");
					 }
					 else{
					
					 vm.searchlist =mapList;
					 }
				 },
				 error:function(result){
					  	alert("ajax数据错误没有进入success");
					  },
		 
			});	//ajax结束
			
		},//search结束
			/* var newList=[]
			this.list.forEach(item=>{
				if(item.articleName.indexOf(keywords)!=-1){
					newList.push(item)
				}//if结束
			});//foreach结束
			
			return newList; */
		
		/* search1(keywords){
			 
			var newList=[]
			this.top.forEach(item=>{
				if(item.articleName.indexOf(keywords)!=-1){
					newList.push(item)
				}//if结束
			});//foreach结束
			
			return newList;
		}, */
		
		
		
	} //methods结束

}); //Vue结束


			
		</script>
	
	</body>
</html>
