package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.post.domain.UserBookVo;

@Mapper
public interface BookmarkMapper {

	List<UserBookVo> getUserbook(UserBookVo ub);

	int checkUBNO(UserBookVo userBookVo);

	void addBoolean(UserBookVo userBookVo);

	void canclBoolean(UserBookVo userBookVo);

	//List<UserBookVo> checkUBNO(UserBookVo userBookVo);

	/*
    @Insert("INSERT INTO USERBOOK (ub_num, user_id, po_num, ub_boolean) VALUES ((SELECT NVL(MAX(ub_num),0) + 1 FROM USERBOOK), #{user_id}, #{po_num}, 1)")
    void addBookmark(@Param("user_id") String user_id, @Param("po_num") int po_num);

    @Delete("DELETE FROM USERBOOK WHERE user_id = #{user_id} AND po_num = #{po_num}")
    void removeBookmark(@Param("user_id") String user_id, @Param("po_num") int po_num);
    
    @Select("SELECT 1\r\n"
    		+ "    FROM USERBOOK\r\n"
    		+ "    WHERE user_id = #{user_id}\r\n"
    		+ "    AND po_num = #{po_num}\r\n")
    boolean checkScrapStatus(@Param("user_id") String user_id, @Param("po_num") int po_num);
    */
    
}