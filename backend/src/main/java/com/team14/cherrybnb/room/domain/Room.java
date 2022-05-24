package com.team14.cherrybnb.room.domain;

import com.team14.cherrybnb.auth.domain.Member;
import com.team14.cherrybnb.common.domain.Address;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @JoinColumn(name = "address_id")
    private Address address;

    @ManyToOne
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "room")
    private List<RoomImage> roomImages;
}
