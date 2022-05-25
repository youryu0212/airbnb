package com.example.todo.airbnb.presentation.search.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import coil.annotation.ExperimentalCoilApi
import com.example.todo.airbnb.presentation.search.SearchViewModel
import com.example.todo.airbnb.presentation.search.SearchWidgetState

@ExperimentalCoilApi
@Composable
fun SearchScreen(viewModel: SearchViewModel) {
    val searchWidgetState by viewModel.searchWidgetState
    when(searchWidgetState) {
        is SearchWidgetState.CLOSED -> {
            Column(
                modifier = Modifier.verticalScroll(rememberScrollState())
            ) {
                LoadMainImage()
                TravelScreen(viewModel = viewModel)
                // TODO[숙소 리스트]
            }
        }
        is SearchWidgetState.OPEN -> {
            val locations = viewModel.searchLocations.collectAsState().value
            LazyColumn {
                if (!locations.isNullOrEmpty()) {
                    items(locations) { location ->
                        Text(
                            modifier = Modifier.fillMaxSize(),
                            text = location,
                            style = MaterialTheme.typography.h6,
                            color = Color.Black,
                        )
                    }
                }
            }
        }
    }
}