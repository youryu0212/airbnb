package com.example.airbnb

import com.google.gson.annotations.SerializedName

data class HeroImage(
    @SerializedName("imageUrl")
    val imageUrl: String
)
