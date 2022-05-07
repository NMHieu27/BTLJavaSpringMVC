/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service;

import com.hal.pojo.Comment;
import com.hal.pojo.User;
import java.util.List;

/**
 *
 * @author Linh
 */
public interface CommentService {

    List<Object[]> getComments(int coachId, int routeId);
    Comment addComment(String content, int coachesId, User user);
}
