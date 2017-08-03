package com.jihye.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javajo.vo.CustomerVo;
import com.jihye.naver.SocialManager;

@Repository
public class NaverDao {
	
	public int insertNaverMember(String c_id,String c_email,String c_gender){
		return SocialManager.insertNaverMember(c_id, c_email, c_gender);
	}
	
	public List<CustomerVo> getCustomer(){
		return SocialManager.getCustomer();
	}
}
