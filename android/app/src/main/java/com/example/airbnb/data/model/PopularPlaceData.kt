package com.example.airbnb.data.model

sealed class PopularPlaceData {
    data class PopularPlaceExplain(val explain: String) : PopularPlaceData()
    data class PopularPlaceDetail(val placeName: String, val image: String, val distance: String) :
        PopularPlaceData()
}