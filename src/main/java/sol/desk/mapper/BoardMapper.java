package sol.desk.mapper;

import java.util.List;

import sol.desk.domain.ApplyVo;
import sol.desk.domain.Criteria;
import sol.desk.domain.FleaBoardVo;


public interface BoardMapper {
	
	//플리마켓올리기
	public void insertFBoard(FleaBoardVo vo);
	
	//조회
	public List<FleaBoardVo> getFlealist(Criteria cri);
	
	public FleaBoardVo getFlea(FleaBoardVo vo);
	
	//지원서 등록
	public void apply(ApplyVo vo);

	// 내가 쓴글
	public List<FleaBoardVo> getmyFlealist(String userid);
	public List<ApplyVo> getmyApplylist(String userid);
	
	//지원자 확인
	public List<ApplyVo> readapplylist(int fno);
	
	public int getTotalCount(Criteria cri);
	
	//리스트 정렬기능
	public List<FleaBoardVo> sort(String sname);

}
