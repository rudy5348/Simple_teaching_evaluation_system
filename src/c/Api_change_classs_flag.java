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

import m.Classs;
import m.User;

@WebServlet("/api_change_classs_flag")
public class Api_change_classs_flag extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String str_id = req.getParameter("id");
        String str_flag = req.getParameter("flag");
        int id = Integer.parseInt(str_id);
        int flag = Integer.parseInt(str_flag);
        
        Classs cl = new Classs();
        out.print(cl.change_flag(id, flag));
        out.flush();
	}
}
