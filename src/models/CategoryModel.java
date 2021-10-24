package models;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


@Transactional
public class CategoryModel {
	
	@Autowired
	SessionFactory factory;
	
	
	public String retrieveNumberPostByCategory(String id)
	{
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) "
				+ "FROM Categories as C, "
				+ "	Post AS P "
				+ "WHERE C.Id = P.Cat_Id"
				+ "AND C.Id= :id";
		
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		
		List<String> list = query.list();
		return list.get(0);
	}
}
