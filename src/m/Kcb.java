package m;

import java.util.List;
import java.util.Map;

import u.Db;

public class Kcb {
	String sql;
	Object[] param ;
	Db db = new Db();
	public List get_all() {
		sql = "select * from kcb where flag = ?";
		param = new Object[1];
		param[0] = 1;
		return db.executeQuery(sql, param);
	}
	public int add(String name) {
		sql = "insert into kcb (`name`,`flag`) values( ? ,? )";
		param = new Object[2] ; 
		param[0] = name;
		param[1] = 1;
		return db.executeUpdate(sql, param);
	}
	public int del(int id ) {
		sql = "update kcb set flag = 0 where id = ?";
		param = new Object[1];
		param[0] = id;
		return db.executeUpdate(sql, param);
	}
	public Map get_one (int id) {
		sql = "select * from kcb where id = ?";
		param = new Object[1];
		param[0] = id;
		List list = db.executeQuery(sql, param);
		return (Map) list.get(0);
	}
	public int change(int id , String name) {
		sql = "update kcb set name = ? where id = ?";
		param = new Object[2];
		param[0] = name;
		param[1] = id;
		return db.executeUpdate(sql , param);
	}
}
