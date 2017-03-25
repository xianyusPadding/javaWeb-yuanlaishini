package utils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import javaBean.Comment;
import javaBean.Share;
import javaBean.User;
import javaBean.Album;
import javaBean.Photo;
public class OptionDB {
	/***
	 * User
	 * @param conn
	 * @param contentValues
	 * @return
	 */
	
	//user表
	@SuppressWarnings("finally")
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
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean deleteUser(String u_id) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=1;
		try {
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement)conn.prepareStatement
		               ("delete from share where u_id=?");
			pstmt.setString(1, u_id);
			pstmt.addBatch();
			pstmt=(PreparedStatement)conn.prepareStatement
		               ("delete from comment where u_id=?");
			pstmt.setString(1, u_id);
			pstmt.addBatch();
			pstmt=(PreparedStatement)conn.prepareStatement
		               ("delete from album where u_id=?");
			pstmt.setString(1, u_id);
			pstmt.addBatch();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from user where u_id=?");
			pstmt.addBatch();
			pstmt.executeBatch();	
			pstmt.clearBatch();
			conn.commit();
		} catch (SQLException e) {
			try {
				result=0;
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
	public User selectUser(String u_id ) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		User user=null;
		try {

			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from user where u_id=?");
			pstmt.setString(1, u_id);	
			//写进数据库
			rs=pstmt.executeQuery();			
		
			while(rs.next()){
	    user=new User(rs.getString(1),rs.getString(2),
		    rs.getString(3),rs.getString(4),rs.getString(5),
		    rs.getString(6),rs.getInt(7),rs.getInt(8),
		    rs.getInt(9),rs.getString(10),rs.getString(11),
		    rs.getString(12),rs.getString(13));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return user;
		}
	}
	@SuppressWarnings("finally")
	public boolean alterUser(User user) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String username =user.getUsername();
			String u_id=user.getU_id();
			String password=user.getPassword();
			String sex=user.getSex();
			String email=user.getEmail();
			String i_p_url=user.getI_p_url();
			int age=user.getAge();
			int tall=user.getTall();
			int salary=user.getSalary();
			String province=user.getProvince();
			String city=user.getCity();
			String country=user.getCountry();
			pstmt=(PreparedStatement) conn.prepareStatement
					("update user set username=?,password=?,sex=?,"
		+ "email=?,i_p_url=?,age=?,tall=?,salary=?,province=?,city=?,"
		+ "country=?,date=now() where u_id=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, sex);
			pstmt.setString(4, email);
			pstmt.setString(5, i_p_url);
			pstmt.setInt(6, age);
			pstmt.setInt(7, tall);
			pstmt.setInt(8, salary);
			pstmt.setString(9, province);
			pstmt.setString(10, city);
			pstmt.setString(11, country);
			pstmt.setString(12, u_id);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean insertAlbum(Album album) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String uid=album.getU_id();
			String atitle=album.getA_title();
			String flag=album.getFlag();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into album(u_id,a_title,flag,date) values(?,?,?,now())");
			pstmt.setString(1, uid);
			pstmt.setString(2, atitle);
			pstmt.setString(3, flag);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	//删除所有相册
		@SuppressWarnings("finally")
		public boolean delete_all_Album(Album album) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
			         String uid=album.getU_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("delete  from album where u_id=?");
				pstmt.setString(1, uid);
				//写进数据库
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
		//删除单个相册
		@SuppressWarnings("finally")
		public boolean deleteAlbum(Album album) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
			         int aid=album.getA_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("delete  from album where a_id=?");
				pstmt.setInt(1, aid);
				//写进数据库
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	/**
	 * 查找相册逻辑是传入一个用户的id,查找该用户所创建的相册，返回一个集合list<Album>
	 * @param album
	 * @return
	 */
		@SuppressWarnings("finally")
		public List<Album> selectAlbum(Album album) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
		    List<Album> list=new ArrayList<Album>();
			try {
				String uid=album.getU_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from album where u_id=?");
				pstmt.setString(1, uid);			
				//写进数据库
				rs=pstmt.executeQuery();
				Album album1=null;
				while(rs.next()){
					album1=new Album(rs.getInt(1),rs.getString(2),rs.getString(3),
							rs.getString(4),rs.getString(5));
					list.add(album1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return list;
			}
		}
	/***
	 * 修改相册应该是哪个人修改了哪个相册
	 * @param album
	 * @return
	 */
		@SuppressWarnings("finally")
		public boolean alterAlbum(Album album) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
				int a_id=album.getA_id();
				String uid=album.getU_id();
				String atitle=album.getA_title();
				String flag=album.getFlag();
				pstmt=(PreparedStatement) conn.prepareStatement
		("update album set A_title=?, flag=?, date=now() where u_id=? and a_id=?");
				pstmt.setString(1, atitle);
				pstmt.setString(2, flag);
				pstmt.setString(3, uid);
				pstmt.setInt(4, a_id);
				//写进数据库
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return result!=0?true :false;
			}
		}
	
	//comment表
	@SuppressWarnings("finally")
	public boolean insertComment(Comment comment) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int cid =comment.getCid();
			String u_id=comment.getUid();
			int sid=comment.getSid();
			String cContent=comment.getcContent();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into comment(u_id,s_id,c_content,date) values(?,?,?,now())");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, sid);
			pstmt.setString(3, cContent);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}

	public boolean deleteComment(Comment comment) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int cid =comment.getCid();
			String u_id=comment.getUid();
			int sid=comment.getSid();
			String cContent=comment.getcContent();
			String date=comment.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from comment where c_id=?");
			pstmt.setInt(1, cid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	public boolean selectComment(Comment comment) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int cid =comment.getCid();
			String u_id=comment.getUid();
			int sid=comment.getSid();
			String cContent=comment.getcContent();
			String date=comment.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from comment where s_id=?");
			pstmt.setInt(1, sid);
			//写进数据库
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	public boolean alterComment(Comment comment) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int cid =comment.getCid();
			String u_id=comment.getUid();
			int sid=comment.getSid();
			String cContent=comment.getcContent();
			String date=comment.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
		    ("update comment set u_id=?,s_id=?,c_content=?,date=now()"
		    		+ "where c_id=?");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, sid);
			pstmt.setString(3, cContent);
			pstmt.setInt(4, cid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	//album表
	public boolean insertShare(Share share) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int sid =share.getS_id();
			String uid=share.getU_id();
			String stitle=share.getS_title();
			String scontent=share.getS_content();
			String spurl=share.getS_p_url();
			int startNum=share.getStartNum();
			int readNum=share.getReadNum();
			String flag=share.getFlag();
			String date=share.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into share values("
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
			pstmt.setInt(1, sid);
			pstmt.setString(2, uid);
			pstmt.setString(3, stitle);
			pstmt.setString(4, scontent);
			pstmt.setString(5, spurl);
			pstmt.setInt(6, startNum);
			pstmt.setInt(7, readNum);
			pstmt.setString(8, flag);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	public boolean deleteShare(Share share) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int sid =share.getS_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from share where s_id=?");
			pstmt.setInt(1, sid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	public boolean selectShare(Share share) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		boolean flag1=false;
		try {
			int sid =share.getS_id();
			String uid=share.getU_id();
			String stitle=share.getS_title();
			String scontent=share.getS_content();
			String spurl=share.getS_p_url();
			int startNum=share.getStartNum();
			int readNum=share.getReadNum();
			String flag=share.getFlag();
			String date=share.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from share where s_id=?");
			pstmt.setInt(1, sid);			
			//写进数据库
			rs=pstmt.executeQuery();
			flag1=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return flag1;
		}
	}
	
	public boolean alterShare(Share share) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int sid =share.getS_id();
			String uid=share.getU_id();
			String stitle=share.getS_title();
			String scontent=share.getS_content();
			String spurl=share.getS_p_url();
			int startNum=share.getStartNum();
			int readNum=share.getReadNum();
			String flag=share.getFlag();
			String date=share.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("update share set u_id=?,s_title=?,s_content=?,"
		+ "s_p_url=?,startNum=?,readNum=?,flag=?,date=now() where s_id=?");
			pstmt.setString(1, uid);
			pstmt.setString(2, stitle);
			pstmt.setString(3, scontent);
			pstmt.setString(4, spurl);
			pstmt.setInt(5, startNum);
			pstmt.setInt(6, readNum);
			pstmt.setString(7, flag);
			pstmt.setInt(8, sid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	//unloadphotoalbum表
	public boolean insertphoto(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int upid=photo.getU_p_id();
			String uid=photo.getU_id();
			int aid=photo.getA_id();
			String apurl=photo.getA_p_url();
			String date=photo.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into unloadphotoalbum values(?,?,?,?,now())");
			pstmt.setInt(1, upid);
			pstmt.setString(2, uid);
			pstmt.setInt(3, aid);
			pstmt.setString(4, apurl);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	public boolean deletePhoto(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int upid=photo.getU_p_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from unloadphotoalbum where u_p_id=?");
			pstmt.setInt(1, upid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	public boolean selectPhoto(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		boolean flag1=false;
		try {
			int upid=photo.getU_p_id();
			String uid=photo.getU_id();
			int aid=photo.getA_id();
			String apurl=photo.getA_p_url();
			String date=photo.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from unloadphotoalbum where u_p_id=?");
			pstmt.setInt(1, upid);			
			//写进数据库
			rs=pstmt.executeQuery();
			flag1=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return flag1;
		}
	}
	
	public boolean alterPhoto(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int upid=photo.getU_p_id();
			String uid=photo.getU_id();
			int aid=photo.getA_id();
			String apurl=photo.getA_p_url();
			String date=photo.getDate();
			pstmt=(PreparedStatement) conn.prepareStatement
	("update unloadphotoalbum set u_id=?, a_id=?, a_p_url=?, date=now() where "
	+ "u_p_id=?");
			pstmt.setString(1, uid);
			pstmt.setInt(2,aid);
			pstmt.setString(3, apurl);
			pstmt.setInt(4, upid);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	}
	
	
	public User login(String username,String password){
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		User user = null;
		try {
			pstmt=(PreparedStatement) conn.prepareStatement("select * from User where u_id=? and password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			//写进数据库
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
	/*public static void main(String[] args) {
		OptionDB o=new OptionDB();
	    o.alterPhoto();
	}*/
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
			                //将文件读入到byte[]中   
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
		                //将文件读入到byte[]中   
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
		                //将文件读入到byte[]中   
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
			                //将文件读入到byte[]中   
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
		                //将文件读入到byte[]中   
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
				System.out.println("请确认该球员存在");
				return false;
			}
			String tid =trade.getTid();
			pstmt=(PreparedStatement) conn.prepareStatement("select * from team where tid=? and type =1");
			pstmt.setString(1, tid);
			rs =pstmt.executeQuery();
			if(!rs.next()){
				System.out.println("请确认该球队存在");
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
			System.out.println("图片不存在!");
		}
		return fis;
	}
	*/
}
