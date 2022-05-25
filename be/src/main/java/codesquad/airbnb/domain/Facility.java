package codesquad.airbnb.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;

@Entity
@Table(name = "accommodation_facility")
@Getter
public class Facility {

    @Id @GeneratedValue
    @Column(name = "facility_id")
    private Long id;

    @OneToOne(mappedBy = "facility", fetch = FetchType.LAZY)
    private Accommodation accommodation;

    private int maximumCapacity;
    @Column(name = "bedroom_count")
    private int countOfBedRoom;
    @Column(name = "bed_count")
    private int countOfBed;
    @Column(name = "bathroom_count")
    private int countOfBathroom;
    private boolean kitchenFlag;
    private boolean internetFlag;
    private boolean airConditionerFlag;
    private boolean hairDryerFlag;

}
