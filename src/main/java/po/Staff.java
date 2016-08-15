package po;


public class Staff {
	private byte staff_id;
	private String first_name;
	private String last_name;
	private short address_id;
	private String email;
	private String username;
	private String password;
	private String last_update;
	
	
	public String getLast_update() {
		return last_update;
	}
	public byte getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(byte staff_id) {
		this.staff_id = staff_id;
	}
	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	public short getAddress_id() {
		return address_id;
	}
	public void setAddress_id(short address_id) {
		this.address_id = address_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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