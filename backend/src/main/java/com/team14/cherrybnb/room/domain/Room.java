package com.team14.cherrybnb.room.domain;

import com.team14.cherrybnb.revervation.domain.Member;

import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import java.math.BigDecimal;

public class Room {

    private Long id;

    private int capacity;

    private int roomCount;

    private int bedCount;

    private int restroomCount;

    private String description;

    private BigDecimal weekdayPrice;

    private BigDecimal weekendPrice;

    private BigDecimal weeklyDiscount;

    private BigDecimal cleaningFee;

    private BigDecimal serviceCommission;

    private BigDecimal tax;

    // Address

    @OneToMany
    @JoinColumn
    private Member member;
}
