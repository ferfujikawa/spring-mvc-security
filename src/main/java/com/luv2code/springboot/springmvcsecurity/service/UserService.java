package com.luv2code.springboot.springmvcsecurity.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.luv2code.springboot.springmvcsecurity.entity.User;
import com.luv2code.springboot.springmvcsecurity.user.WebUser;

public interface UserService extends UserDetailsService {

	public User findByUserName(String userName);

	void save(WebUser webUser);

}