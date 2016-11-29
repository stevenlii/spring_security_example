
package com.paymoon.example.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

public class FtspSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {

	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		String url = ((FilterInvocation) object).getRequestUrl();

		Collection<ConfigAttribute> confDef = new ArrayList<ConfigAttribute>();
		confDef.add(new SecurityConfig(url));
		return confDef;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(FilterInvocation.class);
	}



}
