package client.controllers;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import bean.Mailer;
import entities.Posts;
import entities.Subscribers;
import entities.Widgets;
import models.CovidModel;
import models.WidgetModel;

@Transactional
@Controller
public class IndexController {
	
	/***************************************************
	 * @author Hau
	 * IndexController chuyen xu ly trang chu cua website
	 ***************************************************/
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ObjectMapper mapper;
	
	@Autowired
	Mailer mailer;
	
	@SuppressWarnings("unchecked")
	public List<Posts> getListPostsByCat(int catId, int limitPost)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Posts p WHERE p.category.id = :catId AND p.post_status = :post_status ORDER BY p.id DESC"; 
		if(catId == 1) {
			hql = "FROM Posts p WHERE p.category.id != :catId AND p.post_status = :post_status AND featured = 'true' ORDER BY p.id DESC";
		}
		Query query = session.createQuery(hql); 
		query.setFirstResult(0);
		query.setMaxResults(limitPost);
		query.setParameter("catId", catId);
		query.setParameter("post_status", "publish");
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Widgets> getListWidgets()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Widgets ORDER BY order_widget ASC"; 
		Query query = session.createQuery(hql); 
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Posts> getPostRecent(){
		Session session = factory.getCurrentSession();
		String hql = "SELECT p FROM Posts p WHERE p.post_status = :post_status"; 
		Query query = session.createQuery(hql); 
		query.setParameter("post_status", "publish");
		try 
		{
			return query.list();
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("index")
	public String index(HttpServletRequest request, ModelMap model){
		List<WidgetModel> lists = new ArrayList<WidgetModel>();
		
		List<Posts> posts = getPostRecent();
		PagedListHolder pagedlistHolder = new PagedListHolder(posts);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedlistHolder.setPage(page);
		pagedlistHolder.setMaxLinkedPages(5);
		pagedlistHolder.setPageSize(9);
		
		if(page == 0) {
			List<Widgets> listWidgets = this.getListWidgets();
			for(Widgets item: listWidgets) {
				lists.add(
		    			new WidgetModel(
		    					item.getCategory(), 
		    					this.getListPostsByCat(item.getCategory().getId(), item.getNum_post()), 
		    					item.getLayout().trim()
		    			)
		    	);
			}
		}
		
		model.addAttribute("pagedListHolder", pagedlistHolder);
		model.addAttribute("listWidgets", lists);
		dataCovid19(model,false);
		return "index";
	}
	
	//GET DATA COVID-19
	
	
	
	public void dataCovid19(ModelMap model,boolean covidworld) {
		try{
			
	        String url = "https://disease.sh/v3/covid-19/countries";
	        if(covidworld)
	        url = "https://disease.sh/v3/covid-19/all";
	        URL obj = new URL(url);
	        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	        con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36");
	        
	        int responseCode = con.getResponseCode();
	            System.out.println("\nSending Get Request to URL: "+url);
	            System.out.println("Response Code: "+responseCode);
	            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while((inputLine = in.readLine())!=null){
	                response.append(inputLine);
	            }
	            in.close();
	            con.disconnect();
//	             CONVERT JSON TO model[]
	            String json = response.toString();
	            if(json.contains("long")){
	            	 json.replace("long", "Long");
	            	 CovidModel[] result = mapper.readValue(json, CovidModel[].class);
	            	 System.out.println(result[3].country);
	 	             model.addAttribute("covidlist",result);
	 	             dataCovid19(model,true); // Gọi lại hàm để lấy dữ liệu covid all
	            }
	            else{
			         String[] covidWorld = new String[4];
			         covidWorld[0] = mapper.readTree(json).path("cases").asText();
			         System.out.println("cases: "+covidWorld[0]);
			         covidWorld[1] = mapper.readTree(json).path("todayCases").asText();
			         covidWorld[2] = mapper.readTree(json).path("deaths").asText();
			         covidWorld[3] = mapper.readTree(json).path("todayDeaths").asText();
			         model.addAttribute("covidworld",covidWorld);
	            }     
	    }
	    
	        catch(Exception e){
	            System.out.println(e);  
	        }
		
	}
	
	// DANG KY NHAN TIN
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public ResponseEntity<JsonNode> dangKyNhanTin(@RequestParam("email") String email,ModelMap model)
	{
		ObjectNode objectNode = mapper.createObjectNode();
		String error = "";
		
		// code ở dây
		String regex = "^(([^<>()[\\]\\\\.,;:\\s@\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		if(email.isEmpty())
			error="Không được để trống";
		else if (!email.matches(regex)||email.length()<15) {
			error="Email không hợp lệ";
		}
		
		
		
		if(error.isEmpty()==false) {
			objectNode.put("msg", error);
		}else {
			
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			Subscribers sub = new Subscribers();
			sub = sub.createSub(email);
			
			try {
				session.save(sub);
				t.commit();
				mailer.send(mailer.from(),email,mailer.ReceiveMessage(), mailer.bodyRM());	
				objectNode.put("msg", "Thành công. Vui lòng kiểm tra mail");
				
			}catch(HibernateException e){
				t.rollback();
				objectNode.put("msg", "Email đã đăng ký nhận tin.");
			}
			catch(Exception ex)
			{
				t.rollback();
				System.out.println(ex);
				objectNode.put("msg", "Oops.Có lỗi xảy ra");
			}
			finally {
				session.close();
			}
			
		}
	
		return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
	}
}
