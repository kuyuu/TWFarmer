package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.ProductBean;
import model.ProductDAO;

public class ProductDAOjdbc implements ProductDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";

	public static void main(String[] args) {
		ProductDAO dao = new ProductDAOjdbc();
		List<ProductBean> beans = dao.select();
		System.out.println("bean=" + beans);
		for (int i = 0; i < beans.size(); i++) {
			Date a = beans.get(i).getAddDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/DD");
			System.out.println(sdf.format(a));
		}
	}

	private static final String SELECT_BY_ID = "select* from Product where ProductId=?";

	@Override
	public ProductBean select(int ProductId) {
		ProductBean result = null;
		ResultSet rset = null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);
			{
				rset = stmt.executeQuery();
				if (rset.next()) {
					result = new ProductBean();
					result.setProductId(rset.getInt("ProductId"));
					result.setSellerId(rset.getInt("SellerId"));
					result.setOrigin(rset.getString("Origin"));
					result.setProductName(rset.getString("ProductName"));
					result.setInventory(rset.getInt("Inventory"));
					result.setPrice(rset.getInt("Price"));
					result.setUnitId(rset.getInt("UnitId"));
					result.setProductTypeId(rset.getInt("ProductTypeId"));
					result.setProductIntro(rset.getString("ProductIntro"));
					result.setFreight(rset.getInt("Freight"));
					result.setAddDate(rset.getDate("AddDate"));
					result.setRemoveEstDate(rset.getDate("RemoveEstDate"));
					result.setRemoveDate(rset.getDate("RemoveDate"));
					result.setProductStatusId(rset.getInt("ProductStatusId"));
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	private static final String SELECT_ALL = "select * from Product";

	@Override
	public List<ProductBean> select() {
		List<ProductBean> result = null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rset = stmt.executeQuery();
			{
				result = new ArrayList<ProductBean>();
				while (rset.next()) {
					ProductBean bean = new ProductBean();
					bean.setProductId(rset.getInt("ProductId"));
					bean.setSellerId(rset.getInt("SellerId"));
					bean.setOrigin(rset.getString("Origin"));
					bean.setProductName(rset.getString("ProductName"));
					bean.setInventory(rset.getInt("Inventory"));
					bean.setPrice(rset.getInt("Price"));
					bean.setUnitId(rset.getInt("UnitId"));
					bean.setProductTypeId(rset.getInt("ProductTypeId"));
					bean.setProductIntro(rset.getString("ProductIntro"));
					bean.setFreight(rset.getInt("Freight"));
					bean.setAddDate(rset.getDate("AddDate"));
					bean.setRemoveEstDate(rset.getDate("RemoveEstDate"));
					bean.setRemoveDate(rset.getDate("RemoveDate"));
					bean.setProductStatusId(rset.getInt("ProductStatusId"));

					result.add(bean);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into product (ProductId, SellerId, Origin, ProductName, Inventory, Price, UnitId, ProductTypeId, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusId) "
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			{
				if (bean != null) {
					stmt.setInt(1, bean.getProductId());
					stmt.setInt(2, bean.getProductId());
					stmt.setString(3, bean.getOrigin());
					stmt.setString(4, bean.getProductName());
					stmt.setInt(5, bean.getInventory());
					stmt.setInt(6, bean.getPrice());
					stmt.setInt(7, bean.getUnitId());
					stmt.setInt(8, bean.getProductTypeId());
					stmt.setString(9, bean.getProductIntro());
					stmt.setInt(10, bean.getFreight());
					Date AddDate = bean.getAddDate();
					if (AddDate != null) {
						long time = AddDate.getTime();
						stmt.setDate(11, new java.sql.Date(time));
					} else {
						stmt.setDate(11, null);
					}
					Date RemoveEstDate = bean.getRemoveEstDate();
					if (RemoveEstDate != null) {
						long time = RemoveEstDate.getTime();
						stmt.setDate(12, new java.sql.Date(time));
					} else {
						stmt.setDate(12, null);
					}
					Date RemoveDate = bean.getRemoveDate();
					if (RemoveDate != null) {
						long time = RemoveDate.getTime();
						stmt.setDate(13, new java.sql.Date(time));
					} else {
						stmt.setDate(13, null);
					}
					stmt.setInt(14, bean.getProductStatusId());

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update Product set ProductId=?,SellerId=?,Origin=?,ProductName=?,Inventory=?,Price=?,UnitId=?"
			+ "ProductTypeId=?,ProductIntro=?,Freight=?,AddDate=?,RemoveEstDate=?,RemoveDate=?,ProductStatusId=?";

	@Override
	public ProductBean update(int ProductId, int SellerId, String Origin, String ProductName, int Inventory, int Price,
			int UnitId, int ProductTypeId, String ProductIntro, int Freight, Date AddDate, Date RemoveEstDate,
			Date RemoveDate, int ProductStatusId) {
		ProductBean result = null;
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(UPDATE);
			{
				stmt.setInt(1, ProductId);
				stmt.setInt(2, SellerId);
				stmt.setString(3, Origin);
				stmt.setString(4, ProductName);
				stmt.setInt(5, Inventory);
				stmt.setInt(6, Price);
				stmt.setInt(7, UnitId);
				stmt.setInt(8, ProductTypeId);
				stmt.setString(9, ProductIntro);
				stmt.setInt(10, Freight);
				if (AddDate != null) {
					long time = AddDate.getTime();
					stmt.setDate(11, new java.sql.Date(time));
				} else {
					stmt.setDate(11, null);
				}

				if (RemoveEstDate != null) {
					long time = RemoveEstDate.getTime();
					stmt.setDate(12, new java.sql.Date(time));
				} else {
					stmt.setDate(12, null);
				}

				if (RemoveDate != null) {
					long time = RemoveDate.getTime();
					stmt.setDate(11, new java.sql.Date(time));
				} else {
					stmt.setDate(11, null);
				}
				stmt.setInt(14, ProductStatusId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	private static final String DELETE = "delete from Product where ProductId=?";

	@Override
	public boolean delete(int ProductId) {
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(DELETE);
			{
				stmt.setInt(1, ProductId);
				int i = stmt.executeUpdate();
				if (i == 1) {
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
