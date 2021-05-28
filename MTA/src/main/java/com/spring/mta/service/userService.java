package com.spring.mta.service;



import com.spring.mta.vo.UserVO;


public interface userService {

	public UserVO login(UserVO uvo);

	public int userUpdate(UserVO uvo) throws Exception;


}
