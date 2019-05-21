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
import m.Pjnrb;
import m.Pjxxb;
import m.User;

@WebServlet("/api_pjxxb_change_flag")
public class Api_pjxxb_change_flag extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        int id = Integer.parseInt((String)req.getParameter("id"));
        int flag = Integer.parseInt((String)req.getParameter("flag"));
        Pjxxb p = new Pjxxb();
        out.print(p.change_flag(id, flag));
        out.flush();
	}
}
