<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
			margin-top: 20px;
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
		{	-webkit-filter: grayscale(0%); /* Chrome, Safari, Opera */
    		filter: grayscale(0%);}
    .banner{
    	border-radius: 5px;
    }

  
	</style>


	<body>
		<div id="app" style="background-color:#F6F7FD;">
		<!-- 搜索框 -->
			<div class="" style="background: #00A5ED;height: 50px;padding-top: 10px;">
  				<span class="glyphicon glyphicon-search" style="position:absolute;z-index:999;line-height:2.8;margin-left:8vw;top:auto" ></span>
  				<input type="text" class="form-control"v-model="keywords" placeholder="搜搜大家吃了啥" style="display: table;margin: 0 auto;width: 90%;border-radius: 18px; padding-left:7vw" >
			</div>
		<h3 >今日推荐</h3>
		<!-- 轮播图 -->
		<div id="myCarousel" style="background-color:#F6F7FD; margin-top: 18px;" class="carousel slide" data-ride="carousel" data-interval="4000">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播项目图片 -->
		<div >
			<div class="carousel-inner" ontouchstart='getFlag()' ontouchmove='setFlag()' ontouchend='change()' style="margin-left: 5%; width: 90%;">
				<div class="item active">
					<a><img :id='bannerlist[0].bannerId' :src="bannerlist[0].img" class="banner" alt="First slide" onclick="xiangxi(this)"></a>
					<div class="carousel-caption">{{bannerlist[0].articleName}}</div>
				</div>
				<div class="item">
					<a><img :id='bannerlist[1].bannerId' :src="bannerlist[1].img" class="banner" alt="Second slide" onclick="xiangxi(this)"></a>
					<div class="carousel-caption">{{bannerlist[1].articleName}}</div>
				</div>
				<div class="item">
					<a><img :id='bannerlist[2].bannerId' :src="bannerlist[2].img" class="banner" alt="Third slide" onclick="xiangxi(this)"></a>
					<div class="carousel-caption">{{bannerlist[2].articleName}}</div>
				</div>
			</div>
		</div>
			<!-- 轮播（Carousel）导航 左右按钮 -->
			<a class="left carousel-control" style="opacity: 0;" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" style="opacity: 0;" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!--大家推荐-->
		<!--app为vue控制div-->
		
		<div   >
		
			<h3 >大家推荐  
				<span  class="time" style="  margin-top: 5px; font-weight: normal; float: right; margin-right: 25px; font-size:15px;" onclick="window.location.href = 'index.jsp'">时间
					<img class="sort" style="   height: 13px; margin-top: -2px; " src="img/166.png" />
				</span>
				<span class="hot" style=" color: rgba(32,203,175,1); margin-top: 5px; font-size: 15px; font-weight: normal; float: right; margin-right: 20px;" >热度 
					<img  style="  height: 13px;  margin-top: -2px; " src="img/166.png" />
				</span>
			</h3>
			<!-- 置顶 -->
			
			
			
			<div class="panel"  style="margin:30px 18px 18px;border-radius:15px 15px 5px 5px;"  >
				<!--推荐的图片-->
				
					<div class="panel-heading" style="margin-top: -10px; padding: 0;">
					<img :src="top[0].textImg"  class="img-responsive " alt="Responsive image"style="padding-top:8px; border-radius:5px 5px 0 0;"></img>
					</div>
					<!--推荐的名字和内容-->
					<div class="panel-body" style=" margin-left: 8px;">
					<p style=" color: rgba(66,66,91,1);font-size: 2.71428rem; font-weight: bold; ">{{top[0].articleName}}</p>
					<p style="color: rgba(66,66,91,1);">{{top[0].text}}</p>
					
				 <!--点赞-->
   				<button  class="btn" @click.once.capture="top[0].likeNum++,top[0].likeTotal++" style="float: right;margin-right: 20px;"    >
   				<img  islike="9999"   :id='top[0].articleId' style="margin-right: 5px; width: 15px;height: 13px;"  onclick="changeImg1(this)" src="img/1010.png">
					<span style=" pointer-events: none;cursor: default; color: rgba(66,66,91,1);font-size:14px;line-height:13px; position:absolute;">{{top[0].likeNum}}
   					</span>
					</img></button>
 						<!--点差评-->
 				<button  class="btn"  @click.once.capture="top[0].unLike++"  style="float: right;margin-right: 40px;" >
 				<img islike="9999"  :id='top[0].articleId'  style="margin-right: 5px; width: 15px;height: 13px;" onclick="changeImg2(this)" src="img/13.png">
 				<span style="pointer-events: none;cursor: default;  color: rgba(66,66,91,1);font-size:14px;line-height:13px; position:absolute;">{{top[0].unLike}}
   				</span>
 				</img></button>
	
			
				</div>
				<!--发表用户及总共点赞数-->
				<div class="panel-footer" style="background-color: white; border: 1px solid rgba(241,241,243,1);border-bottom: none;border-left: none; border-right: none;" >
				<div class="row" >		
					<img class="img-circle img-responsive"   style="margin-left: 2rem; float: left; width:56px;height:56px " :src="top[0].userHead" alt="Responsive image"/>
					<div class="user" style="margin-top: 8px;">
					{{top[0].realName}}<br>
					<p style="margin-top:5px; font-size: 13px;color: rgba(159,159,172,1);letter-spacing: 0px;">{{top[0].className}}</p></div>	
						
					<span class="badge" style="border-radius: 15px; margin-right:20px; margin-top: 25px; line-height: 1.5; background-color:rgba(254,181,36,1); float: right; " >已获得个{{top[0].likeTotal}}<img style=" margin-left: 5px; width: 12px; height: 10px;" src="img/sj.png"/></span>
				</div>	
				</div>
			</div>
			
			
			
			
			
			
			<!--各个推荐模板-->
			<div class="panel"  style="margin:30px 18px 18px;border-radius:15px 15px 5px 5px;" v-for="item in search(keywords)">
				<!--推荐的图片-->
				
					<div class="panel-heading" style="margin-top: -10px; padding: 0;">
					<img :src="item.textImg"  class="img-responsive " alt="Responsive image"style="width:100%;padding-top:8px; border-radius:5px 5px 0 0;"></img>
					</div>
					<!--推荐的名字和内容-->
					<div class="panel-body" style=" margin-left: 8px;">
					<p style=" color: rgba(66,66,91,1);font-size: 2.71428rem; font-weight: bold; ">{{item.articleName}}</p>
					<p style="color: rgba(66,66,91,1);">{{item.text}}</p>
					
					 <!--点赞-->
   				<button  class="btn" @click.once.capture="item.likeNum++,item.likeTotal++" style="float: right;margin-right: 20px;"   >
   					<img  islike="9999"  :id='item.articleId' style="margin-right: 5px; width: 15px;height: 13px;"  onclick="changeImg1(this)" src="img/1010.png">
   					<span style="pointer-events: none;cursor: default;  color: rgba(66,66,91,1);font-size:14px;line-height:13px; position:absolute;">{{item.likeNum}}</span></img></button>
 						<!--点差评-->
 					<button  class="btn"  @click.once.capture="item.unLike++"   style="float: right;margin-right: 40px;" >
 					<img islike="9999"  :id='item.articleId'  style="margin-right: 5px;width: 15px;height: 13px;" onclick="changeImg2(this)" src="img/13.png">
 					<span style="pointer-events: none;cursor: default; color: rgba(66,66,91,1);font-size:14px;line-height:13px;position:absolute;">{{item.unLike}}</span></button>
				
				</div>
				<!--发表用户及总共点赞数-->
				<div class="panel-footer" style="background-color: white; border: 1px solid rgba(241,241,243,1);border-bottom: none;border-left: none; border-right: none;" >
				<div class="row" >		
					<img class="img-circle img-responsive"   style="margin-left: 2rem; float: left; width:56px;height:56px "  :src="item.userHead" alt="Responsive image"/>
					<div class="user" style="margin-top: 8px;">
					{{item.realName}}<br>
					<p style="margin-top:5px; font-size: 13px;color: rgba(159,159,172,1);letter-spacing: 0px;">{{item.className}}</p></div>	
						
					<span class="badge" style="border-radius: 15px; margin-right:20px; margin-top: 25px; line-height: 1.5; background-color:rgba(254,181,36,1); float: right; " >已获得{{item.likeTotal}}个<img style=" margin-left: 5px; width: 12px; height: 10px;" src="img/sj.png"/></span>
				</div>	
				</div>
			</div>
		</div>
		<div class="footer">
	
			<button onclick="window.location.href = '3.jsp'" class="tuijian">
				<span class="badge"style="box-shadow: 0px 6px 10px 0px rgba(32,203,175,0.5);border-radius: 2.85714rem; line-height:4.2rem;  width:14.28571rem; height:4.85714rem; background-color: rgba(32,203,175,1);font-size: 2.28571rem;">
					我要推荐</span></button>
		</div>
		</div>
		
		
		<div id="pop" style="display:none; width: 130px; height: 130px;  background: rgba(43,36,36,0.6);   
        
        width: 150px;
        height: 80px;
        line-height: 80px;/*让黄色div中的文字内容垂直居中*/
        text-align: center;/*让文字水平居中*/
        font-size:20px;
        position: sticky;
        bottom:10%;
        border-radius:15px;
        margin-top: -50px;
        margin:0 auto; ">没有更多信息</div>

		
		
		<!-- 触摸滑动banner -->
		<script type="text/javascript">
		$(document).ready(function(){  
                var startX,endX;//声明触摸的两个变量  
                var offset = 30;//声明触摸距离的变量  
                $('.carousel-inner').on('touchstart',function (e) {  
                    startX= e.originalEvent.touches[0].clientX;//当触摸开始时的x坐标；  
                });  
                $('.carousel-inner').on('touchmove',function (e) {  
                    endX = e.originalEvent.touches[0].clientX;//当触摸离开时的x坐标；  
                });  
                $('.carousel-inner').on('touchend',function (e) {  
                    //当触摸完成时进行的事件；  
                    var distance = Math.abs(startX - endX);//不论正负，取值为正值；  
                    if (distance > offset){  
                        if(startX > endX){  
                            $('#myCarousel').carousel('next');//当开始的坐标大于结束的坐标时，滑动到下一附图  
                        }else{  
                            $('#myCarousel').carousel('prev');//当开始的坐标小于结束的坐标时，滑动到上一附图  
  
                        }  
                                  
                    }  
                });   
            });  
		</script>

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

