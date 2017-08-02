package com.jun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.BoardDao;
import com.jun.dao.ReplyDao;
import com.jun.vo.ReplyVo;

@Controller
public class ReplyController {

	@Autowired
	private ReplyDao dao;
	
	public void setDao(ReplyDao dao) {
		this.dao = dao;
	}
	@Autowired
	private BoardDao dao1;
	
	public void setDao1(BoardDao dao1) {
		this.dao1 = dao1;
	}
	//댓글 상세보기
	@RequestMapping(value="/detail/{re_number}", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("re_number") Integer re_number, ModelAndView mav){
        ReplyVo vo = dao.detailRe(re_number);
        // 뷰이름 지정
        mav.setViewName("detailReply");
        // 뷰에 전달할 데이터 지정
        mav.addObject("vo", vo);
        // replyDetail.jsp로 포워딩
        return mav;
    }

    // 댓글 삭제처리
    @RequestMapping(value="deleteReply.com/{re_number}")
    public ResponseEntity<String> delete(@PathVariable("re_number") Integer re_number){
        ResponseEntity<String> entity = null;
        try {
            dao.deleteRe(re_number);
            // 댓글 삭제가 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 삭제가 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 삭제 처리 HTTP 상태 메시지 리턴
        return entity;
    }
	
	
	
	@RequestMapping("insertReply.com")
	public void insert(@ModelAttribute ReplyVo vo, HttpSession session){
		
		//ModelAndView mav = new ModelAndView();
		String se_id= (String)session.getAttribute("se_id");
		int re_number= dao.getNextRe();
		vo.setRe_number(re_number);
		vo.setC_id(se_id);
		dao.insertRe(vo);
		//mav.setViewName("detailBoard");
		

	}
	
	@RequestMapping("listReply.com")
	public ModelAndView list(@RequestParam int b_number, HttpSession session){
//		HttpSession session = request.getSession();
//		session.setAttribute("customerid2","비누주스라우");
		
//		String se_id=(String)session.getAttribute("se_id");
		ModelAndView mav = new ModelAndView();
		String se_id = (String) session.getAttribute("se_id");
		List<ReplyVo> items = dao.listRe(b_number);
        for(ReplyVo vo : items){
        	System.out.println("vo    ::"+vo);
        	System.out.println("items   ::"+items);
        	System.out.println("getRe_secretreply   ::"+vo.getRe_secretreply());
        	
            // 댓글 목록중에 중에 비밀 댓글이 있을 경우
            if(vo.getRe_secretreply()==null){
                if(se_id== null){ // 비로그인 상태면 비밀 댓글로 처리
                    vo.setRe_content("비밀 댓글입니다.");
                } else { // 로그인 상태일 경우
                    //String writer = vo.getWriter(); // 게시물 작성자 저장
                    String replyer = vo.getC_id(); // 댓글 작성자 저장
                    // 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
                    if(/*!se_id.equals(writer) && */!se_id.equals(replyer)) {
                        vo.setRe_content("비밀 댓글입니다.");
                    }
                }
            }
        }
		
		/*List<ReplyVo> listRe = dao.listRe(b_number);*/
        System.out.println("listRe의  items ::     "+items);
        System.out.println("listRe  b_number ::     "+b_number);
        // 뷰이름 지정
        mav.setViewName("listReply");
        // 뷰에 전달할 데이터 지정
        mav.addObject("listRe", items);
        
        // replyList.jsp로 포워딩
        return mav;
    }
	
/*	 public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
	        List<ReplyVO> items = replyDao.list(bno, start, end);
	        // 세션에서 현재 사용자 id값 저장
	        String userId = (String) session.getAttribute("userId");
	        for(ReplyVO vo : items){
	            // 댓글 목록중에 중에 비밀 댓글이 있을 경우
	            if(vo.getSecretReply().equals("y")){
	                if(userId== null){ // 비로그인 상태면 비밀 댓글로 처리
	                    vo.setReplytext("비밀 댓글입니다.");
	                } else { // 로그인 상태일 경우
	                    String writer = vo.getWriter(); // 게시물 작성자 저장
	                    String replyer = vo.getReplyer(); // 댓글 작성자 저장
	                    // 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
	                    if(!userId.equals(writer) && !userId.equals(replyer)) {
	                        vo.setReplytext("비밀 댓글입니다.");
	                    }
	                }
	            }
	        }
	        return items; 
	    }
	*/
	

	
}
