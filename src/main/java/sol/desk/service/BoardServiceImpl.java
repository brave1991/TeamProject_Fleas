package sol.desk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sol.desk.domain.ApplyVo;
import sol.desk.domain.AttachVO;
import sol.desk.domain.Criteria;
import sol.desk.domain.FleaBoardVo;
import sol.desk.mapper.AttachMapper;
import sol.desk.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private AttachMapper amapper;

	@Override
	public List<FleaBoardVo> getFlealist(Criteria cri) {
		System.out.println("===> Mybatis로 getFlealist() 기능 처리");
		return mapper.getFlealist(cri);
	}

	@Override
	public FleaBoardVo getFlea(FleaBoardVo vo) {
		System.out.println("===> Mybatis로 getFlea() 기능 처리");
		return mapper.getFlea(vo);
	}
	
	@Transactional
	@Override
	public void insertFBoard(FleaBoardVo vo) {
		System.out.println("===> Mybatis로 insertBoard() 기능 처리");
		mapper.insertFBoard(vo);
		
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return;
		}
		vo.getAttachList().forEach(attach ->{
			attach.setFno(vo.getFno());
			amapper.insert(attach);
		});
	}

	@Override
	public void apply(ApplyVo vo) {
		System.out.println("===> Mybatis로 apply() 기능 처리");
		mapper.apply(vo);
	}

	
	//마이페이지
	@Override
	public List<FleaBoardVo> getmyFlealist(String userid) {
		System.out.println("===> Mybatis로 getmyFlealist() 기능 처리");
		return mapper.getmyFlealist(userid);
	}
	@Override
	public List<ApplyVo> getmyApplylist(String userid) {
		System.out.println("===> Mybatis로 getmyApplylist() 기능 처리");
		return mapper.getmyApplylist(userid);
	}

	@Override
	public List<ApplyVo> readapplylist(int fno) {
		System.out.println("===> Mybatis로 readapplylist() 기능 처리");
		return mapper.readapplylist(fno);
	}

	@Override
	public int getTotal(Criteria cri) {
		System.out.println("===> Mybatis로 getTotalCount() 기능 처리");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<AttachVO> getAttachList(int fno) {
		
		return amapper.findByFno(fno);
	}
 
	
	//	리스트 정렬기능
	@Override
	public List<FleaBoardVo> sort(String sname) {
		
		return mapper.sort(sname);
	}
	
	

}
