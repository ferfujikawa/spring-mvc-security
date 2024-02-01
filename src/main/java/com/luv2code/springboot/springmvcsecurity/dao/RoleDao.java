package com.luv2code.springboot.springmvcsecurity.dao;

import com.luv2code.springboot.springmvcsecurity.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
