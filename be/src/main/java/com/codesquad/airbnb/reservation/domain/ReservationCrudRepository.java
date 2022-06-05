package com.codesquad.airbnb.reservation.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReservationCrudRepository extends JpaRepository<Reservation, Long> {

    List<Reservation> findByUserId(Long userId);
}

