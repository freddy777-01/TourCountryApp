package tTour.model;

public class Council {
	private String name,about;
	private Long id,region;
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setRegion(Long region) {
		this.region = region;
	}
	
	public String getName() {
		return name;
	}
	public String getAbout() {
		return about;
	}
	public Long getId() {
		return id;
	}
	public Long getRegion() {
		return region;
	}
}
