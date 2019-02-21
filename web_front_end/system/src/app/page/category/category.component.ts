import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd';
@Component({
    selector: 'storeCategory',
    templateUrl: 'category.component.html',
    styleUrls:['category.component.css']
})

export class CategoryComponent implements OnInit {
    i = 1;  
    name:any="";
    dicclass:any="";
    show:any=false;
    dataSet= [];
    indeterminate = false;
    constructor(private service:InterfaceService,private router:Router,private message: NzMessageService) { }


    // 弹出添加页面
    add(){
      if(this.show == false){
        this.show=true;
      }
     }
    cancel(){
      if(this.show == true){
        this.show=false;
      }
    } 
    ngOnInit(){
      var that=this;
      var url = "/category/getUserDictionaryList.do";
      if(JSON.parse(localStorage.user).isadmin == 1){
        url = "category/getPayWayList.do";
      }else{
        //如果是非管理员登录，也需要存储支付方式
        this.service.interface("category/getPayWayList.do",null,
          function(data){
              window.localStorage.setItem("payway",JSON.stringify(data))
          })
      }
      this.service.interface(url,null,
        function(data){
            that.dataSet=data;
            //存储支付类型
            window.localStorage.setItem("category",JSON.stringify(data))
        })
      }
   
     //删除信息
    deleteRow(i: string): void {
      var that=this;
      var obj = {id:i};
      this.service.interface("/category/deleteUserDictionary.do",obj,function(){
          that.ngOnInit();
      })
    } 
    //添加提交
     submit(){
       var name=this.name;
       var dicclass=this.dicclass;
       var data={name:name,dicclass:dicclass};
       if(name=="" || dicclass==""){
        this.message.info("请填写正确信息");
         return;
       }else{
         var that=this;
        this.service.interface("/category/addUserDictionary.do",data,
          function(){
            that.show=false;
            that.ngOnInit();
          })
       }
     }
    }
