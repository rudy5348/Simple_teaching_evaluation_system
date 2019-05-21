package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import m.Pjjgb;
import m.Pjnrb;
import m.Pjnrqrb;
import m.Pjxxb;

@WebServlet("/stu_pj")
public class Stu_pj extends HttpServlet {
	
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

		
		int user_id = (int)user.get("id");
		int pjxxb_id = Integer.parseInt((String)req.getParameter("id"));
		Pjnrqrb p = new Pjnrqrb();
		session.setAttribute("nr" , p.get_one_pjxxb_id(pjxxb_id));
		session.setAttribute("pjxxb_id" , pjxxb_id);
		req.getRequestDispatcher("/stu_pj.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		Map user = (Map)session.getAttribute("user");
		if (user == null|| (int)user.get("flag")!=0) {
			resp.sendRedirect("login");
			return ;
		}

		int user_id = (int)user.get("id");
		int pjxxb_id = (int) session.getAttribute("pjxxb_id");
		Pjnrqrb p = new Pjnrqrb();
		List list = p.get_one_pjxxb_id(pjxxb_id);
		List re_list = new ArrayList();
		
		for(int i = 0 ; i < list.size(); i++) {
			Map temp = (Map)list.get(i);
			String fen = req.getParameter(String.valueOf(temp.get("id")));
			temp.put("fen", fen);
			re_list.add(temp);
		}
		Pjjgb pp = new Pjjgb();
		pp.add(re_list, user_id, pjxxb_id);
		resp.sendRedirect("stu_pjlb");
	}
}
