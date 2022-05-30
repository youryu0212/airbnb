package com.codesquad.airbnb.accommodation.web;

import com.codesquad.airbnb.accommodation.domain.AccommodationRepository;
import com.codesquad.airbnb.accommodation.service.AccommodationService;
import com.codesquad.airbnb.accommodation.web.dto.AccommodationResponseDto;
import com.codesquad.airbnb.accommodation.web.dto.BasicSearchCondition;
import com.codesquad.airbnb.accommodation.web.dto.PriceSearchCondition;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/accommodations")
@RestController
public class AccommodationController {

    private final AccommodationRepository accommodationRepository;
    private final AccommodationService accommodationService;

    @GetMapping
    public List<AccommodationResponseDto> showAccommodationsWithCondition(BasicSearchCondition basicSearchCondition) {
        return accommodationService.findByBasicSearch(basicSearchCondition);
    }

    @GetMapping("/{accommodationId}")
    public String showDetail(@PathVariable Long accommodationId) {
        /**
         * TO-DO
         * - Parameter: 숙소 id
         * - Return: DB로부터 조회한 해당 숙소 id의 정보를 출력한다.
         */
        return null;
    }

    @GetMapping("/prices")
    public String showPrices(@RequestBody PriceSearchCondition dto) {
        /**
         * TO-DO
         * - Parameter: (체크인 날짜, 체크아웃 날짜가 담긴 검색 조건)
         * - Return: DB로부터 조회한 해당 일정의 숙소 가격 정보를 보낸다.
         */
        return null;
    }
}
