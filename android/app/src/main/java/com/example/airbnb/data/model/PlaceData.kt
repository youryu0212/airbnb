package com.example.airbnb.data.model

sealed class PlaceData {
    data class SearchPlaceData(val placeName: String, val image: String? = null) : PlaceData()
    data class PopularPlaceData(val placeName: String, val image: String, val distance: String) :
        PlaceData()
}