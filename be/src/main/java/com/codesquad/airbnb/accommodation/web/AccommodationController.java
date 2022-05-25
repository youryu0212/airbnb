package com.codesquad.airbnb.accommodation.web;

import com.codesquad.airbnb.accommodation.web.dto.ListConditionDto;
import com.codesquad.airbnb.accommodation.web.dto.PriceConditionDto;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/accommodations")
@RestController
public class AccommodationController {

    @GetMapping
    public String showListWithCondition(@RequestBody ListConditionDto dto) {
        /**
         * TO-DO
         * - Parameter: 숙소 검색 조건
         * - Return: DB로부터 조회한 숙소 목록을 출력한다.
         */
        return null;
    }

    @GetMapping("/{accommodationId}")
    public String showDetail(@PathVariable Long accommodationId) {
        /**
         * TO-DO
         * - Parameter: 숙소 id
         * - Return: DB로부터 조회한 해당 숙소를 출력한다.
         */
        return null;
    }

    @GetMapping("/prices")
    public String showPriceList(@RequestBody PriceConditionDto dto) {
        /**
         * TO-DO
         * - Parameter: (체크인 날짜, 체크아웃 날짜가 담긴 검색 조건)
         * - Return: DB로부터 조회한 해당 일정의 숙소 가격 정보를 보낸다.
         */
        return null;
    }
}
