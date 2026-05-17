package com.uniquebooks.service;

import com.uniquebooks.dao.UserDAO;
import com.uniquebooks.entity.User;

import java.util.List;

public class UserService {
    private final UserDAO dao =new UserDAO();

    public User findByEmail(String email) {
        return dao.findByEmail (email);
    }
    public boolean register(User user) {
        return dao.save(user);
    }
    public List<User> getAllUsers(){
        return dao.findAllUsers();
    }
    public List<User> getPendingUsers(){
        return dao.findPendingUsers();
    }

    public boolean approveUser(int id) {
        return dao.updateStatus(id, "approved");
    }
    public boolean rejectUser(int id) {

        return dao.updateStatus(id, "pending");
    }
    public boolean updateProfile(User user){
        return dao.updateProfile(user);
    }
    public int countPending(){
        return dao.countPending();
    }
}
