package route;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tTour.dao.CouncilDAO;
import tTour.dao.RegionDAO;
import tTour.dao.TtourDAO_db;
import tTour.model.Council;
import tTour.model.Region;
import tTour.model.User;

/**
 * Servlet implementation class RouteServlet
 */
@WebServlet(name ="RouteServlet", urlPatterns = {"/RouteServlet"})
public class RouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		System.out.println(request.getParameter("regionId"));
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		String contextPath = request.getContextPath();
//				request.getRequestDispatcher("index.jsp").forward(request, response);
//        	request.getRequestDispatcher("/").forward(request, response);
//        	request.getRequestDispatcher("index.jsp").forward(request, response);
//		System.out.println(request.getParameter("regionId"));
		linkHandler(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String contextPath = request.getContextPath();
        String action = request.getParameter("action");
//        String action = request.getParameter("action_login");
        String urlPath = request.getServletPath();
        switch(action) {
        case "login":
        	TtourDAO_db auth = new TtourDAO_db();
        	String email = request.getParameter("email");
            String password = request.getParameter("password");
            
        	try {
				if(auth.userAuth(new User(email,password))) {
					System.out.println("Success Login");
					HttpSession session = request.getSession();
//        		User s = auth.getUser(new User(email,password));
					session.setAttribute("user", auth.getUser(new User(email,password)));
					request.getRequestDispatcher("admin.jsp").forward(request, response);
//        		response.sendRedirect(request.getContextPath()+"admin/");
//        		System.out.println("path: "+request.getContextPath()+"; Email: "+email+"; Paswd: "+password);
				}else {
					System.out.println("context Path: "+contextPath);
//        		response.sendRedirect(contextPath+"/");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} catch (SQLException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	break;
        case "logout":
//        	HttpSession session = request.getSession(false);
        	if(request.getSession(false).getAttribute("user") !=null) {
        		System.out.println("url path: "+urlPath);
        		request.getSession(false).removeAttribute("user");
        		request.getSession(false).invalidate();
        		System.out.println("Success LogOut");
	            request.getRequestDispatcher("index.jsp").forward(request, response);
//        		response.sendRedirect(request.getContextPath()+"/");
        	}else {
        		System.out.println(contextPath);
        		request.getRequestDispatcher("index.jsp").forward(request, response);
        	}
	        break;
	        
        case "addUser":
        	doPut(request, response);
	        break;
        case "addRegion":
        	doPut(request,response);
        	break;
        case "addCouncil":
        	doPut(request,response);
        	break;
	    default:
	    	request.getRequestDispatcher("index.jsp").forward(request, response);
	    	break;
	            	 
        }
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch(action) {
		case"addUser":
			User user = new User();
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setUserType(request.getParameter("userType"));
			user.setPswd(request.getParameter("paswd"));
			try {
				if(new TtourDAO_db().create(user)) {
				request.setAttribute("msg", "New user added");
//				System.out.println("User Added");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}else {
				request.setAttribute("msg", "Failed");
					System.out.println("Failed");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}
			} catch (SQLException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		case "addRegion":
			Region region = new Region();
			region.setName(request.getParameter("name"));
			region.setMayer(request.getParameter("mayer"));
			region.setAbout(request.getParameter("about"));
			try {
				if(new RegionDAO().create(region)) {
					request.setAttribute("msg", "New Region added");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}else {
					request.setAttribute("msg", "Failed");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}
			}catch(SQLException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		case "addCouncil":
			Council council = new Council();
			council.setName(request.getParameter("name"));
			council.setRegion(Long.parseLong(request.getParameter("regionCouncil")));
			council.setAbout(request.getParameter("aboutCouncil"));
			try {
				if(new CouncilDAO().create(council)) {
					request.setAttribute("msg", "New Coucil added '"+request.getParameter("name")+"'");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}else {
					request.setAttribute("msg", "Failed to add Council '"+request.getParameter("name")+"'");
					request.getRequestDispatcher("admin.jsp").forward(request, response);
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			request.getRequestDispatcher("index.jsp").forward(request, response);
	    	break;	
			
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
//	user Defined Function
	protected void linkHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setAttribute("region", new RegionDAO().getRegion(Integer.parseInt(request.getParameter("regionId"))));
			request.getRequestDispatcher("region.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
