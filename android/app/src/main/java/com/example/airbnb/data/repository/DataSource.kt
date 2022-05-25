package com.example.airbnb.data.repository

import com.example.airbnb.network.dto.HeroImage
import com.example.airbnb.network.dto.Travel

interface DataSource {

    suspend fun loadHeroImage(): HeroImage?

    suspend fun loadCloseTravel(): Travel?
}