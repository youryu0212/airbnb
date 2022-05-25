package com.example.todo.airbnb.presentation.search

import androidx.compose.runtime.MutableState
import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import com.example.todo.airbnb.data.Travel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class SearchViewModel : ViewModel() {

    private val _searchWidgetState: MutableState<SearchWidgetState> =
        mutableStateOf(SearchWidgetState.CLOSED)
    val searchWidgetState: State<SearchWidgetState> = _searchWidgetState

    private val _searchTextState: MutableState<String> = mutableStateOf(value = "")
    val searchTextState: State<String> = _searchTextState

    private val _searchLocations = MutableStateFlow<List<String>>(emptyList())
    val searchLocations: StateFlow<List<String>> = _searchLocations.asStateFlow()

    private val _travelLocations = MutableStateFlow<List<Travel>>(emptyList())
    val travelLocation: StateFlow<List<Travel>> = _travelLocations.asStateFlow()

    private val locations = listOf(
        "양재동, 서초구, 서울특별시",
        "양재역 사거리, 양재1동",
        "서울특별시 양재2동 시민의숲앞",
        "서울특별시 양재2동 양재 IC",
        "강릉시, 강원도",
        "대전광역시 서구",
        "대전광역시 중구",
        "대전광역시 동구",
        "경기도 수원시"
    )

    private val travelList = listOf(
        Travel("", "서울", "차로 30분 거리"),
        Travel("", "광주", "차로 4시간 거리"),
        Travel("", "의정부", "차로 30분 거리"),
        Travel("", "수원", "차로 45분 거리"),
        Travel("", "대구", "차로 3.5시간 거리"),
        Travel("", "울산", "차로 4.5시간 거리"),
        Travel("", "대전", "차로 2시간 거리"),
        Travel("", "부천", "차로 30분 거리"),
    )

    init {
        getTravelLocations()
        getSearchWord("양재")
    }

    fun updateSearchWidgetState(newValue: SearchWidgetState) {
        _searchWidgetState.value = newValue
    }

    fun updateSearchText(newValue: String) {
        _searchTextState.value = newValue
    }

    private fun getSearchWord(searchWord: String) {
        val searchList = locations.filter { it.contains(searchWord) }
        _searchLocations.value = searchList
    }

    private fun getTravelLocations() {
        _travelLocations.value = travelList.toList()
    }
}