package com.codesquad.airbnb.naverapi.web.dto.apiresponse;

import lombok.Getter;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Getter
public class NaverAPIResponse implements Serializable {
    private String status;
    private Map<String, String> meta;
    private List<Addresses> addresses;
    private String errorMessage;
}
