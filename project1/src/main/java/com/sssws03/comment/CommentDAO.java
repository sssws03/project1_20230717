package com.sssws03.comment;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
@Autowired
private SqlSession sqlSession;

public int commentInsert(Map<String, Object> map) {
	return sqlSession.insert("comment.commentInsert", map);
}
}
