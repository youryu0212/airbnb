package com.codesquad.airbnb.reservation.web;

import com.codesquad.airbnb.reservation.service.ReservationService;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/reservations")
@RestController
public class ReservationController {

    private final ReservationService reservationService;

    @GetMapping
    public List<ReservationListResponseDto> showReservations() {
        /**
         * 현재 유저가 예약한 목록을 보여준다.
         * 현재 유저 정보는 JWT를 통해 받아온 정보를 통해 user ID를 세션에 저장하고 그걸 불러온다. (고민)
         */
        reservationService.findAll(null);
        return null;
    }

    @PostMapping
    public void createReservation(ReservationRequestDto dto) {
        /**
         * 유저 정보, 예약하려는 숙소 정보, 예약 정보를 받아와서 예약을 한다.
         *
         */
        reservationService.create(dto);
    }

    @GetMapping("/{reservationId}")
    public ReservationDetailDto showDetail(@PathVariable long reservationId) {
        /**
         * 예약 id를 통해 예약 상세 페이지 정보 전달
         */
        return reservationService.findById(reservationId);
    }
}
