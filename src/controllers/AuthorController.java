package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorController {

	@RequestMapping("author")
	public String author()
	{
		return "client/author";
	}
}
