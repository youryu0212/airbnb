package com.example.todo.airbnb.presentation.main.components

import androidx.compose.material.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.navigation.compose.rememberNavController
import coil.annotation.ExperimentalCoilApi
import com.example.todo.airbnb.presentation.search.SearchViewModel
import com.example.todo.airbnb.presentation.search.SearchWidgetState

@ExperimentalCoilApi
@Composable
fun MainScreen(viewModel: SearchViewModel) {

    val navController = rememberNavController()
    val searchWidgetState by viewModel.searchWidgetState
    val searchTextState by viewModel.searchTextState
    Scaffold(
        topBar = {
            MainAppBar(
                searchWidgetState = searchWidgetState,
                searchTextState = searchTextState,
                onTextChange = { viewModel.updateSearchText(newValue = it) },
                onCloseClicked = { viewModel.updateSearchText(newValue = "") },
                onSearchClicked = {},
                onOpenTriggered = { viewModel.updateSearchWidgetState(newValue = SearchWidgetState.OPEN) },
                onCloseTriggered =  { viewModel.updateSearchWidgetState(newValue = SearchWidgetState.CLOSED) },
            )
        },
        bottomBar = { BottomBar(navController) }
    ) {
        BottomNavGraph(navController, viewModel)
    }
}