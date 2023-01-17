package jdbc;

public class FBoardDTO {
	private String bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bfileone;
	private String bfiletwo;
	private String bdate;
	
	public String getBno() {
		return bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBwriter() {
		return bwriter;
	}
	public String getBcontent() {
		return bcontent;
	}
	public String getBfileone() {
		return bfileone;
	}
	public String getBfiletwo() {
		return bfiletwo;
	}
	public String getBdate() {
		return bdate;
	}
	public FBoardDTO(String bno, String btitle, String bwriter, String bcontent, String bfileone, String bfiletwo, String bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.bfileone = bfileone;
		this.bfiletwo = bfiletwo;
		this.bdate = bdate;
	}
}
