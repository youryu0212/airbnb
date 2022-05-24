package com.example.airbnb.dataSource

import com.example.airbnb.dto.HomeContentDTO
import kotlinx.coroutines.flow.Flow

interface HomeDataSource {

    suspend fun getHomeContents(): Flow<HomeContentDTO>

}