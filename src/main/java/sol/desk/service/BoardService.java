package sol.desk.service;

import java.util.List;

import sol.desk.domain.ApplyVo;
import sol.desk.domain.AttachVO;
import sol.desk.domain.Criteria;
import sol.desk.domain.FleaBoardVo;

public interface BoardService {
	
	//공고 목록 조회
	public List<FleaBoardVo> getFlealist(Criteria cri);
	
	public List<AttachVO> getAttachList(int fno);
	
	//상세 조회
	public FleaBoardVo getFlea(FleaBoardVo vo);
	//등록
	public void insertFBoard(FleaBoardVo vo);
	
	
	//지원서 등록
	public void apply(ApplyVo vo);

	public List<FleaBoardVo> getmyFlealist(String userid);
	public List<ApplyVo> getmyApplylist(String userid);
	
	//지원자 확인
	public List<ApplyVo> readapplylist(int fno);
	
	public int getTotal(Criteria cri);
	
	public List<FleaBoardVo> sort(String sname);
}
