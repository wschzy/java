import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
@Component({
    selector: 'storeFooter',
    templateUrl: 'footer.component.html',
    styleUrls:['footer.component.css']
})

export class FooterComponent implements OnInit {
    private list:any;
    menu=JSON.parse(localStorage.menu);
    constructor(private service:InterfaceService) { 
    }

    ngOnInit() {
      this.list=this.menu;
     }
}