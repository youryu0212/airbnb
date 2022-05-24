package com.example.airbnb.di

import com.example.airbnb.dataSource.HomeDataImpl
import com.example.airbnb.dataSource.HomeDataSource
import com.example.airbnb.repository.HomeRepository
import com.example.airbnb.repository.HomeRepositoryImpl
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class HomeDataModule {

    @Singleton
    @Binds
    abstract fun bindHomeData(
        homeDataImpl: HomeDataImpl
    ): HomeDataSource
}