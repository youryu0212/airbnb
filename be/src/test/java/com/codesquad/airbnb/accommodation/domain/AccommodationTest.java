package com.codesquad.airbnb.accommodation.domain;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class AccommodationTest {
    Accommodation accommodation;
    DiscountPolicy discountPolicy;

    @BeforeEach
    void setUp() {
        accommodation = Accommodation.builder()
                .cleaningFee(30000)
                .basicFee(10000)
                .build();

        discountPolicy = DiscountPolicy.builder()
                .weeklyDiscountRate(0.05)
                .monthlyDiscountRate(0.1)
                .yearlyDiscountRate(0.15)
                .build();
    }


    @Test
    void 숙박요금이_정상적으로_계산된다() {
        // given
        int nights = 15;

        // when
        int subtotal = accommodation.calculateSubtotal(nights);
        int serviceFee = accommodation.calculateServiceFee(subtotal);
        int taxAndFee = accommodation.calculateTaxAndFee(subtotal);

        // then
        assertThat(subtotal).isEqualTo(180000);
        assertThat(serviceFee).isEqualTo(25200);
        assertThat(taxAndFee).isEqualTo(2520);
    }

    @Test
    void 할인정책이_적용된_숙박요금이_계산된다() {
        // given
        int nights = 10;

        // when
        accommodation.setDiscountPolicy(discountPolicy);
        int totalFee = accommodation.calculateTotalFee(nights);

        // then
        assertThat(totalFee).isEqualTo(144250);
    }
}
