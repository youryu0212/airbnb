package com.codesquad.airbnb.reservation.web.dto;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.DiscountPolicy;
import lombok.Getter;

@Getter
public class ReservationPriceResponseDto {
    private int nights;
    private int reviewCount;
    private int basicFee;
    private int discountRatePercent;
    private int cleaningFee;
    private int serviceFee;
    private int taxAndFee;

    public ReservationPriceResponseDto(Accommodation accommodation, int nights) {
        this.nights = nights;
        this.reviewCount = accommodation.getReviewCount();
        this.basicFee = accommodation.getBasicFee();

        DiscountPolicy discountPolicy = accommodation.getDiscountPolicy();
        this.discountRatePercent = discountPolicy.getDiscountRateInPercent(nights);
        this.cleaningFee = accommodation.getCleaningFee();

        this.serviceFee = accommodation.calculateServiceFee(nights);
        this.taxAndFee = accommodation.calculateTaxAndFee(nights);
    }
}
