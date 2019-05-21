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

import m.Kcb;
import m.Pjjgb;
import m.Pjnrb;
import m.User;

@WebServlet("/api_get_pj_classs")
public class Api_get_pj_classs extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String str_id = req.getParameter("id");
        int id = Integer.parseInt(str_id);
        Pjjgb p = new Pjjgb();
        
        out.print(p.get_classs_pj(id));
        out.flush();
	}
}
