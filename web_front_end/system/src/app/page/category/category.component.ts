import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
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
    constructor(private service:InterfaceService,private router:Router) { }


    // 弹出添加页面
    add(){
      if(this.show == false){
        this.show=true;
      }
     }

    ngOnInit(){
      var that=this;
      this.service.interface("/category/getUserDictionaryList.do",null,
        function(data){  
            that.dataSet=data;
        })
      }
   
     //删除信息
    deleteRow(i: string): void {
      var that=this;
      var obj = {id:i};
      this.service.interface("/category/deleteUserDictionary.do",obj,function(){
          // const dataSet = that.dataSet.filter(d => d.id !== i);
          // this.dataSet = dataSet;
          that.ngOnInit();
      })
    } 
    //添加提交
     submit(){
       var name=this.name;
       var dicclass=this.dicclass;
       var data={name:name,dicclass:dicclass};
       if(name=="" || dicclass==""){
         alert("请填写正确信息");
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
