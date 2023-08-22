package com.example.practicalexamdart.controller;

import com.example.practicalexamdart.model.Customer;
import com.example.practicalexamdart.repository.ICustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customers")

public class CustomerController {
    @Autowired
    private ICustomerRepository iCustomerRepository;

    @PostMapping("/add")
    public Customer addCustomer(@RequestBody Customer customer) {
        return iCustomerRepository.save(customer);
    }

    @GetMapping("/")
    public List<Customer> getAllCustomers() {
        return iCustomerRepository.findAll();
    }
}
