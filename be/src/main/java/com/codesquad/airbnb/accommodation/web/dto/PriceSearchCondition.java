package com.codesquad.airbnb.accommodation.web.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Setter
@Getter
public class PriceSearchCondition {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime checkInDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime checkOutDate;
}
