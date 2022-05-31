package com.codesquad.airbnb.accommodation.web.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Setter
@Getter
public class BasicSearchCondition {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkInDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkOutDate;

    private int minPrice;
    private int maxPrice;
}
