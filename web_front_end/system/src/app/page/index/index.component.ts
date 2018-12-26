import { Component, OnInit } from '@angular/core';
@Component({
    selector: 'storeIndex',
    templateUrl: 'index.component.html',
    styleUrls:['index.component.css']
})

export class IndexComponent implements OnInit {
    options:any;
    constructor() { }

    ngOnInit() { 
        this.options = {
            xAxis: {
                type: 'category',
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [820, 932, 901, 934, 1290, 1330, 1320],
                type: 'line'
            }]
        };
    }
    
    
}