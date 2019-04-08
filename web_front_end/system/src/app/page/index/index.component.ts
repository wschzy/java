import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
import {HttpClient} from '@angular/common/http';
import { DomSanitizer } from '@angular/platform-browser';
@Component({
    selector: 'storeIndex',
    templateUrl: 'index.component.html',
    styleUrls:['index.component.css']
})
export class IndexComponent implements OnInit {
    city:string;
    public all:any=[];                         //存储所有的城市数据
    public citys: any = []; 
    cityURL:any;
    cityUrl="https://tianqiapi.com/api.php?style=tw&skin=pitaya";
    constructor(private service:InterfaceService,private router:Router,public http: HttpClient,private sanitizer: DomSanitizer){
        

    }
    ngOnInit(){ 
        this.setAll();
    }
    search(){
        console.log(this.city);
        this.setAll();
    } 
     // 获取城市json 数据
  setAll() {
    this.getAll('assets/city.json')
      .subscribe(
        data => {
          this.all = data;
          let that =this;
          for (let i = 0; i < this.all.length; i++){
            const value = this.all[i];
            if(that.city==null){
                this.cityURL= this.sanitizer.bypassSecurityTrustResourceUrl(this.cityUrl);
            }
            if(value['cityZh']===that.city){             
                this.cityUrl+="&cityid="+value['id'];
                // angular 安全限制
                // error： unsafe value used in a resource URL context
                this.cityURL= this.sanitizer.bypassSecurityTrustResourceUrl(this.cityUrl);
            }
          }
        },
        error => {
          console.log(error);
        }
      );
      
  }
   //   根据路径获取信息
   public getAll(url: string) {
    return this.http.get(url);
  }
}