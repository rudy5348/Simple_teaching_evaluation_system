package u;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Db {

	public final static String DRIVER = "com.mysql.jdbc.Driver";
	public final static String URL = "jdbc:mysql://localhost:3306/pjwz";
	public final static String USERNAME = "root";
	public final static String PASSWORD = "root";

	public Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void closeAll(Connection conn, PreparedStatement prsts, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (prsts != null) {
			try {
				prsts.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int executeUpdate(String sql, Object[] param) {
		int rows = 0;
		Connection conn = this.getConn();
		PreparedStatement prsts = null;
		try {
			prsts = conn.prepareStatement(sql);
			for (int i = 1; i <= param.length; i++) {
				prsts.setObject(i, param[i - 1]);
			}
			rows = prsts.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, prsts, null);
		}
		return rows;
	}

	public List executeQuery(String sql, Object[] param) {
		ResultSet rs = null;
		List list = null;
		Connection conn = this.getConn();
		PreparedStatement prsts = null;
		try {
			prsts = conn.prepareStatement(sql);
			for (int i = 1; i <= param.length; i++) {
				prsts.setObject(i, param[i - 1]);
			}
			rs = prsts.executeQuery();
			list = new ArrayList();
			ResultSetMetaData rsm = rs.getMetaData();
			Map map = null;
			while (rs.next()) {
				map = new HashMap();
				for (int i = 1; i <= rsm.getColumnCount(); i++) {
					map.put(rsm.getColumnName(i), rs.getObject(rsm.getColumnName(i)));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, prsts, rs);
		}
		return list;
	}

}
