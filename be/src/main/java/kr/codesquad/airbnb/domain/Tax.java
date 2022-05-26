package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.*;

@Entity
@Getter
public class Tax {

    @Id
    @GeneratedValue
    @Column(name = "tax_id")
    private Long id;

    private String name;
    private Integer rate;

    @OneToMany(mappedBy = "tax")
    private RoomTax rooms;
}
