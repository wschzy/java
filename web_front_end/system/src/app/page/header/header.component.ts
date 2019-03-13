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
    user=JSON.parse(localStorage.user);
    menu=JSON.parse(localStorage.menu);
    constructor(private myRouter:Router,private service:InterfaceService) {
        
    }
    ngOnInit() { 
        
        this.list=this.menu;
    }
    ngAfterViewChecked(){
        
    }
    jump(){
        this.myRouter.navigateByUrl('index');
    }
    logout(){
        this.service.interface("SysUserInfo/logout.do",null,null);
        this.myRouter.navigateByUrl('login');
    }
}