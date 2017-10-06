package Model;

public class LabServices {
	private String testCode;
	private String  testName;
	private String  testDescription;
	private int testDuration;
	private int testCost;
	private String  labHome;
	private int LabId;
	
	public LabServices(String testCode, String testName,
			String testDescription, int testDuration, int testCost,
			String labHome, int labId) {
		super();
		this.testCode = testCode;
		this.testName = testName;
		this.testDescription = testDescription;
		this.testDuration = testDuration;
		this.testCost = testCost;
		this.labHome = labHome;
		LabId = labId;
	}
	public LabServices(String testName, String testDescription,
			int testDuration, int testCost, String labHome, int labId) {
		super();
		this.testName = testName;
		this.testDescription = testDescription;
		this.testDuration = testDuration;
		this.testCost = testCost;
		this.labHome = labHome;
		LabId = labId;
	}
	public LabServices() {
		// TODO Auto-generated constructor stub
	}
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getTestDescription() {
		return testDescription;
	}
	public void setTestDescription(String testDescription) {
		this.testDescription = testDescription;
	}
	public int getTestDuration() {
		return testDuration;
	}
	public void setTestDuration(int testDuration) {
		this.testDuration = testDuration;
	}
	public int getTestCost() {
		return testCost;
	}
	public void setTestCost(int testCost) {
		this.testCost = testCost;
	}
	public String getLabHome() {
		return labHome;
	}
	public void setLabHome(String labHome) {
		this.labHome = labHome;
	}
	public int getLabId() {
		return LabId;
	}
	public void setLabId(int labId) {
		LabId = labId;
	}



}
