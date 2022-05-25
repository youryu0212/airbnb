package com.example.airbnb.network.dto

import com.google.gson.annotations.SerializedName

data class HeroImage(
    @SerializedName("imageUrl")
    val imageUrl: String
)
