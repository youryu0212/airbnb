package com.codesquad.airbnb.accommodation.domain;

import lombok.Getter;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.CascadeType.*;

@Getter
@Entity
public class Accommodation {

    @GeneratedValue
    @Id
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private double rating;

    private int reviewCount;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private String accommodationType;

    @Column(nullable = false)
    private String hostName;

    private String accommodationCondition;
    private String description;
    @OneToMany(mappedBy = "accommodation", cascade = ALL)
    private List<Reservation> reservations;
}
