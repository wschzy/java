import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators,FormControl} from '@angular/forms';
import {Router} from '@angular/router';
import * as $ from 'jquery';

@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls:['./login.component.css']
})


export class LoginComponent implements OnInit {
  private myForm: FormGroup;
  constructor(){}

  ngOnInit() {
  }
 
}