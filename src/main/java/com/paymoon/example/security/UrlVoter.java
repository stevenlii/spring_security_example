
package com.paymoon.example.security;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.FilterInvocation;




public class UrlVoter implements AccessDecisionVoter<Object> {


	public boolean supports(ConfigAttribute attribute) {
		return true;
	}


	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(FilterInvocation.class);
	}


	public int vote(Authentication authentication, Object object, Collection<ConfigAttribute> attributes) {
		System.out.println("Authentication authentication:"+authentication.getAuthorities());//[ROLE_USER]
		System.out.println("Authentication authentication.getName():"+authentication.getName());//[ROLE_USER]
		for(ConfigAttribute attribute:attributes){
			System.out.println(0000000000);
			System.out.println("ConfigAttribute attribute:"+attribute.getAttribute());//"/index.jsp"
			System.out.println(11111111);
			
		}
		//本来needRole是后边参数应该传来的资源对应的role, 如index.jsp>ROLE_***，好与用户的role:authentication进行对比
		//但是参数都怎么传过来的？走DB了吗，怎么走的？是provider吗？
		
		//!!!知道了，后边参数传url是因为数据来源FtspSecurityMetadataSource里面对url没有处理！
//		Iterator<ConfigAttribute> ite = attributes.iterator();
//		while (ite.hasNext()) {
//			ConfigAttribute ca = ite.next();
//			String needRole = ((SecurityConfig) ca).getAttribute();
//			for (GrantedAuthority ga : authentication.getAuthorities()) {
//				if (needRole.equals(ga.getAuthority())) {
//
//					return ACCESS_GRANTED;
//				}
//			}
//		}
//		
//		return ACCESS_DENIED;
		return ACCESS_GRANTED;
	}


}
