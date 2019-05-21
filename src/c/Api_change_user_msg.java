package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import m.User;

@WebServlet("/api_change_user_msg")
public class Api_change_user_msg extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		Map user = (Map)session.getAttribute("user");
		int user_flag = (int)user.get("flag");
		
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String tel = req.getParameter("tel");
        int bj_id = 0;
        if (user_flag == 0) {
        	bj_id = Integer.parseInt((String)req.getParameter("bj_id"));
        }
        
        
        User u = new User();
        int re = u.change_user_msg((int)user.get("id"), username, password, name, tel, bj_id);
        if (re == 1) {
        	session.setAttribute("user", u.get_one((int)user.get("id")));
        }
        out.print(re);
        out.flush();
	}
}
