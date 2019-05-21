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
import m.Kcb;
import m.Pjnrb;
import m.Pjxxb;

@WebServlet("/pjgl")
public class Pjgl extends HttpServlet {
	
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

		Pjxxb p = new Pjxxb();
		session.setAttribute("p", p.admin_all_list());
		req.getRequestDispatcher("/pjgl.jsp").forward(req, resp);
	}
	
}
