package m;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import u.Db;

public class Pjxxb {
	String sql;
	Object[] param ;
	Db db = new Db();
	public List xx(List l) {
		List re_list = new ArrayList();
		User u = new User();
		Kcb k = new Kcb();
		Classs c = new Classs();
		for(int i = 0 ; i < l.size() ; i++) {
			Map temp = (Map) l.get(i);
			temp.put("tea_name", (u.get_one((int)temp.get("tea_id"))).get("name"));
			temp.put("kcb_name", (k.get_one((int)temp.get("kcb_id"))).get("name"));
			temp.put("classs_name", (c.get_one((int)temp.get("classs_id"))).get("name"));
			re_list.add(temp);
		}
		return re_list;
	}
	public List admin_all_list() {
		sql = "select * from pjxxb  where flag != ?";
		param = new Object[1];
		param[0] = 4;
		List list = db.executeQuery(sql, param);
		return xx(list);
	}
	public List stu_all_list(int stu_id) {
		User u = new User();
		Map u_map = u.get_one(stu_id);
		sql = "select * from pjxxb where flag != ? and flag != ? and classs_id = ?";
		param = new Object[3];
		param[0] = 4;
		param[1] = 0;
		param[2] = (int)u_map.get("bj_id");
		List list = db.executeQuery(sql, param);
		List xx_list = xx(list);
		List re_list = new ArrayList();
		Pjjgb p = new Pjjgb();
		for(int i = 0 ; i < xx_list.size() ; i++) {
			Map temp = (Map) xx_list.get(i);
			temp.put("zt", p.yz_user_pj(stu_id, (int)temp.get("id")));
			re_list.add(temp);
		}
		return re_list;
	}
	public List tea_all_list(int tea_id) {
		sql = "select * from pjxxb where flag != ? and flag != ? and tea_id = ?";
		param = new Object[3];
		param[0] = 4;
		param[1] = 0;
		param[2] = tea_id;
		List list = db.executeQuery(sql, param);
		List xx_list = xx(list);
		return xx_list;
	}
	public Map get_add_pj_nr() {
		Map re_map = new HashMap();
		User u = new User();
		List tea_u = u.get_all_tea();
		Kcb k = new Kcb();
		List kcb = k.get_all();
		Classs c = new Classs();
		List classs = c.get_all();
		re_map.put("tea", tea_u);
		re_map.put("kcb", kcb);
		re_map.put("classs", classs);
		return re_map;
	}
	public int add(int tea_id , int kcb_id , int classs_id) {
		sql = "insert into pjxxb (tea_id , kcb_id , classs_id , flag) values(?,?,?,?)";
		param = new Object[4];
		param[0] = tea_id;
		param[1] = kcb_id;
		param[2] = classs_id;
		param[3] = 0;
		int re = db.executeUpdate(sql, param);
		sql = "select * from pjxxb where tea_id = ? and kcb_id = ? and classs_id = ? and flag = ?";
		List list = db.executeQuery(sql, param);
		Map m = (Map) list.get(list.size()-1);
		Pjnrqrb p = new Pjnrqrb();
		p.add((int)m.get("id"));
		return re ;
	}
	public int change_flag (int id , int flag) {
		sql = "update pjxxb set flag = ? where id = ? ";
		param = new Object[2] ;
		param[0] = flag ;
		param[1] =  id;
		return db.executeUpdate(sql, param);
	}
	public Map get_one(int id ) {
		sql = "select * from pjxxb where id = ?";
		param = new Object[1];
		param[0] = id;
		List list = db.executeQuery(sql, param);
		return (Map)list.get(0);
	}
}
