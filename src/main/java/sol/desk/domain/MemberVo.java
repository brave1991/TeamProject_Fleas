package sol.desk.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVo {
	
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String tel;
	
	private List<AuthVo> authList;

}
