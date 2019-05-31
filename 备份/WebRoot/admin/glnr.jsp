<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理内容</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/glnr.css" />
	<style>
        @media screen and (max-width: 2500px) {
		html{font-size: 16px;}
		}
		@media screen and (max-width: 1600px) {
		html{font-size: 14px;}
		}
		@media screen and (max-width: 1400px) {
		html{font-size: 12px;}
		}
		@media screen and (max-width: 1200px) {
		html{font-size: 10px;}
		}
		@media screen and (max-width: 1000px) {
		html{font-size: 9px;}
		}
		@media screen and (max-width: 800px) {
		html{font-size: 8px;}
		}			 
        .page{
        text-align: center;
        margin-top: 50px;
        }
        .page a{
        text-decoration: none;
        border:1px solid #f9d52b;
        padding: 5px 7px;
        color: #767675;
        cursor: pointer;
        }
        .page a:hover,.page span:hover{
        color: red;
        }    

		.page a:current{
			color:red;
		}
</style>
  </head>
  <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
  <script type="text/javascript">
    function a(){
    document.getElementById("a1").style.color='yellow';
    document.getElementById("a2").style.color='#999999';
    document.getElementById("a3").style.color='#999999';
    document.getElementById("a4").style.color='#999999';
    document.getElementById("a5").style.display='';
     document.getElementById("a6").style.display='';
}
function b(){
    document.getElementById("a1").style.color='#999999';
    document.getElementById("a2").style.color='yellow';
    document.getElementById("a3").style.color='#999999';
    document.getElementById("a4").style.color='#999999';
     document.getElementById("a5").style.display='none';
     document.getElementById("a6").style.display='none';
}
function c(){
    document.getElementById("a1").style.color='#999999';
    document.getElementById("a2").style.color='#999999';
    document.getElementById("a3").style.color='yellow';
    document.getElementById("a4").style.color='#999999';
     document.getElementById("a5").style.display='none';
     document.getElementById("a6").style.display='none';
}
function d(){
    document.getElementById("a1").style.color='#999999';
    document.getElementById("a2").style.color='#999999';
    document.getElementById("a3").style.color='#999999';
    document.getElementById("a4").style.color='yellow';
     document.getElementById("a5").style.display='none';
     document.getElementById("a6").style.display='none';
}

function deletefood(articleId){
	//alert(id);
	if(window.confirm('你确定要删除吗？')){
                 //alert("确定");
         $.ajax({
		 type:"post",
		 url:"/WhatToEatToday/Delete.do",
		 data:{articleId:articleId},
		 
		 success: function(data){
		// alert(data);
             if(data == 1){
             	alert("删除成功");
             	location.reload();		//刷新当前页面
             }
		 },
		 error:function(){
			 alert('失败');
		 }
	 });
              }else{
                 //alert("取消");
                 return false;
    }
	
}

function topfood(articleId){
	//alert(articleId);
	 $.ajax({
		 type:"post",
		 url:"/WhatToEatToday/Top.do",
		 data:{articleId:articleId},
		 
		 success: function(data){
			// alert(data);
             if(data == 1){
             	alert("置顶成功");
             	//location.reload();		//刷新当前页面
             }
		 },
		 error:function(){
			 alert('失败');
		 }
	 });
}
</script>
<body bgcolor="white">
<div>
  <div class="fixative">
  <div class="left">
    <div class="ab-1">
    <a class="head-1" href="Admin.do" style="color:rgba(32,203,175,1);text-decoration:none" id="a1" onclick="a()">管理内容</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/morning.jsp" style="text-decoration:none" id="a2" onclick="b()">上午推荐</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/noon.jsp" style="text-decoration:none" id="a3" onclick="c()">中午推荐</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/night.jsp" style="text-decoration:none" id="a4" onclick="d()">晚上推荐</a></div>
  </div>
  <div class="mid">
    <div class="ab-2">
        <a class="head-6" href="#cover"  style="text-decoration:none" visited="color: rgba(32,203,175,1)" id="a5">时间 </a></div>
    <div class="ab-3">
        <a class="head-6" href="#cover"  style="text-decoration:none" visited="color: rgba(32,203,175,1)" id="a6">热度 </a></div>
  </div>
  </div>
  <div class="manxfd">
  <div class="sousuo">
  <br><br><br>
