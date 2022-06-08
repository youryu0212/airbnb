package com.codesquad.airbnb.wishlist.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WishListCrudRepository extends JpaRepository<WishList, Long> {
}
