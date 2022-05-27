package com.codesquad.airbnb.reservation.service;

import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ReservationService {

    public List<ReservationListResponseDto> findAll(Long userId) {
        /**
         * DB로부터 user 정보를 통해 조회한 결과를 return
         */
        return null;
    }

    public void create(ReservationRequestDto dto) {
        /**
         * DB에 dto에 담긴 정보를 통해 예약 저장
         */
    }


    public ReservationDetailDto findById(long reservationId) {
        /**
         * DB에서 reservation_id로 조회해서 보여주기
         */
        return null;
    }
}
