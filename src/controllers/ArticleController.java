package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class ArticleController {

	
	/***************************************************
	 * @author Phong
	 * ArticleController chuyen xu ly hien thi cho mot bai viet
	 * @return
	 ***************************************************/
	@RequestMapping("article")
	public String article()
	{
		return "client/article";
	}
}
