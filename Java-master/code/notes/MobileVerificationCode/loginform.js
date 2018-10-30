
  function login(){
  	if($("#username").val()==null || $("#username").val()==""){
  		alert("请输入用户名");
        $("#username").focus();
  	}else if($("#password").val()==null || $("#password").val()==""){
      	alert("请输入密码");
		$("#password").focus();
  	}else{
  		$(".dl").hide();
		$(".zzdl").show();
		window.setTimeout(function(){
			toLogin();
			$(".dl").show();
			$(".zzdl").hide();
		},1);
  		
  	}
  }
//键盘确认按钮事件
function iLogin(event){
   	event = (event) ? event : ((window.event) ? window.event : "");
   	var keyCode = event.keyCode?event.keyCode:event.which;
   	
   	if(keyCode == 13){
   		login();
   	}
}

$(window).resize(function(){
	heightresize();
});

$(document).ready(function(){	

	$("body").ezBgResize({
        img : "images/bg.jpg",
        callback:function(){
        	replaceElements("form", "login", window);
        	showEWM();
        }
    });
	
	heightresize();

   	$("#username").focus();
   	var username = window.localStorage.login_saveInfo;
   	if(username == null){
   		username="";
   	}
   	$("#username").val(username);
   	if($("#username").val() == ""){
   		$("#username").focus();
   	}else{
   		$("#password").focus();
   	}
   	
   	getkeys();
   	//setTimeout(function(){showEWM();},1);
   
});
//点击显示二维码
function showEWM(){
	$(".app").mousemove(function (en) {  
		        var xPos=parseInt(en.offsetX)+"px";
		        $(".app_img").css("left", xPos); 
		        //$(".app_img").css("top", "320px"); 
		        $(".app_img").show(1000);
		    });
	$(".app").mouseout(function (en) {  
	    $(".app_img").hide(500);
	});
	
	$(".wx").mousemove(function (en) {  
		        var xPos=parseInt(en.offsetX)+"px";
		        $(".wx_img").css("left", xPos); 
		        $(".wx_img").show(1000);
		    });
	$(".wx").mouseout(function (en) {  
	    $(".wx_img").hide(500);
	});

}

function heightresize(){
	var h=$(window).height();
	h=(h-540)/2;
	if(h<=0)
		h=0;
	$(".login-top").css("height",h);
}

function setCountDown(){
	$('#Reacquisition').html("重新获取(60)");
    $("#Reacquisition").removeClass("Reacquisition");
    $("#Reacquisition").addClass('codedisabled');
    $("#Reacquisition").attr("disabled",true);
    setTimeout("thrty(59)",1000);
}
function thrty(tm){
	if(tm==0){
		$('#Reacquisition').html("&nbsp;&nbsp;&nbsp;重新获取");
		$('#Reacquisition').addClass("Reacquisition");
		$('#Reacquisition').removeClass("codedisabled");
		$('#Reacquisition').removeAttr("disabled");
		return;
	}
	$('#Reacquisition').html("重新获取("+tm+")");
	setTimeout("thrty("+(tm-1)+")",1000);
}

function sendCode(){
	if(!$("#Reacquisition").attr("disabled")){
	
		var username=$("#username").val();
		var phoneNum=$("#phoneNum").val();
		
		$.ajax({
			url : Fix.App.getHost() + 'servlet/LoginServlet.cmd',
			dataType : 'json',
			type : 'post',
			async : false,
			data : {
				action : 'toSendCode',
	            username : username
			},//传入的参数
			success : function(response) { 
				if(response.sendSuc==true||response.sendSuc=="true"){//发送成功
					$("#cue").text("验证码已发送至手机"+phoneNum.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2'));
				    setCountDown();
			    }else if(response.errmsg=="416"){
					Fix.Runtime.setError("您的手机号接收验证码次数超过今日最大值");
				}else{//发送失败
					$('#Reacquisition').removeAttr("disabled");
			    	alert("获取验证码失败");
			    }
			}
		});
	}
}

//获取密匙
function getkeys(){
	$.ajax({
		url : Fix.App.getHost() + 'servlet/LoginServlet.cmd',
		dataType : 'json',
		type : 'post',
		async : false,
		data : {
			action : 'getPubkey'
		},
		success : function(response) {
			var publickey=response.pubkey;
			$("#pubkey").val(publickey);
			$.cookie("pubKey",publickey,{path: '/' });
			
			if(response.AESEncryption==true||response.AESEncryption=="true"){
				var AESKey=createAESkey();
				$.cookie("AESKey",AESKey,{path: '/' });
				$.cookie("AESEncryption",true,{path: '/' });
			}else{
				$.cookie("AESKey","",{path: '/' });
				$.cookie("AESEncryption",false,{path: '/' });
			}
		}
	});
}
