import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { InterfaceService } from 'src/app/interface/interface.component';
import { element } from '@angular/core/src/render3';
import * as $ from 'jQuery';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    list;
    constructor(private myRouter:Router,private service:InterfaceService) {
    }
    ngOnInit() { 
        this.init();
    }

    
    init(){
        this.service.interface("SysUserInfo/getMenu.do", null,  
            function(data:any){
                this.list.push(data);
            }
        );
    }

    jump(){
        this.myRouter.navigateByUrl('index');
    }
}