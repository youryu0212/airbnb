package com.example.airbnb.repository

import com.example.airbnb.model.City

interface HomeRepository {

    suspend fun loadHomeContents(): List<City>

}