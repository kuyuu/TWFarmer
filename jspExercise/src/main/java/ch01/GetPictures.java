package ch01;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;

public class GetPictures {
	File saveFolder;
	String url;

	public GetPictures(File saveFolder, String url) {
		this.saveFolder = saveFolder;
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		this.url = url;
	}

	public void doWord() {
		try {
			String name = url.substring(url.lastIndexOf("/") + 1);
			File file = new File(saveFolder, name);
			URL aurl = new URL(url);
			InputStream is = aurl.openStream();
			FileOutputStream os = new FileOutputStream(file);
			byte[] b = new byte[8192];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				os.write(b, 0, len);
			}
			System.out.println(name + " OK");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	
}
