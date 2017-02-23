package upload;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.MemberBean;
import model.dao.MemberDAOJdbc;

@Controller
@RequestMapping("/UploadDemo")
public class UploadImgController {
	@Autowired
	private MemberDAOJdbc memberDAO;

	@RequestMapping(value = "/uploadHeadImage.do", method = RequestMethod.POST)
	public String uploadHeadImage(HttpServletRequest request, @RequestParam(value = "x") String x,
			@RequestParam(value = "y") String y, @RequestParam(value = "h") String h,
			@RequestParam(value = "w") String w, @RequestParam(value = "imgFile") MultipartFile imageFile,
			Integer memberId, Model model) throws Exception {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		String resourcePath = "resources/uploadImages/";
		if (imageFile != null) {
			if (FileUploadUtil.allowUpload(imageFile.getContentType())) {
				String fileName = FileUploadUtil.rename(imageFile.getOriginalFilename());
				int end = fileName.lastIndexOf(".");
				String saveName = fileName.substring(0, end);
				File dir = new File(realPath + resourcePath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File file = new File(dir, saveName + "_src.jpg");
				imageFile.transferTo(file);
				String srcImagePath = realPath + resourcePath + saveName;
				int imageX = Integer.parseInt(x);
				int imageY = Integer.parseInt(y);
				int imageH = Integer.parseInt(h);
				int imageW = Integer.parseInt(w);
				// 这里开始截取操作
				ImgCut.imgCut(srcImagePath, imageX, imageY, imageW, imageH);
				//將圖片名稱存入會員資料
				MemberBean mb = memberDAO.select(memberId);
				mb.setMemberPic(saveName + "_cut.jpg");
				memberDAO.update(mb);
				model.addAttribute("memberBean", mb);
			}
		}
		return "MemberSubmit/UploadSuccess";
	}

}