function xiangxi(data){
	var bannerId=data.id;
	location.replace('Banner.do?bannerId='+bannerId);
}
		//点赞评改变图片的效果
		function	changeImg1(data) {
			 var articleId=data.id;
			 
		 			// alert(result);
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
		
//vue部分
/* var vueone = new Vue({
	el: '#vuebanner',
	data: {
		bannerlist:[],
	},
	created(){ //这个函数与vue的生命周期有关，data和methods初始化后，会执行该函数
		this.getBannerList();
		let self = this;
	},
	methods:{
		getBannerList(){
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/GetBanner.do",
				 dataType:"json",
				 data:{},
				 success: function(mapList){
					 vueone.bannerlist =vueone.bannerlist.concat(mapList);
					 console.log(vueone.bannerlist);
				 },
		 
			});	//ajax结束
		}
	},
}); */
var vm = new Vue({
	el: '#app',
	data: {
		bannerlist:[],
		list:[],
		top:[],
		page:1,	
		keywords:'',
	},
	mounted(){
		this.getBannerList();
		let self = this;},
	created(){ //这个函数与vue的生命周期有关，data和methods初始化后，会执行该函数
		this.getBannerList();
		this.getAllList();
		let self = this;
					
					/* 判断是否到底部，是的话调用getMoreList */
					
		function getScrollTop(){
	　　		var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
	　　		if(document.body){
	　　　　		bodyScrollTop = document.body.scrollTop;
	　　		}
		　　	if(document.documentElement){
		　　　　	documentScrollTop = document.documentElement.scrollTop;
		　　	}
		　　	scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
		　　	return scrollTop;
		}
		//文档的总高度
		function getScrollHeight(){
		　　 var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
		　　 if(document.body){
		　　　　bodyScrollHeight = document.body.scrollHeight;
		　　 }
		　　 if(document.documentElement){
		　　　　documentScrollHeight = document.documentElement.scrollHeight;
		　　 }
		　　 scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
		　　 return scrollHeight;
		}
		function getWindowHeight(){
		　　var windowHeight = 0;
		　　if(document.compatMode == "CSS1Compat"){
		　　　　windowHeight = document.documentElement.clientHeight;
		　　}else{
		　　　　windowHeight = document.body.clientHeight;
		　　}
		　　return windowHeight;
		}
		window.onscroll = function(){
		　　if(getScrollTop() + getWindowHeight() == getScrollHeight()){
		　　　//　alert("已经到最底部了！!");
				self.getMoreList();
				
		　　}
		};
	
		/* p */
		$(window).scroll(function(){
		　　var scrollTop = $(this).scrollTop();
		　　var scrollHeight = $(document).height();
		　　var windowHeight = $(this).height();
		　　if(scrollTop + windowHeight == scrollHeight){
		　　　//　alert("已经到ding部了！");
				location=location;
		　　}
		});
				
				
	}, //created结束
	
	methods: {
	/* 上滑时获取数据，采用将数据连接的方法 */ 
		getMoreList(){
			var now_page=vm.page;
			vm.page++;
			console.log(now_page);
								 	
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/Index.do",
				 dataType:"json",
				 data:{now_page:now_page},
				 success: function(mapList){
					 var arr = Object.getOwnPropertyNames(mapList);
					 if(arr.length==1){
						 
						 $("#pop").css("display","table");
						 var scroll= $(document).scrollTop();
		                    var news = scroll - 30;
		                    $(document).scrollTop(news);
		                    
						 setTimeout(function(){//定时器 
							 $("#pop").css("display","none");//将图片的display属性设置为none
							 },
							 1500);//设置三千毫秒即3秒
					 }else{
					 
					 vm.list =vm.list.concat(mapList);
					 }
					
				 },
		 
			});	//ajax结束
			
		}, //getMoreList结束
					
		//vue中的ajax
		//获取数据库内容
		getAllList(){	
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/OrderByLike.do",
				 dataType:"json",
				 data:{},
				 success: function(mapList){
						vm.list = mapList;
						console.log(vm.list);
				 },
			});//ajax结束
			
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/GetTop.do",
				 dataType:"json",
				 data:{},
				 success: function(mapList){
					 vm.top =vm.top.concat(mapList);
					 console.log(vm.top);
				 },
		 
			});	//ajax结束
		}, //getAllList结束
		search(keywords){
			var newList=[]
			this.list.forEach(item=>{
				if(item.articleName.indexOf(keywords)!=-1){
					newList.push(item)
				}//if结束
			})//foreach结束
			return newList
		},//search结束
		getBannerList(){
			$.ajax({
				 type:"post",
				 url:"/WhatToEatToday/GetBanner.do",
				 dataType:"json",
				 data:{},
				 success: function(mapList){
					 vm.bannerlist =vm.bannerlist.concat(mapList);
					 console.log(vm.bannerlist);
				 },
		 
			});	//ajax结束
		}
		
	} //methods结束
		


}); //Vue结束


			
		</script>
	
	</body>
</html>
