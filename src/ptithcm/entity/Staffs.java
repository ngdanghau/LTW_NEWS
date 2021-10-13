package ptithcm.entity;


import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Staffs")
public class Staffs {
	@Id
	@Column(name="Id")
	private String id;
	@Column(name="Name")
	private String name;
	@Column(name="Gender")
	private int gender;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="Birthday")
	private Date birthday;
	@Column(name="Email")
	private String email;
	@Column(name="Phone")
	private String phone;
	@Column(name="Salary")
	private float salary;
	@Column(name="Notes")
	private String notes;
	@Column(name="DepartId")
	private String departId;
	@ManyToOne
	@JoinColumn(name="departId")
	private Departs depart;
	
	@OneToMany(mappedBy="staff", fetch=FetchType.EAGER)
	private Collection<Records> record;
	
	
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
	
	public int getGender(){
		return gender;
	}
	
	public void setGender(int gender){
		this.gender = gender;
	}
	
	public Date getBirthday(){
		return birthday;
	}
	
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public float getSalary(){
		return salary;
	}
	
	public void setSalary(float salary){
		this.salary = salary;
	}
	
	public String getNotes(){
		return notes;
	}
	
	public void setNotes(String notes){
		this.notes = notes;
	}
	
	public String getDepartId(){
		return departId;
	}
	
	public void setDepartId(String departId){
		this.departId = departId;
	}
	
	public Departs getDepart(){
		return depart;
	}
	
	public void setDepart(Departs depart){
		this.depart = depart;
	}
}
