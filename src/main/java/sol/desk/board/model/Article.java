package sol.desk.board.model;

public class Article {
	private Integer number;
	private String title;
	private int readCnt;


	public Article(Integer number, String title,  int readCnt
			) {
		this.number = number;
		this.title = title;
		this.readCnt = readCnt;
	
	}

	public Integer getNumber() {
		return number;
	}

	public String getTitle() {
		return title;
	}


	public int getReadCnt() {
		return readCnt;
	}


}
