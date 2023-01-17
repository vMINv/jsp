package jdbc;

public class memberDTO {
	private String mno;
	private String mname;
	private String mid;
	private String mpass;
	private String mgender;
	private String memail;
	private String mdate;
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpass() {
		return mpass;
	}
	public void setMpass(String mpass) {
		this.mpass = mpass;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public memberDTO(String mno, String mname, String mid, String mpass, String mgender, String memail, String mdate) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mid = mid;
		this.mpass = mpass;
		this.mgender = mgender;
		this.memail = memail;
		this.mdate = mdate;
	}
}
