package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.LabServiceProvider;
import Model.LabServices;
import Service.LabService;

public class LabServicesDao {
	Connection con = null;
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	ResultSet rs = null;

 public LabServices addServices(LabServices labservice) throws SQLException
	  {
		  con=DatabaseUtil.getConnection();
		  int cid=0;
			ps2=con.prepareStatement("select testcodeSeq.nextval from dual");
			rs=ps2.executeQuery();
	   while(rs.next())
	     {
		cid=rs.getInt(1);
	    }
	     String ser=labservice.getTestName()+"_"+cid;
			String sql="INSERT INTO tbl_project2_LabServices VALUES(?,?,?,?,?,?,?)";
		
			
				ps1=con.prepareStatement(sql);
				ps1.setString(1,ser);
				ps1.setString(2,labservice.getTestName());
				ps1.setString(3,labservice.getTestDescription());
				ps1.setInt(4,labservice.getTestDuration());
				ps1.setInt(5,labservice.getTestCost());
				ps1.setString(6,labservice.getLabHome());
				ps1.setInt(7,labservice.getLabId());
				ps1.executeUpdate();
				
				String sql1="select * from tbl_project2_LabServices where testcode=?";
				ps2=con.prepareStatement(sql1);
				ps2.setString(1,ser);
				rs=ps2.executeQuery();
				LabServices ls=new LabServices();

				while(rs.next())
				{
					ls.setTestCode(rs.getString(1));
					ls.setTestName(rs.getString(2));
					return ls;
				}
				DatabaseUtil.closeConection(con);
				DatabaseUtil.closeStatement(ps2);
				DatabaseUtil.closeStatement(ps1);
			return null;

		  }
	  

 public LabServices search(String testcode,String testname) throws SQLException
	  {
			  con=DatabaseUtil.getConnection();
					String sql1="select * from tbl_project2_LabServices where testCode=? or testName=?";
					ps2=con.prepareStatement(sql1);
					ps2.setString(1,testcode);
					ps2.setString(2,testname);
					rs=ps2.executeQuery();
					LabServices ls=new LabServices();
				
				while(rs.next())
				{
					
					ls.setTestCode(rs.getString(1));
					ls.setTestName(rs.getString(2));
					ls.setTestDescription(rs.getString(3));
					ls.setTestDuration(rs.getInt(4));
					ls.setTestCost(rs.getInt(5));
					ls.setLabHome(rs.getString(6));
					return ls;
				}
				
				DatabaseUtil.closeConection(con);
				DatabaseUtil.closeStatement(ps2);
				
			 return null;
			  }
 

  public LabServices updatetest(LabServices lab) throws SQLException
	  {
		    con=DatabaseUtil.getConnection();
			String sql="update tbl_project2_LabServices set testname=?,testDescription=?,testDuration=?,testCost=?,labHome=? where testcode=?";
			
				ps1=con.prepareStatement(sql);
				ps1.setString(1,lab.getTestName());
				ps1.setString(2,lab.getTestDescription());
				ps1.setInt(3,lab.getTestDuration());
				ps1.setInt(4,lab.getTestCost());
				ps1.setString(5,lab.getLabHome());
				ps1.setString(6,lab.getTestCode());
				int temp=0;
				ps1.executeUpdate();
			
				String sql1="select * from tbl_project2_LabServices where testcode=?";
				ps2=con.prepareStatement(sql1);
				ps2.setString(1,lab.getTestCode());
				rs=ps2.executeQuery();
				LabServices ls=new LabServices();
				
			
				while(rs.next())
				{
					ls.setTestCode(rs.getString(1));
					ls.setTestName(rs.getString(2));
					ls.setTestDescription(rs.getString(3));
					ls.setTestDuration(rs.getInt(4));
					ls.setTestCost(rs.getInt(5));
					ls.setLabHome(rs.getString(6));
					return ls;
				}
				DatabaseUtil.closeConection(con);
				DatabaseUtil.closeStatement(ps2);
				DatabaseUtil.closeStatement(ps1);
			return null;


		  }


	public LabServices updatelookservice(String test_name, int id) throws SQLException {
		con=DatabaseUtil.getConnection();
		String sql="select * from tbl_project2_LabServices where testname=? and labid=?";
		
		ps1=con.prepareStatement(sql);
		ps1.setString(1,test_name);
		ps1.setInt(2,id);
		rs=ps1.executeQuery();
		LabServices updated=new LabServices();
	
        while(rs.next())
        {
       	 updated.setTestCode(rs.getString(1));
       	 updated.setTestName(rs.getString(2));
       	 updated.setTestDescription(rs.getString(3));
       	 updated.setTestDuration(rs.getInt(4));
       	 updated.setTestCost(rs.getInt(5));
       	 updated.setLabHome(rs.getString(6));
       	return updated;
       	
        }
		DatabaseUtil.closeConection(con);
		DatabaseUtil.closeStatement(ps1);
		return null;
	
	}
	 
	public ArrayList<LabServices> viewdetials(int id) throws SQLException 
	{
		con = DatabaseUtil.getConnection();
		String sql1 = "select * from tbl_project2_LabServices where labid=?";
	
		ps2 = con.prepareStatement(sql1);
		ps2.setInt(1,id);
		rs = ps2.executeQuery();
		ArrayList<LabServices> list=new ArrayList<LabServices>();
		while (rs.next()) {
			LabServices ls=new LabServices();
			
			ls.setTestCode(rs.getString(1));
			ls.setTestName(rs.getString(2));
			ls.setTestDescription(rs.getString(3));
			ls.setTestDuration(rs.getInt(4));
			ls.setTestCost(rs.getInt(5));
			ls.setLabHome(rs.getString(6));
			ls.setLabId(rs.getInt(7));
			list.add(ls);
		}

		DatabaseUtil.closeConection(con);
		DatabaseUtil.closeStatement(ps2);
	if(list.size()>0)
		return list;
	else return null;

	}  
	   public int deletetest(String code) throws SQLException
	  {
		    con=DatabaseUtil.getConnection();
			String sql="delete from tbl_project2_LabServices where testCode=?";
			int res=0;
			
				ps1=con.prepareStatement(sql);
				ps1.setString(1,code);
			   res=ps1.executeUpdate();
		         if(res>0)
		         {
		        	 return res;
		       
		         }
				DatabaseUtil.closeConection(con);
				DatabaseUtil.closeStatement(ps1);
			return 0;

		  }
	   

public ArrayList<LabServices> viewdtials(int labid) throws SQLException {

			con = DatabaseUtil.getConnection();
			String sql1 = "select testcode,testname from tbl_project2_LabServices where labid=?";
			ps2 = con.prepareStatement(sql1);
			ps2.setInt(1,labid);
			rs = ps2.executeQuery();
			ArrayList<LabServices> list=new ArrayList<LabServices>();
			while (rs.next()) {
				LabServices ls=new LabServices();
				ls.setTestCode(rs.getString(1));
				ls.setTestName(rs.getString(2));
				list.add(ls);

			}

			DatabaseUtil.closeConection(con);
			DatabaseUtil.closeStatement(ps2);
			if(list.size()>0)
			return list;
			else return null;

		}
	  
}
