import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import {RouterModule} from '@angular/router';  //导入路由
import { AppComponent } from './app.component';
import { LoginComponent } from './page/login/login.component'
import {InterfaceService} from './interface/interface.component';
import { IndexComponent } from './page/index/index.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    IndexComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule,
    
  ],
  providers: [InterfaceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
