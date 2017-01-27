package model;

public class ProductStatusBean {

	
		public interface ProductStatusDAO {

	}
		// ProductStatusID int IDENTITY(2501,1) NOT NULL PRIMARY KEY,
		//ProductStatusName nvarchar(10),
		private int productStatusId;
		private String productStatusName;
		
		
		public int getProductStatusId() {
			return productStatusId;
		}



		public void setProductStatusId(int productStatusId) {
			this.productStatusId = productStatusId;
		}



		public String getProductStatusName() {
			return productStatusName;
		}



		public void setProductStatusName(String productStatusName) {
			this.productStatusName = productStatusName;
		}



		
		


		//		@Override
//		public boolean equals(Object obj) {
//			if(obj!=null && (obj instanceof ProductStatusBean)) {
//				ProductStatusBean temp = (ProductStatusBean) obj;
//				if(this.ProductStatusID == temp.ProductStatusID) {
//					return true;
//				}
//			}
//			return false;
//		}
		@Override
		public String toString() {
			return "{"+productStatusId+":"+productStatusName+"}";
		}
		
		
		
	
	

}
