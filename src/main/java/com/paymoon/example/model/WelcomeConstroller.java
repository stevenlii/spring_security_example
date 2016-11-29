package com.paymoon.example.model;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class WelcomeConstroller { 
     
	@Autowired
	private UserMapper userMapper;
	
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)  
    public String welcome(HttpServletRequest request,Model model) {  
    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
    		    .getAuthentication()
    		    .getPrincipal();
    	Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
    	model.addAttribute("authorities", authorities.toString());	
    	model.addAttribute("username", userDetails.getUsername());	
    	model.addAttribute("userDetails", userDetails);
        return "/hello";  
    } 

    
    @RequestMapping(value = "/testUser", method = RequestMethod.GET)  
    public String testUser(HttpServletRequest request,Model model) {  
        User user=new User();
        //添加两条数据
        user.setId("11");
        user.setUsername("testUser");
        userMapper.addUser(user);
        return "/hello";  
    } 
    
    @SuppressWarnings("resource")
	public static void main(String[] args) {
        ApplicationContext ctx=null;
        ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserMapper userMapper=(UserMapper) ctx.getBean("userMapper");
        User user=new User();
        //添加两条数据
        user.setId("10");
        user.setUsername("123");
        userMapper.addUser(user);
        System.out.println("添加成功");

        
    }
    
    
    
    
    
    
    
    
}
