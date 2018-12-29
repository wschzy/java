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
import { FooterComponent } from './page/footer/footer.component';
import { HeaderComponent } from './page/header/header.component';
import { AddFamilyComponent } from './page/add-family/add-family.component';

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
    AddFamilyComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule,
    FormsModule,
    NgxEchartsModule
    
  ],
  providers: [InterfaceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
