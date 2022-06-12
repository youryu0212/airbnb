package com.codesquad.airbnb.wishlist.web.dto;

import com.codesquad.airbnb.wishlist.domain.WishList;
import lombok.Getter;

@Getter
public class WishListResponseDto {
    private Long id;
    private String imageLink;
    private double rating;
    private int reviewCount;
    private String name;
    private int basicFee;

    public WishListResponseDto(WishList wishList) {
        this.id = wishList.getId();
        this.imageLink = wishList.getAccommodation().getMainImageLink();
        this.rating = wishList.getAccommodation().getRating();
        this.reviewCount = wishList.getAccommodation().getReviewCount();
        this.name = wishList.getAccommodation().getName();
        this.basicFee = wishList.getAccommodation().getBasicFee();
    }
}
