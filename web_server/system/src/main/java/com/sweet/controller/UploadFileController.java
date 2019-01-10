package com.sweet.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.hzy.service.UserHomeService;
import com.sweet.util.FileUtil;
import com.sweet.util.ServletUtil;
import com.sweet.util.StringUtil;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value = "/file")
public class UploadFileController extends BaseController {

	@Value("${file.path}")
	private String rootDir;
	
	@Resource
	private SysUserInfoService sysUserInfoService;
	
	@Resource
	private UserHomeService userHomeService;
	
	/**
	 * 处理上载请求
	 */
	@PostMapping(value = "upload.do")
	public void upload(@RequestParam("image") MultipartFile image, @RequestParam("name") String name, HttpServletRequest request) throws Exception {
		String fileName = image.getOriginalFilename();
		String type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()): null;
		if (type != null) {
			if ("gif".equals(type.toLowerCase()) || "png".equals(type.toLowerCase()) || "jpg".equals(type.toLowerCase())) {
				String path = null;//目录
				String newFileName = null;
				if ("1".equals(name)) {// 用户头像
					path = "photo\\sys_userinfo";
					newFileName = ServletUtil.getSessionVal("id")+"."+type;
					//保存地址到业务表
					sysUserInfoService.updateUserPictureById(path + "\\" + newFileName);
				} else if ("2".equals(name)) {// home头像
					path = "photo\\user_home";
					UserHome home = userHomeService.getHomeByUserid();
					newFileName = home.getId()+"."+type;
					userHomeService.updateHomePictureById(path + "\\" + newFileName, home.getId());
				} else {
					throw new SysException("参数错误");
				}
				FileUtil.saveFile(rootDir+"\\"+path, newFileName, image);
			} else {
				throw new SysException("只支持gif、png、jpg");
			}
		} else {
			throw new SysException("文件类型为空");
		}
	}
	
	//获取家庭成员的头像
	@RequestMapping(value = "/getUserListImg.do")
    public byte[]  getHomeUserImage(String picture) throws IOException {
		if(StringUtil.isEmpty(picture)) {
			return  FileUtil.getDefaultImg();//默认图片
		}else {
			return FileUtil.getFile(rootDir +  "\\" + picture);
		}
    }
	
	@RequestMapping(value = "/getUserImg.do")
    public byte[]  getImage() throws IOException {
		SysUserInfo user = sysUserInfoService.findUserByid(Integer.parseInt(ServletUtil.getSessionVal("id")));
		if(StringUtil.isEmpty(user.getPicture())) {
			return  FileUtil.getDefaultImg();//默认图片
		}else {
			return FileUtil.getFile( rootDir +  "\\" +user.getPicture());
		}
    }

	@RequestMapping(value = "/getHomeImg.do")
    public byte[]  getHomeImage() throws Exception {
		UserHome home = userHomeService.getHomeByUserid();
		if(StringUtil.isEmpty(home.getPicture())) {
			return  FileUtil.getDefaultImg();//默认图片
		}else {
			return FileUtil.getFile(rootDir +  "\\" + home.getPicture());
		}
    }
	
}
