package com.jk.service;

import com.jk.dao.TestDao;
import com.jk.dao.TestDaoImpl;
import com.jk.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
public class TestService {

    @Autowired
    private TestDao testDao;
    @Autowired
    private TestDaoImpl testDaoimpl;

    public void saveStudent(Student stu) {
        testDao.save(stu);
        System.out.println	("stu.getId() = "+stu.getId());
    }

    public void delestu(Integer id) {

        testDao.deleteById(id);



    }


    public List<Student> querystu() {

        List<Student>list =testDao.findAll();

        return list;
    }

    public Student querystubyid(Integer id) {

        Student student=testDaoimpl.querystubyid(id);

        return student;
    }

    public void updatestu(Student student) {


    }
}
