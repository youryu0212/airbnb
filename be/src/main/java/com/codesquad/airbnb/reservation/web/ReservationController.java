package com.codesquad.airbnb.reservation.web;

import com.codesquad.airbnb.reservation.service.ReservationService;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
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

    @PostMapping
    public void createReservation(HttpServletRequest request, @RequestBody ReservationRequestDto dto) {
        Long userId = getUserId(request);
        reservationService.makeReservation(userId, dto);
    }

    @GetMapping("/{reservationId}")
    public ReservationDetailDto showDetail(@PathVariable long reservationId) {
        return reservationService.findById(reservationId);
    }

    private Long getUserId(HttpServletRequest request) {
        return (Long) request.getAttribute(USER_ID);
    }
}
