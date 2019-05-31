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


	<body style="overflow-y:auto">
		<div id="app" style="background-color:#F6F7FD;">
		<!-- 搜索框 -->
			<div class="" style="background: #00A5ED;height: 50px;padding-top: 10px;">
  				<span class="glyphicon glyphicon-search" style="position:absolute;z-index:999;line-height:2.8;margin-left:8vw;top:auto" ></span>
  				<form action="search.jsp" method="post">
  				<input type="text" name="search" id=""search class="form-control" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"  required oninvalid="setCustomValidity('搜索内容不能为空')" oninput="setCustomValidity('')" placeholder="搜搜大家吃了啥" style="display: table; border: medium none;  width: 80%; border-radius: 18px; padding-left: 8vw;margin-left: 15px;" >
  				<button  type="submit" style="color: white;background: transparent;margin-top: -26px;float: right;border: none;margin-right: 1.5rem;">
  				搜索
  				</button>
  				</form>
			</div>
		<h3 >今日推荐</h3>
		<!-- 轮播图 -->
<div class="middle_right" style="padding:10px">
    <div id="lunbobox"  >
       			 <div id="toleft"> &lt;</div>
                <div class="lunbo" style="width:100%; height:auto"  >
                  
                  
                   <a  v-for="item in bannerlist"><img  :id="item.bannerId" onclick="xiangxi(this)" :src="item.img"  class="img-responsive " alt="Responsive image"style="max-height:230px; width:100%;height:auto;   border-radius:5px 5px 5px 5px;"></img>
					</a> 
				
				
                </div>
                <div id="toright">&gt;</div>
                <ul style="margin-bottom:0px">
                    <li></li>
                    <li></li>
                    <li></li>
                   
                </ul>
                <span></span>
        </div>
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
			
			
			<div class="panel"  style="margin:30px 18px 18px; border-radius:15px 15px 5px 5px;"  v-for="item in top" >
				<!--推荐的图片-->
				
					<div class="panel-heading" style="margin-top: -10px; padding: 0;">
					<img :src="item.textImg"  class="img-responsive " alt="Responsive image"style="width:100%; border-radius:5px 5px 0 0;"></img>
					</div>
					<!--推荐的名字和内容-->
					<div class="panel-body" style=" margin-left: 8px;">
					<p style=" color: rgba(66,66,91,1);font-size: 2.71428rem; font-weight: bold; ">{{item.articleName}}</p>
					<p style="color: rgba(66,66,91,1);">{{item.text}}</p>
					
					 <!--点赞-->
   				<button  class="btn"  @click.once.capture="item.likeNum++,item.likeTotal++" style="float: right;margin-right: 25px;"    >
   				<img  islike="9999"  :id='item.articleId' style="margin-right: 5px; width: 15px;height: 13px;"  onclick="changeImg1(this)" src="img/1010.png">
					<span style="pointer-events: none;cursor: default; color: rgba(66,66,91,1);font-size:14px;line-height:13px; position:absolute;">{{item.likeNum}}
   					</span>
					</img></button>
 						<!--点差评-->
 				<button  class="btn"   @click.once.capture="item.unLike++" style="float: right;margin-right: 40px;" >
 				<img islike="9999"   :id='item.articleId'  style="margin-right: 5px; width: 15px;height: 13px;" onclick="changeImg2(this)" src="img/13.png">
 				<span style="pointer-events: none;cursor: default; color: rgba(66,66,91,1);font-size:14px;line-height:13px; position:absolute;">{{item.unLike}}
   				</span>
 				</img></button>
	
			
				</div>
				<!--发表用户及总共点赞数-->
				<div class="panel-footer" style="background-color: white; border: 1px solid rgba(241,241,243,1);border-bottom: none;border-left: none; border-right: none;" >
				<div class="row" >		
					<img class="img-circle img-responsive"   style="margin-left: 2rem; float: left; width:56px;height:56px " :src="item.userHead" alt="Responsive image"/>
					<div class="user" style="margin-top: 8px;">
					{{item.realName}}<br>
					<p style="margin-top:5px; font-size: 13px;color: rgba(159,159,172,1);letter-spacing: 0px;">{{item.className}}</p></div>	
						
					<span class="badge" style="border-radius: 15px; margin-right:20px; margin-top: 25px; line-height: 1.5; background-color:rgba(254,181,36,1); float: right; " >已获得个{{item.likeTotal}}<img style=" margin-left: 5px; width: 12px; height: 10px;" src="img/sj.png"/></span>
				</div>	
				</div>
			</div>
			
			
			
			
			
			<!--各个推荐模板-->
			<div class="panel"  style="margin:30px 18px 18px;border-radius:15px 15px 5px 5px;" v-for="item in list">
				<!--推荐的图片-->
				
					<div class="panel-heading" style="margin-top: -10px; padding: 0;">
					<img :src="item.textImg"  class="img-responsive " alt="Responsive image"style="width:100%; border-radius:5px 5px 0 0;"></img>
					</div>
					<!--推荐的名字和内容-->
					<div class="panel-body" style=" margin-left: 8px;">
					<p style=" color: rgba(66,66,91,1);font-size: 2.71428rem; font-weight: bold; ">{{item.articleName}}</p>
					<p style="color: rgba(66,66,91,1);">{{item.text}}</p>
					
					 <!--点赞-->
   				<button  class="btn" @click.once.capture="item.likeNum++,item.likeTotal++" style="float: right;margin-right: 25px;"   >
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
		
			<div id="loading" style="   
        
        
      
        text-align: center;/*让文字水平居中*/
       
        position: sticky;
        bottom:12%;
        border-radius:15px;
        margin-top: -50px;
        margin:0 auto; "></div>
		
