package com.codesquad.airbnb.accommodation.domain;

import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.user.domain.User;
import lombok.Getter;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.CascadeType.ALL;
import static javax.persistence.FetchType.LAZY;
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

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private User host;

    @Embedded
    private AccommodationCondition accommodationCondition;

    @Embedded
    private DetailAddress detailAddress;

    private String description;

    @OneToMany(mappedBy = "accommodation", cascade = ALL)
    private List<Image> images;

    public int calculateTotalFee(int nights) {
        return basicFee * nights;
    }

    public String getMainImageLink() {
        return images.get(0).getImageLink();
    }
}
