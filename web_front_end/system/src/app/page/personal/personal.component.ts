import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';

@Component({
    selector: 'storePersonal',
    templateUrl: 'personal.component.html',
    styleUrls:['personal.component.css']
})

export class PersonalComponent implements OnInit {
    constructor(private service:InterfaceService) { }

    ngOnInit() { }
    ngAfterContentInit(){
       this.service.interface("/home/getHome.do",null,
       function(data:any){
            if(data==null){
                alert("抱歉，你没有家庭！");
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