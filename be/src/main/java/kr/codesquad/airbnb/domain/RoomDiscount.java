package kr.codesquad.airbnb.domain;

import javax.persistence.*;

//숙소 엔티티와 할인 엔티티의 다대다 연결을 위한 엔티티
@Entity
public class RoomDiscount {

    @Id
    @GeneratedValue
    @Column(name = "roomdiscount_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;
}
