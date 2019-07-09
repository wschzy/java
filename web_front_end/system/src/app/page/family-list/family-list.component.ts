import { Component, OnInit,NgZone } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
import throttleByAnimationFrame from 'ng-zorro-antd/core/util/throttleByAnimationFrame';
import { NzMessageService } from 'ng-zorro-antd';
@Component({
    selector: 'storeFamilyList',
    templateUrl: 'family-list.component.html',
    styleUrls:['family-list.component.css']
})

export class FamilyListComponent implements OnInit {
    // 展示头像
    portrait = APPCONFIG.requestUrl+"file/getUserListImg?picture=";

    //邀请人 
    username:any="";
    // 展示家庭列表
    list = [];
    description:any="";
    constructor(private service:InterfaceService,private router:Router,public ngZone: NgZone,private message: NzMessageService) { }

    ngOnInit() {
        var that = this; 
        this.service.get("/home/getUserList",
            function(data){
                that.list=data;
                for(var b in that.list){
                    that.list[b].picture = that.portrait + encodeURIComponent( data[b].picture == null ? '' : data[b].picture);

                }
            });  
    }
    // 增加家庭成员
    add(){
        var that=this;
        var name =this.username;
        var inviter={loginid:name}
        this.service.post("/home/addUser",inviter,
            function(){
                that.message.info("申请已发出");
            })
    }
    
    // 删除用户
    delete(id){
        var that=this;
        this.service.delete("/home/deleteUser/"+id,
        function(){
            that.ngOnInit();
        })
    }
    
}
