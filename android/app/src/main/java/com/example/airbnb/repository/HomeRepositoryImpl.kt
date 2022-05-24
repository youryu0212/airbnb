package com.example.airbnb.repository

import com.example.airbnb.dataSource.HomeDataSource
import com.example.airbnb.dto.toCity
import com.example.airbnb.model.City
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class HomeRepositoryImpl @Inject constructor(private val dataSource: HomeDataSource) :
    HomeRepository {

    override suspend fun loadHomeContents(): List<City> = dataSource.getHomeContents().toCity()

}