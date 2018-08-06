package com.jk.mapper;

import com.jk.entity.Student;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentMapper {
    @Select("select * from student ")
    List<Student> getStudentList();

    @Select("select * from student where id = #{id}")
    Student getStudentOneById(Integer id);
   // like 查询使用CONCAT 拼接字符串
    @Select("select * from student where age like CONCAT('%',#{name},'%')")
    List<Student> likeName(String name);

    @Update(" update student set stuname=#{student.stuname},stuage=#{student.student} ")
     void updatestu(@Param("student") Student student);

}
