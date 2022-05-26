package com.codesquad.airbnb.naverapi.service;

import com.codesquad.airbnb.naverapi.web.dto.Address;
import com.codesquad.airbnb.naverapi.web.dto.GeoCodeResponseDto;
import com.codesquad.airbnb.naverapi.ApiKey;
import com.codesquad.airbnb.naverapi.domain.GeoCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Slf4j
@Transactional
@Service
public class GeoCodeService {
    private final ApiKey apiKey;

    public GeoCodeResponseDto convertAddressToCoordinate(Address address) throws ParseException {
        String addressString = address.toValue();
        GeoCode geoCode = GeoCode.getGeoCodeFromNaverApi(addressString, apiKey);
        log.info("[Accomm. Service] (latitude, longitude): ({}, {})",
                geoCode.getLatitude(), geoCode.getLongitude());
        return new GeoCodeResponseDto(geoCode.getLatitude(), geoCode.getLongitude());
    }
}
