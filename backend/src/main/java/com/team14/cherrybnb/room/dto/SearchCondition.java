package com.team14.cherrybnb.room.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class SearchCondition {


    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private BigDecimal minPrice;

    private BigDecimal maxPrice;

    private int capacity;

    private String location;
}
