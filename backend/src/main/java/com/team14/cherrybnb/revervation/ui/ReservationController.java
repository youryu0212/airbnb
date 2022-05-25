package com.team14.cherrybnb.revervation.ui;

import com.team14.cherrybnb.revervation.dto.ReservationCardResponse;
import com.team14.cherrybnb.revervation.dto.ReservationDetailResponse;
import com.team14.cherrybnb.revervation.dto.ReservationRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reservations")
public class ReservationController {


    //예약하기
    //예약취소
    //예약 상세 조회
    //예약 리스트 조회

    @PostMapping()
    public ResponseEntity<Void> reserve(@RequestBody ReservationRequest reservationRequest) {
        // return Ok 또는 리다이렉트 url 넘겨주기
        return null;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> cancel(@PathVariable Long id) {
        // return ok 또는 리다이렉트 url 넘겨주기
        return null;
    }

    @GetMapping("/{id}")
    public ResponseEntity<ReservationDetailResponse> getReservationDetail(@PathVariable Long id) {
        return ResponseEntity.ok(null);
    }

    @GetMapping()
    public ResponseEntity<List<ReservationCardResponse>> getReservations() {
        return null;
    }



}
