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

@WebServlet("/bjgl")
public class Bjgl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		Map user = (Map)session.getAttribute("user");
		if (user == null|| (int)user.get("flag")!=2) {
			resp.sendRedirect("login");
			return ;
		}
		
		Classs cl = new Classs();
		List cl_list = cl.get_all();
		session.setAttribute("cl_list", cl_list);
		req.getRequestDispatcher("/bjgl.jsp").forward(req, resp);
	}
	
}
