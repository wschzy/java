
import {Injectable} from '@angular/core';
import { APPCONFIG } from '../config';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import {Router} from '@angular/router';
import * as $ from 'jquery';
@Injectable()
export class InterfaceService {
  public userLoginURL = APPCONFIG.requestUrl;
  constructor(public http:HttpClient,private router: Router){};
  
  //统一接口分装
  public interface(url:any,data:any,fun:Function){
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*'
      })
    };
    this.http.post(this.userLoginURL+url,$.param(data),httpOptions).subscribe(
      data => {
          if(data != undefined && data['state'] == '-1'){
              alert(data['message']);
          }else if(data == '-2'){//重定向
            this.router.navigateByUrl('login');
          }else{
            if(typeof fun === 'function'){
              eval(fun(data));
            }
          }
      },
      err => {
          console.log(err);
      }
    );
  }
  
}

