package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/api_get_pj_user")
public class Api_get_pj_user extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        Map user = (Map) session.getAttribute("user");
        int user_id = (int) user.get("id");
        String str_id = req.getParameter("id");
        int id = Integer.parseInt(str_id);
        Pjjgb p = new Pjjgb();
        List list = p.get_one_user_pj(user_id, id);
        JSONArray json = new JSONArray();
        json.add(list);
        out.print(json);
        out.flush();
	}
}
