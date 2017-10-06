package Service;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import DAO.LabScheduleDao;
import DAO.LabServicesDao;
import Model.LabSchedule;

public class LabScheduleService {




	public ArrayList<String> getslots(String code, Date date) throws SQLException {
		// TODO Auto-generated method stub
		return new LabScheduleDao().getslots(code,date);
	
	}

	public LabSchedule addschedule(String code, String slots, Date date) throws SQLException {
		// TODO Auto-generated method stub
		return new LabScheduleDao().addschedule(code,slots,date);
	
	}
	
	public ArrayList<LabSchedule> viewschedule(int id,Date shdate) throws SQLException
	   {
		   LabScheduleDao ld=new LabScheduleDao();
		   ArrayList<LabSchedule> array=new ArrayList<LabSchedule>();
		System.out.println("inside service");
	      array=ld.viewschedule1(id,shdate);
	               return array;
	   }

	public int delete(String testcode) throws SQLException {
		
		return new LabScheduleDao().deletetest(testcode);
		
	}

}
