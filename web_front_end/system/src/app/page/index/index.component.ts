import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
@Component({
    selector: 'storeIndex',
    templateUrl: 'index.component.html',
    styleUrls:['index.component.css']
})

export class IndexComponent implements OnInit {
    optionsByWeek:any;
    constructor(private service:InterfaceService) { }
   
    ngOnInit() {
        //查询本周每天消费
        var that = this;
        this.service.interface("pay/getMoneyListByWeek.do",null,
          function(data){
              var dt = {'Mon':0,'Tue':0,'Wed':0,'Thu':0,'Fri':0,'Sat':0,'Sun':0};
              for(var i of data){
                var day = i.obj;
                var money = i.money;
                dt[day] = money;
              }
              that.optionsByWeek = {
                legend: {
                    data:['本周每天消费情况']
                },
                xAxis: {
                    type: 'category',
                    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    name:'本周每天消费情况',
                    label: {
                        normal: {
                            show: true,
                            textStyle: {
                              color: 'black'
                            }
                        }
                   },
                    data: [dt.Mon,dt.Tue,dt.Wed,dt.Thu,dt.Fri,dt.Sat,dt.Sun],
                    type: 'line'
                }]
              };
        })
    }
}
