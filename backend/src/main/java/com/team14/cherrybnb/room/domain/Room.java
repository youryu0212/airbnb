package com.team14.cherrybnb.room.domain;

import com.team14.cherrybnb.auth.domain.Member;
import com.team14.cherrybnb.common.domain.Address;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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

    @OneToOne
    @JoinColumn
    private Address address;

    @ManyToOne
    @JoinColumn
    private Member member;
}
