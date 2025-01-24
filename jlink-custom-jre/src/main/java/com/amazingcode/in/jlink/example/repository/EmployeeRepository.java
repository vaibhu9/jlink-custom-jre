package com.amazingcode.in.jlink.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.amazingcode.in.jlink.example.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    
}
