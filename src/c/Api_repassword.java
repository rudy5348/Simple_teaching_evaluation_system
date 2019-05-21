package c;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpServer;

import m.User;

@WebServlet("/api_repassword")
public class Api_repassword extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("repassword_username");
        String password = req.getParameter("repassword_password");
        String tel = req.getParameter("repassword_tel");
        String str_flag = req.getParameter("repassword_flag");
        int flag = Integer.parseInt(str_flag);
        
        User user = new User();
        int re = user.repassword(username, password, tel, flag);
        out.print(re);
        out.flush();
	}
}
