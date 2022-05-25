package com.example.airbnb.viewmodels

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.airbnb.model.City
import com.example.airbnb.repository.HomeRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class HomeViewModel @Inject constructor(
    private val homeRepository: HomeRepository
) : ViewModel() {

    private val _homeContents:MutableStateFlow<List<City>> = MutableStateFlow(mutableListOf())
    val homeContent: StateFlow<List<City>> = _homeContents.asStateFlow()

    fun loadHomeContents() {
        viewModelScope.launch {
            homeRepository.loadHomeContents().collect { cities ->
                Log.d("viewModel", cities.size.toString())
                _homeContents.value = cities
                Log.d("viewModel", _homeContents.value[0].cityName)
            }
        }
    }
}