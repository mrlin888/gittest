package cn.itcast.pojo;

public class QueryVo {
	private int uid;
	private String nickname;
	private String username;
	private String password;
	
	private int cid;
	private String cust_name;
	private String cust_type;
	private String cust_phone;
	private String cust_address;
	private int cust_link_user;
	
	//当前页数
		private Integer page = 1;

		//从第几条开始查
		private Integer start;
		//每页显示多少条
		private Integer size = 10;
		
		
		public int getUid() {
			return uid;
		}


		public void setUid(int uid) {
			this.uid = uid;
		}

		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getCust_phone() {
		return cust_phone;
	}


	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}


	public String getCust_address() {
		return cust_address;
	}


	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}


	public int getCust_link_user() {
		return cust_link_user;
	}


	public void setCust_link_user(int cust_link_user) {
		this.cust_link_user = cust_link_user;
	}
	
	
	@Override
	public String toString() {
		return "QueryVo [username=" + username + ", password=" + password + "]";
	}
	
	
	public String getCust_name() {
		return cust_name;
	}


	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}


	public String getCust_type() {
		return cust_type;
	}


	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}


	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
