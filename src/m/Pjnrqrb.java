package m;

import java.util.List;
import java.util.Map;

import u.Db;

public class Pjnrqrb {
	String sql;
	Object[] param ;
	Db db = new Db();
	public int add(int pjxxb_id) {
		Pjnrb p = new Pjnrb();
		List l = p.get_all();
		sql = "insert into pjnrqrb (`pjxxb_id`,`name`)values(?,?);";
		param = new Object[2];
		param[0] = pjxxb_id;
		for(int i = 0 ; i < l.size() ; i++) {
			Map temp = (Map) l.get(i);
			param[1] = (String)temp.get("name");
			db.executeUpdate(sql, param);
		}
		return 1;
	}
	public List get_one_pjxxb_id(int pjxxb_id) {
		sql = "select * from pjnrqrb where pjxxb_id = ?";
		param = new Object[1];
		param[0] = pjxxb_id;
		List list = db.executeQuery(sql, param);
		return list;
	}
	public Map get_one(int id ) {
		sql = "select * from pjnrqrb where id = ? ";
		param = new Object[1];
		param[0] = id;
		List list = db.executeQuery(sql, param);
		Map map = (Map)list.get(0);
		return map;
	}
}
