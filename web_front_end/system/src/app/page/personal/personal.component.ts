import { Component, OnInit } from '@angular/core';
import { InterfaceService } from 'src/app/interface/interface.component';
import {Router} from '@angular/router';
import { APPCONFIG } from '../../config';
import { UploadFile } from 'ng-zorro-antd';
import { NzMessageService } from 'ng-zorro-antd';
@Component({
    selector: 'storePersonal',
    templateUrl: 'personal.component.html',
    styleUrls:['personal.component.css']
})

export class PersonalComponent implements OnInit {
    uploadURL = APPCONFIG.requestUrl+"file/getUserImg.do";
    // 判断 a的值 判断是否显示
    a:any=false;
    b:any=false;
    // 初始化个人信息
    fullname:any="";
    email:any="";
    user:any="";
    phone:any="";
    picture:any="";
    sex:any="";
    //初始化家庭信息
    name:any="";
    note:any="";

    constructor(private service:InterfaceService,private router:Router,private message: NzMessageService) {
        
    }
    ngOnInit() { 

    }
    add(){
        this.router.navigateByUrl('add-family');
    }
    ngAfterContentInit(){
       var that = this;
       this.service.interface("/home/getHome.do",null,
            function(data:any){
                window.localStorage.setItem("home",JSON.stringify(data));
                var msg=JSON.parse(localStorage.user);
                var fam=JSON.parse(localStorage.home);
                console.log(msg);
                //给个人信息赋值
                that.fullname=msg.fullname;
                that.email=msg.email;
                that.phone=msg.phone;
                //that.picture=msg.picture;
                that.sex=msg.sex==0?"女":"男";
                if(data==null){
                    that.a=true;
                    that.b=false;
                }else{
                    that.a=false;
                    that.b=true;
                    // 给家庭信息赋值
                    that.name=fam.name;
                    that.note=fam.note;
                }
            });
    }
    // 跳转家庭列表页面
    family(){
        this.router.navigateByUrl("family-list");
    }
// 上传个人文件
fileList = [
    {
      uid: -1,
      name: ' ',
      status: 'remove',
      url: this.uploadURL
    }
];
  previewImage = '';
  previewVisible = false;

  handlePreview = (file: UploadFile) => {
    this.previewImage = file.url || file.thumbUrl;
    this.previewVisible = true;
  }
  handleUpload = (uploadFile: any) => {
    this.uploadImg(uploadFile,1);
  }
//上传家庭图片
uploadURLFam = APPCONFIG.requestUrl+"file/getHomeImg.do";
fileListFam = [
    {
      uid: -1,
      name: ' ',
      status: 'remove',
      url: this.uploadURLFam
    }
];
  previewImageFam = '';
  previewVisibleFam = false;

  handlePreviewFam = (file: UploadFile) => {
    this.previewImageFam = file.url || file.thumbUrl;
    this.previewVisibleFam = true;
  }
    uploadFamily = (uploadFile: any) => {
        this.uploadImg(uploadFile,2)
  }
  //上传
  uploadImg(uploadFile,name){
    var that=this;
    const formData = new FormData();
    formData.append('image', uploadFile.file);
    formData.append('name', name);
    this.service.interface2("file/upload.do",formData).subscribe((event: any)=> {
        if(name == 1){
            that.fileList = [
                {
                  uid: -1,
                  name: '大头',
                  status: 'remove',
                  url: that.uploadURL+"?a="+Math.random()
                }
            ];
        }else{
            that.fileListFam = [
                {
                  uid: -1,
                  name: '大头',
                  status: 'remove',
                  url: that.uploadURLFam+"?a="+Math.random()
                }
            ];
        }
    }, (err) => {
        that.message.info("上传失败");
    });
  }

}