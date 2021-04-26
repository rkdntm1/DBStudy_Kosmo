package optimisticLocking;

import java.util.Date;

public class Some {
	private long id;
	private String name;
	private Date updateDate;
	
	public Some(long id, String name, Date updateDate) {
		this.id = id;
		this.name = name;
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Some [id=" + id + ", name=" + name + ", updateDate=" + updateDate + "]";
	}

	public void setName(String string) {
		name = string;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Date getUpdateDate() {
		return updateDate;
	}
	
}
