package com.airbnb.domain;

import javax.persistence.Embeddable;

@Embeddable
public class DetailInfo {

    private int maxNumber;
    private String type;
    private String roomIntroduction;
    private double rate;
    private int commentCount;
}
