package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductStatusBean;
import model.ProductStatusDAO;

public class ProductStatusDAOjdbc implements ProductStatusDAO {

	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";

	public static void main(String[] args) {
		ProductStatusDAO dao=new ProductStatusDAOjdbc();
		List<ProductStatusBean> beans= dao.select();
		System.out.println("bean="+beans);
	}

	private static final String SELECT_BY_ID=
			"select* from ProductStatus where ProductStatusID=?";
	@Override
	public ProductStatusBean select(int ProductStatusID ){
		ProductStatusBean result =null;
		ResultSet rset =null;
		try {
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);	
		PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);{
			rset=stmt.executeQuery();
			if(rset.next()){
				result= new ProductStatusBean();
				result.setProductStatusID(rset.getInt("ProductStatusID"));
				result.setProductStatusName(rset.getString("ProductStatusName"));
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
			"select * from ProductStatus";
	@Override
	public List<ProductStatusBean> select() {
		List<ProductStatusBean> result =null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rset= stmt.executeQuery();{
				result= new ArrayList<ProductStatusBean>();
				while(rset.next()){
					ProductStatusBean bean=new ProductStatusBean();
					bean.setProductStatusID(rset.getInt("ProductStatusID"));
					bean.setProductStatusName(rset.getString("productStatusName"));
					
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
			"insert into ProductStatus (ProductStatusID, ProductStatusName) values (?, ?)";
	@Override
	public ProductStatusBean insert(ProductStatusBean bean) {
			ProductStatusBean result= null;
			try {
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);{
					if (bean !=null){
						stmt.setInt(1, bean.getProductStatusID());
						stmt.setString(2, bean.getProductStatusName());
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
	}
	
	private static final String UPDATE =
			"update ProductStatus set ProductStatusID=?,ProductStatusName=?";
	@Override
	public ProductStatusBean update(int ProductStatusID, String ProductStatusName) {
		ProductStatusBean result= null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(UPDATE);{
				stmt.setInt(1,ProductStatusID);
				stmt.setString(2, ProductStatusName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	private static final String DELETE =
			"delete from ProductStatus where ProductStatusID=?";	
	@Override
	public boolean delete(int ProductStatusID) {
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(DELETE);{
				stmt.setInt(1, ProductStatusID);
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
