import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { InterfaceService } from 'src/app/interface/interface.component';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    constructor(private myRouter:Router,private service:InterfaceService) { }
    private list;
    ngOnInit() { 
        this.service.interface("SysUserInfo/getMenu.do", '',  
        function(data:any){
            this.list = data;
            // var str = '';
            // if(data != undefined && data.length > 0){
            //     for(var i=0;i<data.length;i++){
            //          str+=`<li>
            //                     <a [routerLink]="['/${data[i]['URL']}']">
            //                         <span>${data[i]['NAME']}</span>
            //                     </a>
            //                 </li>`;
            //     }
                
            // }
           
        }
    );
    }
    jump(){
        this.myRouter.navigateByUrl('index');
    }
}