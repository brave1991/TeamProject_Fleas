package sol.desk.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import sol.desk.domain.ApplyVo;
import sol.desk.domain.FleaBoardVo;
import sol.desk.service.BoardService;

@Controller
public class MypageController {

	@Autowired
	private BoardService service;

	@RequestMapping("/mypage.do")
	public String mp(){
		return "/board/mypage";
	}

	// 내가 쓴 글 확인하기
	@RequestMapping("/mypage/boardcheck")
	public String getmine(Model model, Principal principal) {
		String userid = principal.getName();
		System.out.println("mypage boardcheck +"+userid);
		
		List<FleaBoardVo> myflea = service.getmyFlealist(userid);
		model.addAttribute("myflea",myflea);
		
		List<ApplyVo> myapp = service.getmyApplylist(userid);
		model.addAttribute("myapply",myapp);
		return "/board/mine";
	}
	
	// 지원자 확인
	@RequestMapping("/mypage/applycheck/{fno}")
	public String applycheck(@PathVariable("fno")int fno,Model model) {
		System.out.println("controller fno -"+fno);
		List<ApplyVo> app = service.readapplylist(fno);
		model.addAttribute("apply", app);
		return "/board/applycheck";
	}


}
