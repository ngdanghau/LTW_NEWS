package admin.controllers;



import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import entities.General_Data;
import models.SettingsData;
import models.SocialData;

@Transactional
@Controller
@RequestMapping("/admin/settings/")
public class SettingsController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ObjectMapper mapper;
	

	public SettingsData getGeneralData(String name) {
		Session session = factory.getCurrentSession();
		String hql = String.format("FROM General_Data WHERE name = :name"); 
		Query query = session.createQuery(hql); 
		query.setParameter("name", name); 
		try {
			General_Data json = (General_Data) query.list().get(0);// lấy text {""}
			return mapper.readValue(json.getData(), SettingsData.class);
		}catch(Exception ex) {
			return null;
		}
	}
	
	public SocialData getSocialData(String name) {
		Session session = factory.getCurrentSession();
		String hql = String.format("FROM General_Data WHERE name = :name"); 
		Query query = session.createQuery(hql); 
		query.setParameter("name", name); 
		try {
			General_Data json = (General_Data) query.list().get(0);// lấy text {""}
			return mapper.readValue(json.getData(), SocialData.class);
		}catch(Exception ex) {
			return null;
		}
	}
	
	
	
	@RequestMapping(value="site",method = RequestMethod.GET)
	public String SiteController(ModelMap model)
	{
		SettingsData settings = getGeneralData("settings");
		model.addAttribute("settings", settings);
		return "admin/settings-site";
	}
	
	
	@RequestMapping(value="site",method = RequestMethod.POST)
	public String SiteSubmit(HttpServletRequest request,ModelMap model,@RequestParam("site_name") String site_name,@RequestParam("site_slogan") String site_slogan ,
											@RequestParam("site_description") String site_description,@RequestParam("site_keywords") String site_keywords)
	{
		SettingsData settings = getGeneralData("settings");
		if(site_name.isEmpty()||site_description.isEmpty()||site_keywords.isEmpty()||site_slogan.isEmpty()) {
			model.addAttribute("error","Vui lòng không để trống");
			model.addAttribute("settings", settings);
			return "admin/settings-site";
		}
		
		settings.setSite_name(site_name);
		settings.setSite_slogan(site_slogan);
		settings.setSite_description(site_description);
		settings.setSite_keywords(site_keywords);
		try {
			String data = mapper.writeValueAsString(settings);
			System.out.println("DATA: "+data);
				
			Session session = factory.getCurrentSession();
			String hql = "UPDATE General_Data gd SET gd.data = :data where gd.name = 'settings'";
			Query query = session.createQuery(hql); 
			query.setParameter("data", data);
			query.executeUpdate();
			model.addAttribute("success","Lưu thành công");
			model.addAttribute("settings", settings);
			return "admin/settings-site";
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("error","Lưu không thành công");
		}
		
		return "admin/settings-site";
	}
	
	// SETTING SOCIAL
	@RequestMapping(value="social",method = RequestMethod.GET)
	public String SocialController(ModelMap model)
	{
		SocialData social = getSocialData("social");
		System.out.println("facebook: "+social.getFacebook());
		model.addAttribute("social", social);
		return "admin/settings-social";
	}
	
	@RequestMapping(value="social",method = RequestMethod.POST)
	public String SocialSubmit(HttpServletRequest request,ModelMap model,@RequestParam("facebook") String facebook, @RequestParam("twitter") String twitter ,
											@RequestParam("instagram") String instagram, @RequestParam("pinterest") String pinterest,
											@RequestParam("tumblr") String tumblr, @RequestParam("telegram") String telegram, @RequestParam("whatsapp") String whatsapp)
	{
		
		SocialData social = getSocialData("social");
		if(facebook.isEmpty()||twitter.isEmpty()||instagram.isEmpty()||pinterest.isEmpty() || tumblr.isEmpty()||telegram.isEmpty()||whatsapp.isEmpty())
		{
			model.addAttribute("error","Vui lòng không để trống");
			model.addAttribute("social", social);
			return "admin/settings-social";
		}
		
		social.setFacebook(facebook);
		social.setTwitter(twitter);
		social.setInstagram(instagram);
		social.setPinterest(pinterest);
		social.setTumblr(tumblr);
		social.setTelegram(telegram);
		social.setWhatsapp(whatsapp);
		try {
			String data = mapper.writeValueAsString(social);
			Session session = factory.getCurrentSession();
			String hql = "UPDATE General_Data gd SET gd.data = :data where gd.name = 'social'";
			Query query = session.createQuery(hql); 
			query.setParameter("data", data);
			query.executeUpdate();
			model.addAttribute("success","Lưu thành công");
			model.addAttribute("social", social);
			return "admin/settings-social";
		} 
		catch (Exception e)
		{
			System.out.println(e);
			model.addAttribute("error","Lưu không thành công");
		}
		return "admin/settings-social";
	}
	
	// SETTINGS LOGO
	@RequestMapping(value="logo",method = RequestMethod.GET)
	public String LogoController(ModelMap model)
	{
		return "admin/errors/404";
	}
}
