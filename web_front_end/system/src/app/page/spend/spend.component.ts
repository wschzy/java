import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
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
    selectedPayway='支付宝';
    selectedName="早餐";
    dicclass:any=[];
    payway:any=[];
    name:any=[];
    id:any=[];
    obj:object={};
    demoValue = 100;
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
            var obj2 = {};
            obj2[d.name]=d.id;
            this.obj[d.dicclass].push(obj2);  
        }
        // 第一级 是数组
        for (var dic in this.obj){
            this.dicclass.push(dic);
        }
        var payData=JSON.parse(localStorage.payway);
        for(var pay of payData){
            this.payway.push(pay.name);
            
        }
        console.log(this.payway);
    }
     //  第二级
    change(){
        this.name = [];
        var a=this.selectedDicclass;
        for(var o of this.obj[a]){
            for(var n in o ){
                this.name.push(n);
            }
        }
            
    }

    //第三级
    // changeId(){
    //     this.id=[];
    //     var a=this.selectedDicclass;
    //     var b=this.selectedName;
    //     for(var i of this.obj[a]){
    //         var c=i[b];
    //         this.id.push(c);
    //     }
        
    // }
    cancel(){
        if(this.add == true){
            this.add=false;
        }
    } 
    
    ngOnInit(): void {
        
        var that=this;
        this.service.interface("/pay/getUserPayList.do",null,
            function(data:any){
                that.dataSet=data;
            });    
            var that = this;
            var msg=JSON.parse(localStorage.payway);
            console.log(msg);
    }
    deleteRow(i: string): void {
        var that=this;
        var obj = {id:i};
        this.service.interface("pay/deleteUserPay.do",obj,
        function(){
            that.ngOnInit();
        })
        
    }
    provinceChange(value: string): void {
        this.selectedName = this.obj[ value ][ 0 ];
      }
    // 输入金额
    formatterDollar = value => `￥ ${value}`;
    parserDollar = value => value.replace('￥ ', '');
    
}