package utils;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ConDataBase {
	private final static HashMap<String, String> ConnDate =ParserXML.parserXML("../xml/database.conf.xml");
	private static Connection conn;
    static{
        try{
            Class.forName(ConnDate.get("driver"));
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public static Connection getConn(){
        try {
            
            return (Connection) DriverManager.getConnection(ConnDate.get("url")+"?useUnicode=true&characterEncoding=UTF-8",ConnDate.get("user"),ConnDate.get("password"));
            
        } catch (SQLException e) {
            
            e.printStackTrace();
            
        }
        return null;
    }
    
    public static void closeConn(ResultSet rs,PreparedStatement pstmt,Connection conn){
        
        try {
            if (rs!=null) {
                rs.close();
                rs=null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
        	 try {
                 if (pstmt!=null) {
                     pstmt.close();
                     pstmt=null;
                 }
             } catch (Exception e) {
                 e.printStackTrace();
             }finally {
                 try {
                     if (conn!=null) {
                         conn.close();
                         conn=null;
                     }
                 } catch (Exception e) {
                     e.printStackTrace();
                 }finally{
                 }
			}
		}
    }
}