package com.example.airbnb.dataSource

import android.util.Log
import com.example.airbnb.dto.HomeContentDTO
import com.example.airbnb.network.HomeApi
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class HomeDataImpl @Inject constructor(private val api: HomeApi): HomeDataSource {

    override suspend fun getHomeContents(): Flow<HomeContentDTO> {
        val result = api.getHomeContents()
        Log.d("datasource", result.cities?.size.toString())

        return flow { emit(result) }
    }

}