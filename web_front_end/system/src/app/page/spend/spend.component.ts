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
    constructor(private service:InterfaceService,private router:Router){}
    addRow(){
        if(this.add == false){
          this.add=true;
        }
       }
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
        const dataSet = this.dataSet.filter(d => d.id !== i);
        this.dataSet = dataSet;
    }
}