import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import {Router} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector: 'login',
    templateUrl: 'login.component.html',
    styleUrls:['login.component.css']
})

export class LoginComponent implements OnInit {
    name:any="";
    word:any="";
    checked = false;
    constructor(private service:InterfaceService,private router: Router) { 
     
    }
    ngAfterContentInit(){
    }
    ngOnInit() {
        
    }
    submit(){
        var username=this.name;
        var password =this.word;    
        var data= {loginid:username,password:password};
        var that = this;
        if(username == '' || password == '') {
            alert("用户名或密码不能为空");
            return;
        }else if(username !=='') { 
        this.service.interface("SysUserInfo/findUser", data,  
            function(data:any){
                that.router.navigateByUrl('/index');  
                window.localStorage.setItem("user",JSON.stringify(data));//将用户信息放入缓存中
                //  window.location.href="http://www.baidu.com"; 
                       
            }
        );
      }
     
    }   
}