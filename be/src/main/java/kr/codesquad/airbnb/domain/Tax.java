package kr.codesquad.airbnb.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class Tax {

    @Id
    @GeneratedValue
    @Column(name = "tax_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;
}
