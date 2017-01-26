package model;

import java.util.Date;
import java.util.List;

public interface ProductDAO {
	public abstract ProductBean select(int ProductId);

	public abstract List<ProductBean> select();

	public abstract ProductBean insert(ProductBean bean);

	public abstract ProductBean update(
			 int ProductId,
			 int SellerId,
			 String Origin,
			 String ProductName,
			 int Inventory,
			 int Price,
			 int UnitId,
			 int ProductTypeId,
			 String ProductIntro,
			 int Freight,
			 Date AddDate,
			 Date RemoveEstDate,
			 Date RemoveDate,
			 int ProductStatusId);

	public abstract boolean delete(int ProductId);
}
