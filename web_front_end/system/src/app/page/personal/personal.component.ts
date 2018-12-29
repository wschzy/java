import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';

@Component({
    selector: 'storePersonal',
    templateUrl: 'personal.component.html',
    styleUrls:['personal.component.css']
})

export class PersonalComponent implements OnInit {
    constructor(private service:InterfaceService,private router:Router) {

     }
    ngOnInit() { 

    }
    add(){
        this.router.navigateByUrl('add-family');
    }
    ngAfterContentInit(){
       this.service.interface("/home/getHome.do",null,
       function(data:any){
            if(data==null){
                alert("抱歉，你没有家庭！请添加家庭");
            }else{
                    this.service.interface("/home/getUserList.do",null,
                    function(data:any){
                        alert(data);
                    }
                )
            }
       })
    }
}