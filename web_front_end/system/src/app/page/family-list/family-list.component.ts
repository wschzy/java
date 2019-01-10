import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
@Component({
    selector: 'storeFamilyList',
    templateUrl: 'family-list.component.html',
    styleUrls:['family-list.component.css']
})

export class FamilyListComponent implements OnInit {
    // 展示头像
    portrait = APPCONFIG.requestUrl+"file/getUserListImg.do?picture=";
    //邀请人 
    username:any=""
    // 展示家庭列表
    list = [];
    description:any="";
    constructor(private service:InterfaceService,private router:Router) { }

    ngOnInit() {
        var that = this; 
        this.service.interface("/home/getUserList.do",null,
            function(data){
                that.list=data;
            });  
    }
    // 增加家庭成员
    add(){
        var name =this.username;
        var inviter={loginid:name}
        this.service.interface("/home/addUser.do",inviter,
            function(){
                console.log(inviter);
            })
    }
}