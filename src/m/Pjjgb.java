package m;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import u.Db;

public class Pjjgb {
	String sql;
	Object[] param ;
	Db db = new Db();
	public int yz_user_pj(int user_id , int pjxxb_id) {
		sql = "select * from pjjgb where user_id = ? and pjxxb_id = ?";
		param = new Object[2];
		param[0] = user_id;
		param[1] = pjxxb_id;
		List list = db.executeQuery(sql, param);
		if (list.isEmpty() || list.size() == 0 ) return 0;
		else return 1;
	}
	public int add(List fen , int user_id , int pjxxb_id) {
		sql = "insert into pjjgb (`pjnrqrb_id`,`fen`,`user_id`,`pjxxb_id`) values(?,?,?,?);";
		param = new Object[4];
		param[2] = user_id;
		param[3] = pjxxb_id;
		for(int i = 0 ; i < fen.size() ; i++) {
			Map temp =(Map) fen.get(i);
			param[0] = (int)temp.get("id");
			param[1] = temp.get("fen");
			db.executeUpdate(sql, param);
		}
		return 1;
	}
	public List get_one_user_pj(int user_id , int pjxxb_id) {
		sql = "select *from pjjgb where user_id = ? and pjxxb_id = ?";
		param = new Object[2];
		param[0] = user_id ;
		param[1] = pjxxb_id;
		List list = db.executeQuery(sql, param);
		List re_list = new ArrayList();
		Pjnrqrb p = new Pjnrqrb();
		for(int i = 0 ; i < list.size(); i++) {
			Map temp = (Map) list.get(i);
			temp.put("name",(p.get_one((int)temp.get("pjnrqrb_id"))).get("name"));
			re_list.add(temp);
		}
		return re_list;
	}
	public JSONObject get_classs_pj(int pjxxb_id) {
		Pjxxb pjxxb = new Pjxxb();
		Map pj_one = pjxxb.get_one(pjxxb_id);
		User user = new User();
		List classs_user = user.get_one_classs((int)pj_one.get("classs_id"));
		Pjnrqrb pjnrqrb = new Pjnrqrb();
		List pjnrqr_list = pjnrqrb.get_one_pjxxb_id(pjxxb_id);
		JSONObject json = new JSONObject();
		json.put("title", pjnrqr_list);
		List re_user_list = new ArrayList();
		sql = "select * from pjjgb where pjnrqrb_id = ? and user_id = ? and pjxxb_id = ?";
		param = new Object[3];
		param[2] = pjxxb_id;
		for(int i = 0 ; i < classs_user.size() ; i++) {
			Map user_temp = (Map)classs_user.get(i);
			for(int j = 0 ; j <pjnrqr_list.size(); j++ ) {
				Map pj_temp = (Map)pjnrqr_list.get(j);
				param[0] = (int)pj_temp.get("id");
				param[1] = (int)user_temp.get("id");
				List cx = db.executeQuery(sql, param);
				if (cx.isEmpty() || cx.size() == 0 ) {
					user_temp.put(pj_temp.get("name"), -1);
				}else {
					Map jg = (Map) cx.get(0);
					user_temp.put(pj_temp.get("name"), jg.get("fen"));
				}
			}
			re_user_list.add(user_temp);
		}
		json.put("note", re_user_list);
		return json;
	}
}
