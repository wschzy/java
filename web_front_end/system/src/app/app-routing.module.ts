import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './page/login/login.component';
import { IndexComponent } from './page/index/index.component';
const routes: Routes = [
  { path:'login',component:LoginComponent},
  { path:'',component:LoginComponent},
  {path:'index',component:IndexComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
