package team18.airbnb.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class AccommodationInfo {

    @Id @GeneratedValue
    private Long id;

    // 숙소 ID FK 필요

    private String description;

    @Enumerated(EnumType.STRING)
    private AccommodationType type;

    private int nBed;
    private int nBath;
    private int discountOfWeek;
}
