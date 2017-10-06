package Service;

import java.sql.SQLException;
import java.util.ArrayList;

import DAO.LSPDao;
import Model.LabServiceProvider;

public class LSPServices {

	public LabServiceProvider addLSP(LabServiceProvider labObj) throws SQLException {
		
		return new LSPDao().addLSP(labObj);
	}

	public LabServiceProvider login(int lab_id, String password) throws SQLException {
		
		return new LSPDao().login(lab_id,password);
	}


	public LabServiceProvider updateLSP(LabServiceProvider lSPObj) throws SQLException {
		// TODO Auto-generated method stub
		
		return new LSPDao().updateLSP(lSPObj);
		
	}
	

public int changepwd(int labid, String newpwd) throws SQLException {
		return new LSPDao().changepwd(labid, newpwd);

	}

	public String getQues(int labid) throws SQLException {
		// TODO Auto-generated method stub
		return new LSPDao().getQues(labid);
	}

	public LabServiceProvider checkans(String answer, String question, int labid) throws SQLException {
		// TODO Auto-generated method stub
		return new LSPDao().checkans(answer,question,labid);
		
	}
	public boolean adminlogin(int userId, String password) throws SQLException {
		
		return new LSPDao().adminlogin(userId,password);
	}

	public ArrayList<LabServiceProvider> viewLSPs() throws SQLException {
		return new LSPDao().viewLSPs();
	}

	public int delete(int id) throws SQLException {
		// TODO Auto-generated method stub
		return new LSPDao().deleteLSP(id);
		
	}

	public LabServiceProvider view(int id) throws SQLException {
		
		return new LSPDao().view(id);
	}
	
}
