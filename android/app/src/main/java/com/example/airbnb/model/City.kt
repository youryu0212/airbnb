package com.example.airbnb.model

import com.example.airbnb.dto.HomeContentDTO

data class City (
    val cityName: String,
    val image: String,
    val currentCoordinate: Coordinate
) {
    data class Coordinate(
        val latitude: Double,
        val longitude: Double
    )
}