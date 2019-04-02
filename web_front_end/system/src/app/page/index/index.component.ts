import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
@Component({
    selector: 'storeIndex',
    templateUrl: 'index.component.html',
    styleUrls:['index.component.css']
})

export class IndexComponent implements OnInit {
    city:string;
    public all:any=[];                         //存储所有的省市区数据
    public citys: any = []; 
    constructor(private service:InterfaceService,private router:Router){

    }
    ngOnInit(){ 

    }
    search(){;
    } 
}