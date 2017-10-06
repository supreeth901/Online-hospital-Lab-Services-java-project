package Model;

import java.sql.Date;
import java.sql.Timestamp;

public class LabSchedule {
int slotId;
Timestamp startTime,endTime;
Date schedule_Date;
public LabSchedule() {
	super();
}
String status,testCode;
public LabSchedule(Timestamp startTime, Timestamp endTime, Date schedule_Date,
		String status, String testCode) {
	super();
	this.startTime = startTime;
	this.endTime = endTime;
	this.schedule_Date = schedule_Date;
	this.status = status;
	this.testCode = testCode;
}
public int getSlotId() {
	return slotId;
}
public void setSlotId(int slotId) {
	this.slotId = slotId;
}
public Timestamp getStartTime() {
	return startTime;
}
public void setStartTime(Timestamp startTime) {
	this.startTime = startTime;
}
public Timestamp getEndTime() {
	return endTime;
}
public void setEndTime(Timestamp endTime) {
	this.endTime = endTime;
}
public Date getSchedule_Date() {
	return schedule_Date;
}
public void setSchedule_Date(Date schedule_Date) {
	this.schedule_Date = schedule_Date;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getTestCode() {
	return testCode;
}
public void setTestCode(String testCode) {
	this.testCode = testCode;
}

}