<!--bootstrap：搜索框 -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="input-group">
            
            	<form action="Find.do" method="post">
	                <input name="articleName" type="text" class="form-control"  placeholder="请输入检索关键字" style="margin-left: 1100px;font-size: 21px;">
	                <span class="input-group-btn">
	                    <button class="btn btn-primary" style="font-size: 21px;">检索</button>
	                </span>
                </form>
                
            </div>
        </div>
    </div>
</div>
</div>
  <div class="right">
  	<c:forEach items="${mapList }" var="food">
        <div id="komu">
            <div style="height: 274px">    
                <img class="img-1" src="${food.textImg }">
            </div>
            <div class="abcd-1" style="width: 411px;height: 358px">
            <div style="width: 66px;height: 33px">
               <textarea class="primary-1" rows="1" cols="45" style="border-bottom: none;border-top: none;border-left: none;border-right: none;font-weight: 510">${food.articleName }</textarea>
            </div>
            <div>
                <textarea class="primary-2" style="border-bottom: none;border-top: none;border-left: none;border-right: none">${food.text }
                </textarea>
            </div>
            <div>
                <img class="img-2" src="img/碎无色.png">
                <h2 class="head-2">${food.unLike }</h2>
                <img class="img-3" src="img/好有色.png">
                <h2 class="head-3">${food.likeNum }</h2>
            </div>
            <div style="width: 411px;height: 1px;color: #F6F7FD">
            </div>
            </div>
            <div class="abcd-2">
                <div class="abc-1">
                    <div>
                    <img class="img-4" src="${food.userHead }">
                    </div>
                    <div>
                        <div>
                        <p class="primary-3"><b>${food.realName }</b></p>
                        <p class="primary-4">${food.className }</p></div>
                    </div>
                </div>
                <div class="abc-2">
                <div class="button-1" >
                <p class="button-2">已获得${food.likeTotal }个爱心
                <img class="img-5" src="img/后台端已获得爱心.png">
                </p>
                </div>
                </div>
            </div>
            <div class="abcd-3">
            <div class="abc-3"><img onclick="topfood(${food.articleId})" src="img/置顶.png"></div>
            <div class="abc-4"><img onclick="deletefood(${food.articleId})" src="img/删除.png"></div>
            </div> 
        </div>
      </c:forEach> 
    </div>
</div>    
        <c:if test="${!empty totalPage }">
        <div class="mant">
        <div class="page">
       
        <a href="Admin.do?page=1">首页</a>
        <a href="Admin.do?page=${pageInt eq 1 ? 1 : pageInt - 1}">上一页</a>
        <c:if test="${totalPage > 5 }">
        <a href="Admin.do?page=1">1</a>
        <a href="Admin.do?page=2">2</a>
        <a href="Admin.do?page=3">3</a>
        ...
        <a href="Admin.do?page=${totalPage - 1 }">${totalPage - 1 }</a>
        <a href="Admin.do?page=${totalPage }">${totalPage }</a>
        </c:if>
        
        <c:if test="${totalPage <= 5 }">
        <c:forEach  var="i" begin="1" end="${totalPage }" step="1">
        <a href="Admin.do?page=${i }">${i }</a>
        </c:forEach>
        </c:if>
        
        <a href="Admin.do?page=${pageInt eq totalPage ? pageInt : pageInt + 1}">下一页</a>
        <a href="Admin.do?page=${totalPage }">尾页</a>
       	共 ${totalPage }页,当前第${pageInt }页
        </div>
        </div>
   		</c:if>
</div>
</body>
</html>
