package com.team14.cherrybnb.common.domain;


import javax.persistence.*;

@Entity
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    private Long id;

    private String allAddress;

    private String city;

    private String street;

    private String zipcode;
}
