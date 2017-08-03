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

	//�α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "/naverLogin.com", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session) {
		
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//System.out.println("���̹�:" + naverAuthUrl);
		ModelAndView mav = new ModelAndView("redirect:"+naverAuthUrl);
		
		return mav;
	}

	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/naverLoginOk.com", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		
		
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //�α��� ����� ������ �о�´�.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
	    int emailstart = apiResult.indexOf("email");
	    int emailend = apiResult.indexOf("com");
	    int gender = apiResult.indexOf("gender")+10;
	    
	   /* System.out.println("���� ���� :"+emailstart);
	    System.out.println("���� ���� �� :"+emailend);*/
	    String c_id = apiResult.substring(emailstart+8,emailend+3);
	    String c_gender = apiResult.substring((gender-1),gender);
	    if(c_gender.equals("F")){
	    	c_gender="����";
	    }
	    else if(c_gender.equals("M")){
	    	c_gender="����";
	    }
	    
	    /*System.out.println("gender = "+c_gender);
	    System.out.println("�ڸ� �̸��� :"+c_id);*/
	    String c_email = c_id;
	    
	    
	    
	    //���� ���̹� �α����� ������ ȸ���̶��
	    if(apiResult!=""&&apiResult!=null){
	    	
	    	List<CustomerVo> list = dao.getCustomer();
	    	
	    	int idx=0;
	    	int lsize = list.size();
	    	for(CustomerVo v : list){
	    		
	    		idx++;
	    		System.out.println("index= "+idx);
	    		String id = v.getC_id();
	    		System.out.println("��ȸ�ϴ� ���̵� : "+id);
	    		
	    		if(idx==lsize){ //list�� ������ ������ �϶� 
	    			if(!id.equals(c_id)){ //������̺� ȸ���� ������ (���ԵǾ���������) 
		    			int re = dao.insertNaverMember(c_id, c_email, c_gender);
		    			if(re==1){
		    				System.out.println("���̹�ȸ�� ������̺� �߰� ����");
		    			}
		    			else{
		    				System.out.println("������̺� �߰� ���� �Ф�");
		    			}
		    			
		    		}
	    		}
	    	
	    		

	    	}
	    	
	    }
	 
	   // ModelAndView mav = new ModelAndView();
	    
	    
	
	    System.out.println("apiResult: "+apiResult);
		model.addAttribute("result", apiResult);

        /* ���̹� �α��� ���� ������ View ȣ�� */
		return "naverSuccess";
	}

}
