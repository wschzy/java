import { Component, OnInit } from '@angular/core';
import {FormBuilder,FormControl,FormGroup,Validators} from '@angular/forms';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
@Component({
    selector: 'add-user',
    templateUrl: 'add-user.component.html',
    styleUrls:['add-user.component.css']
})

export class AddUserComponent implements OnInit {
    validateForm: FormGroup;
    passwordVisible = false;
    password: string;
    users:{};
    constructor(private fb: FormBuilder,private service:InterfaceService,private router:Router) {
      this.buildFrom();
    }
    
    submitForm(): void {
        var that=this;
        var loginid=this.validateForm.controls.nickname.value;
        var pwd=this.validateForm.controls.password.value;
        var phone=this.validateForm.controls.phoneNumber.value;
        var sex=this.validateForm.controls.Sex.value;
        var fullname=this.validateForm.controls.fullname.value;
        var email=this.validateForm.controls.email.value;
        var data={loginid:loginid,password:pwd,phone:phone,sex:sex,fullname:fullname,email:email};
        console.log(data)
        this.service.interface("SysUserInfo/addUser.do",data,
          function(data){
            that.users=data;
            console.log(that.users)
          })
        }
  
    ngOnInit(): void {
      
    }
    buildFrom(){
      this.validateForm = this.fb.group({
        email            : [ null, [ Validators.email, Validators.required ] ],
        password         : [ null, [Validators.minLength(6)]],
        nickname         : [ null, [ Validators.required ] ],
        fullname         : [ null ],
        phoneNumber      : [ null, [ Validators.required ] ],
        Sex               :[null,[Validators.required]]
      });
    }
  }