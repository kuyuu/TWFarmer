package model;

import java.io.InputStream;
import java.io.Serializable;

public class ProductPicBean implements Serializable {
	private int productPicId;
	private int productId;
	private String pictureName;
	private String pictureIntro;

	public ProductPicBean() {

	}

	public ProductPicBean(int productPicId, int productId, String pictureName, String pictureIntro) {
		super();
		this.productPicId = productPicId;
		this.productId = productId;
		this.pictureName = pictureName;
		this.pictureIntro = pictureIntro;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof ProductPicBean)) {
			ProductPicBean temp = (ProductPicBean) obj;
			if (this.productPicId == temp.productPicId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{" + productPicId + ":" + productId + ":" + pictureIntro + "}";
	}

	public int getProductPicId() {
		return productPicId;
	}

	public void setProductPicId(int productPicId) {
		this.productPicId = productPicId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPictureIntro() {
		return pictureIntro;
	}

	public void setPictureIntro(String pictureIntro) {
		this.pictureIntro = pictureIntro;
	}

}
