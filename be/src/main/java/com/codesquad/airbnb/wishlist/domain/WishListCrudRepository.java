package com.codesquad.airbnb.wishlist.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WishListCrudRepository extends JpaRepository<WishList, Long> {

    List<WishList> findByUserIdAndDeleted(long userId, boolean deleted);

    Optional<WishList> findByUserIdAndAccommodationId(long userId, long accommodationId);
}
