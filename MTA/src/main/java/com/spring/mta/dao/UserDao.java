package com.spring.mta.dao;

import com.spring.mta.vo.UserVO;

public interface UserDao {

	public UserVO login(UserVO uvo);
	public int userUpdate(UserVO uvo);

}
