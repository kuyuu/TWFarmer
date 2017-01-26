package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductDiscountBean;
import model.ProductDiscountDAO;






public class ProductDiscountDAOjdbc implements ProductDiscountDAO {
	
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";
	
	public static void main(String[] args) {
		ProductDiscountDAO dao=new ProductDiscountDAOjdbc();
		List<ProductDiscountBean> beans= dao.select();
		System.out.println("bean="+beans);	
	}

	private static final String SELECT_BY_ID=
			"select* from ProductDiscount where DiscountId=?";
	@Override
	public ProductDiscountBean select(int DiscountId) {
		ProductDiscountBean result =null;
		ResultSet rset =null;
		try {
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);	
		PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);{
			rset=stmt.executeQuery();
			if(rset.next()){
				result= new ProductDiscountBean();
				result.setDiscountId(rset.getInt("DiscountId"));
				result.setDiscountPrice(rset.getInt("DiscountPrice"));
				result.setMaxThreshold(rset.getInt("MaxThreshold"));
				result.setMinThreshold(rset.getInt("MinThreshold"));
				result.setProductId(rset.getInt("ProductId"));
			}
			
		}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
					
	}

	private static final String SELECT_ALL =
			"select * from ProductDiscount";
	@Override
	public List<ProductDiscountBean> select() {
		List<ProductDiscountBean> result =null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rset= stmt.executeQuery();{
				result= new ArrayList<ProductDiscountBean>();
				while(rset.next()){
					ProductDiscountBean bean=new ProductDiscountBean();
					bean.setDiscountId(rset.getInt("DiscountId"));
					bean.setDiscountPrice(rset.getInt("DiscountPrice"));
					bean.setMaxThreshold(rset.getInt("MaxThreshold"));
					bean.setMinThreshold(rset.getInt("MinThreshold"));
					bean.setProductId(rset.getInt("ProductId"));
					
					
					result.add(bean);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
	private static final String INSERT =
			"insert into ProductDiscount (DiscountId, ProductId,MinThreshold,MaxThreshold,DiscountPrice) values (?, ?, ?, ?, ?)";
	@Override
	public ProductDiscountBean insert(ProductDiscountBean bean) {
		ProductDiscountBean result= null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(INSERT);{
				if (bean !=null){
					stmt.setInt(1, bean.getDiscountId());
					stmt.setInt(2, bean.getProductId());
					stmt.setInt(3, bean.getMinThreshold());
					stmt.setInt(4, bean.getMaxThreshold());
					stmt.setInt(5, bean.getDiscountPrice());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE =
			"update ProductDiscount set DiscountId=?,ProductId=?,MinThreshold=?,MaxThreshold=?,DiscountPrice=?";
	@Override
	public ProductDiscountBean update(int DiscountId, int ProductId, int MinThreshold, int MaxThreshold,
			int DiscountPrice) {
		ProductDiscountBean result= null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(UPDATE);{
				stmt.setInt(1,DiscountId);
				stmt.setInt(2, ProductId);
				stmt.setInt(3, MinThreshold);
				stmt.setInt(4, MaxThreshold);
				stmt.setInt(5, DiscountPrice);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	private static final String DELETE =
			"delete from ProductDiscount where DiscountId=?";	
	@Override
	public boolean delete(int DiscountId) {
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(DELETE);{
				stmt.setInt(1, DiscountId);
				int i= stmt.executeUpdate();
				if(i==1){
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
