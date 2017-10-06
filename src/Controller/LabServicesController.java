package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LabServiceProvider;
import Model.LabServices;
import Service.LabService;

public class LabServicesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LabServicesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);	
		LabServiceProvider lbobj =(LabServiceProvider)session.getAttribute("Lspobj");
		LabService lbservice=new LabService();
		String value=request.getParameter("add");
	
		
		
		
		if(value.equals("add"))
		{
		String test_name=request.getParameter("name");
		
		String test_desc=request. getParameter("desc");
		
		int test_duration=Integer.parseInt(request.getParameter("duration"));
	
		int cost=Integer.parseInt(request.getParameter("cost"));
		
		String Lab_home=request. getParameter("labathome");
		
		int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
		LabServices ls = new LabServices(test_name,test_desc,test_duration,cost,Lab_home,id);		
		
		try {
			
		LabServices temp =new LabServices();
			temp=lbservice.addservice(ls);
			
			if(temp!=null)
			{
				response.setContentType("text/html");
				System.out.println(temp.getTestCode());
				request.setAttribute("ls",temp);
				RequestDispatcher rd=request.getRequestDispatcher("ServiceSuccess.jsp");
				rd.forward(request,response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		else if(value.equals("view"))
		{
			ArrayList<LabServices> list=new ArrayList<LabServices>();
			int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
			try {
				
				list=lbservice.viewServices(id);
				if(list.size()>0)
				{
					request.setAttribute("viewlist",list);
					RequestDispatcher rd=request.getRequestDispatcher("Table.jsp");
					rd.forward(request,response);
				}
				else
				{
					request.setAttribute("viewlist",list);
					RequestDispatcher rd=request.getRequestDispatcher("Table.jsp");
					rd.forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		else if(value.equals("updateservice"))
		{
			
			session=request.getSession(false);
			String test_name=request.getParameter("keyword");
			int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
		
			try {
				LabService serObj=new LabService();
				System.out.println(test_name);
				System.out.println(id);
				LabServices temp=serObj.updatelookservice(test_name,id);
				
				if(temp!=null)
				{
					response.setContentType("text/html");
					request.setAttribute("lbserob", temp);
					RequestDispatcher rd=request.getRequestDispatcher("Updateform.jsp");
					rd.forward(request,response);
				}
				else
				{
					request.setAttribute("lbserob", temp);
					RequestDispatcher rd=request.getRequestDispatcher("Updateform.jsp");
					rd.forward(request,response);	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(value.equals("updateform"))
		{
			session=request.getSession(false);
			String testcode=request.getParameter("code");
			String testname=request.getParameter("city");
			String test_desc=request. getParameter("desc");
			int test_duration=Integer.parseInt(request.getParameter("contact_no"));
		    int cost=Integer.parseInt(request.getParameter("contact_no_alt"));
			String Lab_home=request. getParameter("labathome");
			int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
			LabServices ls=new LabServices(testcode, testname, test_desc, test_duration, cost, Lab_home, id);
			
			try {
				LabService serObj=new LabService();
				LabServices temp =new LabServices();
				
				temp=serObj.updatetest(ls);
				
				if(temp!=null)
				{
					response.setContentType("text/html");				
					request.setAttribute("ls",temp);
					RequestDispatcher rd=request.getRequestDispatcher("UpdateSucess.jsp");
					rd.forward(request,response);
	
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		
		}
		else if(value.equals("search"))
		{
			session=request.getSession(false);
			String testcode=request.getParameter("title");
			String testname=request.getParameter("keyword");
			String ser="abc";
					
			try {
				LabService serObj=new LabService();
				LabServices temp=serObj.search(testcode,testname);
				System.out.println(temp);
				if(temp!=null)
				{
					request.setAttribute("search", ser);
					request.setAttribute("lbsearch",temp);
					response.setContentType("text/html");
					RequestDispatcher rd=request.getRequestDispatcher("searchPage.jsp");
					rd.include(request,response);
				}
				else
				{
					request.setAttribute("search","xyz");
					request.setAttribute("lbsearch",temp);
					response.setContentType("text/html");
					RequestDispatcher rd=request.getRequestDispatcher("searchPage.jsp");
					rd.include(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
		
		else if(value.equals("view1"))
		{
			session=request.getSession(false);
			ArrayList<LabServices> temp=new ArrayList<LabServices>();
			int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
			try {
				
				LabService viewObj=new LabService();
				 temp=viewObj.viewdtials(id);
				 if(temp!=null)
					{
						request.setAttribute("view1",temp);	
						RequestDispatcher rd=request.getRequestDispatcher("LabSchedule.jsp");
						rd.forward(request,response);
					}
				 else
				 {
					 request.setAttribute("view1",temp);	
						RequestDispatcher rd=request.getRequestDispatcher("LabSchedule.jsp");
						rd.forward(request,response); 
				 }
				 
		}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		
		else if(value.equals("delete"))
		{
			
			ArrayList<LabServices> list=new ArrayList<LabServices>();
			try {
				int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
				list=lbservice.viewServices(id);
			
				if(list.size()>0)
				{
					request.setAttribute("viewlist",list);
					RequestDispatcher rd=request.getRequestDispatcher("DeleteService.jsp");
					rd.forward(request,response);
				}
				else
				{
					request.setAttribute("viewlist",list);
					RequestDispatcher rd=request.getRequestDispatcher("DeleteService.jsp");
					rd.forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(value.equals("delete1"))
		{
			String testcode=request.getParameter("code");
			String testname=request.getParameter("testname");
			LabService serObj=new LabService();
		
			
			try {
				int temp = serObj.delete(testcode);
				if(temp>0)
				{
					response.setContentType("text/html");
					request.setAttribute("testname", testname);
					RequestDispatcher rd=request.getRequestDispatcher("deleteSuccess.jsp");
					rd.forward(request,response);
				}
				else
				{
					response.setContentType("text/html");
					request.setAttribute("testname", null);
					RequestDispatcher rd=request.getRequestDispatcher("deleteSuccess.jsp");
					rd.forward(request,response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}
	
	}
		
		
	}


