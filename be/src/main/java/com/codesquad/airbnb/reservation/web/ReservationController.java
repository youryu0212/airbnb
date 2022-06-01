package com.codesquad.airbnb.reservation.web;

import com.codesquad.airbnb.reservation.service.ReservationService;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/reservations")
@RestController
public class ReservationController {

    private final ReservationService reservationService;

    @GetMapping
    public List<ReservationListResponseDto> showReservations(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return reservationService.findAllByUserId(userId);
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
