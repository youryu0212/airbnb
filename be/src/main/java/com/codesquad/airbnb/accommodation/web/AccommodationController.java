package com.codesquad.airbnb.accommodation.web;

import com.codesquad.airbnb.accommodation.web.dto.BasicSearchCondition;
import com.codesquad.airbnb.accommodation.web.dto.PriceSearchCondition;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/accommodations")
@RestController
public class AccommodationController {

    @GetMapping
    public String showListWithCondition(@RequestBody BasicSearchCondition dto) {
        /**
         * TO-DO
         * - Parameter: 숙소 검색 조건(체크인/체크아웃 날짜, 가격대, 인원)
         * - Return: DB로부터 해당 조건으로 필터링하여 조회한 숙소 목록을 출력한다.
         */
        return null;
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
    public String showPriceList(@RequestBody PriceSearchCondition dto) {
        /**
         * TO-DO
         * - Parameter: (체크인 날짜, 체크아웃 날짜가 담긴 검색 조건)
         * - Return: DB로부터 조회한 해당 일정의 숙소 가격 정보를 보낸다.
         */
        return null;
    }
}
