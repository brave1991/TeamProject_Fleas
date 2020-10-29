package sol.desk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import sol.desk.domain.MemberVo;
import sol.desk.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int idCheck(String userId) {
		System.out.println("idcheck!");
		int result = mapper.idCheck(userId);
		return result;
	}

	@Override
	public void register(MemberVo vo) {
		System.out.println("register");
		vo.setUserpw(passwordEncoder.encode(vo.getUserpw()));
		mapper.register(vo);
	}

	@Override
	public void register_auth(String userid) {
		System.out.println("register_auth");
		mapper.register_auth(userid);
		
	}
	
}
