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

@WebServlet("/stu_pjlb")
public class Stu_pjlb extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		Map user = (Map)session.getAttribute("user");
		if (user == null|| (int)user.get("flag")!=0) {
			resp.sendRedirect("login");
			return ;
		}
		Pjxxb p = new Pjxxb();
		session.setAttribute("list", p.stu_all_list((int)user.get("id")));
		req.getRequestDispatcher("/stu_pjlb.jsp").forward(req, resp);
	}
	
}
