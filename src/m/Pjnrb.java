package m;

import java.util.List;

import u.Db;

public class Pjnrb {
	String sql;
	Object[] param ;
	Db db = new Db();
	public List get_all() {
		sql = "select * from pjnrb where id != ? ";
		param = new Object[1];
		param[0] = 0;
		return db.executeQuery(sql, param);
	}
	public int add(String name) {
		sql = "insert into pjnrb (`name`) values( ? )";
		param = new Object[1] ; 
		param[0] = name;
		return db.executeUpdate(sql, param);
	}
	public int del(int id ) {
		sql = "delete from pjnrb where id = ?";
		param = new Object[1];
		param[0] = id;
		return db.executeUpdate(sql, param);
	}
}
