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

@WebServlet("/api_regedit")
public class Api_regedit extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("regedit_username");
        String password = req.getParameter("regedit_password");
        String name = req.getParameter("regedit_name");
        String tel = req.getParameter("regedit_tel");
        String str_flag = req.getParameter("regedit_flag");
        int flag = Integer.parseInt(str_flag);
        String str_bj_id = req.getParameter("regedit_bj_id");
        int bj_id = 0;
        try {
        	bj_id = Integer.parseInt(str_bj_id);
        }catch (Exception e) {
		}
        User user = new User();
        out.print(user.regedit(username, password, name, tel, flag, bj_id));
        out.flush();
	}
}
