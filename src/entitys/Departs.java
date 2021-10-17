package entitys;

import java.util.Collection;
import javax.persistence.*;

@Entity
public class Departs {
	@Id
	@Column(name="Id")
	private String id;
	@Column(name="Name")
	private String name;
	
	@OneToMany(mappedBy="depart", fetch=FetchType.EAGER)
	private Collection<Staffs> staff;
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
}
