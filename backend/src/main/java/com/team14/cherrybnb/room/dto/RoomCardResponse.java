package com.team14.cherrybnb.room.dto;

import com.team14.cherrybnb.room.domain.RoomImage;

import java.math.BigDecimal;

public class RoomCardResponse {

    private RoomImage roomImage;

    private Long roomId;

    private int starRating;

    private int reviewCount;

    private String name;

    private BigDecimal pricePerDay;

    private BigDecimal totalPrice;

    private boolean checkWish;
}
