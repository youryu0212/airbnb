package com.codesquad.airbnb.accommodation.domain;

import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.reservation.domain.Reservation;
import lombok.Getter;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.CascadeType.ALL;
import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Entity
public class Accommodation extends BaseTime {

    @GeneratedValue(strategy = IDENTITY)
    @Id
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private double rating;

    private int reviewCount;

    private int basicFee;

    @Column(nullable = false, columnDefinition = "point")
    private Point location;

    @Column(nullable = false)
    private String accommodationType;

    @Column(nullable = false)
    private String hostName;

    private String accommodationCondition;
    private String description;
    @OneToMany(mappedBy = "accommodation", cascade = ALL)
    private List<Reservation> reservations;
}
