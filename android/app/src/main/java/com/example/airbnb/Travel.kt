package com.example.airbnb

import com.google.gson.annotations.SerializedName

data class Travel(
    @SerializedName("closeTravel")
    val closeTravel: List<CloseTravelContents?>
)

data class CloseTravelContents(
    @SerializedName("id")
    val id: Int?,
    @SerializedName("imageUrl")
    val imageUrl: String?,
    @SerializedName("title")
    val title: String?,
    @SerializedName("contents")
    val contents: String?
)
