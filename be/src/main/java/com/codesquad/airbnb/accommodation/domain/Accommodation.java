package com.codesquad.airbnb.accommodation.domain;

import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.IDENTITY;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity
public class Accommodation extends BaseTime {

    private static final double SERVICE_FEE_RATE = 0.14;
    private static final double TAX_AND_FEE_RATE = 0.014;

    @GeneratedValue(strategy = IDENTITY)
    @Id
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private double rating;

    private int reviewCount;

    private int basicFee;

    private int cleaningFee;

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

    @JoinColumn
    @OneToOne
    private DiscountPolicy discountPolicy;

    @OneToMany(mappedBy = "accommodation")
    private List<Image> images;

    public int calculateTotalFee(int nights) {
        int subtotal = calculateSubtotal(nights);
        return subtotal + calculateServiceFee(nights) + calculateTaxAndFee(nights);
    }

    public int calculateSubtotal(int nights) {
        double discountFactor = getDiscountFactor(nights);
        return (int) ((basicFee * nights * discountFactor) + cleaningFee);
    }

    private double getDiscountFactor(int nights) {
        double discountRate = 0;
        if (discountPolicy != null) {
            discountRate = discountPolicy.getDiscountRate(nights);
        }
        return (1 - discountRate);
    }

    public int calculateServiceFee(int nights) {
        return (int) (calculateSubtotal(nights) * SERVICE_FEE_RATE);
    }

    public int calculateTaxAndFee(int nights) {
        return (int) (calculateSubtotal(nights) * TAX_AND_FEE_RATE);
    }

    public String getMainImageLink() {
        return images.get(0).getImageLink();
    }

    public void setDiscountPolicy(DiscountPolicy discountPolicy) {
        this.discountPolicy = discountPolicy;
    }
}
