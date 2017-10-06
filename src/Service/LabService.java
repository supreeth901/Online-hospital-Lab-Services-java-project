package Service;

import java.sql.SQLException;
import java.util.ArrayList;
import DAO.LabServicesDao;
import Model.LabServices;

public class LabService {
	
	public LabServices addservice(LabServices ser) throws SQLException
	{
	return new LabServicesDao().addServices(ser);
      }

	 
       
	  public LabServices updatetest(LabServices lab) throws SQLException
	  {
		  return new LabServicesDao().updatetest(lab);
		  
	  }
	 
        public LabServices search(String testcode,String testname) throws SQLException
	  {
	    LabServicesDao ld=new LabServicesDao();
	       LabServices result=ld.search(testcode,testname);
	        return result;
        }
		public LabServices updatelookservice(String test_name, int id) throws SQLException {
			// TODO Auto-generated method stub
			return new LabServicesDao().updatelookservice(test_name,id);
		}
		

public ArrayList<LabServices> viewServices(int id) throws SQLException {
			// TODO Auto-generated method stub
			return new LabServicesDao().viewdetials(id);
		}
public ArrayList<LabServices> viewdtials(int ladbid) throws SQLException
{
	  LabServicesDao ld=new LabServicesDao();
	  ArrayList<LabServices> lists=ld.viewdtials(ladbid);
		  return lists;

}




public int delete(String testcode) throws SQLException {
	return new LabServicesDao().deletetest(testcode);

}
}