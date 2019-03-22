import { Component, OnInit } from '@angular/core';
import {FormBuilder,FormControl,FormGroup,Validators, ValidationErrors} from '@angular/forms';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { Observable, Observer } from 'rxjs';
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
        this.service.interface("SysUserInfo/add.do",data,
          function(data){
            that.users=data;
            that.router.navigateByUrl('user');
          })
    }
    // 退出添加页面
    quit(){
      this.router.navigateByUrl('user');
    }
    ngOnInit(): void {
      
    }
    buildFrom(){
      this.validateForm = this.fb.group({
        email            : [ null, [ Validators.email, Validators.required ] ],
        password         : [ null, [Validators.minLength(6)]],
        nickname         : [ null, [ Validators.required ] ],
        fullname         : [ null ],
        phoneNumber      : [ null, [ Validators.required ] ,[this.phoneValidator]],
        Sex               :[null,[Validators.required]]
      });
    }
     // 校验手机号码
    phoneValidator = (control: FormControl) =>
    Observable.create((observer: Observer<ValidationErrors>) => {
    if (control.value) {
      let dataInfo: any;
      let phoneReg =  /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
      let phoneResult = phoneReg.test(control.value);
      if (!phoneResult) {
        observer.next({error: true, phoneregexed: true});
      } else {
        observer.next(null);
      }
      observer.complete();

    }
});
  }