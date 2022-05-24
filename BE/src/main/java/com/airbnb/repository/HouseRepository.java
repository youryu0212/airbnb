package com.airbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.airbnb.domain.House;

public interface HouseRepository extends JpaRepository<House, Long> {

}
