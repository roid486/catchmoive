package com.jihye.naver;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.javajo.controller.MainContoller;
import com.javajo.vo.CustomerVo;
import com.jihye.dao.NaverDao;

@Controller
public class LoginController {

	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private NaverDao dao;
	
	
	
	public void setDao(NaverDao dao) {
		this.dao = dao;
	}

	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLogin.com", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//System.out.println("네이버:" + naverAuthUrl);
		ModelAndView mav = new ModelAndView("redirect:"+naverAuthUrl);
		
		return mav;
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverLoginOk.com", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		
		String str="";
		System.out.println("여기는 네아로 성공 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	   
	    
	    int emailstart = apiResult.indexOf("email");
	    int emailend = apiResult.indexOf("com");
	    int gender = apiResult.indexOf("gender")+10;
	    
	   /* System.out.println("메일 길이 :"+emailstart);
	    System.out.println("메일 길이 끝 :"+emailend);*/
	    String c_id = apiResult.substring(emailstart+8,emailend+3);
	    System.out.println("c_id:"+c_id);
	    String c_gender = apiResult.substring((gender-1),gender);
	    if(c_gender.equals("F")){
	    	c_gender="여자";
	    }
	    else if(c_gender.equals("M")){
	    	c_gender="남자";
	    }
	    
	    /*System.out.println("gender = "+c_gender);
	    System.out.println("자른 이메일 :"+c_id);*/
	    String c_email = c_id;
	    
	    
	    
	    //만약 네이버 로그인이 성공한 회원이라면
	    if(apiResult!=""&apiResult!=null){
	    	
	    	List<CustomerVo> list = dao.getCustomer();
	    	
	    	int idx=0;
	    	int lsize = list.size();
//	    	if(lsize==0){
//	    		int re = dao.insertNaverMember(c_id, c_email, c_gender);
//    			if(re==1){
//    				str="새멤버 환영해";
//    				System.out.println("네이버회원 멤버테이블 추가 성공");
//    			}
//    			else{
//    				System.out.println("멤버테이블 추가 실패 ㅠㅠ");
//    			}
//	    	}
	    	System.out.println("list size= "+lsize);
	    	String test="";
	    	for(CustomerVo v : list){
	    		
	    		idx++;
	    		
	    		String id = v.getC_id();
	    		test += id+"/";
	    		
	    		
	    		if(idx==lsize){ //list가 마지막 사이즈 일때 
	    			System.out.println("list에 존재 하는 id = "+test);
	    			String t[] = test.split("/");
	    			
	    			boolean b = Arrays.asList(t).contains(c_id);
	    			System.out.println("잇니?"+b);
	    			if(!b){ //멤버테이블에 회원이 없으면 (가입되어있지않음) 
		    			int re = dao.insertNaverMember(c_id, c_email, c_gender);
		    			if(re==1){
		    				str="새멤버 환영해";
		    				System.out.println("네이버회원 멤버테이블 추가 성공");
		    			}
		    			else{
		    				System.out.println("멤버테이블 추가 실패 ㅠㅠ");
		    			}
		    			
		    		}
	    			else{
	    				
	    			}
	    		}
	    	
	    		

	    	}
	    	
	    	/*session.setAttribute("se_id", c_id);*/
	    	MainContoller.id=c_id;
	    }
	 
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("result",apiResult);
	    mav.addObject("SuccessInsert",str);
	    mav.setViewName("naverSuccess");
	    
	    
		System.out.println("apiResult: "+apiResult);
		model.addAttribute("result", apiResult);
		model.addAttribute("SuccessInsert",str);
		
		System.out.println("str = "+str);
		
		
	  

        /* 네이버 로그인 성공 페이지 View 호출 */
		return mav;
	}

}
