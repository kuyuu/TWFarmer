package ch06_01;

public class LoginService {
	public MemberBean checkIDPassword(String id, String password) {
		MemberDAO dao = new MemberDAO();
		MemberBean mb = dao.select(id);
		if (mb != null && password.equals(mb.getPassword())) {
			return mb;
		}
		return null;
	}
}
