package com.example.airbnb.dataSource

import com.example.airbnb.dto.HomeContentDTO
import com.example.airbnb.dto.toCity
import com.example.airbnb.model.City
import com.example.airbnb.network.HomeApi
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class HomeDataImpl @Inject constructor(private val api: HomeApi): HomeDataSource {

    override suspend fun getHomeContents(): HomeContentDTO = api.getHomeContents()

}