package tTour.model;

import java.util.ArrayList;
import java.util.List;

public class Region {

	private String name,image,about,mayer;
	private Long id;
	private List<Council> councils = new ArrayList<>();
	
	public void setName(String name) {
		this.name = name;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public void setMayer(String mayer) {
		this.mayer = mayer;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setCouncilList(Council council) {
		councils.add(council);
	}
	
	public String getName() {
		return name;
	}
	public String getImage() {
		return image;
	}
	public String getAbout() {
		return about;
	}
	public String getMayer() {
		return mayer;
	}
	public Long getId() {
		return id;
	}
	public List<Council> getCouncils(){
		return councils;
	}
}
