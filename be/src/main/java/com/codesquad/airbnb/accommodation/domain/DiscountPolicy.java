package com.codesquad.airbnb.accommodation.domain;

import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import static javax.persistence.GenerationType.IDENTITY;

@NoArgsConstructor
@Entity
public class DiscountPolicy {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private long id;

    private double weeklyDiscountRate;
    private double monthlyDiscountRate;
    private double yearlyDiscountRate;

    @Builder
    public DiscountPolicy(double weeklyDiscountRate, double monthlyDiscountRate, double yearlyDiscountRate) {
        this.weeklyDiscountRate = weeklyDiscountRate;
        this.monthlyDiscountRate = monthlyDiscountRate;
        this.yearlyDiscountRate = yearlyDiscountRate;
    }

    public double getDiscountRate(int night) {
        if (night >= 365) {
            return yearlyDiscountRate;
        }

        if (night >= 30) {
            return monthlyDiscountRate;
        }

        if (night >= 7) {
            return weeklyDiscountRate;
        }

        return 0;
    }
}
