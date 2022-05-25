package com.team14.cherrybnb.room.domain;

import javax.persistence.Embeddable;
import java.math.BigDecimal;

@Embeddable
public class RoomPriceCondition {

    private BigDecimal weekdayPrice;

    private BigDecimal weekendPrice;

    private BigDecimal weeklyDiscount;

    private BigDecimal cleaningFee;

    private BigDecimal serviceCommission;

    private BigDecimal tax;
}
