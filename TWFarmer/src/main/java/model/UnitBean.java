package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Unit")
public class UnitBean  implements Serializable{
	private int unitId;
	private String unitName;
	
	@Id 
	@Column(name = "UnitID") 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	@Column(name = "UnitName")
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
}
