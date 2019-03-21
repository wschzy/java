import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
import { take } from 'rxjs/operators';
@Component({
    selector: 'store-user',
    templateUrl: 'user.component.html',
    styleUrls:['user.component.css']
})

  
export class UserComponent implements OnInit {
  loading = true;
  // 页面显示数据条数
  pageSize = 8;
  // 搜索条件
  keyword: any = '';
  users: any = [];
  // 当前页码
  pageIndex: any = 1;
  // 当前数据总数量
  total: any = 0;
  // 总复选框
  allChecked: any = false;
  // 子复选框
  checkChild: any = false;
  // 选中数据存储对像
  userInfos: any = [];

  constructor(private service:InterfaceService,private router:Router){

  }
  ngOnInit(){
    this.reloadData();
  }
  // 加载数据
  reloadData(){
    var page=this.pageIndex;
    var pageSize=this.pageSize;
    var data={page:page,pageSize:pageSize};
    var that=this;
    this.service.interface("/SysUserInfo/allUser.do",data,
      function(data){
        
        that.total=data.count;
        that.users=data.list;
        console.log(data.list);
      })
  }
  /* 页码变化时*/
  indexChange() {
    this.reloadData();
  }
  /* 每页显示数据变化时*/
  sizeChange() {
    this.reloadData();
  }
   //  复选框触发事件
   onChange(data: any, che: any) {
    if (che === 'all') {
      for (let i = 0; i < data.length; i++) {
        data[i]['checked'] = this.allChecked;
      }
      // 选中父多选框时，选中所有子复选框
      if (this.allChecked) {
        if (data.length) {
          for (let i = 0; i < data.length; i++) {
            this.userInfos.push(data[i].Id);
          }
        }
      } else {
        if (data.length) {
          for (let i = 0; i < data.length; i++) {
            var index = this.userInfos.indexOf(data[i].Id);
            this.userInfos.splice(index);
          }
        }
      }
    } else if (che === 'single') {
      if (data.checked) {
        this.userInfos.push(data.Id);
      } else {
        var index = this.userInfos.indexOf(data.Id);
        this.userInfos.splice(index, 1);
      }

    } else {
      if (data.checked) {
        data.checked = false;
      }
      this.userInfos.push(data.Id);
    }
  }

    }