<div id="pop" style=" display: none;  background: rgba(43, 36, 36, 0.6) none repeat scroll 0% 0%; width: 150px; height: 80px; line-height: 80px; text-align: center; font-size: 20px; position: sticky; bottom: 50%; border-radius: 15px; margin: 0px auto;color: white; ">没有更多信息</div>



<script>
///轮播
$(function() {
    //$("#toright").hide();
    //$("#toleft").hide();
    $('#toright').hover(function() {
        $("#toleft").hide()
    }, function() {
        $("#toleft").show()
    })
    $('#toleft').hover(function() {
        $("#toright").hide()
    }, function() {
        $("#toright").show()
    })
})

var t;
var index = 0;
/////自动播放
t = setInterval(play, 3000)

function play() {
    index++;
    if (index > 2) {
        index = 0
    }
    // console.log(index)
    $("#lunbobox ul li").eq(index).css({
        "background": "white",
        "border": "1px solid white"
    }).siblings().css({
        "background": "transparent",
        "border": "1px solid white"
    })

    $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
};

///点击鼠标 图片切换
$("#lunbobox ul li").click(function() {

    //添加 移除样式
    //$(this).addClass("lito").siblings().removeClass("lito"); //给当前鼠标移动到的li增加样式 且其余兄弟元素移除样式   可以在样式中 用hover 来对li 实现
    $(this).css({
        "background": "white",
        "border": "1px solid #ffffff"
    }).siblings().css({
        "background": "#cccccc"
    })
    var index = $(this).index(); //获取索引 图片索引与按钮的索引是一一对应的
    // console.log(index);

    $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
});

/////////////上一张、下一张切换
$("#toleft").click(function() {
    index--;
    if (index <= 0) //判断index<0的情况为：开始点击#toright  index=0时  再点击 #toleft 为负数了 会出错
    {
        index = 2
    }
    console.log(index);
    $("#lunbobox ul li").eq(index).css({
        "background": "red",
        "border": "1px solid #ffffff"
    }).siblings().css({
        "background": "#cccccc"
    })

    $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）必须要写
}); // $("#imgbox a ")获取到的是一个数组集合 。所以可以用index来控制切换

