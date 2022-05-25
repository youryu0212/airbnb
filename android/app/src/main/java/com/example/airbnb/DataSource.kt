package com.example.airbnb

interface DataSource {

    suspend fun loadHeroImage(): HeroImage?
}