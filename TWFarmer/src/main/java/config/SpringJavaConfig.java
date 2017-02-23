package config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import model.dao.FarmerDAOJdbc;
import model.dao.FriendDAOJdbc;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;
import model.dao.ProductPicDAOJdbc;

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
	public JointPurchaseDAOjdbc jointPurchaseDAO() {
		return new JointPurchaseDAOjdbc(dataSource());
	}

	@Bean
	public JPDetailDAOjdbc jpDetailDAO() {
		return new JPDetailDAOjdbc(dataSource());
	}

}
