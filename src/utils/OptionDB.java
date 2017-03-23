package utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import javaBean.User;

public class OptionDB {
	
	public User login(String username,String password){
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		User user = null;
		try {
			pstmt=(PreparedStatement) conn.prepareStatement("select * from User where u_id=? and password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()){
				user=new User(rs.getString("username"), rs.getString("u_id"),  rs.getString("password"),rs.getString("sex"), rs.getString("email"), rs.getString("i_p_url"), rs.getInt("age"), rs.getInt("tall"), rs.getInt("salary"), rs.getString("province"), rs.getString("city"), rs.getString("country"), rs.getString("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
		}
		return user;
	}
	
	/***
	 * User
	 * @param conn
	 * @param contentValues
	 * @return
	 */
	public boolean insertUser(User user) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String username =user.getUsername();
			String u_id=user.getU_id();
			String password=user.getPassword();
			String sex=user.getSex();
			if(sex.equals("fl-male"))sex="男";else sex="女";
			String email=user.getEmail();
			String i_p_url=user.getI_p_url();
			int age=user.getAge();
			int tall=user.getTall();
			int salary=user.getSalary();
			String province=user.getProvince();
			String city=user.getCity();
			String country=user.getCountry();
			pstmt=(PreparedStatement) conn.prepareStatement("insert into User values("
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "now()"
					+")");
			pstmt.setString(1, username);
			pstmt.setString(2, u_id);
			pstmt.setString(3, password);
			pstmt.setString(4, sex);
			pstmt.setString(5, email);
			pstmt.setString(6, i_p_url);
			pstmt.setInt(7, age);
			pstmt.setInt(8, tall);
			pstmt.setInt(9, salary);
			pstmt.setString(10, province);
			pstmt.setString(11, city);
			pstmt.setString(12, country);
			//鍐欒繘鏁版嵁搴�
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}

	
	/*@SuppressWarnings("finally")
	@Override
	public boolean softDeletePlayer(Connection conn, Player player) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =player.getPid();
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement) conn.prepareStatement("select * from player where pid =? and type=1");
			pstmt.setString(1, pid);
			rs =pstmt.executeQuery();
			if(rs.next()){
				do{
					pstmt=(PreparedStatement) conn.prepareStatement("update trade set type =0 where pid =? and type=1");
					pstmt.setString(1, rs.getString("pid"));
					pstmt.addBatch();
				}while(rs.next());
				pstmt.executeBatch();	
				pstmt.clearBatch();
			}
			pstmt=(PreparedStatement) conn.prepareStatement("update player set type =0 where pid =? and type=1");
			pstmt.setString(1, pid);
			result=pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	}
	@SuppressWarnings("finally")
	@Override
	public boolean updatePlayer(Connection conn,Player player) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =player.getPid();
			String pname=player.getPname();
			String url =player.getPpic();
			if(pname!=null){
				if(url!=null){
					pstmt=(PreparedStatement) conn.prepareStatement("update player set pname=?,ppic =? where pid =? and type=1");
					pstmt.setString(1, pname);
					File f =new File(url);
					FileInputStream fis =getFISFromFile(f);
					if(fis!=null){
						 byte[] buf=new byte[fis.available()];   
			                //灏嗘枃浠惰鍏ュ埌byte[]涓�   
						 	fis.read(buf);   
						 	pstmt.setBytes(2, buf);  
					}else{
						return false;
					}
					pstmt.setString(3, pid);
					result=pstmt.executeUpdate();
				}else{
					pstmt=(PreparedStatement) conn.prepareStatement("update player set pname= ? where pid=? and type=1");
					pstmt.setString(1, pname);
					pstmt.setString(2, pid);
					result=pstmt.executeUpdate();	
				}
				
			}else if(url!=null){
				pstmt=(PreparedStatement) conn.prepareStatement("update player set ppic=? where pid =? and type=1");
				File f =new File(url);
				FileInputStream fis =getFISFromFile(f);
				if(fis!=null){
					 byte[] buf=new byte[fis.available()];   
		                //灏嗘枃浠惰鍏ュ埌byte[]涓�   
					 	fis.read(buf);   
					 	pstmt.setBytes(1, buf);  
				}else{
					return false;
				}
				pstmt.setString(2, pid);
				result=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public boolean hardDeletePlayer(Connection conn, Player player) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =player.getPid();
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement) conn.prepareStatement("select * from trade where pid =?");
			pstmt.setString(1, pid);
			rs =pstmt.executeQuery();
			if(rs.next()){
				do{
					pstmt=(PreparedStatement) conn.prepareStatement("delete from trade where pid=?");
					pstmt.setString(1, rs.getString("pid"));
					pstmt.addBatch();
				}while(rs.next());
				pstmt.executeBatch();	
				pstmt.clearBatch();
			}
			pstmt=(PreparedStatement) conn.prepareStatement("delete from player where pid =?");
			pstmt.setString(1, pid);
			result=pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	}
	
	*//***
	 * Team
	 * @param conn
	 * @param contentValues
	 * @return
	 *//*
	@SuppressWarnings("finally")
	public boolean insertTeam(Connection conn, Team team) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String tid =team.getTid();
			String tname=team.getTname();
			String url =team.getTpic();
			pstmt=(PreparedStatement) conn.prepareStatement("insert into team values(?,?,?,1)");
			pstmt.setString(1, tid);
			pstmt.setString(2, tname);
			if(url!=null){
				File f =new File(url);
				FileInputStream fis =getFISFromFile(f);
				if(fis!=null){
					 byte[] buf=new byte[fis.available()];   
		                //灏嗘枃浠惰鍏ュ埌byte[]涓�   
					 	fis.read(buf);   
					 	pstmt.setBytes(3, buf);  
				}else{
					return false;
				}
			}else{
				Blob pic =null;
				pstmt.setBlob(3, pic);	
			}
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	@SuppressWarnings("finally")
	@Override
	public boolean softDeleteTeam(Connection conn, Team team) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String tid =team.getTid();
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement) conn.prepareStatement("select * from trade where tid =? and type=1");
			pstmt.setString(1, tid);
			rs =pstmt.executeQuery();
			if(rs.next()){
				do{
					pstmt=(PreparedStatement) conn.prepareStatement("update trade set type =0 where tid =? and type=1");
					pstmt.setString(1, rs.getString("tid"));
					pstmt.addBatch();
				}while(rs.next());
				pstmt.executeBatch();	
				pstmt.clearBatch();
			}
			pstmt=(PreparedStatement) conn.prepareStatement("update team set type =0 where tid =? and type=1");
			pstmt.setString(1, tid);
			result=pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	}
	@SuppressWarnings("finally")
	@Override
	public boolean updateTeam(Connection conn, Team team) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String tid =team.getTid();
			String tname=team.getTname();
			String url =team.getTpic();
			if(tname!=null){
				if(url!=null){
					pstmt=(PreparedStatement) conn.prepareStatement("update team set tname=?,tpic =? where tid =? and type=1");
					pstmt.setString(1, tname);
					File f =new File(url);
					FileInputStream fis =getFISFromFile(f);
					if(fis!=null){
						 byte[] buf=new byte[fis.available()];   
			                //灏嗘枃浠惰鍏ュ埌byte[]涓�   
						 	fis.read(buf);   
						 	pstmt.setBytes(2, buf);  
					}else{
						return false;
					}
					pstmt.setString(3, tid);
					result=pstmt.executeUpdate();
				}else{
					pstmt=(PreparedStatement) conn.prepareStatement("update team set tname= ? where tid=? and type=1");
					pstmt.setString(1, tname);
					pstmt.setString(2, tid);
					result=pstmt.executeUpdate();	
				}
				
			}else if(url!=null){
				pstmt=(PreparedStatement) conn.prepareStatement("update team set tpic=? where tid =? and type=1");
				File f =new File(url);
				FileInputStream fis =getFISFromFile(f);
				if(fis!=null){
					 byte[] buf=new byte[fis.available()];   
		                //灏嗘枃浠惰鍏ュ埌byte[]涓�   
					 	fis.read(buf);   
					 	pstmt.setBytes(1, buf);  
				}else{
					return false;
				}
				pstmt.setString(2, tid);
				result=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public boolean hardDeleteTeam(Connection conn, Team team) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String tid =team.getTid();
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement) conn.prepareStatement("select * from trade where tid =?");
			pstmt.setString(1, tid);
			rs =pstmt.executeQuery();
			if(rs.next()){
				do{
					pstmt=(PreparedStatement) conn.prepareStatement("delete from trade where tid=?");
					pstmt.setString(1, rs.getString("tid"));
					pstmt.addBatch();
				}while(rs.next());
				pstmt.executeBatch();	
				pstmt.clearBatch();
			}
			pstmt=(PreparedStatement) conn.prepareStatement("delete from team where tid =?");
			pstmt.setString(1, tid);
			result=pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	}
	*//***
	 * Trade
	 * @param conn
	 * @param contentValues
	 * @return
	 *//*
	@SuppressWarnings({ "resource", "finally" })
	@Override
	public boolean insertTrade(Connection conn, Trade trade) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =trade.getPid();
			pstmt=(PreparedStatement) conn.prepareStatement("select * from player where pid=? and type =1");
			pstmt.setString(1, pid);
			rs =pstmt.executeQuery();
			if(!rs.next()){
				System.out.println("璇风‘璁よ鐞冨憳瀛樺湪");
				return false;
			}
			String tid =trade.getTid();
			pstmt=(PreparedStatement) conn.prepareStatement("select * from team where tid=? and type =1");
			pstmt.setString(1, tid);
			rs =pstmt.executeQuery();
			if(!rs.next()){
				System.out.println("璇风‘璁よ鐞冮槦瀛樺湪");
				return false;
			}
			int salary=trade.getSalary();
			pstmt=(PreparedStatement) conn.prepareStatement("insert into trade values(?,?,?,now(),1)");
			pstmt.setString(1, pid);
			pstmt.setString(2, tid);
			pstmt.setInt(3, salary);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	@SuppressWarnings("finally")
	@Override
	public boolean softDeleteTrade(Connection conn, Trade trade) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =trade.getPid();
			String tid =trade.getTid();
			pstmt=(PreparedStatement) conn.prepareStatement("update trade set type =0 where pid =? and tid =? and type=1");
			pstmt.setString(1, pid);
			pstmt.setString(2, tid);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	@SuppressWarnings("finally")
	@Override
	public boolean updateTrade(Connection conn, Trade trade) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =trade.getPid();
			String tid =trade.getTid();
			int salary=trade.getSalary();
			pstmt=(PreparedStatement) conn.prepareStatement("update trade set salary=? where pid=? and tid =? and type=1");
			pstmt.setInt(1, salary);
			pstmt.setString(2, pid);
			pstmt.setString(3, tid);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public boolean hardDeleteTrade(Connection conn, Trade trade) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String pid =trade.getPid();
			String tid =trade.getTid();
			pstmt=(PreparedStatement) conn.prepareStatement("delete from trade where pid=? and tid =?");
			pstmt.setString(1, pid);
			pstmt.setString(2, tid);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	public FileInputStream getFISFromFile(File file) {
		FileInputStream fis=null;
//		System.out.println(pic.getAbsolutePath());
		if(file.isFile()){
			try {
				fis =new FileInputStream(file);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}else{
			System.out.println("鍥剧墖涓嶅瓨鍦�!");
		}
		return fis;
	}
	*/
}
