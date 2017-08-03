package com.jihye.naver;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
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
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		
		
		System.out.println("여기는 callback");
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
	    if(apiResult!=""&&apiResult!=null){
	    	
	    	List<CustomerVo> list = dao.getCustomer();
	    	
	    	int idx=0;
	    	int lsize = list.size();
	    	for(CustomerVo v : list){
	    		
	    		idx++;
	    		System.out.println("index= "+idx);
	    		String id = v.getC_id();
	    		System.out.println("조회하는 아이디 : "+id);
	    		
	    		if(idx==lsize){ //list가 마지막 사이즈 일때 
	    			if(!id.equals(c_id)){ //멤버테이블에 회원이 없으면 (가입되어있지않음) 
		    			int re = dao.insertNaverMember(c_id, c_email, c_gender);
		    			if(re==1){
		    				System.out.println("네이버회원 멤버테이블 추가 성공");
		    			}
		    			else{
		    				System.out.println("멤버테이블 추가 실패 ㅠㅠ");
		    			}
		    			
		    		}
	    		}
	    	
	    		

	    	}
	    	
	    }
	 
	   // ModelAndView mav = new ModelAndView();
	    
	    
	
	    System.out.println("apiResult: "+apiResult);
		model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */
		return "naverSuccess";
	}

}
