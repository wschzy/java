import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { InterfaceService } from 'src/app/interface/interface.component';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    constructor(private myRouter:Router,private service:InterfaceService) {
    }
    ngOnInit() { 
    }

    
    ai(){
        this.service.interface("SysUserInfo/getMenu.do", null,  
            function(data:any){
            }
        );
    }

    jump(){
        this.myRouter.navigateByUrl('index');
    }
}