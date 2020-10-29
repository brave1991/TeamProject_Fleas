package sol.desk.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class FleaBoardVo {
	
	private int fno;
	private String title;
	private String content;
	private Date opendate;
	private Date enddate;
	private String location;
	private String userid;
	
	private List<AttachVO> attachList;
	

}
