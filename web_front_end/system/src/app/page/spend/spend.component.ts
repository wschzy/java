import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import {APPCONFIG} from "../../config";
import { NzMessageService } from 'ng-zorro-antd';
import * as FileSaver from 'file-saver';
import * as XLSX from 'xlsx';
@Component({
    selector: 'storeSpend',
    templateUrl: 'spend.component.html',
    styleUrls:['spend.component.css']
})

export class SpendComponent implements OnInit {
    // 编辑备注
    editId: string | null;
    // 当前页码
    pageIndex: any = 1;
    pageSize =10;
    spend: any = [];
  // 当前数据总数量
    total: any = 0;
    i = 1;
    add:any=false;
    editCache = {};
    dataSet = [];
    selectedDicclass='伙食';
    selectedPayway='支付宝';
    selectedName="早餐";
    dicclass:any=[];
    payway:any=[];
    dicValue:any=[];
    id:any=[];
    obj:object={};
    xq:any;
    demoValue = 100;
    constructor(private service:InterfaceService,
                private router:Router,
                private message: NzMessageService){}
    addRow(){
        if(this.add == false){
          this.add=true;
        }
        var data= JSON.parse(localStorage.category);
        this.obj = {};
        for (var d of data){
            if(this.obj[d.dicclass] == undefined){
                this.obj[d.dicclass] = [];
            }
            var obj2 = {};
            obj2['name'] = d.name;
            obj2['id'] = d.id;
            this.obj[d.dicclass].push(obj2);  
        }
        // 第一级 是数组
        this.dicclass = [];
        for (var dic in this.obj){
            this.dicclass.push(dic);
        }
        this.payway = JSON.parse(localStorage.payway);
    }
   
     //  第二级
    change(){
        var a=this.selectedDicclass;
        this.dicValue = this.obj[a]
    }

    //第三级
    // changeId(){
    //     this.id=[];
    //     var a=this.selectedDicclass;
    //     var b=this.selectedName;
    //     for(var i of this.obj[a]){
    //         var c=i[b];
    //         this.id.push(c);
    //     }
        
    // }
    cancel(){
        if(this.add == true){
            this.add=false;
        }
    } 
    
    ngOnInit(): void {
        this.reloadData();
    }
    reloadData(){
        var page=this.pageIndex;
        var pageSize=this.pageSize;
        var data={page:page,pageSize:pageSize};
        var that=this;
        this.service.interface("/pay/getUserPayList.do",data,
            function(data:any){
                console.log(data)
                that.total=data.count;
                that.dataSet=data.list;
            }); 
    }
     /* 页码变化时*/
    indexChange() {
        this.reloadData();
    }
    /* 每页显示数据变化时*/
    sizeChange() {
        this.reloadData();
    }
//   删除数据
    deleteRow(i: string): void {
        var that=this;
        var obj = {id:i};
        this.service.interface("pay/deleteUserPay.do",obj,
        function(){
            that.ngOnInit();
        })
        
    }
  //导出文件
  private saveAsExcelFile(buffer: any, fileName: string) {
    const data: Blob = new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8'
    });
    FileSaver.saveAs(data, fileName + '_' + new Date().getTime() + '.xls');
        // 如果写成.xlsx,可能不能打开下载的文件，这可能与Excel版本有关
    }
    exportFile(){
        let json = this.dataSet;
        //这个dataSet ，是要导出的json数据
        const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(json);
        const workbook: XLSX.WorkBook = { Sheets: { 'data': worksheet }, SheetNames: ['data'] };
        const excelBuffer: any = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
        //这里类型如果不正确，下载出来的可能是类似xml文件的东西或者是类似二进制的东西等
        this.saveAsExcelFile(excelBuffer, "spend");
    } 
    // 导入文件  
    // excelData = [];
    fileList = [];  // 已上传文件列表
    importMsg = ''; // 导入信息
    isUploadVisible = false;  // 上传窗口可见
    isDownVisible = false;    // 下载窗口可见
    isDownLoading = false;
    downFileName = ''; // 文件名
    download() {
        open(APPCONFIG.requestUrl + 'spend_template.xlsx');
        this.fileList = [];
      }
    
    handleOk() {
        this.isUploadVisible = false;
        this.reloadData();
        this.fileList = [];
        this.importMsg = '';
      }
    handleChange({file, fileList}): void {
        const status = file.status;
        if (file.response && ('message' in file.response))
          this.importMsg = file.response.message;
      }
    importFile(){
        this.isUploadVisible = true;
              /* wire up file reader */
//         const target: DataTransfer = <DataTransfer>(evt.target);
//         if (target.files.length !== 1) throw new Error('Cannot use multiple files');
//         const reader: FileReader = new FileReader();
//         reader.onload = (e: any) => {
//         /* read workbook */
//         const bstr: string = e.target.result;
//         const wb: XLSX.WorkBook = XLSX.read(bstr, { type: 'binary' });

//         /* grab first sheet */
//         const wsname: string = wb.SheetNames[0];
//         const ws: XLSX.WorkSheet = wb.Sheets[wsname];

//         /* save data */
//         this.excelData = (XLSX.utils.sheet_to_json(ws, { header: 1 }));

//         evt.target.value = "" // 清空
//          };
//         reader.readAsBinaryString(target.files[0]);
 
    }
   
      
    provinceChange(value: string): void {
        this.selectedName = this.obj[ value ][ 0 ];
    }
    // 输入金额
    formatterDollar = value => `￥ ${value}`;
    parserDollar = value => value.replace('￥ ', '');
    submit(){
        var that = this;
        var param = {dicid:this.selectedName,way:this.selectedPayway,money:this.demoValue,note:this.xq};
        this.service.interface("/pay//addUserPay.do",param,function(data){
            that.add=false;
            that.ngOnInit();
    });
    }
}