package m;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import u.Db;

public class User {
	String sql;
	Object[] param ;
	Db db = new Db();
	public int login(String username , String password) {
		sql = "select * from user where username = ? and flag < 5";
		param = new Object[1];
		param[0] = username ;
		List row = db.executeQuery(sql, param);
		if (row.isEmpty() || row.size() == 0 ) return -1;
		Map map = (Map)row.get(0);
		if (((String)map.get("password")).equals(password)) {
			return (int)map.get("id");
		}else {
			return 0;
		}
	}
	public Map get_one(int id) {
		sql = "select * from user where id = ?";
		param = new Object[1];
		param[0] = id;
		List list = db.executeQuery(sql, param);
		return (Map)list.get(0);
	}
	public int repassword(String username ,String password , String tel , int flag ) {
		sql = "select * from user where username = ? and tel = ? and flag = ?";
		param = new Object[3];
		param[0] = username;
		param[1] = tel ;
		param[2] = flag ;
		List list = db.executeQuery(sql, param);
		if (list.isEmpty() || list.size() == 0) return -1;
		Map map = (Map) list.get(0);
		sql = "update user set password = ? where id = ?";
		param = new Object[2];
		param[0] = password;
		param[1] = (int) map.get("id");
		int row = db.executeUpdate(sql, param);
		return row;
	}
	public int change_user_msg(int id , String username , String password , String name , String tel , int bj_id) {
		sql = "select * from user where id = ? and username = ?";
		param = new Object[2];
		param[0] = id;
		param[1] = username;
		List list = db.executeQuery(sql, param);
		if (list.isEmpty() || list.size() == 0 ) return -1;
		try {
			if (bj_id == 0) {
				sql = "update user set password = ? , name = ? , tel = ? where id = ?";
				param = new Object[4];
				param[0] = password;
				param[1] = name;
				param[2] = tel;
				param[3] = id;
				db.executeUpdate(sql, param);
			} else {
				sql = "update user set password = ? , name = ? , tel = ? , bj_id = ? where id = ?";
				param = new Object[5];
				param[0] = password;
				param[1] = name;
				param[2] = tel;
				param[3] = bj_id;
				param[4] = id;
				db.executeUpdate(sql, param);
			} 
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	public String regedit(String username , String password , String name , String tel , int flag , int bj_id) {
		sql = "select * from user where username = ? ";
		param = new Object[1];
		param[0] = username ;
		List list = db.executeQuery(sql, param);
		if (!(list.isEmpty() || list.size() == 0)) return "3";
		sql = "select * from user where tel = ?";
		param[0] = tel;
		list = db.executeQuery(sql, param);
		if (!(list.isEmpty() || list.size() == 0)) return "4";
		if ( flag == 0) {
			sql = "insert into user(`username` , `password` , `name`, `tel`, `flag`, `bj_id`) values( ?, ?, ?, ?, ?, ?)";
			param = new Object[6];
			param[0] = username ;
			param[1] = password;
			param[2] = name;
			param[3] = tel;
			param[4] = flag ;
			param[5] = bj_id;
			db.executeUpdate(sql, param);
		}else {
			sql = "insert into user(`username` , `password` , `name`, `tel`, `flag`) values( ?, ?, ?, ?, ?)";
			param = new Object[5];
			param[0] = username ;
			param[1] = password;
			param[2] = name;
			param[3] = tel;
			param[4] = flag ;
			db.executeUpdate(sql, param);
		}

		return "1";
	}
	public List get_all_stu() {
		sql = " select * from user where flag = ? or flag = ?";
		param = new Object[2];
		param[0] = 0 ; 
		param[1] = 3;
		List list = db.executeQuery(sql, param);
		Classs cl = new Classs();
		List re_list = new ArrayList();
		if (list.isEmpty() || list.size() == 0 )  return re_list;
		for(int i = 0 ; i < list.size() ; i++) {
			Map temp = (Map)list.get(i);
			temp.put("bj", (String)(cl.get_one((int)temp.get("bj_id"))).get("name"));
			re_list.add(temp);
		}
		return re_list;
	}
	public List get_all_tea() {
		sql = " select * from user where flag = ? or flag = ?";
		param = new Object[2];
		param[0] = 1 ; 
		param[1] = 4 ;
		List list = db.executeQuery(sql, param);
		return list;
	}

	public int change_flag(int id , int flag) {
		sql = "update user set flag = ? where id = ?";
		param = new Object[2];
		param[0] = flag ;
		param[1] = id;
		return db.executeUpdate(sql, param);
	}
	public List get_one_classs(int bj_id) {
		sql = "select * from user where bj_id = ? and (flag = ? or flag = ?)";
		param = new Object[3];
		param[0] = bj_id;
		param[1] = 0;
		param[2] = 3;
		return db.executeQuery(sql, param);
	}
}
