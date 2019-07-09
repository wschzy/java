import { Component, OnInit, ElementRef } from '@angular/core';
import {FormBuilder,FormControl,FormGroup,Validators, ValidationErrors} from '@angular/forms';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { Observable, Observer } from 'rxjs';
import {NzMessageService,UploadFile} from 'ng-zorro-antd';
@Component({
    selector: 'add-user',
    templateUrl: 'add-user.component.html',
    styleUrls:['add-user.component.css']
})

export class AddUserComponent implements OnInit {
    validateForm: FormGroup;
    passwordVisible = false;
    password: string;
    public userInfo: any;
    // 添加/编辑状态
    public isAddStatus: boolean;
    constructor(private fb: FormBuilder,
                private service:InterfaceService,
                private router:Router,
                public msg: NzMessageService,
                private el:ElementRef,
                ){
      this.buildFrom();
    }
    
    submitForm(): void {
        var that=this;
        var loginid=this.validateForm.controls.nickname.value;
        var pwd=this.validateForm.controls.password.value;
        var phone=this.validateForm.controls.phoneNumber.value;
        var sex=this.validateForm.controls.sex.value;
        var fullname=this.validateForm.controls.fullname.value;
        var email=this.validateForm.controls.email.value;
        var id =this.validateForm.controls.id.value;
        var data={loginid:loginid,password:pwd,phone:phone,sex:sex,fullname:fullname,email:email};
        var data1={loginid:loginid,password:pwd,phone:phone,sex:sex,fullname:fullname,email:email,id:id};
        if (this.isAddStatus) {
        this.service.post("SysUserInfo/add",data,
          function(){
            console.log('添加用户信息成功');
            that.router.navigateByUrl('user');
          })
        }else {
          this.service.put("SysUserInfo/update",data1,
            function(data){
              console.log(data);
              console.log('编辑用户信息成功');
              that.router.navigateByUrl('user');
            })
        }
    }
  
    // 退出添加页面
    quit(){
      this.router.navigateByUrl('user');
    }
    ngOnInit(): void {
      
      this.isAddStatus = this.service.isAdd;
      if(this.isAddStatus==false){
        // this.el.nativeElement.querySelector('#pwd').style.visibility="hidden";
        this.validateForm.controls.nickname.disable();
        // console.log(divEle);
      }else if(this.isAddStatus==true){
        // this.el.nativeElement.querySelector('#pwd').style.visibility="show";
      }
      this.userInfo = this.service.commonObj;
      if (!this.isAddStatus) {
        if (!this.userInfo) {
          this.quit();
          return;
        }
      this.validateForm.patchValue({
        email: this.userInfo.email,
        nickname: this.userInfo.loginid,
        fullname: this.userInfo.fullname,
        phoneNumber: this.userInfo.phone, 
        sex: this.userInfo.sex,
        id: this.userInfo.id,
        password:this.userInfo.pwd
      })
    }
    }
    buildFrom(){
      this.validateForm = this.fb.group({
        email            : [ null,[Validators.required ],[ this.emailValidator] ],
        password         : [ null,  this.isAddStatus ? [Validators.required, Validators.minLength(6)] : []],
        nickname         : [ null, [ Validators.required ] ],
        fullname         : [ null ],
        phoneNumber      : [ null, [ Validators.required ] ,[this.phoneValidator]],
        sex              : [ null, [ Validators.required ]],
        id               : [null]
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
   // 邮箱校验
   emailValidator = (control: FormControl): any => {
    return Observable.create((observer) => {
      let emailReg = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
      let emailResult = emailReg.test(control.value);
      if (!control.value) {
        observer.next(null);
        observer.complete();
      } else if (!emailResult) {
        observer.next({error: true, emailregexed: true});
        observer.complete();
      } else {
        observer.next(null);
        observer.complete();
      }
    });
  };
  }