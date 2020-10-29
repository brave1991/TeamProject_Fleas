package sol.desk.mapper;

import sol.desk.domain.MemberVo;

public interface MemberMapper {
	
	public int idCheck(String userid);
	public void register(MemberVo vo);
	public void register_auth(String userid);
	
	// login
	public MemberVo readExist(String userid);
	
}
