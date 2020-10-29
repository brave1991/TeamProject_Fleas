package sol.desk.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import sol.desk.board.model.Article;

public class ArticleDAO {

	public List<Article> select(Connection conn, int startRow, int size, String sort) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement
					("select * from article order by "+ sort +" desc limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Article> articleList = new ArrayList<>();
			while (rs.next()) {
				articleList.add(convertArticle(rs, conn));
			}
			
			return articleList;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

}
