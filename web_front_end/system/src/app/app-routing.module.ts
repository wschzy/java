import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './page/login/login.component';
import { IndexComponent } from './page/index/index.component';
import { PersonalComponent } from './page/personal/personal.component';
import { SpendComponent } from './page/spend/spend.component';
import { CategoryComponent } from './page/category/category.component';
import { AddFamilyComponent } from './page/add-family/add-family.component';
import { FamilyListComponent } from './page/family-list/family-list.component';
const routes: Routes = [
  { path:'login',component:LoginComponent,pathMatch:'full' },
  { path:'',component:LoginComponent},
  {path:'index',component:IndexComponent},
  {path:'personal',component:PersonalComponent},
  {path:'spend',component:SpendComponent},
  {path:'category',component:CategoryComponent},
  {path:'add-family',component:AddFamilyComponent},
  {path:'family-list',component:FamilyListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
