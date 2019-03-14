import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NzMessageService } from 'ng-zorro-antd';
import { InterfaceService } from 'src/app/interface/interface.component';

@Component({
    selector: 'task',
    templateUrl: 'task.component.html',
    styleUrls:['task.component.css']
})

export class TaskComponent implements OnInit {
    initLoading = true; // bug
    list = [];
    
  
    constructor(private http: HttpClient, private msg: NzMessageService, private service:InterfaceService) {}
  
    ngOnInit(){
      var that=this;
      
      this.service.interface("/userspbz/getUserSpbzList.do",null,
        function(data){
          that.list=data;
          console.log(data);
        })
    }
    isagree(item,approval){
      var that=this;
      console.log(item.id)
      var data={id:item.id,approval:approval}
      this.service.interface("userspbz/approvalUserHome.do",data,
        function(){
          that.ngOnInit();
        })
    }
  
  }