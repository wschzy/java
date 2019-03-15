
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

  public userDicCash(func:Function){
    var url;
    if(JSON.parse(localStorage.user).isadmin == 1){
        url = "category/getPayWayList.do";
    }else{
        url = "/category/getUserDictionaryList.do";
        //如果是非管理员登录，也需要存储支付方式
        if(func == null){//如果 func为null的话，为更新列表。不为null的话 为登录成功 需要缓存
          this.interface("category/getPayWayList.do",null,
          function(data){
              window.localStorage.setItem("payway",JSON.stringify(data))
          })
        }
    }
    this.interface(url,null,
        function(data){
            //存储支付类型
            window.localStorage.setItem("category",JSON.stringify(data))
            if(typeof func === 'function'){
              eval(func());
            }
    })
  }
  

}

