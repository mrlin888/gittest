<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>客户关系管理系统-用户登录页面</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>客户关系管理系统-用户登录<sup>2016</sup></h1>
<script type="text/javascript">  
<!--动态验证用户名和密码不能为空-->
function checkUserName(obj){  
    var username = obj;  
    var checkUserNameResult = document.getElementById("checkUserNameResult");    
    if(username.trim().length==0){  
          checkUserNameResult.innerHTML = "用户名不能为空";    
          obj.focus();  
    }else{  
         checkUserNameResult.innerHTML = "";    
    }  
}  
</script>  

<script type="text/javascript">  
function checkPassword(obj){  
    var password = obj;  
    var checkPasswordResult = document.getElementById("checkPasswordResult");   
    if(password.trim().length==0){  
        checkPasswordResult.innerHTML = "密码不能为空";    
        obj.focus();  
    }else{  
         checkPasswordResult.innerHTML = "";    
    }  
}  

</script>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<!-- <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div> -->
        </div>
    </div>    
  
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    
   	<!--登录-->
      <div class="web_login" id="web_login">
         <div class="login-box">
			<div class="login_form">
				<%-- <form action="${pageContext.request.contextPath}/index.jsp" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"> --%>
				<form action="${pageContext.request.contextPath}/login.action" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
					<input type="hidden" name="did" value="0"/>
              		<input type="hidden" name="to" value="log"/>
              		
		            <div class="uinArea" id="uinArea">
		                <label class="input-tips" for="u">帐号：</label>
		                <div class="inputOuter" id="uArea">
	                    	<input type="text" id="u" name="username" class="inputstyle"  onblur="checkUserName(this.value);"/>
	                    	 <td><span id="checkUserNameResult" style="color: red "></span>  </td>  
	               		</div>
	                </div>
	                
	                <div class="pwdArea" id="pwdArea">
		               <label class="input-tips" for="p">密码：</label> 
		               <div class="inputOuter" id="pArea">
		                    <input type="password" id="p" name="password" class="inputstyle" onblur="checkPassword(this.value);"/>
		               		<td><span id="checkPasswordResult" style="color: red "></span></td> 
		                </div>
	                </div>
               
	                <div style="padding-left:50px;margin-top:20px;">
	                	<input type="submit" value="登 录" style="width:150px;" class="button_blue"/>
	                </div>
                </form>
           </div>
         </div>
    </div>
    <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="" method="post">
	      <input type="hidden" name="to" value="reg"/>
		  <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
                    </div>
                </li>
                
                <li>
                 <label for="qq" class="input-tips2">QQ：</label>
                    <div class="inputOuter2">
                        <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="注册"/>
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
    </div>
    </div>
    <!--注册end-->
    
</div>
<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
</html>