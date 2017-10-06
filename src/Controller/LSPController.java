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

import DAO.LSPDao;
import Model.LabServiceProvider;
import Service.LSPServices;
import Service.LabService;

/**
 * Servlet implementation class LSPController
 */
public class LSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LSPController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		LSPServices lsObj = new LSPServices();
		int labid1 =0;
		String value = request.getParameter("action");
		if (value.equals("register")) {

			String lab_name = request.getParameter("lab_name");
			String postal_address = request.getParameter("postal_address");
			int zip_code = Integer.parseInt(request.getParameter("zip_code"));
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			long contact_no=Long.parseLong(request.getParameter("contact_no"));
			long contact_no_alt=0;
			
			if(request.getParameter("contact_no_alt")==null ||request.getParameter("contact_no_alt")=="")
			{
				 contact_no_alt=0;
				
			}
			else{
				contact_no_alt= Long.parseLong(request.getParameter("contact_no_alt"));
			
			}
			String email = request.getParameter("email");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			String category = request.getParameter("category");

			LabServiceProvider LSPObj = new LabServiceProvider(lab_name,
					postal_address, zip_code, city, state, contact_no,
					contact_no_alt, email, question, answer, category);
			LabServiceProvider temp = new LabServiceProvider();
			try {
				temp = lsObj.addLSP(LSPObj);
				if (temp != null)
				{
					response.setContentType("text/html");
					RequestDispatcher rd = request.getRequestDispatcher("registerSuccess.jsp");
					request.setAttribute("qwer", temp);
					rd.forward(request, response);
				} else {
					request.setAttribute("contactno",contact_no);
					RequestDispatcher rd = request
							.getRequestDispatcher("registerFail.jsp");
					rd.forward(request, response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			else if (value.equals("registeradmin")) {

				String lab_name = request.getParameter("lab_name");
				String postal_address = request.getParameter("postal_address");
				int zip_code = Integer.parseInt(request.getParameter("zip_code"));
				String city = request.getParameter("city");
				String state = request.getParameter("state");
				long contact_no = Long
						.parseLong(request.getParameter("contact_no"));
				long contact_no_alt = Long.parseLong(request
						.getParameter("contact_no_alt"));
				String email = request.getParameter("email");
				String question = request.getParameter("question");
				String answer = request.getParameter("answer");
				String category = request.getParameter("category");

				LabServiceProvider LSPObj = new LabServiceProvider(lab_name,
						postal_address, zip_code, city, state, contact_no,
						contact_no_alt, email, question, answer, category);
				LabServiceProvider temp = new LabServiceProvider();
				try {
					temp = lsObj.addLSP(LSPObj);
					if (temp != null)
					{
						response.setContentType("text/html");
						request.setAttribute("qwer", temp);
						RequestDispatcher rd = request.getRequestDispatcher("RegisterSuccessAdmin.jsp");
					
						rd.forward(request, response);
					} else {
						request.setAttribute("contactno",contact_no);
						RequestDispatcher rd = request
								.getRequestDispatcher("registerFail.jsp");
						rd.forward(request, response);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			
		} else if (value.equals("login")) {
			int lab_id = Integer.parseInt(request.getParameter("id"));
			String password = request.getParameter("password");
			LabServiceProvider Lspobj = new LabServiceProvider();
			try {
				Lspobj = lsObj.login(lab_id, password);

				if (Lspobj != null) {
					if (Lspobj.getCategory().equalsIgnoreCase("special")) {
						session = request.getSession(true);
						session.setAttribute("LspObj", Lspobj);
						session.setMaxInactiveInterval(30 * 60);
						RequestDispatcher rd = request.getRequestDispatcher("LSPOption1.jsp");
						rd.forward(request, response);
					} else {
						session = request.getSession(true);
						session.setAttribute("LspObj", Lspobj);
						session.setMaxInactiveInterval(30 * 60);
						RequestDispatcher rd = request
								.getRequestDispatcher("LSPOption.jsp");
						rd.forward(request, response);
					}
				} else {
					request.setAttribute("check", lab_id);
					RequestDispatcher rd = request
							.getRequestDispatcher("LoginPage.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (value.equals("loginadmin")) {
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("pass");
			LabServiceProvider Lspobj = new LabServiceProvider();
			try {
				boolean flag = lsObj.adminlogin(user_id, password);
				if (flag == true) {
					session = request.getSession(true);
					
					session.setMaxInactiveInterval(30 * 60);
					RequestDispatcher rd = request
							.getRequestDispatcher("LSPOptionadmin.jsp");
					rd.include(request, response);
				} else {
					request.setAttribute("admin", flag);
					RequestDispatcher rd = request
							.getRequestDispatcher("LoginPage.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		else if (value.equals("updateprofile")) {
			String lab_name = request.getParameter("lab_name");
			String postal_address = request.getParameter("postal_address");
			int zip_code = Integer.parseInt(request.getParameter("zip_code"));
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			long contact_no = Long
					.parseLong(request.getParameter("contact_no"));
			long contact_no_alt = Long.parseLong(request
					.getParameter("contact_no_alt"));
			String email = request.getParameter("email");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			String category = request.getParameter("category");

			LabServiceProvider LSPObj = new LabServiceProvider(lab_name,
					postal_address, zip_code, city, state, contact_no,
					contact_no_alt, email, question, answer, category);

			try {
				session = request.getSession(false);
				LSPObj.setLabID(((LabServiceProvider) session
						.getAttribute("LspObj")).getLabID());
				LabServiceProvider temp = lsObj.updateLSP(LSPObj);
				
				if (temp!=null) {
					response.setContentType("text/html");
					request.setAttribute("lspobj", temp);
						RequestDispatcher rd = request
							.getRequestDispatcher("LSPUpdateSucess.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


		else if (value.equals("changepwd")) {
			LSPServices lsSer = new LSPServices();
			session = request.getSession(false);
			int labid = ((LabServiceProvider) session.getAttribute("LspObj"))
					.getLabID();
			String labpswd = ((LabServiceProvider) session
					.getAttribute("LspObj")).getPassword();
			System.out.println(labpswd);
			String password = request.getParameter("old_pass");
			String newpwd = request.getParameter("new_pass");
			int temp = 0;
			if (labpswd.equals(password)) {
				try {
					temp = lsSer.changepwd(labid, newpwd);
					if (temp > 0) {
						
						RequestDispatcher rd = request
								.getRequestDispatcher("PasswordChanged.jsp");
						rd.forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				String pswd = "abs";
				
				request.setAttribute("fail1", pswd);
				RequestDispatcher rd = request
						.getRequestDispatcher("LSPOption.jsp");
				
				rd.include(request, response);
			}
		}

		else if (value.equals("forgot")) {
			int labid = Integer.parseInt(request.getParameter("id"));
			labid1=labid;
			try {
				String temp = lsObj.getQues(labid);
				if (temp != null) {
					RequestDispatcher rd = request.getRequestDispatcher("SecurityQuestion.jsp");
					request.setAttribute("id",labid);
					request.setAttribute("ques", temp);
					rd.forward(request, response);
				} else {
					String temp1 = "abc";
					request.setAttribute("fail", temp1);
					RequestDispatcher rd = request
							.getRequestDispatcher("ForgetPassword.jsp");
					rd.include(request, response);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (value.equals("answer")) {
			String answer = request.getParameter("answer");
			String question = request.getParameter("question");
			int labid = Integer.parseInt(request.getParameter("labid"));
			
			try {
				LabServiceProvider lsp = new LabServiceProvider();
				System.out.println(answer);
				System.out.println(question);
				System.out.println(labid1);
				lsp = lsObj.checkans(answer,question,labid);
				if (lsp != null) {
					RequestDispatcher rd = request
							.getRequestDispatcher("passwordretreival.jsp");
					request.setAttribute("lspobj", lsp);
					rd.forward(request, response);
				} else {
					String temp1 = "abc";
					request.setAttribute("fail", temp1);
					RequestDispatcher rd = request
							.getRequestDispatcher("SecurityQuestion.jsp");
					rd.include(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (value.equals("viewadmin")) {
			System.out.println("helo");
			ArrayList<LabServiceProvider> list = new ArrayList<LabServiceProvider>();
			try {
				list = lsObj.viewLSPs();
				System.out.println("List" + list);
				if (list.size() > 0) {
					request.setAttribute("viewlist", list);
					RequestDispatcher rd = request
							.getRequestDispatcher("viewLSPadmin.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		else if (value.equals("deleteLSP")) {
			int id=(Integer.parseInt(request.getParameter("code")));
			LSPServices serObj=new LSPServices();
			int temp;
			try {
				temp = serObj.delete(id);
				if(temp>0)
				{
					response.setContentType("text/html");
					request.setAttribute("id",id);
					RequestDispatcher rd=request.getRequestDispatcher("deleteSuccessLSP.jsp");
					rd.forward(request,response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

		}
		
		else if (value.equals("logout")) {
			session=request.getSession(false);
			
			session.invalidate();
			RequestDispatcher rd=request.getRequestDispatcher("LoginPage.jsp");
			rd.forward(request,response);
			
		}
		else if (value.equals("register1")) {

			String lab_name = request.getParameter("lab_name");
			String postal_address = request.getParameter("postal_address");
			int zip_code = Integer.parseInt(request.getParameter("zip_code"));
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			long contact_no = Long
					.parseLong(request.getParameter("contact_no"));
long contact_no_alt=0;
			
			if(request.getParameter("contact_no_alt")==null ||request.getParameter("contact_no_alt")=="")
			{
				 contact_no_alt=0;
				
			}
			else{
				contact_no_alt= Long.parseLong(request.getParameter("contact_no_alt"));
			
			}
			String email = request.getParameter("email");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			String category = request.getParameter("category");

			LabServiceProvider LSPObj = new LabServiceProvider(lab_name,
					postal_address, zip_code, city, state, contact_no,
					contact_no_alt, email, question, answer, category);
			LabServiceProvider temp = new LabServiceProvider();
			try {
				temp = lsObj.addLSP(LSPObj);
				if (temp != null)
				{
					response.setContentType("text/html");
					RequestDispatcher rd = request.getRequestDispatcher("registerSuccess1.jsp");
					request.setAttribute("spl", temp);
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request
							.getRequestDispatcher("registerFail.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
		else if(value.equals("view"))
		{
			
			LabServiceProvider ls=new LabServiceProvider();
			 session=request.getSession(false);
			int id=((LabServiceProvider)session.getAttribute("LspObj")).getLabID();
			try {
				ls= lsObj.view(id);
				if(ls!=null)
				{
				
				request.setAttribute("lab",ls);				
				RequestDispatcher rd=request.getRequestDispatcher("viewProfile.jsp");
				rd.forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}

}
