package com.codesquad.airbnb.reservation.service;

import com.codesquad.airbnb.reservation.domain.ReservationRepository;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class ReservationService {

    private final ReservationRepository reservationRepository;

    public List<ReservationListResponseDto> findAllByUserId(Long userId) {
        return reservationRepository.findByUserId(userId)
                .stream()
                .map(ReservationListResponseDto::new)
                .collect(Collectors.toList());
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
