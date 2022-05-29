package com.codesquad.airbnb.naverapi.web.dto.apiresponse;

import lombok.Getter;

import java.util.List;

@Getter
public class Addresses {
    private String roadAddress;
    private String jibunAddress;
    private String englishAddress;
    private List<AddressElements> addressElements;
    private String x;
    private String y;
    private double distance;

}
