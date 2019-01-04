import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { InterfaceService } from 'src/app/interface/interface.component';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    private list:any;
    constructor(private myRouter:Router,private service:InterfaceService) {
        var that = this;
        this.service.interface("SysUserInfo/getMenu.do", null,  
            function(data:any){
                for(var i=0;i<data.length;i++){
                  data[i].url = '../'+data[i].url;
                }
                that.list = data;
            }
        );
    }
    ngOnInit() { 
    }
    jump(){
        this.myRouter.navigateByUrl('index');
    }
    logout(){
        this.service.interface("SysUserInfo/logout.do",null,null);
    }
}