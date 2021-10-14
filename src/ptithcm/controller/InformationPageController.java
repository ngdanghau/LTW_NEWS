package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationPageController {

	
	/*
	 * @author Phong
	 * InformationPageController de xu ly cac trang thong tin ngoai le nhu: ABOUT, HELP, 
	 * PRIVACY, TERMS,CONTACT
	 * */
	@RequestMapping("informationPage")
	public String informationPage()
	{
		return "client/informationPage";
	}
}
