package com.example.airbnb.dto

import com.example.airbnb.model.City
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class CityDto(
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

fun CityDto.toCity(): List<City> {
    val cities = requireNotNull(cities)

    val cityList = mutableListOf<City>()

    cities.forEach { cityDto ->
        val cityName = requireNotNull(cityDto.cityName)
        val image = cityDto.image.orEmpty()
        val latitude = cityDto.coord?.latitude ?: 0.0
        val longitude = cityDto.coord?.longitude ?: 0.0

        val city = City(
            cityName = cityName,
            image = image,
            currentCoordinate = City.Coordinate(latitude, longitude)
        )
        cityList.add(city)
    }
    return cityList
}
