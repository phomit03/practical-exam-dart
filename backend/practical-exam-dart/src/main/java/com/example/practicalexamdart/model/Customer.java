package com.example.practicalexamdart.model;

import lombok.Data;
import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "customer")
@Data
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fullName;
    private LocalDate birthday;
    private String address;
    private String phoneNumber;

    public Customer() {
    }

    public Customer(Long id, String fullName, LocalDate birthday, String address, String phoneNumber) {
        this.id = id;
        this.fullName = fullName;
        this.birthday = birthday;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }
}
