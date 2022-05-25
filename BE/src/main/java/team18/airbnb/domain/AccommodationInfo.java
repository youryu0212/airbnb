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
    @Column(name = "accommdationInfo_id")
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accommodation_id")
    private Accommodation accommodation;

    private String description;

    @Enumerated(EnumType.STRING)
    private AccommodationType type;

    private int numberOfBed;
    private int numberOfBath;
    private int discountOfWeek;
    private int maximumNumberOfGuests;
    private String accommodationMainImg;
    private String accommodationDetailImg;
}
