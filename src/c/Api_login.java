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

import com.sun.net.httpserver.HttpServer;

import m.User;

@WebServlet("/api_login")
public class Api_login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("login_username");
        String password = req.getParameter("login_password");
        User user = new User();
        int re = user.login(username, password);
        if (re >0) {
        	Map u = user.get_one(re);
        	if ((int)u.get("flag") == 3 || (int)u.get("flag") == 4) {
        		out.print(2);
        	}else {
        		out.print(1);
        		session.setAttribute("user", u);
        	}
        }
        else out.print(re);
        out.flush();
	}
}
