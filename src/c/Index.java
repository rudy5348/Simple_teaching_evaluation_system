package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpServer;

import m.Classs;

@WebServlet("/index")
public class Index extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		Map user = (Map)session.getAttribute("user");
		if (user == null) {
			resp.sendRedirect("login");
			return ;
		}
		
		if ((int)user.get("flag") == 0) {
			Classs cl = new Classs();
			List list = cl.get_all_open();
			session.setAttribute("cl_list", list);
			session.setAttribute("one_cl", cl.get_one((int)user.get("bj_id")));
		}
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
}
