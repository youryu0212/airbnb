package com.example.airbnb.repository

import android.util.Log
import com.example.airbnb.dataSource.HomeDataSource
import com.example.airbnb.dto.toCity
import com.example.airbnb.model.City
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.flow.*
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class HomeRepositoryImpl @Inject constructor(private val dataSource: HomeDataSource) :
    HomeRepository {

    override suspend fun loadHomeContents(): Flow<List<City>> {
        lateinit var result: List<City>
        dataSource.getHomeContents().collect { homeContentDTO ->
            result = homeContentDTO.toCity()
        }
        return flow { emit(result) }
    }

}