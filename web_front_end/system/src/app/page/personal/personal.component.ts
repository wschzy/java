import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';

@Component({
    selector: 'storePersonal',
    templateUrl: 'personal.component.html',
    styleUrls:['personal.component.css']
})

export class PersonalComponent implements OnInit {
    // 判断 a的值 判断是否显示
    a:any=false;
    constructor(private service:InterfaceService,private router:Router) {

     }
    ngOnInit() { 

    }
    add(){
        this.router.navigateByUrl('add-family');
    }
    ngAfterContentInit(){
        var that = this;
       this.service.interface("/home/getHome.do",null,
       function(data:any){
            if(data==null){
                that.a=true;
            }else{
                    console.log(data);
            }
       })
    }
}