package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.dao.MemberDAOJdbc;

public class MemberService {
	
	
	private MemberDAO memberDao = new MemberDAOJdbc();
	public static void main(String[] args) {
		MemberService service = new MemberService();
		List<MemberBean> beans = service.select(null);
		System.out.println("beans="+beans);
	}
	

	public List<MemberBean> select(MemberBean bean) {
		List<MemberBean> result = null;
		if(bean!=null && bean.getMemberId()!=0) {
			MemberBean temp = memberDao.select(bean.getMemberId());
			if(temp!=null) {
				result = new ArrayList<MemberBean>();
				result.add(temp);
			}
		} else {
			result = memberDao.select(); 
		}
		return result;
	}
	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDao.insert(bean);
		}
		return result;
	}

	public boolean delete(MemberBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = memberDao.delete(bean.getMemberId());
		}
		return result;
	}

}
