package com.green.users.post.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.green.users.post.domain.UserBookVo;

@Mapper
public interface BookmarkMapper {

    @Insert("INSERT INTO Bookmark (user_id, po_num) VALUES (#{user_id}, #{po_num})")
    void addBookmark(@Param("user_id") String user_id, @Param("po_num") int po_num);

    @Delete("DELETE FROM Bookmark WHERE user_id = #{user_id} AND po_num = #{po_num}")
    void removeBookmark(@Param("user_id") String user_id, @Param("po_num") int po_num);
    
    @Select("SELECT CASE WHEN EXISTS (\r\n"
    		+ "    SELECT 1\r\n"
    		+ "    FROM Bookmark\r\n"
    		+ "    WHERE user_id = #{user_id}\r\n"
    		+ "    AND po_num = #{po_num}\r\n"
    		+ ") THEN 1 ELSE 0 END AS is_scraped\r\n"
    		+ "FROM dual")
    boolean checkScrapStatus(@Param("user_id") String user_id, @Param("po_num") int po_num);
    
}