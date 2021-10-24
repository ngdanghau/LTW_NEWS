package admin.controllers;


import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Transactional
@Controller
@RequestMapping("/admin")
public class PostsController {
	@Autowired
	SessionFactory factory;
		
	
	@RequestMapping( value="posts", method = RequestMethod.GET)
	public String index(ModelMap model){	
		
		return "admin/posts";
	}
}
