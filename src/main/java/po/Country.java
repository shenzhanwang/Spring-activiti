package po;

import java.util.List;

public class Country {
	private short country_id;
	private String country;
	private String last_update;
	private List<City> citys;
	public short getCountry_id() {
		return country_id;
	}
	public void setCountry_id(short country_id) {
		this.country_id = country_id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getLast_update() {
		return last_update;
	}
	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}
	public List<City> getCitys() {
		return citys;
	}
	public void setCitys(List<City> citys) {
		this.citys = citys;
	}
	
}
