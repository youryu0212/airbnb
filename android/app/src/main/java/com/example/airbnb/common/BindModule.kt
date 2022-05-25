package com.example.airbnb.common

import com.example.airbnb.data.repository.DataSource
import com.example.airbnb.data.repository.DataSourceImpl
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
abstract class BindModule {

    @Binds
    abstract fun bindRepository(dataSourceImpl: DataSourceImpl): DataSource
}