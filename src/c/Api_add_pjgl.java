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
import m.Pjxxb;
import m.User;

@WebServlet("/api_add_pjgl")
public class Api_add_pjgl extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
        PrintWriter out = resp.getWriter();

        String tea_choose = req.getParameter("tea_choose");
        String classs_choose = req.getParameter("classs_choose");
        String kcb_choose = req.getParameter("kcb_choose");
        int tea_id = Integer.parseInt(tea_choose);
        int classs_id = Integer.parseInt(classs_choose);
        int kcb_id = Integer.parseInt(kcb_choose);
        Pjxxb p = new Pjxxb();
        out.print(p.add(tea_id, kcb_id, classs_id));
        out.flush();
	}
}
