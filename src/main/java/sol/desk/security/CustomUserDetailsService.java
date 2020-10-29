package sol.desk.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.Setter;
import sol.desk.domain.MemberVo;
import sol.desk.mapper.MemberMapper;
import sol.desk.security.domain.CustomUser;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// userName means userid
		MemberVo vo = memberMapper.readExist(userName);
		System.out.println("readExist"+vo.getUserid());

		return vo == null ? null : new CustomUser(vo);
	} 

}
