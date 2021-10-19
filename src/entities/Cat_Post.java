package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;





@Entity
@Table(name="CAT_POST")
public class Cat_Post {
	@Id 
	@GeneratedValue
	@Column(name="ID")
	private int id;	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne
	@JoinColumn(name="POST_ID")
	private Posts post;
	
	@ManyToOne
	@JoinColumn(name="CAT_ID")
	private Categories category;
	
	

	public Posts getPost() {
		return post;
	}

	public void setPost(Posts post) {
		this.post = post;
	}

	public Categories getCategorie() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

	

}
