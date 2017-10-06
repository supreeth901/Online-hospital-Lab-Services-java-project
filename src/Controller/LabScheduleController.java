package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LabSchedule;
import Model.LabServiceProvider;
import Service.LabScheduleService;
import Service.LabService;

/**
 * Servlet implementation class LabScheduleController
 */
public class LabScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LabScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);	
		int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
		LabScheduleService lbsc=new LabScheduleService();
		String value=request.getParameter("name");
		if(value.equals("view"))
		{
		String name=request.getParameter("testname");		
		String code=request.getParameter("testcode");
		request.setAttribute("testname",name);
		request.setAttribute("testcode",code);
		RequestDispatcher rd= request.getRequestDispatcher("AddSchedule.jsp");
		rd.forward(request, response);
			
		} 
		
		
	
		else if(value.equals("view1"))
		{
		String code=request.getParameter("code");
		Date date=Date.valueOf(request.getParameter("select_alert"));
		String slots=request.getParameter("slot");		
			try {
				LabSchedule i=lbsc.addschedule(code,slots,date);
				if(i!=null)
				{
					request.setAttribute("schedule",i);
					RequestDispatcher rd=request.getRequestDispatcher("ScheduleSuccess.jsp");
					rd.forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	else if(value.equals("add"))
		{
			Date date1=Date.valueOf(request.getParameter("schdate"));
			String code1=request.getParameter("code");
			
			ArrayList<String> schdl=new ArrayList<String>();
			try {
				schdl=lbsc.getslots(code1,date1);
				if(schdl!=null)
				{			
					PrintWriter out=response.getWriter();
					for(String str: schdl)
					{
						out.println(str);
					}
//					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	else if(value.equals("viewschedule"))
		{
			session=request.getSession(false);
			
			Date testdate=Date.valueOf(request.getParameter("keyword"));		
			ArrayList<LabSchedule> array=new ArrayList<LabSchedule>();
			LabScheduleService obj=new LabScheduleService();
			try {
				array=obj.viewschedule(id,testdate);
				System.out.println(array);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(array);
			if(array!=null)
			{
				request.setAttribute("schdate", array);
				response.setContentType("text/html");
				RequestDispatcher rd=request.getRequestDispatcher("ViewSchedule.jsp");
				rd.include(request,response);
			}
					
		
		}
	else if(value.equals("updateschedule"))
	{
		session=request.getSession(false);
		String testcode=request.getParameter("testcode");
		LabScheduleService obj=new LabScheduleService();
		int temp;
		try {
			temp = obj.delete(testcode);
			if(temp>0)
			{
				response.setContentType("text/html");
				request.setAttribute("testcode", testcode);
				RequestDispatcher rd=request.getRequestDispatcher("deleteSchedule.jsp");
				rd.forward(request,response);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
}
