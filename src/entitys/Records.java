package entitys;

import java.util.Date;
import javax.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Records")
public class Records {
	@Id @GeneratedValue
	@Column(name="Id")
	private long id;
	@Column(name="Type")
	private boolean type;
	@Column(name="Reason")
	private String reason;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="Date")
	private Date date;

	@ManyToOne
	@JoinColumn(name="StaffId")
	private Staffs staff;
	
	public long getId(){
		return id;
	}
	
	public void setId(long id){
		this.id = id;
	}
	
	public boolean getType(){
		return type;
	}
	
	public void setType(boolean type){
		this.type = type;
	}
	
	public String getReason(){
		return reason;
	}
	
	public void setReason(String reason){
		this.reason = reason;
	}
	
	public Date getDate(){
		return date;
	}
	
	public void setDate(Date date){
		this.date = date;
	}

	public Staffs getStaff(){
		return staff;
	}
	
	public void setStaff(Staffs staff){
		this.staff = staff;
	}
}
