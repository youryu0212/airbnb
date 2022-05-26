package com.codesquad.airbnb.wishlist.web.dto;

import lombok.Getter;

@Getter
public class WishListResponseDto {
    private Long id;
    private String imageLink;
    private double rating;
    private int reviewCount;
    private String name;
    private int basicFee;
}
