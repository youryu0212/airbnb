package com.codesquad.airbnb.reservation.service;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.AccommodationCrudRepository;
import com.codesquad.airbnb.common.util.CalculatorUtils;
import com.codesquad.airbnb.reservation.domain.Reservation;
import com.codesquad.airbnb.reservation.domain.ReservationCrudRepository;
import com.codesquad.airbnb.reservation.web.dto.ReservationDetailDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationPriceRequestDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationListResponseDto;
import com.codesquad.airbnb.reservation.web.dto.ReservationRequestDto;
import com.codesquad.airbnb.user.domain.User;
import com.codesquad.airbnb.user.domain.UserCrudRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class ReservationService {

    private final ReservationCrudRepository reservationCrudRepository;
    private final AccommodationCrudRepository accommodationCrudRepository;
    private final UserCrudRepository userCrudRepository;

    public List<ReservationListResponseDto> findAllByUserId(Long userId) {
        return reservationCrudRepository.findByUserId(userId)
                .stream()
                .map(ReservationListResponseDto::new)
                .collect(Collectors.toList());
    }

    @Transactional
    public long makeReservation(long userId, ReservationRequestDto dto) {
        long accommodationId = dto.getAccommodationId();

        Accommodation accommodation = findAccommodationById(accommodationId);

        User user = userCrudRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 존재하지 않습니다."));

        LocalDate checkInDate = dto.getCheckInDate();
        LocalDate checkOutDate = dto.getCheckOutDate();
        int countOfGuest = dto.getCountOfGuest();
        int nights = CalculatorUtils.calculateNights(checkInDate, checkOutDate);

        Reservation reservation = Reservation.builder()
                .accommodation(accommodation)
                .checkInDate(checkInDate)
                .checkOutDate(checkOutDate)
                .countOfGuest(countOfGuest)
                .fee(accommodation.calculateTotalFee(nights))
                .user(user)
                .build();

        return reservationCrudRepository.save(reservation).getId();
    }

    private Accommodation findAccommodationById(long accommodationId) {
        return accommodationCrudRepository.findById(accommodationId)
                .orElseThrow(() -> new IllegalArgumentException("해당 숙소가 존재하지 않습니다."));
    }

    public ReservationDetailDto findById(long reservationId) {
        Reservation reservation = reservationCrudRepository.findById(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("해당 예약이 존재하지 않습니다."));

        return new ReservationDetailDto(reservation);
    }

    public ReservationPriceResponseDto getReservationInformation(long accommodationId, ReservationPriceRequestDto dto) {
        Accommodation accommodation = findAccommodationById(accommodationId);
        LocalDate checkInDate = dto.getCheckInDate();
        LocalDate checkOutDate = dto.getCheckOutDate();
        int nights = CalculatorUtils.calculateNights(checkInDate, checkOutDate);

        return new ReservationPriceResponseDto(accommodation, nights);
    }
}
