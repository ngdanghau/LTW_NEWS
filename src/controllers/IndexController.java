package controllers;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class IndexController {
	
	/***************************************************
	 * @author Hau
	 * IndexController chuyen xu ly trang chu cua website
	 ***************************************************/
	
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("index")
	public String index(ModelMap model){
		return "index";
	}
}