$("#toright").click(function() {
    index++;
    if (index > 2) {
        index = 0
    }
    console.log(index);
    $(this).css({
        "opacity": "0.5"
    })
    $("#lunbobox ul li").eq(index).css({
        "background": "red",
        "border": "1px solid #ffffff"
    }).siblings().css({
        "background": "#cccccc"
    })
    $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
});
$("#toleft,#toright").hover(function() {
        $(this).css({
            "color": "black"
        })
    },
    function() {
        $(this).css({
            "opacity": "0.3",
            "color": ""
        })
    })
///

///////鼠标移进  移出
$("#lunbobox ul li,.lunbo a img,#toright,#toleft ").hover(
    ////////鼠标移进
    function() {
        $('#toright,#toleft').show()
        clearInterval(t);

    },
    ///////鼠标移开
    function() {
        //$('#toright,#toleft').hide()
        //alert('aaa')
        t = setInterval(play, 3000)

        function play() {
            index++;
            if (index > 2) {
                index = 0
            }
            $("#lunbobox ul li").eq(index).css({
                "background": "red",
                "border": "1px solid #ffffff"
            }).siblings().css({
                "background": "#cccccc"
            })
            $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
        }
    })
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
		

var vm = new Vue({
	el: '#app',
	data: {
		bannerlist:[],
		list:[],
		top:[],
		page:1,	
		keywords:'',
	},
	created(){ //这个函数与vue的生命周期有关，data和methods初始化后，会执行该函数
		this.getBannerList();
		this.getAllList();
		let self = this;
					
		//判断浏览器	执行不同操作
		$(function(){
		     if($.browser.msie) {
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
		     }else if($.browser.mozilla) {
		    	
		    		window.onscroll  = function (){
				    var marginBot = 0;
				    if (document.compatMode === "CSS1Compat"){
				        marginBot = document.documentElement.scrollHeight - (document.documentElement.scrollTop+document.body.scrollTop)-  document.documentElement.clientHeight;
				    } else {
				        marginBot = document.body.scrollHeight - document.body.scrollTop-  document.body.clientHeight;
				    }
				    if(marginBot<=0) {
				    	self.getMoreList();
				    }
				} 
				
		     }else if($.browser.chrome) {
		    	 window.onscroll=function(){
		 			test();
		 			}
		 			function test(){
		 			var a = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		 			var b = document.documentElement.scrollTop==0? document.body.scrollTop : document.documentElement.scrollTop;
		 			var c = document.documentElement.scrollTop==0? document.body.scrollHeight : document.documentElement.scrollHeight;
		 		
		 			  if(a+Math.floor(b)==c || a+Math.ceil(b)==c){
		 				  self.getMoreList();
		 			}
		 			}
		 		
		     }
		     else{
		    	 window.onscroll=function(){
			 			test();
			 			}
			 			function test(){
			 			var a = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
			 			var b = document.documentElement.scrollTop==0? document.body.scrollTop : document.documentElement.scrollTop;
			 			var c = document.documentElement.scrollTop==0? document.body.scrollHeight : document.documentElement.scrollHeight;
			 		
			 			  if(a+Math.floor(b)==c || a+Math.ceil(b)==c){
			 				  self.getMoreList();
			 			}
			 			}
		    	 
		     }
		})
		
		
				
				
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
				  beforeSend: function(){
  			        $('#loading').html("<img src=\"img/loading.gif\" width=\"10%\" style=\"text-align:center;margin:0 auto;\"><p style=\"color:#999;font-size:14px\">加载中，请稍后……</p>") //数据发送过程中先加载图片
  			        $(document.body).css({
  			        	   "overflow-x":"hidden",
  			        	   "overflow-y":"hidden"
  			        	 });
  			      },
  
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
						  $("#loading").empty(); 
						  $(document.body).css({
  			        	   "overflow-x":"auto",
  			        	   "overflow-y":"auto"
  			        	 });
					 return false;
				 }else{ 
					  $("#loading").empty(); 
					  $(document.body).css({
			        	   "overflow-x":"auto",
			        	   "overflow-y":"auto"
			        	 });
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
