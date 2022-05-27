package com.codesquad.airbnb.user.domain;

import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.wishlist.domain.WishList;
import lombok.Getter;

import javax.persistence.*;

import java.util.List;

import static javax.persistence.CascadeType.ALL;
import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Entity
public class User extends BaseTime {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    private String username;

    @OneToMany(mappedBy = "user", cascade = ALL)
    public List<WishList> wishLists;
}
