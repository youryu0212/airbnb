package team18.airbnb.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class AccommodationPrice {

    @Id @GeneratedValue
    private Long id;

    // 숙소 Id FK 필요

    private int roomCharge;
    private int cleaningFee;
}
