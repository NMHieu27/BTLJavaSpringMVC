/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository;

import com.hal.pojo.Comment;
import java.util.List;

/**
 *
 * @author Linh
 */
public interface CommentRepository {

    List<Object[]> getComments(int coachId, int routeId);

    Comment addComment(Comment comment);
}
