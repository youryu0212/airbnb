package com.example.airbnb

import javax.inject.Inject

class Repository @Inject constructor(private val dataSource: DataSource){

    suspend fun loadHeroImage(): HeroImage? {
        return dataSource.loadHeroImage()
    }

    suspend fun loadCloseTravel(): Travel? {
        return dataSource.loadCloseTravel()
    }
}