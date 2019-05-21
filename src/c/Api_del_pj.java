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

import m.Pjnrb;
import m.User;

@WebServlet("/api_del_pj")
public class Api_del_pj extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String id = req.getParameter("id");
        Pjnrb p = new Pjnrb();
        out.print(p.del(Integer.parseInt(id)));
        out.flush();
	}
}
