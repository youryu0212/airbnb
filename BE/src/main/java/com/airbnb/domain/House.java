package com.airbnb.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class House {

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private int price;

    @Embedded
    private DetailInfo detailInfo;

    @OneToMany(mappedBy = "house")
    private List<Reservation> reservations = new ArrayList<>();
}
