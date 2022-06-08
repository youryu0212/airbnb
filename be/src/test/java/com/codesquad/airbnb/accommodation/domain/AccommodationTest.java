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
    void 숙박일이_15일이면_요금소계와_수수료율이_고려된_금액이_계산된다() {
        // given
        int nights = 15;

        // when
        int subtotal = accommodation.calculateSubtotal(nights);
        int serviceFee = accommodation.calculateServiceFee(nights);
        int taxAndFee = accommodation.calculateTaxAndFee(nights);

        System.out.println(subtotal);
        System.out.println(serviceFee);
        System.out.println(taxAndFee);

        // then
        assertThat(subtotal).isEqualTo(180000);
        assertThat(serviceFee).isEqualTo(25200);
        assertThat(taxAndFee).isEqualTo(2520);
    }

    @Test
    void 일주일_이상_숙박을_하면_주간_할인정책이_적용된_금액이_계산된다() {
        // given
        int nights = 10;

        // when
        accommodation.setDiscountPolicy(discountPolicy);
        int totalFee = accommodation.calculateTotalFee(nights);

        // then
        assertThat(totalFee).isEqualTo(144250);
    }
}
