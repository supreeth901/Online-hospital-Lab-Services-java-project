package DAO;

import java.sql.Connection;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;

import Model.LabSchedule;
import Model.LabServiceProvider;

public class LabScheduleDao {
	Connection con = null;
	
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;


	public LabSchedule addschedule(String code, String slots,java.sql.Date date) throws SQLException {
	
		String[] startdate=slots.split("-");
		String start=startdate[0];
		String end=startdate[1];		
		
	  
		String time=date+" "+start+":00.0";
		String endtime=date+" "+end+":00.0";
		Timestamp ts = Timestamp.valueOf(time);
		Timestamp ts1 = Timestamp.valueOf(endtime);		 
		 
		 con = DatabaseUtil.getConnection();		
		 ps=con.prepareStatement("insert into tbl_project2_Lab_Schedule values(slotidSeq.nextval,?,?,?,?,?)");
		 ps.setTimestamp(1,ts);
		 ps.setTimestamp(2,ts1);
		 ps.setDate(3,date);
		 ps.setString(4,"Available");
		 ps.setString(5,code);
		 int result=ps.executeUpdate();
		 if (result > 0) {
				String query1="select * from tbl_project2_Lab_Schedule where testcode=?";
				ps1 = con.prepareStatement(query1);
				ps1.setString(1,code);
				rs=ps1.executeQuery();
				while(rs.next())
				{
					LabSchedule labSer= new LabSchedule();
					labSer.setSchedule_Date(rs.getDate(4));
					labSer.setTestCode(rs.getString(6));
					labSer.setStartTime(rs.getTimestamp(2));
									
					return labSer;
				}

}
		return null;
		 
		 
	}
	public ArrayList<String> getslots(String code,java.sql.Date date) throws SQLException {
		
	
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select testduration from TBL_PROJECT2_LABSERVICES where testcode=?");
		ps.setString(1,code);
		rs=ps.executeQuery();
		int dur=0;
		while(rs.next())
		{
			dur=rs.getInt(1);
		}
		
		int slots=420/dur;
		int starttime=420;
		int starttime1=840;
		int endTime = starttime+dur;
		int starthour=starttime/60, startminute=starttime%60, endhour = endTime/60, endminute = endTime%60;
		ArrayList<String> slotsArray = new ArrayList<String>();
		slotsArray.add(String.format("%02d",starthour)+":"+String.format("%02d",startminute)+"-"+String.format("%02d",endhour)+":"+String.format("%02d",endminute));
		
		for(int i=1;i<slots;i++)
		{
			
			if((780- endTime)>dur)
			{
			starttime=endTime;
			endTime=starttime+dur;			
			starthour = starttime/60;
			startminute=starttime%60;
			endhour = endTime/60;
			endminute = endTime%60;			
			}
			else if((900-endTime)>dur)
			{
				starttime=starttime1;
				endTime=starttime+dur;
				starttime1=starttime1+dur;
				starthour = starttime/60;
				startminute=starttime%60;
				endhour = endTime/60;
				endminute = endTime%60;
			}
			slotsArray.add(String.format("%02d",starthour)+":"+String.format("%02d",startminute)+"-"+String.format("%02d",endhour)+":"+String.format("%02d",endminute));
			
		}
	
		
		ps=con.prepareStatement("select starttime,endtime from TBL_PROJECT2_LAB_SCHEDULE where testcode=? AND schedule_date=?");
		ps.setString(1,code);
		ps.setDate(2,date);
		rs1=ps.executeQuery();	
		
		while(rs1.next())
		{
			String start = rs1.getTimestamp(1).toString().subSequence(11, 16).toString();
			String end = rs1.getTimestamp(2).toString().subSequence(11, 16).toString();
			
			slotsArray.remove(start+"-"+end);			
		}
		return slotsArray;
	}
		

	public ArrayList<LabSchedule> viewschedule1(int id, java.sql.Date scheduledate) throws SQLException 
	{
		con = DatabaseUtil.getConnection();
		String sql1 = "select t1.slotID,t1.starttime,t1.endtime,t1.schedule_date,t1.status,t1.testcode from TBL_PROJECT2_LAB_SCHEDULE t1,TBL_PROJECT2_LABSERVICES t2,TBL_PROJECT2_LSP t3 where t1.testcode=t2.testcode and t2.labID=t3.LabID and t3.LabId=? and schedule_date=?";
		
		ps = con.prepareStatement(sql1);
		ps.setInt(1,id);
		ps.setDate(2,scheduledate);
		rs = ps.executeQuery();
		 ArrayList<LabSchedule> list=new ArrayList<LabSchedule>();
		while (rs.next()) {
			LabSchedule ls=new LabSchedule();
			ls.setSlotId(rs.getInt(1));
			ls.setStartTime(rs.getTimestamp(2));
			ls.setEndTime(rs.getTimestamp(3));
			ls.setSchedule_Date(rs.getDate(4));
			ls.setStatus(rs.getString(5));
		    ls.setTestCode(rs.getString(6));
		    list.add(ls);
       
		}
		DatabaseUtil.closeConection(con);
	DatabaseUtil.closeStatement(ps);
	if(list.size()>0)
		return list;
	else return null;

	}
	public int deletetest(String testcode) throws SQLException {
		con=DatabaseUtil.getConnection();
		String sql="delete from TBL_PROJECT2_LAB_SCHEDULE where slotid=?";
		int res=0;
		
			ps=con.prepareStatement(sql);
			ps.setString(1,testcode);
		   res=ps.executeUpdate();
	         if(res>0)
	         {
	     		return res;
	         }
			DatabaseUtil.closeConection(con);
			DatabaseUtil.closeStatement(ps);
			return 0;

		
	}

	

	

}
