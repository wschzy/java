import { Component, OnInit } from '@angular/core';
// interface ItemData {
//     name: string;
//     age: number;
//     street: string;
//     building: string;
//     gender: string;
//   }
interface ItemData {
  avatar: string;
  content: string;
  name : string;
  count: number;
}
@Component({
    selector: 'rank',
    templateUrl: 'rank.component.html',
    styleUrls:['rank.component.css']
})

export class RankComponent implements OnInit {
  data: ItemData[] = [];
    // pageIndex = "1";
    // total :any =0;
    // constructor() { }
    // listOfData: ItemData[] = [];
    // listOfDisplayData: ItemData[] = [];
    // ngOnInit() {
    //     for (let i = 0; i < 100; i++) {
    //         this.listOfData.push({
    //           name: '哈巴狗',
    //           age: i + 1,
    //           street: '1024',
    //           building: 'C',
    //           gender: 'M',
    //         });
    //       }
    //       this.listOfDisplayData = [...this.listOfData];
    //  }
    ngOnInit(){
      this.loadData(1);
    }
    loadData(pi: number): void {
      this.data = new Array(10).fill({}).map((_, index) => {
        return {
          avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
          content:'1020',
          name:'哈巴狗',
          count:0
        };
      });
    }
  
    count(item){
      item.count++;
    }

    change(){
      this.loadData(1);
    }
    
    }