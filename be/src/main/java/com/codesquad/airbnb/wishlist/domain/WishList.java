package com.codesquad.airbnb.wishlist.domain;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.common.BaseTime;
import com.codesquad.airbnb.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import static javax.persistence.FetchType.*;
import static javax.persistence.GenerationType.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Entity
public class WishList extends BaseTime {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private Accommodation accommodation;

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private User user;

    @Column(nullable = false, columnDefinition = "BOOLEAN")
    private boolean deleted;

    public void delete() {
        this.deleted = true;
    }

    public void restore() {
        this.deleted = false;
    }
}
