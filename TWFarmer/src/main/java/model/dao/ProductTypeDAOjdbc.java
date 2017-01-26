package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductTypeBean;
import model.ProductTypeDAO;

public class ProductTypeDAOjdbc implements ProductTypeDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";

	public static void main(String[] args) {
		ProductTypeDAO dao=new ProductTypeDAOjdbc();
		List<ProductTypeBean> beans= dao.select();
		System.out.println("bean="+beans);	
		for(ProductTypeBean ptb : beans) {
			System.out.println(ptb.getProductTypeId() + " : " + ptb.getType());
		}
	}

	private static final String SELECT_BY_ID=
			"select* from ProductType where ProductTypeId=?";
	@Override
	public ProductTypeBean select(int ProductTypeId ){
		ProductTypeBean result =null;
		ResultSet rset =null;
		try {
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);	
		PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);{
			rset=stmt.executeQuery();
			if(rset.next()){
				result= new ProductTypeBean();
				result.setProductTypeId(rset.getInt("ProductTypeId"));
				result.setType(rset.getString("Type"));
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
//	
	
	private static final String SELECT_ALL =
			"select * from ProductType";
	@Override
	public List<ProductTypeBean> select() {
		List<ProductTypeBean> result =null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rset= stmt.executeQuery();{
				result= new ArrayList<ProductTypeBean>();
				while(rset.next()){
					ProductTypeBean bean=new ProductTypeBean();
					bean.setProductTypeId(rset.getInt("ProductTypeId"));
					bean.setType(rset.getString("Type"));
					
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
			"insert into ProductType (ProductTypeId, Type) values (?, ?)";
	@Override
	public ProductTypeBean insert(ProductTypeBean bean) {
		ProductTypeBean result= null;
			try {
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);{
					if (bean !=null){
						stmt.setInt(1, bean.getProductTypeId());
						stmt.setString(2, bean.getType());
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
	}
	
	private static final String UPDATE =
			"update ProductType set ProductTypeId=?,Type=?";
	@Override
	public ProductTypeBean update(int ProductTypeID, String Type) {
		ProductTypeBean result= null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(UPDATE);{
				stmt.setInt(1, ProductTypeID);
				stmt.setString(2, Type);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	private static final String DELETE =
			"delete from ProductType where ProductTypeId=?";	
	@Override
	public boolean delete(int ProductTypeId) {
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(DELETE);{
				stmt.setInt(1, ProductTypeId);
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
