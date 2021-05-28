package com.spring.mta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.common.file.FileUploadUtil;
import com.spring.mta.dao.UserDao;
import com.spring.mta.vo.UserVO;

import lombok.Setter;

@Service
public class userServiceImpl implements userService{

	@Setter(onMethod_ = @Autowired)
	private UserDao userDao;
	
	@Override
	public UserVO login(UserVO uvo) {
		// TODO Auto-generated method stub
		UserVO userinfo = userDao.login(uvo);
		
		return userinfo;
	}

	@Override
	public int userUpdate(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		if(uvo.getProfile_file().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(uvo.getProfile_file(),"user");
			uvo.setProfile_image(fileName);
		}
		
		result = userDao.userUpdate(uvo);
		return result;
	}

}
