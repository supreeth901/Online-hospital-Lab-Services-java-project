package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import Model.LabServiceProvider;

public class LSPDao {
	Connection con = null;
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	ResultSet rs = null;

	public LabServiceProvider addLSP(LabServiceProvider labObj) throws SQLException {
		con = DatabaseUtil.getConnection();		
		Random rand = new Random();
		char values1[] ={'A','B','C','D','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
		char[] values2 = {'a','b','c','d','e','f','g','h','p','q','r','s','t','u','v','w','x','y','z'};
	    char[] values3 = {'@','&','$','#','%','*'};
	    char[] values4 = {'1','2','3','4','5','6','7','8','9','0'};
	    String out1="";
	    String out2="";
	    String out3="";
	    String out4="";
	    String pw;
	    int i=0;

	         for (i=0;i<3;i++)
	            {
	             int idx=rand.nextInt(values1.length);
	            out1+= values1[idx];
	            }
	         for (i=0;i<1;i++)
	         {
	          int idx=rand.nextInt(values3.length);
	         out2+= values3[idx];
	         }
	    for (i=0;i<2;i++)
	            {
	            int idx=rand.nextInt(values4.length);
	             out3+= values4[idx];
	            }
	 
	    for (i=0;i<2;i++)
	            {
	            int idx=rand.nextInt(values2.length);
	             out4+= values2[idx];
	            }
	 
	    pw= out1.concat(out2).concat(out3).concat(out4);
	    String query2="select * from tbl_project2_LSP where contactno=?";
	    ps1=con.prepareStatement(query2);
	    ps1.setLong(1,labObj.getContactNo());
	    rs=ps1.executeQuery();
	    if(rs.next())
	    {
	    	return null;
	    }
	    else
	    {
	    
	    
		String query = "Insert into tbl_project2_LSP values(LabId_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, pw);
			ps.setString(2, labObj.getLabName());
			ps.setString(3, labObj.getAddress());
			ps.setInt(4, labObj.getZip());
			ps.setString(5, labObj.getCity());
			ps.setString(6, labObj.getState());
			ps.setLong(7, labObj.getContactNo());
			ps.setLong(8, labObj.getAlter_ContactNo());
			ps.setString(9, labObj.getEmail());
			ps.setString(10, labObj.getSecurity_question());
			ps.setString(11, labObj.getSecurity_answer());
			ps.setString(12, labObj.getCategory());
			int result=ps.executeUpdate();
			if (result > 0) {
								String query1="select labID, password from tbl_project2_LSP where password=?";
								
								ps1 = con.prepareStatement(query1);
								ps1.setString(1,pw);
								rs=ps1.executeQuery();
								while(rs.next())
								{
									LabServiceProvider labSer= new LabServiceProvider();
									labSer.setLabID(rs.getInt(1));
									labSer.setPassword(rs.getString(2));
									
									
									return labSer;
								}
				
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeConection(con);
			DatabaseUtil.closeStatement(ps);
		}}
		return null;
	}
	public LabServiceProvider login(int id, String password) throws SQLException
	{
		LabServiceProvider LspObj=new LabServiceProvider();
		con = DatabaseUtil.getConnection();	
		String query="select * from tbl_project2_LSP where labID=? AND password=?";
		ps=con.prepareStatement(query);
		ps.setInt(1,id);
		ps.setString(2,password);
		rs=ps.executeQuery();
		while(rs.next())
		{
		LspObj.setLabID(rs.getInt(1));
		LspObj.setPassword(rs.getString(2));
		LspObj.setLabName(rs.getString(3));
		LspObj.setAddress(rs.getString(4));
		LspObj.setZip(rs.getInt(5));
		LspObj.setCity(rs.getString(6));
		LspObj.setState(rs.getString(7));
		LspObj.setContactNo(rs.getLong(8));
		LspObj.setAlter_ContactNo(rs.getLong(9));
		LspObj.setEmail(rs.getString(10));
		LspObj.setSecurity_question(rs.getString(11));
		LspObj.setSecurity_answer(rs.getString(12));
		LspObj.setCategory(rs.getString(13));
		return LspObj;
		}
		return null;
	}
	public LabServiceProvider updateLSP(LabServiceProvider lSPObj) throws SQLException {
		// TODO Auto-generated method stub
	
	
		con = DatabaseUtil.getConnection();	
		ps=con.prepareStatement("update tbl_project2_LSP set labName=?,address=?,zip=?,city=?,state=?,contactNo=?,alter_ContactNo=?,email=?,security_question=?,security_answer=?,category=? where labID=?");
		
		ps.setString(1,lSPObj.getLabName());
		ps.setString(2,lSPObj.getAddress());
		ps.setInt(3,lSPObj.getZip());
		ps.setString(4,lSPObj.getCity());
		ps.setString(5,lSPObj.getState());
		ps.setLong(6,lSPObj.getContactNo());
		ps.setLong(7,lSPObj.getAlter_ContactNo());
		ps.setString(8,lSPObj.getEmail());
		ps.setString(9,lSPObj.getSecurity_question());
		ps.setString(10,lSPObj.getSecurity_answer());
		ps.setString(11,lSPObj.getCategory());
		ps.setInt(12,lSPObj.getLabID());
		ps.executeUpdate();
		
		ps=con.prepareStatement("select * from tbl_project2_LSP where labId=?");
		ps.setInt(1,lSPObj.getLabID());
		rs=ps.executeQuery();
		LabServiceProvider ls=new LabServiceProvider();
		while(rs.next())
		{			
			ls.setLabName(rs.getString(3));
			ls.setAddress(rs.getString(4));
			ls.setZip(rs.getInt(5));
			ls.setCity(rs.getString(6));
			ls.setState(rs.getString(7));
			ls.setContactNo(rs.getLong(8));
			ls.setAlter_ContactNo(rs.getLong(9));
			ls.setEmail(rs.getString(10));
			ls.setCategory(rs.getString(13));
			return ls;
		}
	
		
		
		return null;
	}
	public int changepwd(int labid,String newpwd) throws SQLException
	{
		System.out.println("change pwd");
		con = DatabaseUtil.getConnection();	
		ps=con.prepareStatement("update tbl_project2_LSP set password=? where labID=?");
		ps.setString(1,newpwd);
		ps.setInt(2,labid);		
		int temp=ps.executeUpdate();
		if(temp>0)
		{
		return temp;
		}
		return 0;
		
	}
	public String getQues(int labid) throws SQLException
	{
		con = DatabaseUtil.getConnection();	
		ps=con.prepareStatement("select security_question from tbl_project2_LSP where labID=?");
		ps.setInt(1,labid);
		rs=ps.executeQuery();
		String q;
		while(rs.next())
		{
			q=rs.getString(1);
			return q;
		}
		return null;
		
	}
	public LabServiceProvider checkans(String answer, String question, int labid) throws SQLException {
		con = DatabaseUtil.getConnection();	
		LabServiceProvider lspobj=new LabServiceProvider();
		ps=con.prepareStatement("select labid,password from tbl_project2_LSP where security_question=? and security_answer=? and labId=?");
		ps.setString(1, question);
		ps.setString(2,answer);
		ps.setInt(3,labid);
		rs=ps.executeQuery();
		while(rs.next())
		{
			lspobj.setLabID(rs.getInt(1));
			lspobj.setPassword(rs.getString(2));
			return lspobj;
		}
		return null;
	}
	public boolean adminlogin(int userId, String password) throws SQLException 
	{
		LabServiceProvider LspObj=new LabServiceProvider();
		con = DatabaseUtil.getConnection();	
		String query="select * from tbl_project2_admin where adminID=? AND password=?";
		ps=con.prepareStatement(query);
		ps.setInt(1,userId);
		ps.setString(2,password);
		rs=ps.executeQuery();
		if(rs.next())
			
			return true;
		else 
			return false;
	}
	public int deletetest(Integer lab_id) throws SQLException
	{
		con=DatabaseUtil.getConnection();
		String sql="delete from tbl_project2_LSP where labID=?";
		int res=0;
		ps=con.prepareStatement(sql);
		ps.setInt(1,lab_id);
		   res=ps.executeUpdate();
	         if(res>0)
	         {
	        	 return res;
	        
	         }
			DatabaseUtil.closeConection(con);
			DatabaseUtil.closeStatement(ps1);
		return 0;

	  }
	public ArrayList<LabServiceProvider> viewLSPs() throws SQLException {
		System.out.println("helodac");
		con = DatabaseUtil.getConnection();
		String sql= "select * from tbl_project2_LSP";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		ArrayList<LabServiceProvider> list=new ArrayList<LabServiceProvider>();
		while (rs.next()) {
			LabServiceProvider ls=new LabServiceProvider();
			ls.setLabID(rs.getInt(1));
			
			ls.setLabName(rs.getString(3));
			ls.setAddress(rs.getString(4));
			ls.setZip(rs.getInt(5));
			ls.setCity(rs.getString(6));
			ls.setState(rs.getString(7));
			ls.setContactNo(rs.getLong(8));
			ls.setAlter_ContactNo(rs.getLong(9));
			ls.setEmail(rs.getString(10));
			ls.setCategory(rs.getString(13));
			list.add(ls);
		}
		DatabaseUtil.closeConection(con);
		DatabaseUtil.closeStatement(ps);
		if(list.size()>0)
	return list;
		else return null;
	}
	public int deleteLSP(int id) throws SQLException {
		con=DatabaseUtil.getConnection();
		String sql="delete from tbl_project2_LSP where labid=?";
		int res=0;
		
			ps1=con.prepareStatement(sql);
			ps1.setInt(1,id);
		   res=ps1.executeUpdate();
	         if(res>0)
	         {
	        	 System.out.println("delete sucessfully");
	         }
			DatabaseUtil.closeConection(con);
			DatabaseUtil.closeStatement(ps1);
		return res;
	
	}
	public LabServiceProvider view(int id) throws SQLException {
		 LabServiceProvider ls=new LabServiceProvider();
		 con = DatabaseUtil.getConnection();
			String sql= "select * from tbl_project2_LSP where labid=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1,id);
			System.out.println(id);
			System.out.println("heello1");
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				ls.setLabID(rs.getInt(1));
				ls.setLabName(rs.getString(3));
				ls.setAddress(rs.getString(4));
				ls.setZip(rs.getInt(5));
				ls.setCity(rs.getString(6));
				ls.setState(rs.getString(7));
				ls.setContactNo(rs.getLong(8));
				ls.setAlter_ContactNo(rs.getLong(9));
				ls.setEmail(rs.getString(10));
				ls.setCategory(rs.getString(13));
				return ls;
			}
		 
		return null;
	}




}

