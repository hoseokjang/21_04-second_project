package kr.co.life.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KeywordController {
	   @RequestMapping("/keywd_search")
	   public String keywd_search()
	   {
		   
		   return "/search/keywd_search";
	   }
	   
	   @RequestMapping("/keywd_save")
	   public String keywd_save(HttpServletRequest req)throws IOException, ParseException, InterruptedException
	    {
		   req.setCharacterEncoding("utf-8");
		  
		   //"C:\Program Files\JetBrains\PyCharm Community Edition 2020.3.2\bin\pycharm64.exe"
		   String dir = "D:/spring_suup/life/src/main/webapp/WEB-INF/views/search/";

		   String filename = dir +"keyword.txt";
		   String keyword = req.getParameter("keywd");
		   
		   File file = new File(filename);
//		   FileWriter fw = new FileWriter(file, false); 
		   BufferedWriter bw = new BufferedWriter(new FileWriter(file,false));
		   
		   bw.write(keyword);
		   bw.flush();
		   bw.close();

			    // 프로세스 빌더를 통하여 외부 프로그램 실행
			 
		   System.out.println(keyword);
		   String cmd = "D:\\study\\life\\dist\\ingre_cafe.exe";
		   String str = null;

	   		try {
	
	   			Process process= new ProcessBuilder(cmd).start();
	   			BufferedReader stdOut = new BufferedReader( new InputStreamReader(process.getInputStream()) );
	   			process.waitFor();
	   			process.getErrorStream().close(); 
	   			process.getInputStream().close(); 
	   			process.getOutputStream().close();
	   			

//	   			System.out.print("111111111111");
	   			
//	   		    while( (str = stdOut.readLine()) != null ) {
////	   		    	System.out.print("22222222222");
//	   		        System.out.println(str);
//	   		        
//	   		    }
 			
	   		}catch(Exception e) {
//	   			System.out.print("333333333333333");
	   			System.out.print(e);   			
	   		}	
//		   	System.out.print("44444444444444");
		    return "redirect:/keyresult";
	    } 
  

	   @RequestMapping("/keyresult")
	   	public String keyresult (Model model, HttpServletRequest req) throws IOException {
		   String dir = "D:/spring_suup/life/src/main/webapp/WEB-INF/views/search/";
		   String filename = dir +"keyword.txt";
		   Charset cs = StandardCharsets.UTF_8;
		   String keyword = null;
		   
		   File file = new File(filename);
		   BufferedReader br = new BufferedReader(new FileReader(file));
		   System.out.print("111111111111");

		   try {
		    keyword = br.readLine();
		    model.addAttribute("keyword",keyword);
			System.out.print(keyword); 
//			
		   }catch(IOException e) {
			   System.exit(0);
		   }
		   System.out.print("3333333333");
		   br.close();
	   	
//	   	keyword = req.getParameter("keyword");
	   	
//	   	System.out.print(keyword);
   		return "/search/keyresult";
	   }
	  
} 		   

