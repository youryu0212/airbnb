package kr.codesquad.airbnb.domain;

import javax.persistence.*;

//숙소 엔티티와 세금 엔티티의 다대다 연결을 위한 엔티티
@Entity
public class RoomTax {

    @Id
    @GeneratedValue
    @Column(name = "room_tax_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @ManyToOne
    @JoinColumn(name = "tax_id")
    private Tax tax;
}
