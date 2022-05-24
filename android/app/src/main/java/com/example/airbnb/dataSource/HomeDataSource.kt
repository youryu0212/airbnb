package com.example.airbnb.dataSource

import com.example.airbnb.dto.HomeContentDTO

interface HomeDataSource {

    suspend fun getHomeContents(): HomeContentDTO

}