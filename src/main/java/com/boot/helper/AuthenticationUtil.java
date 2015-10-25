package com.boot.helper;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.boot.exception.NoPrincipalUserFound;

/**
 * AuthenticationUtil.java
 * Purpose : handle all authentication concerns
 * 
 * @author ralen
 *
 */
public class AuthenticationUtil {
	/**
	 * get the principal/username
	 * 
	 * @return principal name
	 * @throws NoPrincipalUserFound
	 */
	public static String getPrincipal() throws NoPrincipalUserFound{
		String principalUser = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
        	principalUser = ((UserDetails)principal).getUsername();
        } else {
        	principalUser = principal.toString();
        }
        
        if(principalUser == null){
        	throw new NoPrincipalUserFound("No principal found");
        }
        return principalUser;
	}
}
