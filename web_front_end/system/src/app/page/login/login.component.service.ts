
import {Injectable} from '@angular/core';
import {Router} from "@angular/router";

import {InterfaceService} from './../../interface/interface.component';
@Injectable()
export class UserLoginService {

  constructor(public service:InterfaceService,private router :Router){};

  public login(data:any,fun:Function){
    return this.service.interface("SysUserInfo/findUser",data,fun)
  }
  
}
