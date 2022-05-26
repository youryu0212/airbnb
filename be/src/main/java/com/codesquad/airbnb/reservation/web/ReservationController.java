package com.codesquad.airbnb.reservation.web;

import com.codesquad.airbnb.reservation.service.ReservationService;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/reservations")
@RestController
public class ReservationController {

    private final ReservationService reservationService;

    @GetMapping
    public List<ReservationListResponseDto> showList() {
        /**
         * 현재 유저가 예약한 목록을 보여준다.
         * 현재 유저 정보는 JWT를 통해 받아온 정보를 통해 user ID를 세션에 저장하고 그걸 불러온다. (고민)
         */
        reservationService.findAll(null);
        return null;
    }
}
