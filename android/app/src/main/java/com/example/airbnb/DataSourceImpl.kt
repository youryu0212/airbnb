package com.example.airbnb

import com.google.gson.Gson
import javax.inject.Inject

class DataSourceImpl @Inject constructor(private val assetLoader: AssetLoader) : DataSource {

    private val gson = Gson()

    override suspend fun loadHeroImage(): HeroImage? {
        return assetLoader.getJsonString("heroImage.json")?.let { heroImageString ->
            gson.fromJson(heroImageString, HeroImage::class.java)
        }
    }
}