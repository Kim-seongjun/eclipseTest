package bean;

public class Pet {
	private String id;
	private String pet_name;
	private String pet_type;
	private String pet_gender;
	private String per_request;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPer_request() {
		return per_request;
	}
	public void setPer_request(String per_request) {
		this.per_request = per_request;
	}
}
