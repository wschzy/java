import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'store-user',
    templateUrl: 'user.component.html',
    styleUrls:['user.component.css']
})

  
export class UserComponent implements OnInit {
    ilistOfSelection = [
        {
          text    : 'Select All Row',
          onSelect: () => {
            this.checkAll(true);
          }
        },
      ];
      isAllDisplayDataChecked = false;
      isIndeterminate = false;
      listOfDisplayData: any[] = [];
      listOfAllData: any[] = [];
      mapOfCheckedId: { [ key: string ]: boolean } = {};
    
      currentPageDataChange($event: Array<{ id: number, name: string; age: number; address: string}>): void {
        this.listOfDisplayData = $event;
        this.refreshStatus();
      }
    
      refreshStatus(): void {
        this.isAllDisplayDataChecked = this.listOfDisplayData.every(item => this.mapOfCheckedId[ item.id ]);
        this.isIndeterminate = this.listOfDisplayData.some(item => this.mapOfCheckedId[ item.id ]) && !this.isAllDisplayDataChecked;
      }
    
      checkAll(value: boolean): void {
        this.listOfDisplayData.forEach(item => this.mapOfCheckedId[ item.id ] = value);
        this.refreshStatus();
      }
    
      ngOnInit(): void {
        for (let i = 0; i < 100; i++) {
          this.listOfAllData.push({
            id      : i,
            name    : `Edward King ${i}`,
            age     : 32,
            address : `London, Park Lane no. ${i}`
          });
        }
      }
    }