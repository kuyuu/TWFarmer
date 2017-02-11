package ch01;

import java.io.File;

public class GetPicturesMain {

	public static void main(String[] args) {
		String sURL1 = "http://www.space-fox.com/wallpapers/celebs/penelope-cruz/penelope_cruz_";
		String sURL3 = ".jpg";
		File dir = new File("C:/images");
		for (int n = 1; n <= 64; n++) {
			String sURL = sURL1 + n + sURL3;
			GetPictures gp = new GetPictures(dir, sURL);
			gp.doWord();
		}
	}

}
