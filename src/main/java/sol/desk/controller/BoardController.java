package sol.desk.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sol.desk.domain.ApplyVo;
import sol.desk.domain.AttachVO;
import sol.desk.domain.Criteria;
import sol.desk.domain.FleaBoardVo;
import sol.desk.domain.PageDTO;
import sol.desk.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/fleaform.do")
	public String ffom() throws Exception{
		return "/board/fleaform";
	}
	//공고 글 쓰기
	@RequestMapping(value = "/fleaformcre.do",method = RequestMethod.POST) 
	public String insertFBoard(FleaBoardVo vo, Principal principal,RedirectAttributes rttr) throws IOException {
		System.out.println("fleaformcre enter!!!!!!!!");
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> System.out.println(attach));
		}
	
		vo.setUserid(principal.getName());
		System.out.println("controller....,"+vo);
		boardService.insertFBoard(vo);
		
		rttr.addFlashAttribute("result", vo.getFno());
		return "redirect:/getFlealist.do";
	}

	//글 목록 검색
	@RequestMapping(value = "/getFlealist.do", method=RequestMethod.GET)
	public String getBoardList(Model model, Criteria cri) {
//		List<FleaBoardVo> fleaList = boardService.getFlealist(cri);

		// Model 정보 저장
		model.addAttribute("flealist", boardService.getFlealist(cri));
		
		int total = boardService.getTotal(cri);
		  System.out.println("total"+total);
		  model.addAttribute("pageMaker", new PageDTO(cri,total));
		  
		  System.out.println("controller cri = "+cri);
		return "/board/getFlealist"; // View 이름 리턴
	}
	

	// 글 상세 조회
	@RequestMapping("/getflea.do")
	public String getBoard(FleaBoardVo vo, Model model) {
		System.out.println("controller..내용+"+vo);
		model.addAttribute("content", boardService.getFlea(vo));
		return "/board/fleadetail"; // View 이름 리턴
	}

	
	// 지원서
	@RequestMapping("/applyform.do")
	public String afom() throws Exception{
		return "/board/applyform";
	}
	@RequestMapping(value="/applyformcre.do") 
	public String insertA(ApplyVo vo, Principal principal) throws IOException {
		vo.setUserid(principal.getName());
		boardService.apply(vo);
		return "/board/boardsucess";
	}
	
	
	
	@GetMapping(value="/getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachVO>> getAttachList(int fno){
		return new ResponseEntity<>(boardService.getAttachList(fno),HttpStatus.OK);
	}
	
	
	
	
	
	
/*	private void deleteFiles(List<AttachVO> attachList) {
		if(attachList == null || attachList.size()==0) {
			return;
		}
		System.out.println("delete attach false");
		System.out.println(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("C:\\Users\\soldesk\\Desktop\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\Users\\soldesk\\Desktop\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
			}
		});
	} */
	
}
