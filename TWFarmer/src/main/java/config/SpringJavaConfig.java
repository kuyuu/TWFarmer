package config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import model.daojdbc.F2FDetailDAOjdbc;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.FriendDAOJdbc;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JPFollowerDAOJdbc;
import model.daojdbc.JPFollowerDetailDAOJdbc;
import model.daojdbc.JointPurchaseDAOjdbc;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.MsgDAOJdbc;
import model.daojdbc.OrderDetailDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ProductPicDAOJdbc;
import model.daojdbc.TrackProductDAOJdbc;
import model.daojdbc.ViolationDAOJdbc;

@Configuration
public class SpringJavaConfig {

	@Bean
	public DataSource dataSource() {
		DataSource dataSource = null;
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataSource;

	}

	@Bean
	public FriendDAOJdbc friendDAO() {
		return new FriendDAOJdbc(dataSource());
	}

	@Bean
	public MemberDAOJdbc memberDAO() {
		return new MemberDAOJdbc(dataSource());
	}

	@Bean
	public FarmerDAOJdbc farmerDAO() {
		return new FarmerDAOJdbc(dataSource());
	}

	@Bean
	public ProductDAOjdbc productDAO() {
		return new ProductDAOjdbc(dataSource());
	}

	@Bean
	public ProductPicDAOJdbc productPicDAO() {
		return new ProductPicDAOJdbc(dataSource());
	}

	@Bean
	public OrdersDAOJdbc orderDAO() {
		return new OrdersDAOJdbc(dataSource());
	}

	@Bean
	public OrderDetailDAOJdbc orderDetailDAO() {
		return new OrderDetailDAOJdbc(dataSource());
	}

	@Bean
	public JointPurchaseDAOjdbc jointPurchaseDAO() {
		return new JointPurchaseDAOjdbc(dataSource());
	}

	@Bean
	public JPDetailDAOjdbc jpDetailDAO() {
		return new JPDetailDAOjdbc(dataSource());
	}
	@Bean
	public JPFollowerDAOJdbc jpfDAO() {
		return new JPFollowerDAOJdbc();
	}
	@Bean
	public JPFollowerDetailDAOJdbc jpfDetailDAO() {
		return new JPFollowerDetailDAOJdbc(dataSource());
	}

	@Bean
	public F2FDetailDAOjdbc f2fDetailDAO() {
		return new F2FDetailDAOjdbc(dataSource());
	}

	@Bean
	public MsgDAOJdbc msgDAO() {
		return new MsgDAOJdbc(dataSource());
	}

	@Bean
	public ViolationDAOJdbc violationDAO() {
		return new ViolationDAOJdbc(dataSource());
	}

	@Bean
	public TrackProductDAOJdbc trackProductDAO() {
		return new TrackProductDAOJdbc(dataSource());
	}

}
