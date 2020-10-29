package sol.desk.service;

import sol.desk.domain.MemberVo;

public interface MemberService {

	//아이디 중복 체크
	public int idCheck(String userId);

	//회원 가입
	public void register(MemberVo vo);
	
	public void register_auth(String userid);


}
