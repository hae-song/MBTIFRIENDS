package kr.co.mlec.member.vo;

public class SignupVO {

	private String id;
	private String pwd;
	private String name;
	private String mymbti;
	private String likembti;
	private String dislikembti;
	private String addrx;
	private String addry;
	
	public SignupVO() {
		super();
	}

	public SignupVO(String id, String pwd, String name, String mymbti, String likembti, String dislikembti,
			String addrx, String addry) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.mymbti = mymbti;
		this.likembti = likembti;
		this.dislikembti = dislikembti;
		this.addrx = addrx;
		this.addry = addry;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMymbti() {
		return mymbti;
	}

	public void setMymbti(String mymbti) {
		this.mymbti = mymbti;
	}

	public String getLikembti() {
		return likembti;
	}

	public void setLikembti(String likembti) {
		this.likembti = likembti;
	}

	public String getDislikembti() {
		return dislikembti;
	}

	public void setDislikembti(String dislikembti) {
		this.dislikembti = dislikembti;
	}

	public String getAddrx() {
		return addrx;
	}

	public void setAddrx(String addrx) {
		this.addrx = addrx;
	}

	public String getAddry() {
		return addry;
	}

	public void setAddry(String addry) {
		this.addry = addry;
	}

	@Override
	public String toString() {
		return "SignupVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", mymbti=" + mymbti + ", likembti="
				+ likembti + ", dislikembti=" + dislikembti + ", addrx=" + addrx + ", addry=" + addry + "]";
	}

	

}
