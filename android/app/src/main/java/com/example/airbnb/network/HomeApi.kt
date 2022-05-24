package com.example.airbnb.network

import com.example.airbnb.dto.HomeContentDTO
import retrofit2.http.GET

interface HomeApi {

    @GET("/api/nearMeCities")
    suspend fun getHomeContents() : HomeContentDTO

}