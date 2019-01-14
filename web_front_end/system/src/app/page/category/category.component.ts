import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import throttleByAnimationFrame from 'ng-zorro-antd/core/util/throttleByAnimationFrame';
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
    dele:any=false;
    allChecked = false;
    dataSet= [];
    indeterminate = false;
    constructor(private service:InterfaceService,private router:Router) { }
    // 弹出添加页面
    add(){
      if(this.show == false){
        this.show=true;
      }
     }
    //  删除信息
    deleteRow(i:string){
      var that=this;
      const dataSet = this.dataSet.filter(d => d.id !== i);
      this.dataSet = dataSet;
      this.service.interface("/category/deleteUserDictionary.do",dataSet,
        function(){
          that.ngOnInit();
        })
    }
    ngOnInit(){
      var that=this;
      this.service.interface("/category/getUserDictionaryList.do",null,
        function(data){
            that.dataSet=data;
        })
      }
    // 表格 分页 和全选
    refreshStatus(): void {
      const allChecked = this.dataSet.every(value => value.checked === true);
      const allUnChecked = this.dataSet.every(value => !value.checked);
      this.allChecked = allChecked;
      this.indeterminate = (!allChecked) && (!allUnChecked);
    }
  
    checkAll(value: boolean): void {
      this.dataSet.forEach(data => data.checked = value);
      this.refreshStatus();
    }
    // 添加提交
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
    //  删除提交
    del(){
      this.service.interface("/category/deleteUserDictionary.do",null,
        function(){
          
        })
    }
}  