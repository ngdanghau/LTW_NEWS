package entitys;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WIDGETS")
public class Widgets {

	@Id @GeneratedValue
	@Column(name="Id")
	private int id;
		
	@Column(name="TITLE")
	private String title;
	
	@ManyToOne
	@JoinColumn(name="CAT_ID",referencedColumnName="ID")
	private Categories categorie;
	
	@Column(name="LAYOUT")
	private String layout;
	
	@Column(name="ORDER_WIDGET")
	private int order_widget;

	
	public Categories getCategorie() {
		return categorie;
	}

	public void setCategorie(Categories categorie) {
		this.categorie = categorie;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public int getOrder_widget() {
		return order_widget;
	}

	public void setOrder_widget(int order_widget) {
		this.order_widget = order_widget;
	}
	
}
