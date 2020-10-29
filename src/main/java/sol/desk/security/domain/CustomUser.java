package sol.desk.security.domain;
// membervo의 인스턴스를 스프링 시큐리티의 userdetails 타입으로 변환하는 작업
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import sol.desk.domain.MemberVo;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private MemberVo member;

	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		System.out.println("customuser constructor +"+username+password);
	}

	public CustomUser(MemberVo vo) {

		super(vo.getUserid(), vo.getUserpw(), 
				vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
				// authvo 인스턴스가 GrantedAuthority 객체로 변환
		this.member = vo;
	}
}
