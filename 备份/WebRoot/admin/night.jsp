<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>今天吃啥后台</title>
    
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

</style>

</head>

 
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

</script>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  
 
  //直接嵌套显示
  laydate.render({
    elem: '#test-n1'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n2'
    ,position: 'static'
    ,lang: 'en'
  });
  laydate.render({
    elem: '#test-n3'
    ,type: 'month'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n4'
    ,type: 'time'
    ,position: 'static'
  });
});
</script>
<script>
    function changepic(obj) {
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc=getObjectURL(obj.files[0]);
        var p= document.getElementById('show');
        document.getElementById('show').src=newsrc;
        p.style.width=435;
         p.style.height=auto;
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
<body bgcolor="white">
<div>
  <div class="fixative">
  <div class="left">
    <div class="ab-1">
    <a class="head-1" href="Admin.do" style="text-decoration:none" id="a1" onclick="a()">管理内容</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/morning.jsp" style="text-decoration:none" id="a2" onclick="b()">上午推荐</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/noon.jsp" style="text-decoration:none" id="a3" onclick="c()">中午推荐</a></div>
    <div class="ab-1">
    <a class="head-1" href="admin/night.jsp" style="color:rgba(32,203,175,1);text-decoration:none" id="a4" onclick="d()">晚上推荐</a></div>
  </div>
  <div class="mid">
    <div class="ab-2">
        <a class="head-6" href="#cover"  style="text-decoration:none" visited="color: rgba(32,203,175,1)" id="a5">时间 </a></div>
    <div class="ab-3">
        <a class="head-6" href="#cover"  style="text-decoration:none" visited="color: rgba(32,203,175,1)" id="a6">热度 </a></div>
  </div>
  </div>
  <div class="right">
            <div class="site-demo-laydate"">
                <div class="rili" id="test-n1"></div>
                </div>
  <div class="font-style-2">
                食物名称
            </div> 
            <form enctype="multipart/form-data" action="AdminAdd.do" method="post" >
            <input class="input-1" / required  onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" name="foodname">
            <div class="font-style-3">
                相关描述
            </div>
            <textarea class="textarea-1" / required  onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" name="description">
            </textarea>
            
            <img id="show" src="img/QQ图片20190412181944.png"  class="photo-1">
            

            <div class="font-style-4">
                定时发布
                	
			
            </div>
			<input type="hidden" value="晚" name="time"/>
            <button type="submit" class="button" >
            <p class="font-style-5">发布推荐</p>
            </button>
            <input class="yincang"  accept="image/*"  name="photo" onchange="changepic(this)" type="file"/ required >
            </form>
            </div>
  
   
</div>
</body>
</html>
