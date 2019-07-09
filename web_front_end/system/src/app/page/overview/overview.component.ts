import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import { en_US, zh_CN, NzI18nService } from 'ng-zorro-antd';
@Component({
    selector: 'overview',
    templateUrl: 'overview.component.html',
    styleUrls:['overview.component.css']
})

export class OverviewComponent implements OnInit {
    optionsByWeek:any;
    optionsByMonth:any;
    optionsByMonthWeek:any;
    optionsByYear:any;
    optionsByDic:any;
    optionsByEvery:any;
    date = null; // new Date();
    // dateRange = []; // [ new Date(), addDays(new Date(), 3) ];
    // isEnglish = false;
    constructor(private service:InterfaceService) { }
   
    ngOnInit() {
        //查询本周每天消费
        var that = this;
        this.service.post("pay/getMoneyListByWeek",this.date,
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
                    type: 'bar'
                }]
              };
        })

        this.service.post("pay/getMoneyListByMonth",this.date,
            function(data){
                var dt = [];
                for(var i of data){
                    var obj = {};
                    obj['name']=i.obj;
                    obj['value']=i.money;
                    dt.push(obj);
                }
                that.optionsByMonth = {
                    legend: {
                        data:['本月每天消费情况']
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}号 : 消费{c}元 ({d}%)"
                    },
                    data:[
                    ],
                    series: [{
                        name:'本月每天消费情况',
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                color: 'black'
                                },
                                position: 'outer',// 可选值：'outer' ¦ 'inner'
                                // formatter: '{a} {b} : {c}个 ({d}%)'   设置标签显示内容 ，默认显示{b}
                                // {a}指series.name  {b}指series.data的name
                                // {c}指series.data的value  {d}%指这一部分占总数的百分比
                                formatter: '{c}'
                            }
                        },
                        data: dt,
                        type: 'pie',
                    }]
                };
            }
        )

        this.service.post("pay/getMoneyListByMonthWeek",this.date,
            function(data){
                var dt = [];
                var money = [];
                var j = 1;
                for(var i of data){
                    dt.push(j);
                    money.push(i.money);
                    j ++;
                }
                that.optionsByMonthWeek = {
                    legend: {
                        data:['本月每周消费情况']
                    },
                    xAxis: {
                        type: 'category',
                        data: dt
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        name:'本月每周消费情况',
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                color: 'black'
                                }
                            }
                    },
                        data: money,
                        type: 'line'
                    }]
                };
            }
        )

        this.service.post("pay/getMoneyListByYear",this.date,
            function(data){
                var dt = [];
                var money = [];
                for(var i of data){
                    dt.push(i.obj);
                    money.push(i.money);
                }
                that.optionsByYear = {
                    legend: {
                        data:['本年每月消费情况']
                    },
                    xAxis: {
                        type: 'category',
                        data: dt
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        name:'本年每月消费情况',
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                color: 'black'
                                }
                            }
                    },
                        data: money,
                        type: 'line'
                    }]
                };
            }
        )


        this.service.post("pay/getMoneyListByDic",this.date,
            function(data){
                var dt = [];
                var money = [];
                for(var i of data){
                    dt.push(i.obj);
                    money.push(i.money);
                }
                that.optionsByDic = {
                    legend: {
                        data:['本年各类消费情况']
                    },
                    xAxis: {
                        type: 'category',
                        data: dt
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        name:'本年各类消费情况',
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                color: 'black'
                                }
                            }
                    },
                        data: money,
                        type: 'line'
                    }]
                };
            }
        )  
        this.service.post("pay/getMoneyListByDicMonth",this.date,
        function(data){
            var dt = [];
            var money = [];
            for(var i of data){
                // 截取 '-' 之后的字段
                var index=i.obj.lastIndexOf("\-");
                i.obj=i.obj.substring(index+1,i.obj.length);
                dt.push(i.obj);
                
                money.push(i.money);
            }
            that.optionsByEvery = {
                legend: {
                    data: ['本月每类消费总额'],
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    },
                },
                xAxis: {
                    type : 'category',
                    splitLine: {show:false},
                    data : dt,
                    axisLabel : {//坐标轴刻度标签的相关设置。
                        interval:0,
                        rotate:"45"
                    }
                },
                yAxis: {
                    type : 'value'
                },
                series: [
                    {
                        name: '本月每类消费总额',
                        type: 'bar',
                        stack:  'null',
                        // barGap: '-100%',
                        itemStyle: {
                            normal: {
                                barBorderColor: 'rgba(0,0,0,0)',
                                color: 'rgba(0,0,0,0)'
                            },
                            emphasis: {
                                barBorderColor: 'rgba(0,0,0,0)',
                                color: 'rgba(0,0,0,0)'
                            }
                        },
                        // data: [0, 1700, 1400, 1200, 300, 0]
                    },
                    {
                        name: '生活费',
                        type: 'bar',
                        stack: 'null',
                        label: {
                            normal: {
                                show: true,
                                position: 'inside'
                            }
                        },
                        data:money,
                        
                    }
                ]
            };
        }
    )
          
    }
    onChange(date): void {
        if(date!=null){
            this.date={time:date};
        }
        this.ngOnInit();
    }
    getCaption(obj){
        var index=obj.lastIndexOf("\-");
        obj=obj.substring(index+1,obj.length);
        //  console.log(obj);
        return obj;
}

}
