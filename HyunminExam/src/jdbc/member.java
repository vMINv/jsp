package jdbc;

public class member {
	private int mno;
	private String mname;
	private String mid;
	private String mpass;
	private String mgender;
	private String memail;
	private String mphone;
	private String mjoindate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
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
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}
	public member(int mno, String mname, String mid, String mpass, String mgender, String memail, String mphone, String mjoindate) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mid = mid;
		this.mpass = mpass;
		this.mgender = mgender;
		this.memail = memail;
		this.mphone = mphone;
		this.mjoindate = mjoindate;
	}
	
}
