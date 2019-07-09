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
      this.dataSet=JSON.parse(localStorage.category);
    }
   
     //删除信息
    deleteRow(i: string): void {
      var that=this;
      this.service.delete("/category/delete/"+i,function(){
          //更新用户类别缓存 并刷新列表
          that.service.userDicCash(function(){that.ngOnInit();});
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
         this.service.post("/category/add",data,
          function(){
            that.show=false;
            //更新用户类别缓存 并刷新列表
            that.service.userDicCash(function(){that.ngOnInit();});
          })
       }
     }
    }
