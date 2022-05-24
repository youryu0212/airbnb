package com.example.airbnb.dto

import com.example.airbnb.model.City
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class HomeContentDTO(
    @SerialName("cities")
    val cities: List<City>?
) {
    @Serializable
    data class City(
        @SerialName("cityName")
        val cityName: String?,
        @SerialName("coord")
        val coord: Coord?,
        @SerialName("image")
        val image: String?
    )

    @Serializable
    data class Coord(
        @SerialName("latitude")
        val latitude: Double?,
        @SerialName("longitude")
        val longitude: Double?
    )
}

fun HomeContentDTO.toCity(): List<City> {
    val cities = requireNotNull(cities)

    val cityList = mutableListOf<City>()

    cities.forEach { homeContentDTO ->
        val cityName = requireNotNull(homeContentDTO.cityName)
        val image = homeContentDTO.image.orEmpty()
        val latitude = homeContentDTO.coord?.latitude ?: 0.0
        val longitude = homeContentDTO.coord?.longitude ?: 0.0

        val city = City(
            cityName = cityName,
            image = image,
            currentCoordinate = City.Coordinate(latitude, longitude)
        )
        cityList.add(city)
    }
    return cityList
}
