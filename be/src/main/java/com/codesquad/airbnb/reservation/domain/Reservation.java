package com.codesquad.airbnb.reservation.domain;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.DetailAddress;
import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.user.domain.User;
import lombok.Getter;

import javax.persistence.*;
import java.time.LocalDate;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Entity
public class Reservation extends BaseTime {

    @GeneratedValue(strategy = IDENTITY)
    @Id
    private Long id;

    @Column(nullable = false)
    private LocalDate checkInDate;

    @Column(nullable = false)
    private LocalDate checkOutDate;

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private Accommodation accommodation;

    private int fee;
    private int clientCount;

    @Column(nullable = false, columnDefinition = "BOOLEAN")
    private boolean cancelled;

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private User user;

    public String getMainImageLink() {
        return accommodation.getMainImageLink();
    }

    public DetailAddress getDetailAddress() {
        return accommodation.getDetailAddress();
    }

    public String getName() {
        return accommodation.getName();
    }
}
