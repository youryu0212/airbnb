package com.example.airbnb

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.airbnb.data.model.PlaceData
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.debounce
import kotlinx.coroutines.launch

class PlaceSearchViewModel : ViewModel() {
    private val _searchWord = MutableSharedFlow<String>()
    val searchWord = _searchWord.debounce { 400 }

    private val _popularPlaceList = MutableStateFlow<List<PlaceData>?>(null)

    private val _popularPlaceExplain = MutableStateFlow<String?>(null)
    val popularPlaceExplain: StateFlow<String?> = _popularPlaceExplain

    private val _placeList = MutableStateFlow<List<PlaceData>?>(null)
    val placeList: StateFlow<List<PlaceData>?> = _placeList

    fun handleSearchWord(word: String) {
        viewModelScope.launch {
            _searchWord.emit(word)
        }
    }

    fun getPlaceList(word: String) {
        viewModelScope.launch {
            // todo  - get PopularPlace Data From Repository
            // todo  - update _popularPlaceExplain
            // todo  - update _popularPlaceList

            if (word == "") {
                _popularPlaceExplain.emit("근처 인기 여행지")
                if (_popularPlaceList.value == null) {
                    getPopularDummyData()
                }
                _placeList.value = _popularPlaceList.value
            } else {
                // todo  - get SearchPlace Data From Repository
                // todo  - update _placeList
                getSearchDummyData(word)
            }
        }
    }

    private suspend fun getSearchDummyData(word: String) {

        val data1 = PlaceData.SearchPlaceData("${word}1")
        val data2 = PlaceData.SearchPlaceData("${word}2")
        val data3 = PlaceData.SearchPlaceData("${word}3")
        val data4 = PlaceData.SearchPlaceData("${word}4")

        _popularPlaceExplain.emit(null)
        _placeList.value = listOf(data1, data2, data3, data4)
    }

    private suspend fun getPopularDummyData() {
        val image1 =
            "https://s3-alpha-sig.figma.com/img/4ee4/e169/870b792e3a4ae88671095fad825a8ef0?Expires=1654473600&Signature=TQ8Um2PqB135YjD9Nk4L51PJC5kzSV5lsp5oY9n-Y9QHAKzzW4zIrKXIEOjG5IeJUOYG-r3zS2uaWhLlkgDaDT-b5abY~BYGmBetze1xhXIgAWhdiVaYLvosEvFIFfD4RheMMFbCllOX9TgSwJo7FNv8Xv36Y24aGqTSmoaQBYjNzvnY55TgsbGOdAkTNppXZH6Wl1FgT5VuEUerqbfoQ4nqgntyY~P4ZWP7NydW5ksOzv-Wo1aJRm3sxgg~qB7KHeqYfKBxPSGtD4jF4Idozxiyzd~ipWVXLxIXC5xDgR~qGQF~xj2hs7T9JqpX2SbEYCA5ybVLKeGyf41k7o60Qg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
        val image2 =
            "https://s3-alpha-sig.figma.com/img/d11b/fafa/041959faaab5d3d5bd0c98fc56ab6feb?Expires=1654473600&Signature=AIKFWnJfXVMOoFp70Jjbb0liJ8DejemAdMt2sQZFjqeGYqIRY4Y7mGseDcC5b8do8EFRh97Foy-~6gcdyrFefsEIBb06~yV8cQbIcK~sZ1QXu9HobheuNzP-N0~icBA47~qN6KCxUhiDz4lsymM9y41pdeFDAiFPIDqVrkvhNpggFTLsWDgcBe7mjRT6XVe15YYu0oK3yBG57cvDarIDfq4AhH-8fl2Sprk4k2AC3Ia58A9k5kd30Oqy0VbIi6B5Ztclgxjt~2ScmGtRDMJi7g1uwR9kqWyIKtljgPriKKJcC6oUOQjGnb-aWwkBHVY3NcOK9BNH~XxLi-O375akGQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
        val data1 = PlaceData.PopularPlaceData("서울", image1, "차로 30분거리")
        val data2 = PlaceData.PopularPlaceData("광주", image2, "차로 30분거리")

        _popularPlaceList.value = listOf(data1, data2)
        _placeList.value = _popularPlaceList.value
    }


}