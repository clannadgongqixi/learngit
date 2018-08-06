package com.jk.dao;

import com.jk.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestDao  extends JpaRepository<Student, Integer> {



}
