import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './page/login/login.component';
import { IndexComponent } from './page/index/index.component';
import { PersonalComponent } from './page/personal/personal.component';
import { SpendComponent } from './page/spend/spend.component';
import { CategoryComponent } from './page/category/category.component';
const routes: Routes = [
  { path:'login',component:LoginComponent,pathMatch:'full' },
  { path:'',component:LoginComponent},
  {path:'index',component:IndexComponent},
  {path:'personal',component:PersonalComponent},
  {path:'spend',component:SpendComponent},
  {path:'category',component:CategoryComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
