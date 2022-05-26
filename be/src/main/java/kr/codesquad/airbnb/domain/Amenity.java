package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
public class Amenity {

    @Id
    @GeneratedValue
    @Column(name = "amenity_id")
    private Long id;

    private String name;

    @OneToMany(mappedBy = "amenity")
    private List<RoomAmenity> roomAmenities;
}
