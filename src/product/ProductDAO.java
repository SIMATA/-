package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopping?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true";
			String dbID = "root";
			String dbPassword = "wlsrnr905!";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	public Product getProduct(int productID) {
		String SQL = "SELECT * FROM product WHERE productID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  productID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setDescription(rs.getString(4));
				return product;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
}