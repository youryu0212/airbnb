package com.example.airbnb.data.repository

import com.example.airbnb.network.dto.HeroImage
import com.example.airbnb.network.dto.Travel
import javax.inject.Inject

class Repository @Inject constructor(private val dataSource: DataSource){

    suspend fun loadHeroImage(): HeroImage? {
        return dataSource.loadHeroImage()
    }

    suspend fun loadCloseTravel(): Travel? {
        return dataSource.loadCloseTravel()
    }
}