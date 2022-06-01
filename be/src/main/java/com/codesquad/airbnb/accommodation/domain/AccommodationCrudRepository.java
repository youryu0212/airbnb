package com.codesquad.airbnb.accommodation.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AccommodationCrudRepository extends JpaRepository<Accommodation, Long> {
}
