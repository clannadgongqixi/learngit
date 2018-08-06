package com.jk.dao;

import com.jk.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;
@Repository
public class TestDaoImpl {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Student querystubyid(Integer id) {

        String sql = "select * from Student where id=?";
        RowMapper<Student> rowMapper;
        rowMapper = new BeanPropertyRowMapper<Student>(Student.class);

        return jdbcTemplate.queryForObject(sql, rowMapper,id);
    }


}
