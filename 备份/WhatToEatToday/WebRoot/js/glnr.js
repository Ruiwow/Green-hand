  function showInform(){ 
    document.getElementById("inform").style.display='block'; 
    // document.getElementById("inform").css("display","block"); 
                        }  //隐藏悬浮层 
  function hiddenInform(event){ 
  var informDiv = document.getElementById('inform'); 
  var x=event.clientX; 
  var y=event.clientY; 
  var divx1 = informDiv.offsetLeft; 
  var divy1 = informDiv.offsetTop; 
  var divx2 = informDiv.offsetLeft + informDiv.offsetWidth; 
  var divy2 = informDiv.offsetTop + informDiv.offsetHeight; 
  if( x < divx1 || x > divx2 || y < divy1 || y > divy2){ 
  document.getElementById('inform').style.display='none'; 
  } 
   
 } 
  
  
