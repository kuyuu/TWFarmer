package controller.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MsgBean;
import model.daojdbc.MsgDAOJdbc;

@Controller
@RequestMapping(path = { "/Message/DeleteMessage.do" })
public class DeleteMessageController {
	@Autowired
	private MsgDAOJdbc msgDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(Integer msgId, String value) {

		MsgBean bean = msgDAO.select(msgId);
		if ("reader".equals(value)) {
			bean.setReaderDelete(1);
			msgDAO.update(bean);
		} else {
			bean.setWriterDelete(1);
			msgDAO.update(bean);
		}

	}

}
