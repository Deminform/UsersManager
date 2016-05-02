package com.usermanager.dao;


import com.usermanager.model.User;

import java.util.List;

public interface UserDao {

    void firstPage();

    void prevPage();

    void nextPage();

    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getUserByName(String name);

    List<User> listUsers();

}
