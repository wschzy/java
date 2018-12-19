import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import { InterfaceService } from 'src/app/interface/interface.component';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
@Component({
    selector: 'login',
    templateUrl: 'login.component.html',
    styleUrls:['login.component.css']
})

export class LoginComponent implements OnInit {
    constructor(private service:InterfaceService) { 
       
    }

    ngOnInit() {
        
    }
    submit(){
        var username=$('#username').val();
        var password = $("#password").val();    
        var data= {loginid:username,password:password};
        if(username == '' || password == '') {
            alert("用户名或密码不能为空");
            return;
        }else if(username !=='')  
        this.service.interface("SysUserInfo/findUser", data,
            function(data:any){
                 window.localStorage.setItem("user",JSON.stringify(data));//将用户信息放入缓存中
                // window.location.href="http://www.baidu.com";
            }
        );
        
    }

   
   
}