package Model;

public class LabServiceProvider{
	private int labID,zip;
	private String password,labName, address,city,state,email,security_question,security_answer,category;
	private long contactNo, alter_ContactNo;
	public LabServiceProvider() {
		
	}
	public LabServiceProvider(String labName, String address, int zip,
			String city, String state, long contactNo, long alter_ContactNo,
			String email, String security_question, String security_answer,
			String category) {
		
		this.labName = labName;
		this.address = address;
		this.zip = zip;
		this.city = city;
		this.state = state;
		this.contactNo = contactNo;
		this.alter_ContactNo = alter_ContactNo;
		this.email = email;
		this.security_question = security_question;
		this.security_answer = security_answer;
		this.category = category;
	}
	public int getLabID() {
		return labID;
	}
	public void setLabID(int labID) {
		this.labID = labID;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLabName() {
		return labName;
	}
	public void setLabName(String labName) {
		this.labName = labName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSecurity_question() {
		return security_question;
	}
	public void setSecurity_question(String security_question) {
		this.security_question = security_question;
	}
	public String getSecurity_answer() {
		return security_answer;
	}
	public void setSecurity_answer(String security_answer) {
		this.security_answer = security_answer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getContactNo() {
		return contactNo;
	}
	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}
	public long getAlter_ContactNo() {
		return alter_ContactNo;
	}
	public void setAlter_ContactNo(long alter_ContactNo) {
		this.alter_ContactNo = alter_ContactNo;
	}
	
	 

	
}

