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
import net.sf.json.JSONObject;

@WebServlet("/api_add_pj_msg")
public class Api_add_pj_msg extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        Pjxxb p = new Pjxxb();
        Map m = p.get_add_pj_nr();
        JSONObject json = new JSONObject();
        json.putAll(m);
        out.print(json);
        out.flush();
	}
}
