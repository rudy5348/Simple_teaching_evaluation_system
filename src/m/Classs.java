package m;

import java.util.List;
import java.util.Map;

import u.Db;

public class Classs {
	String sql;
	Object[] param ;
	Db db = new Db();
	public int add_one(String name) {
		sql = "insert into classs (`name` , `flag`) values( ? , ? )";
		param = new Object[2];
		param[0] = name;
		param[1] = 2;
		return db.executeUpdate(sql, param);
	}

	public List get_all() {
		sql = "select * from classs where flag != ?";
		param = new Object[1];
		param[0] = 0;
		return db.executeQuery(sql, param);
	}
	
	public List get_all_open() {
		sql = "select * from classs where flag = ?";
		param = new Object[1];
		param[0] = 1;
		return db.executeQuery(sql, param);
	}
	public int change_flag(int id , int flag) {
		sql = "update classs set flag = ? where id = ?";
		param = new Object[2];
		param[0] = flag ;
		param[1] = id;
		return db.executeUpdate(sql, param);
	}
	public Map get_one(int id) {
		sql = "select * from classs where id = ?";
		param = new Object[1];
		param[0]= id;
		List list = db.executeQuery(sql, param);
		return (Map) list.get(0);
	}
}
