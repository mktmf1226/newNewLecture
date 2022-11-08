package kr.co.itwill.bbs;

public class BbsDTO {
	private String wname;
    private String subject;
    private String content;
    private String passwd;
    
	public BbsDTO() {}//생성자

	//getter and setter
	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	//toString()
	@Override
	public String toString() {
		return "BbsDTO [wname=" + wname + ", subject=" + subject + ", content=" + content + ", passwd=" + passwd + "]";
	}
    
    
    
    
    
}//class end
