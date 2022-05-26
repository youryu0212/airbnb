package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.*;
import java.util.List;

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
    private List<RoomTax> roomTaxes;
}
