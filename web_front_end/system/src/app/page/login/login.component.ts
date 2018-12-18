import { Component, OnInit } from '@angular/core';
import {UserLoginService} from './login.component.service';
import * as $ from 'jquery';
@Component({
    selector: 'login',
    templateUrl: 'login.component.html',
    styleUrls:['login.component.css']
})

export class LoginComponent implements OnInit {
    // submit(){
    //     var username = $("#username").val();
    //     var password = $("#password").val();
    //     if(!username || username == ""){
    //         $('#btn').attr('disabled',"true");
    //         alert("请输入用户名！"); 
    //     }
    //     if(!password || password == ""){
    //        $("#btn").attr('disabled',"true");
    //        alert("请输入密码！");
    //     }
    //   }
    constructor(private loginService:UserLoginService) { 
        
    }

    ngOnInit() {

    }
    submit(){
        var data= {loginid:"hzy",password:"123456"};
        this.loginService.login(data,
            function(data:any){
                window.localStorage.setItem("user",JSON.stringify(data));//将用户信息放入缓存中
                window.location.href="http://www.baidu.com";
            }
        );
        
    }

   
   
}