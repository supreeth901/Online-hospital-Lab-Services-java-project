package DAO;
/**
 * 
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author 311223
 *
 */
public class DatabaseUtil {
//	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
//	private static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
//	private static final String USERNAME="system";
//	private static final String PASSWORD="1234";
	
	
	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@intvmoradb02:1521:ORAJAVADB";
	private static final String USERNAME="PJ02DEV_TJA90";
	private static final String PASSWORD="tcstvm";
//	
	
	public static Connection getConnection(){
		Connection con=null;
		
		try {
			Class.forName(DRIVER);
            con=DriverManager.getConnection(URL, USERNAME, PASSWORD);
		   System.out.println("connection established"+con);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		  return con;
		
	}
	
	
	public static void closeStatement(PreparedStatement pst){
		
		if(pst!=null){
			
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
		}
		
		
	}
	
	public static void closeConection(Connection con){
		
		if(con!=null){
			
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
		}
		
		
	}
	
	
	
	
	
	

}

