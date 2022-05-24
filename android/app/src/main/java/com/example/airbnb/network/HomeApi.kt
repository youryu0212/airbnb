package com.example.airbnb.network

import retrofit2.http.GET

interface HomeApi {

    @GET("/api/nearMeCities")
    suspend fun getHomeContents()

}