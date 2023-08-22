package com.example.practicalexamdart.repository;

import com.example.practicalexamdart.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICustomerRepository extends JpaRepository<Customer, Long> {
}
