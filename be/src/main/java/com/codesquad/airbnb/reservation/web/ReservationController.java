package com.codesquad.airbnb.reservation.web;

import com.codesquad.airbnb.reservation.service.ReservationPriceResponseDto;
import com.codesquad.airbnb.reservation.service.ReservationService;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationPriceRequestDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/reservations")
@RestController
public class ReservationController {

    private static final String USER_ID = "USER_ID";

    private final ReservationService reservationService;

    @GetMapping
    public List<ReservationListResponseDto> showReservations(HttpServletRequest request) {
        Long userId = getUserId(request);
        return reservationService.findAllByUserId(userId);
    }

    @GetMapping("/price/{accommodationId}")
    public ReservationPriceResponseDto showPriceInformation(@PathVariable long accommodationId, ReservationPriceRequestDto dto) {
        log.debug("ReservationController: {}", dto.getCheckInDate());
        log.debug("ReservationController: {}", dto.getCheckOutDate());
        return reservationService.getReservationInformation(accommodationId, dto);
    }

    @PostMapping
    public long createReservation(HttpServletRequest request, @RequestBody ReservationRequestDto dto) {
        Long userId = getUserId(request);
        return reservationService.makeReservation(userId, dto);
    }

    @GetMapping("/{reservationId}")
    public ReservationDetailDto showDetail(@PathVariable long reservationId) {
        return reservationService.findById(reservationId);
    }

    private Long getUserId(HttpServletRequest request) {
        /**
         * return (Long) request.getAttribute(USER_ID);
         * 테스트용 메서드
         */
        return 1L;
    }
}
