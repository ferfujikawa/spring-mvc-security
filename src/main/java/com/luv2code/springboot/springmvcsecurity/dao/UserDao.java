package com.luv2code.springboot.springmvcsecurity.dao;

import com.luv2code.springboot.springmvcsecurity.entity.User;

public interface UserDao {

    User findByUserName(String userName);

    void save(User theUser);
}