import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { typeWithParameters } from '@angular/compiler/src/render3/util';
import { NzMessageService } from 'ng-zorro-antd';
@Component({
    selector: 'storeAdd',
    templateUrl: 'add-family.component.html',
    styleUrls:['add-family.component.css']
})

export class AddFamilyComponent implements OnInit {
    name:any="";
    note:any="";
    constructor(private service:InterfaceService,private router:Router,private message: NzMessageService) { }

    ngOnInit() { }
    submit(){
        var name=this.name;
        var note=this.note;
        var that=this;
        var data={name:name,note:note};
        if(name==" " || note==" "){
            this.message.info("请填写信息");
            return;
        }else{
            this.service.post("/home/addHome",data,
                function(data:any){
                    that.router.navigateByUrl("/personal")
                });
        }
    }
}