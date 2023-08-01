package carbon.dto;


public class MemberDto {
	int idx;
	String member_id;
	String member_pwd;
	String member_name;
	
	
	
	public MemberDto(int idx, String member_id, String member_pwd, String member_name) {
		super();
		this.idx = idx;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
	}
	
	public MemberDto() {
		super();
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	@Override
	public String toString() {
		return "MemberDto [idx=" + idx + ", member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name="
				+ member_name + "]";
	}
	
	
}
