package sol.desk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sol.desk.domain.MemberVo;
import sol.desk.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	//회원가입 페이지로 이동
	@RequestMapping(value ="/registerpage.do")
	public String signUpPage(){
		
		return "register";
	}
	
	//실제 회원가입 처리
	@RequestMapping(value = "/register.do")
	public String signUp(MemberVo vo) {
		
		service.register(vo);
		String userid = vo.getUserid();
		service.register_auth(userid);
		
		return "regsuccess";
	}
	
	//produces는 ajax가 데이터 넘겨받을때 깨짐 방지
	//id 중복 체크
	@RequestMapping(value = "/idCheck.do",method = RequestMethod.GET, 
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		int result = service.idCheck(userid);
		return Integer.toString(result);
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
}
