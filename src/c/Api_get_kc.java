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
import m.User;

@WebServlet("/api_get_kc")
public class Api_get_kc extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String str_id = req.getParameter("id");
        int id = Integer.parseInt(str_id);
        Kcb k = new Kcb();
        Map map = k.get_one(id);
        out.print("{\"msg\":\""+map.get("name")+"\",\"id\":\""+map.get("id")+"\"}");
        out.flush();
	}
}
