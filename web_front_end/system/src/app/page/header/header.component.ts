import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { InterfaceService } from 'src/app/interface/interface.component';
import { FunctionExpr } from '@angular/compiler';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    private list:any;
    private counts;
    private user;
    constructor(private myRouter:Router,private service:InterfaceService) {
        let ur = localStorage.user;
        if(ur == undefined){
            this.myRouter.navigateByUrl('login');
        }
        this.user=JSON.parse(ur);
    }
    ngOnInit() { 
        this.list=JSON.parse(localStorage.menu);
        var that=this;
        this.service.get("userspbz/getUserSpbzCount",
            function(data:any){
               that.counts=data 
            }
        );
    }
    ngAfterViewChecked(){
        
    }
    jump(){
        this.myRouter.navigateByUrl('index');
    }
    logout(){
        this.service.get("SysUserInfo/logout",null);
        this.myRouter.navigateByUrl('login');
    }
}