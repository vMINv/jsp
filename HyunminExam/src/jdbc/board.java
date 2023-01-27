package jdbc;

public class board {
	private int bid;
	private String bname;
	private String bpass;
	private String bsubject;
	private String bcontent;
	private String binputdate;
	private int bmasterid;
	private int breadcount;
	private int breplynum;
	private int bstep;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBpass() {
		return bpass;
	}
	public void setBpass(String bpass) {
		this.bpass = bpass;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBinputdate() {
		return binputdate;
	}
	public void setBinputdate(String binputdate) {
		this.binputdate = binputdate;
	}
	public int getBmasterid() {
		return bmasterid;
	}
	public void setBmasterid(int bmasterid) {
		this.bmasterid = bmasterid;
	}
	public int getBreadcount() {
		return breadcount;
	}
	public void setBreadcount(int breadcount) {
		this.breadcount = breadcount;
	}
	public int getBreplynum() {
		return breplynum;
	}
	public void setBreplynum(int breplynum) {
		this.breplynum = breplynum;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public board(int bid, String bname, String bpass, String bsubject, String bcontent, String binputdate,
			int bmasterid, int breadcount, int breplynum, int bstep) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.bpass = bpass;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
		this.binputdate = binputdate;
		this.bmasterid = bmasterid;
		this.breadcount = breadcount;
		this.breplynum = breplynum;
		this.bstep = bstep;
	}
	
}
