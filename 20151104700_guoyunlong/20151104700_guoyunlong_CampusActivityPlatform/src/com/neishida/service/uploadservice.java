package com.neishida.service;

import com.neishida.bean.Uploadbean;
import com.neishida.dao.UploadDao;

public class uploadservice {

	public static void UPloadValidate(String file, String fileName, long sizeInBytes) {
		// TODO Auto-generated method stub
		Uploadbean uploadbean = new Uploadbean();
		
		uploadbean.setFile(file);
		uploadbean.setFileName(fileName);
		uploadbean.setSizeInBytes(sizeInBytes);
	UploadDao ld = new UploadDao();
		ld.addFile(uploadbean);
	}
	
}

