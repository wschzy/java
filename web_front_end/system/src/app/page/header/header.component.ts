import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
@Component({
    selector: 'storeHeader',
    templateUrl: 'header.component.html',
    styleUrls:['header.component.css']
})

export class HeaderComponent implements OnInit {
    constructor(private myRouter:Router) { }

    ngOnInit() { }
    jump(){
        this.myRouter.navigateByUrl('index');
    }
}