package com.codesquad.airbnb.naverapi.web;

import com.codesquad.airbnb.naverapi.web.dto.Address;
import com.codesquad.airbnb.naverapi.web.dto.GeoCodeResponseDto;
import com.codesquad.airbnb.naverapi.service.GeoCodeService;
import lombok.RequiredArgsConstructor;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class GeoCodeController {

    private final GeoCodeService geoCodeService;

    @GetMapping("/coordinate")
    public GeoCodeResponseDto showCoordinateOfAddress(@RequestBody Address address) throws ParseException {
        return geoCodeService.convertAddressToCoordinate(address);
    }
}
