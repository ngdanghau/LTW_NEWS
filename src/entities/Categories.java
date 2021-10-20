package entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CATEGORIES")
public class Categories {
	@Id 
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
	private Collection<Cat_Post> cat;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="SLUG")
	private String slug;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="PARENT")
	private int parent;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Collection<Cat_Post> getCat() {
		return cat;
	}

	public void setCat(Collection<Cat_Post> cat) {
		this.cat = cat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}
}
