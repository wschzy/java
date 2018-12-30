package com.sweet.util;

import java.io.File;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public static void saveFile(@NotNull(message = "目录不能为空") String dirPath,@NotNull(message = "文件地址不能为空")String fileName,
			@NotNull(message = "不能为空")MultipartFile image) throws Exception {
		File dir = new File(dirPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File file = new File(dir,fileName);
		delFile(dirPath,fileName);
		image.transferTo(file);
	}
	
	public static void delFile(String path,String filename){
        File file=new File(path+"/"+filename);
        if(file.exists() && file.isFile())
            file.delete();
    }
}
