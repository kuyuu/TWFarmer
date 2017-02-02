package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmailUtility;
import model.JPDetailBean;
import model.JointPurchaseBean;
import model.MsgBean;
import model.ProductBean;
import model.dao.MsgDAOJdbc;
import model.dao.ProductDAOjdbc;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/Msg/MsgCreatingServlet")
public class MsgCreatingServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final long serialVersionUID = 1L;
	//====== INSERTING MESSAGE INTO TABLE MSG
	@Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MsgBean msgBean = new MsgBean();
		 // reads form per writer's input: Reader, Title and Content
		String temp1 = request.getParameter("msgReaderId");
		String temp2 = request.getParameter("msgTitle");
		String temp3 = request.getParameter("msgContent");		

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		

		msgBean = (MsgBean) session.getAttribute("Msg");
		System.out.println(msgBean.getMsgWriterId());
		int msgReaderId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				msgReaderId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("msgReaderId", "信不能寄給神，總要有人讀吧 ಠ皿ಠ");
			}
		}

		if (temp2 == null || temp2.length() == 0) {
			errors.put("msgTitle", "標題不會自己想??༼ ͠ຈ Ĺ̯ ͠ຈ ༽┌");
		}
		if (temp3 == null || temp3.length() == 0) {
			errors.put("msgContent", "無字天書不是這樣寫的，打點東西吧 ಠ⌣ಠ");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"error.jsp").forward(request, response);
			return;
		}

    
	java.util.Date dateObj = msgBean.getMsgTime();

	       // Setting the user's ID as Writer ID and the system time on his/her computer as Message Time
	   
	       msgBean.setMsgTime(dateObj);

			MsgDAOJdbc daom = new MsgDAOJdbc();
			msgBean = daom.insert(msgBean);
		

			request.getRequestDispatcher("/MsgFormSuccess.jsp").forward(request, response);
			//response.sendRedirect("/MsgFormSuccess.jsp");
			
	}

}
	
