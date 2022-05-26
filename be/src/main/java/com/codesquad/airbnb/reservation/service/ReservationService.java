package com.codesquad.airbnb.reservation.service;

import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
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
}
