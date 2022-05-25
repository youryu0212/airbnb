package project.airbnb.wishlist;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Wish {

    @Id
    @GeneratedValue
    @Column(name = "wishlist_id")
    private Long id;

    @JoinColumn(name = "")
    private Long userId;

    @JoinColumn(name = "")
    private Long bnbId;

}
