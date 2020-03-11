import { Component, OnInit } from '@angular/core';
interface ItemData {
    name: string;
    age: number;
    street: string;
    building: string;
    gender: string;
  }
@Component({
    selector: 'rank',
    templateUrl: 'rank.component.html',
    styleUrls:['rank.component.css']
})

export class RankComponent implements OnInit {
    pageIndex = "1";
    total :any =0;
    constructor() { }
    listOfData: ItemData[] = [];
    listOfDisplayData: ItemData[] = [];
    ngOnInit() {
        for (let i = 0; i < 100; i++) {
            this.listOfData.push({
              name: '哈巴狗',
              age: i + 1,
              street: '1024',
              building: 'C',
              gender: 'M'
            });
          }
          this.listOfDisplayData = [...this.listOfData];
     }
    
    }