package Video;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import org.apache.tomcat.dbcp.dbcp.BasicDataSource;

import java.util.ArrayList;
import Video.videolist_DTO;


public class videolist_DAO {
	private BasicDataSource ds;
	private static videolist_DAO instance = new videolist_DAO();
	
	public static videolist_DAO getInstance(){
		return instance;
	}
	private videolist_DAO(){
		ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/video");
		ds.setUsername("root");
		ds.setPassword("1234");
		ds.setInitialSize(1);
		ds.setMaxActive(8);
		ds.setMaxIdle(8);
		ds.setMinIdle(1);
	}
	
	public List<videolist_DTO> get_url_list() throws SQLException{
		List<videolist_DTO> list_DTO = new ArrayList<videolist_DTO>();
		
		String sql = "select * from videolist;";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		try{
			conn = ds.getConnection();
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();
			
			while (rset.next()) {
				videolist_DTO list = new videolist_DTO();
				list.setId(rset.getInt("id"));
				list.setArtist(rset.getString("artist"));
				list.setTitle(rset.getString("title"));
				list.setUrl(rset.getString("url"));
				list_DTO.add(list);
			}
		}finally{
			if(rset != null) rset.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return list_DTO;
	}

}
