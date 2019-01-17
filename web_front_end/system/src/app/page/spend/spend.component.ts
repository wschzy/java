import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import throttleByAnimationFrame from 'ng-zorro-antd/core/util/throttleByAnimationFrame';
@Component({
    selector: 'storeSpend',
    templateUrl: 'spend.component.html',
    styleUrls:['spend.component.css']
})

export class SpendComponent implements OnInit {
    i = 1;
    add:any=false;
    editCache = {};
    dataSet = [];
    selectedDicclass='伙食';
    selectedName="早饭";
    dicclass:any=[];
    obj:object={};
    constructor(private service:InterfaceService,private router:Router){}
    addRow(){
        if(this.add == false){
          this.add=true;
        }
        var data= JSON.parse(localStorage.category);
        for (var d of data){
            if(this.obj[d.dicclass] == undefined){
                this.obj[d.dicclass] = [];
            }
            this.obj[d.dicclass].push(d.name);
        }
        for(var dic in this.obj){
            this.dicclass.push(dic);
        }
    }
    provinceChange(value: string): void {
        this.selectedName = this.obj[ value ][ 0 ];
      }
    // provinceChange(value: string): void {
    //     this.selectedCity = this.cityData[ value ][ 0 ];
    //   }
    cancel(){
        if(this.add == true){
            this.add=false;
        }
    }   
    startEdit(id: string): void {
        this.editCache[ id ].edit = true;
    }
    
    finishEdit(id: string): void {
        this.editCache[ id ].edit = false;
        this.dataSet.find(item => item.id === id).name = this.editCache[ id ].name;
    }
    
    updateEditCache(): void {
    this.dataSet.forEach(item => {
        if (!this.editCache[ item.id ]) {
        this.editCache[ item.id ] = {
            edit: false,
            note: item.note
               };
            }
        });
    }
    ngOnInit(): void {
        var that=this;
        this.service.interface("/pay/getUserPayList.do",null,
            function(data:any){
                that.dataSet=data;
                console.log(that.dataSet);
            });
            this.updateEditCache();
    }
    deleteRow(i: string): void {
        var that=this;
        var obj = {id:i};
        this.service.interface("pay/deleteUserPay.do",obj,
        function(){
            that.ngOnInit();
        })
        
    }
}