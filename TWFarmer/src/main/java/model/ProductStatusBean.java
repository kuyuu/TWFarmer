package model;

public class ProductStatusBean {

	
		public interface ProductStatusDAO {

	}
		// ProductStatusID int IDENTITY(2501,1) NOT NULL PRIMARY KEY,
		//ProductStatusName nvarchar(10),
		private int ProductStatusID;
		private String ProductStatusName;
		
		@Override
		public boolean equals(Object obj) {
			if(obj!=null && (obj instanceof ProductStatusBean)) {
				ProductStatusBean temp = (ProductStatusBean) obj;
				if(this.ProductStatusID == temp.ProductStatusID) {
					return true;
				}
			}
			return false;
		}
		@Override
		public String toString() {
			return "{"+ProductStatusID+":"+ProductStatusName+"}";
		}
		
		
		
		public int getProductStatusID() {
			return ProductStatusID;
		}
		public void setProductStatusID(int productStatusID) {
			ProductStatusID = productStatusID;
		}
		public String getProductStatusName() {
			return ProductStatusName;
		}
		public void setProductStatusName(String productStatusName) {
			ProductStatusName = productStatusName;
		}

	

}
