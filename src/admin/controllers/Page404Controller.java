package admin.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/404")
public class Page404Controller {
	@RequestMapping( method = RequestMethod.GET)
	public String index(){	
		return "admin/404";
	}
}
