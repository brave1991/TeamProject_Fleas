package sol.desk.mapper;

import java.util.List;

import sol.desk.domain.AttachVO;

public interface AttachMapper {
	
	public void insert(AttachVO vo);
	
	public void delete(String uuid);
	
	public List<AttachVO> findByFno(int fno);
	
	public void deleteAll(int fno);
	
	public List<AttachVO> getOldFiles();
	
}

