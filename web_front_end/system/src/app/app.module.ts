import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule} from '@angular/common/http';
import { NgxEchartsModule} from 'ngx-echarts'
import { AppRoutingModule } from './app-routing.module';
import {RouterModule} from '@angular/router';  //导入路由
import { AppComponent } from './app.component';
import { LoginComponent } from './page/login/login.component'
import {InterfaceService} from './interface/interface.component';
import { IndexComponent } from './page/index/index.component';
import { FormsModule } from '@angular/forms'
import { SpendComponent } from './page/spend/spend.component';
import { PersonalComponent } from './page/personal/personal.component';
import { CategoryComponent } from './page/category/category.component';
import { FamilyListComponent } from './page/family-list/family-list.component'
import { FooterComponent } from './page/footer/footer.component';
import { HeaderComponent } from './page/header/header.component';
import { AddFamilyComponent } from './page/add-family/add-family.component';
import { TaskComponent } from './page/task/task.component';
import { NgZorroAntdModule, NZ_I18N, en_US } from 'ng-zorro-antd';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { UserComponent } from './page/user/user.component';
import { AddUserComponent } from './page/add-user/add-user.component';


registerLocaleData(en);

@NgModule({
  declarations: [
    AppComponent,
    FooterComponent,
    HeaderComponent,
    LoginComponent,
    IndexComponent,
    SpendComponent,
    PersonalComponent,
    CategoryComponent,
    AddFamilyComponent,
    FamilyListComponent,
    TaskComponent,
    UserComponent,
    AddUserComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule,
    FormsModule,
    NgxEchartsModule,
    NgZorroAntdModule,
    BrowserAnimationsModule
    
  ],
  providers: [InterfaceService, { provide: NZ_I18N, useValue: en_US }],
  bootstrap: [AppComponent]
})
export class AppModule { }
