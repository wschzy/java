
import {Injectable} from '@angular/core';
import { APPCONFIG } from '../config';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders, HttpRequest, HttpResponse } from '@angular/common/http';
import {Router} from '@angular/router';
import * as $ from 'jquery';
import { filter } from 'rxjs/operators';
import { NzMessageService } from 'ng-zorro-antd';
@Injectable()
export class InterfaceService {
  public userLoginURL = APPCONFIG.requestUrl;
  constructor(public http:HttpClient,private router: Router,private message: NzMessageService){};
  
  //统一接口分装
  public interface(url:any,data:any,fun:Function){
      const httpOptions = {
        headers: new HttpHeaders({
          'Content-Type':  'application/x-www-form-urlencoded'
        }),withCredentials: true
      };
    if(data == null){
      data={};
    }
    this.http.post(this.userLoginURL+url,$.param(data),httpOptions).subscribe(
      data => {
          if(data != undefined && data['state'] == '-1'){
              this.message.info(data['message']);
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


  interface2(url:any,formData:FormData):Observable<any>{
    const httpOptions = {
      withCredentials: true
    };
    const req = new HttpRequest('POST',this.userLoginURL+url, formData, httpOptions);
    return  this.http.request(req).pipe(filter(e => e instanceof HttpResponse));
  }
  
}

