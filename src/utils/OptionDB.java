package utils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import javaBean.Album;
import javaBean.Comment;
import javaBean.Dgrounp;
import javaBean.Diary;
import javaBean.Friend;
import javaBean.Information;
import javaBean.Photo;
import javaBean.Share;
import javaBean.User;
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
			String email=user.getEmail();
			String i_p_url=user.getI_p_url();
			int age=user.getAge();
			int tall=user.getTall();
			int salary=user.getSalary();
			String province=user.getProvince();
			String city=user.getCity();
			String country=user.getCountry();
			pstmt=(PreparedStatement) conn.prepareStatement("insert into user values("
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
	public List<User> selectUser_all(String u_id) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<User> list=new ArrayList<>();
		try {

			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from user where u_id != ?  order by date DESC limit 24");
			pstmt.setString(1, u_id);
			//写进数据库
			rs=pstmt.executeQuery();			
			while(rs.next()){
			User  user=new User(rs.getString(1),rs.getString(2),
				    rs.getString(3),rs.getString(4),rs.getString(5),
				    rs.getString(6),rs.getInt(7),rs.getInt(8),
				    rs.getInt(9),rs.getString(10),rs.getString(11),
				    rs.getString(12),rs.getString(13));
			    Information information =select(user);
			    user.setInformation(information);
			    list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	@SuppressWarnings("finally")
	public List<User> selectUser_none( ) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<User> list=new ArrayList<>();
		try {

			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from user  order by date DESC limit 24");
			//写进数据库
			rs=pstmt.executeQuery();			
			while(rs.next()){
			User  user=new User(rs.getString(1),rs.getString(2),
				    rs.getString(3),rs.getString(4),rs.getString(5),
				    rs.getString(6),rs.getInt(7),rs.getInt(8),
				    rs.getInt(9),rs.getString(10),rs.getString(11),
				    rs.getString(12),rs.getString(13));
			    Information information =select(user);
			    user.setInformation(information);
			    list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
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
	public boolean insertFriend(Friend friend) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String u_id=friend.getUid();
			String f_id=friend.getFid();
			int fri =friend.getFriend();
			int f_feel=friend.getF_feeling();
			int f_coll=friend.getF_collection();
			pstmt=(PreparedStatement) conn.prepareStatement("insert into friend values("
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "now()"
					+")");
			pstmt.setString(1, u_id);
			pstmt.setString(2, f_id);
			pstmt.setInt(3, fri);
			pstmt.setInt(4, f_feel);
			pstmt.setInt(5, f_coll);
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
	public boolean deleteFriend(Friend friend) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=1;
		try {
			conn.setAutoCommit(false);
			pstmt=(PreparedStatement)conn.prepareStatement
		               ("delete from friend where u_id=? and f_id=?");
			pstmt.setString(1, friend.getUid());
			pstmt.setString(2, friend.getFid());
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
	public Friend selectFriend_single(Friend friend) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from friend where u_id=? and f_id=?");
			pstmt.setString(1, friend.getUid());	
			pstmt.setString(2, friend.getFid());	
			//写进数据库
			rs=pstmt.executeQuery();			
			while(rs.next()){
				friend=new Friend(rs.getString(1),rs.getString(2),
				  rs.getInt(3),rs.getInt(4),rs.getInt(5));
				User user =selectUser(friend.getFid());
				friend.setUser(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return friend;
		}
	}
	
	@SuppressWarnings("finally")
	public List<User> selectFriend_user(User user) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<User> list=new ArrayList<>();
		try {
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from friend where u_id=? order by data");
			pstmt.setString(1, user.getU_id());	
			//写进数据库
			rs=pstmt.executeQuery();			
			while(rs.next()){
				Friend friend=new Friend(rs.getString(1),rs.getString(2),
				  rs.getInt(3),rs.getInt(4),rs.getInt(5));
				User u =selectUser(friend.getFid());
				Information information =select(u);
				u.setInformation(information);
				u.setFriend(friend);
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	@SuppressWarnings("finally")
	public boolean alterFriend(Friend friend) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String u_id=friend.getUid();
			String f_id=friend.getFid();
			int fri =friend.getFriend();
			int f_feel=friend.getF_feeling();
			int f_coll=friend.getF_collection();
			
			pstmt=(PreparedStatement) conn.prepareStatement
					("update friend set friend=?,f_feeling=?,f_collection=? where u_id=? and f_id=?");
			pstmt.setInt(1, fri);
			pstmt.setInt(2, f_feel);
			pstmt.setInt(3, f_coll);
			pstmt.setString(4, u_id);
			pstmt.setString(5, f_id);
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
	public boolean insertDgrounp(Dgrounp dgrounp) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String uid=dgrounp.getU_id();
			String atitle=dgrounp.getDg_title();
			String flag=dgrounp.getFlag();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into dgrounp(u_id,dg_title,flag,date) values(?,?,?,now())");
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
	
	//删除所有日记组
		@SuppressWarnings("finally")
		public boolean delete_all_Dgrounp(Dgrounp dgrounp) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
			         String uid=dgrounp.getU_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("delete  from dgrounp where u_id=?");
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
		
		//删除单个日记组
		@SuppressWarnings("finally")
		public boolean deleteDgrounp(Dgrounp dgrounp) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
			         int aid=dgrounp.getDg_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("delete  from dgrounp where dg_id=?");
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
	 * 查找日记逻辑是传入一个用户的id,查找该用户所创建的日记组，返回一个集合list<Dgrounp>
	 * @param user
	 * @return
	 */
		@SuppressWarnings("finally")
		public List<Dgrounp> selectDgrounp(User user) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
		    List<Dgrounp> list=new ArrayList<Dgrounp>();
			try {
				String uid=user.getU_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from dgrounp where u_id=?");
				pstmt.setString(1, uid);			
				//写进数据库
				rs=pstmt.executeQuery();
				Dgrounp dgrounp=null;
				while(rs.next()){
					String date =rs.getString(5);
					String[] dates=date.split(" ");
					dgrounp=new Dgrounp(rs.getInt(1),rs.getString(2),rs.getString(3),
							rs.getString(4),dates[0]);
					list.add(dgrounp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return list;
			}
		}
	/***
	 * 修改日记组应该是哪个人修改了哪个日记组
	 * @param dgrounp
	 * @return
	 */
		@SuppressWarnings("finally")
		public boolean alterAlbum(Dgrounp dgrounp) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
				int a_id=dgrounp.getDg_id();
				String uid=dgrounp.getU_id();
				String atitle=dgrounp.getDg_title();
				String flag=dgrounp.getFlag();
				pstmt=(PreparedStatement) conn.prepareStatement
		("update dgrounp set dg_title=?, flag=?, date=now() where u_id=? and dg_id=?");
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
			public List<Album> selectAlbum(User user) {
				Connection conn=ConDataBase.getConn();
				ResultSet rs = null;
				PreparedStatement pstmt = null;
			    List<Album> list=new ArrayList<Album>();
				try {
					String uid=user.getU_id();
					pstmt=(PreparedStatement) conn.prepareStatement
							("select * from album where u_id=?");
					pstmt.setString(1, uid);			
					//写进数据库
					rs=pstmt.executeQuery();
					Album album=null;
					while(rs.next()){
						String date =rs.getString(5);
						String[] dates=date.split(" ");
						album=new Album(rs.getInt(1),rs.getString(2),rs.getString(3),
								rs.getString(4),dates[0]);
						list.add(album);
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

	@SuppressWarnings("finally")
	public boolean deleteComment(Comment comment) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int cid =comment.getCid();
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
	
	@SuppressWarnings("finally")
	public List<Comment> selectComment_share(Share share) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
	    List<Comment> list=new ArrayList<Comment>();
		try {
			int s_id =share.getS_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from comment where s_id=? order by date DESC");
			pstmt.setInt(1, s_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String date =rs.getString(5);
				String[] dates=date.split(" ");
				Comment comment=new Comment(rs.getInt(1),rs.getString(2),rs.getInt(3),
						rs.getString(4),dates[0]);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
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
	
	//Diary表
	@SuppressWarnings("finally")
	public boolean insertDiary(Diary diary) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String uid=diary.getU_id();
			String stitle=diary.getS_title();
			String scontent=diary.getS_content();
			String spurl=diary.getS_p_url();
			String flag=diary.getFlag();
			int dg_id=diary.getDg_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into diary(u_id,s_title,s_content,s_p_url,flag,date,dg_id) values("
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "now(),"
					+ "?"
					+")");
			pstmt.setString(1, uid);
			pstmt.setString(2, stitle);
			pstmt.setString(3, scontent);
			pstmt.setString(4, spurl);
			pstmt.setString(5, flag);
			pstmt.setInt(6, dg_id);
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
	public boolean deleteDiary(Diary diary) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int sid =diary.getS_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from diary where s_id=?");
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
	@SuppressWarnings("finally")
	public Diary selectDiary_single(Diary diary) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			int sid =diary.getS_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from diary where s_id=?");
			pstmt.setInt(1, sid);			
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				String[] date=rs.getString(9).split(" ");
				diary =new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0],rs.getInt(10));
				User user =selectUser(rs.getString(2));
				diary.setUser(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return diary;
		}
	}
	/**
	 * 查询一个用户的所有动态
	 * @param user
	 * @return
	 */
	@SuppressWarnings("finally")
	public List<Diary> selectDiary_user(User user) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Diary> list=new ArrayList<>();
		try {
			String uid=user.getU_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from diary where u_id=? order by date desc");
			pstmt.setString(1, uid);			
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				String[] date=rs.getString(9).split(" ");
				Diary diary =new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0],rs.getInt(10));
				User u  =selectUser(rs.getString(2));
				diary.setUser(u);;
//				List<Comment> comment=selectComment_share(share);
//				share.setListComment(comment);;
				list.add(diary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	public List<Diary> selectDiary_user_dg(Diary diary) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Diary> list=new ArrayList<>();
		try {
			String uid=diary.getU_id();
			int dg_id=diary.getDg_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from diary where u_id=? and dg_id=? order by date desc");
			pstmt.setString(1, uid);	
			pstmt.setInt(2, dg_id);
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				String[] date=rs.getString(9).split(" ");
				Diary d =new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0],rs.getInt(10));
				User u  =selectUser(rs.getString(2));
				d.setUser(u);;
//				List<Comment> comment=selectComment_share(share);
//				share.setListComment(comment);;
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	/**
	 * 查询所有动态
	 * @param user
	 * @return
	 */
	@SuppressWarnings("finally")
	public List<Diary> selectDiary_all() {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Diary> list=new ArrayList<>();
		try {
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from diary order by date DESC limit 10");
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				String[] date=rs.getString(9).split(" ");
				Diary diary =new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0],rs.getInt(10));
				User u  =selectUser(rs.getString(2));
				diary.setUser(u);;
//				List<Comment> comment=selectComment_share(share);
//				share.setListComment(comment);;
				list.add(diary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean alterDiary(Diary diary) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			int sid =diary.getS_id();
			String uid=diary.getU_id();
			String stitle=diary.getS_title();
			String scontent=diary.getS_content();
			String spurl=diary.getS_p_url();
			int startNum=diary.getStartNum();
			int readNum=diary.getReadNum();
			String flag=diary.getFlag();
			int dg_id=diary.getDg_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("update diary set u_id=?,s_title=?,s_content=?,"
		+ "s_p_url=?,startNum=?,readNum=?,flag=?,date=now(),dg_id=? where s_id=?");
			pstmt.setString(1, uid);
			pstmt.setString(2, stitle);
			pstmt.setString(3, scontent);
			pstmt.setString(4, spurl);
			pstmt.setInt(5, startNum);
			pstmt.setInt(6, readNum);
			pstmt.setString(7, flag);
			pstmt.setInt(8, dg_id);
			pstmt.setInt(9, sid);
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
	public List<Diary> selectDiary_page(int index) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Diary> list=new ArrayList<>();
		try {
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from diary order by date DESC limit ?, 10");
			pstmt.setInt(1, index);
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				String[] date=rs.getString(9).split(" ");
				Diary  diary =new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0],rs.getInt(10));
				User user =selectUser(rs.getString(2));
				diary.setUser(user);
//				List<Comment> comment=selectComment_share(share);
//				share.setListComment(comment);;
				list.add(diary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	
	//share表
		@SuppressWarnings("finally")
		public boolean insertShare(Share share) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			int result=0;
			try {
				String uid=share.getU_id();
				String stitle=share.getS_title();
				String scontent=share.getS_content();
				String spurl=share.getS_p_url();
				String flag=share.getFlag();
				pstmt=(PreparedStatement) conn.prepareStatement
						("insert into share(u_id,s_title,s_content,s_p_url,flag,date) values("
						+ "?,"
						+ "?,"
						+ "?,"
						+ "?,"
						+ "?,"
						+ "now()"
						+")");
				pstmt.setString(1, uid);
				pstmt.setString(2, stitle);
				pstmt.setString(3, scontent);
				pstmt.setString(4, spurl);
				pstmt.setString(5, flag);
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
		@SuppressWarnings("finally")
		public Share selectShare_single(Share share) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			try {
				int sid =share.getS_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from share where s_id=?");
				pstmt.setInt(1, sid);			
				//写进数据库
				rs=pstmt.executeQuery();
				while(rs.next()){
					String[] date=rs.getString(9).split(" ");
					share =new Share(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0]);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return share;
			}
		}
		/**
		 * 查询一个用户的所有动态
		 * @param user
		 * @return
		 */
		@SuppressWarnings("finally")
		public List<Share> selectShare_user(User user) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			List<Share> list=new ArrayList<>();
			try {
				String uid=user.getU_id();
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from share where u_id=? order by date desc");
				pstmt.setString(1, uid);			
				//写进数据库
				rs=pstmt.executeQuery();
				while(rs.next()){
					String[] date=rs.getString(9).split(" ");
					Share share =new Share(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0]);
					User u  =selectUser(rs.getString(2));
					share.setUser(u);;
//					List<Comment> comment=selectComment_share(share);
//					share.setListComment(comment);;
					list.add(share);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return list;
			}
		}
		/**
		 * 查询所有动态
		 * @param user
		 * @return
		 */
		@SuppressWarnings("finally")
		public List<Share> selectShare_all() {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			List<Share> list=new ArrayList<>();
			try {
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from share order by date DESC limit 10");
				//写进数据库
				rs=pstmt.executeQuery();
				while(rs.next()){
					String[] date=rs.getString(9).split(" ");
					Share share =new Share(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0]);
					User user =selectUser(rs.getString(2));
					share.setUser(user);
//					List<Comment> comment=selectComment_share(share);
//					share.setListComment(comment);;
					list.add(share);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return list;
			}
		}
		@SuppressWarnings("finally")
		public List<Share> selectShare_page(int index) {
			Connection conn=ConDataBase.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			List<Share> list=new ArrayList<>();
			try {
				pstmt=(PreparedStatement) conn.prepareStatement
						("select * from share order by date DESC limit ?, 10");
				pstmt.setInt(1, index);
				//写进数据库
				rs=pstmt.executeQuery();
				while(rs.next()){
					String[] date=rs.getString(9).split(" ");
					Share share =new Share(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), date[0]);
					User user =selectUser(rs.getString(2));
					share.setUser(user);
//					List<Comment> comment=selectComment_share(share);
//					share.setListComment(comment);;
					list.add(share);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				ConDataBase.closeConn(rs, pstmt, conn);
				return list;
			}
		}
		@SuppressWarnings("finally")
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
				pstmt=(PreparedStatement) conn.prepareStatement
						("update share set u_id=?,s_title=?,s_content=?,"
			+ "s_p_url=?,startNum=?,readNum=?,flag=? where s_id=?");
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
	@SuppressWarnings("finally")
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
			pstmt=(PreparedStatement) conn.prepareStatement
					("insert into unloadphotoalbum(u_id,a_id,a_p_url,date) values(?,?,?,now())");
			pstmt.setString(1, uid);
			pstmt.setInt(2, aid);
			pstmt.setString(3, apurl);
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
	
	/**
	 * 返回一个用户一个相册的所有图片
	 * @param photo
	 * @return
	 */
	@SuppressWarnings("finally")
	public List<Photo> selectPhoto_Ablum(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
	    List<Photo> list=new ArrayList<Photo>();
		try {
			String uid=photo.getU_id();
			int aid=photo.getA_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from unloadphotoalbum where u_id=? and a_id=?");
			pstmt.setString(1, uid);	
			pstmt.setInt(2, aid);	
			//写进数据库
			rs=pstmt.executeQuery();
			Photo photo1=null;
			while(rs.next()){
				String date =rs.getString(5);
				String[] dates=date.split(" ");
				photo1=new Photo(rs.getInt(1),rs.getString(2),rs.getInt(3),
						rs.getString(4),dates[0]);
				list.add(photo1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	/**
	 * 返回一个用户的所有图片
	 * @param photo
	 * @return
	 */
	@SuppressWarnings("finally")
	public List<Photo> selectPhoto_User(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
	    List<Photo> list=new ArrayList<Photo>();
		try {
			String uid=photo.getU_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from unloadphotoalbum where u_id=?");
			pstmt.setString(1, uid);	
			//写进数据库
			rs=pstmt.executeQuery();
			Photo photo1=null;
			while(rs.next()){
				String date =rs.getString(5);
				String[] dates=date.split(" ");
				photo1=new Photo(rs.getInt(1),rs.getString(2),rs.getInt(3),
						rs.getString(4),dates[0]);
				list.add(photo1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	
	/**
	 * 返回一个用户的每个相册的一张图片
	 * @param photo
	 * @return
	 */
	@SuppressWarnings("finally")
	public List<Photo> selectPhoto_single(Photo photo) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
	    List<Photo> list=new ArrayList<Photo>();
		try {
			String uid=photo.getU_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from unloadphotoalbum where u_id=? group by a_id");
			pstmt.setString(1, uid);	
			
			//写进数据库
			rs=pstmt.executeQuery();
			Photo photo1=null;
			while(rs.next()){
				String date =rs.getString(5);
				String[] dates=date.split(" ");
				photo1=new Photo(rs.getInt(1),rs.getString(2),rs.getInt(3),
						rs.getString(4),dates[0]);
				list.add(photo1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
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
	
	//information表
	@SuppressWarnings("finally")
	public boolean insertInformation(Information information) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String name=information.getName();
			String uid=information.getUid();
			String hobby=information.getHobby();
			String motto = information.getMotto();
			int start=information.getStart();
			String friend=information.getFriend();
			String f_feeling=information.getF_feeling();
			String f_collection=information.getF_collection();
			int height=information.getHeight();
			int weight=information.getWeight();
			String bloodtype=information.getBloodtype();
			String nation=information.getNation();
			String house=information.getHouse();
			String have_child_not=information.getHave_child_not();
			String graduate_school=information.getGraduate_school();
			String location =information.getLocation();
			pstmt=(PreparedStatement) conn.prepareStatement
	("insert into information values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, uid);
			pstmt.setString(3, hobby);
			pstmt.setString(4, motto);
			pstmt.setInt(5, start);
			pstmt.setString(6 , friend);
			pstmt.setString(7, f_feeling);
			pstmt.setString(8, f_collection);
			pstmt.setString(9, location);
			pstmt.setInt(10, weight);
			pstmt.setString(11, bloodtype);
			pstmt.setString(12,nation);
			pstmt.setString(13, house);
			pstmt.setString(14, have_child_not);
			pstmt.setString(15,graduate_school);
			pstmt.setInt(16,height);
			//写进数据库
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return result!=0?true :false;
		}
	} 
	
	public boolean deleteInformation(Information information) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String uid=information.getUid();
			pstmt=(PreparedStatement) conn.prepareStatement
					("delete  from information where u_id=?");
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
	
	@SuppressWarnings("finally")
	public Information select(User user) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Information information=null;
		try {
			String uid=user.getU_id();
			pstmt=(PreparedStatement) conn.prepareStatement
					("select * from information where u_id=?");
			pstmt.setString(1, uid);	
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
				information=new Information(rs.getString(2),rs.getString(1),
				rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),
				rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),
				rs.getString(11),rs.getString(12),rs.getString(13),
				rs.getString(14),rs.getString(15),rs.getInt(16));			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return information;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean alterInformation(Information information) {
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			String name=information.getName();
			String uid=information.getUid();
			String hobby=information.getHobby();
			String motto = information.getMotto();
			int start=information.getStart();
			String friend=information.getFriend();
			String f_feeling=information.getF_feeling();
			String f_collection=information.getF_collection();			
			String location =information.getLocation();
			int weight=information.getWeight();
			String bloodtype=information.getBloodtype();
			String nation=information.getNation();
			String house=information.getHouse();
			String have_child_not=information.getHave_child_not();
			String graduate_school=information.getGraduate_school();
			int height=information.getHeight();
			pstmt=(PreparedStatement) conn.prepareStatement
	("update information set name=?, hobby=?, motto=?, start=?, "
	+ "friend=?, f_feeling=?,f_collection=?, location=?, weight=?, "
	+ "blood_type=?, nation=?,house=?,have_child_not=?,  "
	+ "graduate_school=?, height=?  where u_id=?;");
			pstmt.setString(1, name);
			pstmt.setString(2, hobby);
			pstmt.setString(3, motto);
			pstmt.setInt(4 , start);
			pstmt.setString(5, friend);
			pstmt.setString(6, f_feeling);
			pstmt.setString(7, f_collection);
			pstmt.setString(8, location);
			pstmt.setInt(9, weight);
			pstmt.setString(10, bloodtype);
			pstmt.setString(11, nation);
			pstmt.setString(12, house);
			pstmt.setString(13, have_child_not);
			pstmt.setString(14, graduate_school);
			pstmt.setInt(15, height);
			pstmt.setString(16, uid);
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
	public List<User> matching(User user){
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<User> list=new ArrayList<User>();
		User user1=null;
		String sex=user.getSex();
		String province=user.getProvince();
		String city=user.getCity();
		String country=user.getCountry();
		String uid =user.getU_id();
		int age=user.getAge();
		int ageEnd=user.getAgeEnd();
		int salary=user.getSalary();
		int salaryEnd=user.getSalaryEnd();
		Information information=user.getInformation();
	    int height=information.getHeight();
	    int heightEnd=information.getHeightEnd();
	    String mUid=information.getUid();
	    String hobby=information.getHobby();
	    String motto=information.getMotto();
	    String blood_type=information.getBloodtype();
	    String house=information.getHouse();
	    String child=information.getHave_child_not();
	    String graduate_school=information.getGraduate_school();
		String str1="select * from user natural join information where ";
		String str2="sex = ? and ";
		String str3="province = ? and ";
		String str4="city = ? and ";
		String str5="country = ? and ";
		String str6="age >= ? and ";
		String str7="age <= ? and ";
		String str8="salary >= ? and ";
		String str9="salary <= ? and ";
		String str10="height >= ? and ";		
		String str11="height <= ? and ";	
		String str12="blood_type = ? and ";
		String str13="house = ? and ";
		String str14="have_child_not = ? and ";
		String str15="graduate_school = ? and ";
		String str16="(u_id like ? or username like ? ) and ";
		String str17="u_id !=?  and ";
		HashMap<Integer, Integer> hash=new HashMap<Integer ,Integer>();
		HashMap<Integer, Object> hash1=new HashMap<Integer,Object>();
		int index=0;
		if(!(sex=="")){
			index++;
			str1=str1+str2;
			hash.put(index, 1);
			hash1.put(index, sex);
		}
		
		if(!(province==""||province.equals("undefined"))){
			index++;
			str1=str1+str3;
			hash.put(index, 1);
			hash1.put(index, province);
		}
			
		if(!(city==""||city.equals("undefined"))){
			index++;
			str1=str1+str4;
			hash.put(index, 1);
			hash1.put(index, city);
		}
			
		if(!(country==""||country.equals("undefined"))){
			index++;
			str1=str1+str5;
			hash.put(index, 1);
		    hash1.put(index, country);	
		}
		if(!(age==0)){
			index++;
			str1=str1+str6;
			hash.put(index, 2);
			hash1.put(index, age);
		}
		if(!(ageEnd==0)){
			index++;
			str1=str1+str7;
			hash.put(index, 2);
			hash1.put(index, ageEnd);
		}
	
		if(!(salary==0)){
			index++;
			str1=str1+str8;
			hash.put(index, 2);
			hash1.put(index, salary);
		}
		if(!(salaryEnd==0)){
			index++;
			str1=str1+str9;
			hash.put(index, 2);
			hash1.put(index, salaryEnd);
		}	
		
		if(!(height==0)){
			index++;
			str1=str1+str10;
			hash.put(index, 2);
			hash1.put(index, height);
		}
		if(!(heightEnd==0)){
			index++;
			str1=str1+str11;
			hash.put(index, 2);
			hash1.put(index, heightEnd);
		}
		if(!(blood_type==null)){
			index++;
			str1=str1+str12;
			hash.put(index, 1);
			hash1.put(index, blood_type);
		}
						
		if(!(house==null)){
			index++;
			str1=str1+str13;
			hash.put(index, 1);
			hash1.put(index, house);
		}
			
		if(!(child==null)){
			index++;
			str1=str1+str14;
			hash.put(index, 1);
			hash1.put(index, child);
		}
			
		if(!(graduate_school==null)){
			index++;
			str1=str1+str15;
			hash.put(index,1);
			hash1.put(index, graduate_school);
		}
		if(!(uid=="")){
			index++;
			str1=str1+str16;
			hash.put(index,1);
			hash1.put(index, "%"+uid+"%");
		}
		if(!(uid=="")){
			index++;
			hash.put(index,1);
			hash1.put(index, "%"+uid+"%");
		}
		
		if(!(mUid=="")){
			index++;
			str1=str1+str17;
			hash.put(index,1);
			hash1.put(index, mUid);
		}
		if(str1=="select * from user natural join information where ")
			{str1="select * from user natural join information order by date DESC;";
		}else{
			int i=str1.lastIndexOf("and");
			str1=str1.substring(0,i);
			str1=str1+" order by date DESC";
		}		
		try {
			pstmt=(PreparedStatement) conn.prepareStatement(str1);
			for (int i = 1; i <=hash.size(); i++) {
				if(hash.get(i)==1){
					pstmt.setString(i, (String)hash1.get(i));
				}else{
					pstmt.setInt(i, (int)hash1.get(i));
				}
			}
			//写进数据库
			rs=pstmt.executeQuery();
			while(rs.next()){
			   user1=new User(rs.getString(2),rs.getString(1),rs.getString(3),
		    rs.getString(4),rs.getString(5),rs.getString(6),
			rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getString(10),
		    rs.getString(11),rs.getString(12),rs.getString(13));
			   
		   information=new Information(rs.getString(1),rs.getString(14),rs.getString(15),
		    rs.getString(16),rs.getInt(17),rs.getString(18),
			rs.getString(19),rs.getString(20),rs.getString(21),rs.getInt(22),
			rs.getString(23),rs.getString(24),rs.getString(25),
			rs.getString(26),rs.getString(27),rs.getInt(28));
			   user1.setInformation(information);	
			   list.add(user1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			ConDataBase.closeConn(rs, pstmt, conn);
			return list;
		}
	}
	
	public User login(String username,String password){
		Connection conn=ConDataBase.getConn();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		User user = null;
		try {
			pstmt=(PreparedStatement) conn.prepareStatement("select * from user where u_id=? and password=?");
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
}
