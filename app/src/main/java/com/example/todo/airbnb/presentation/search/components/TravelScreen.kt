package com.example.todo.airbnb.presentation.search.components

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import com.example.todo.airbnb.R
import com.example.todo.airbnb.data.Travel
import com.example.todo.airbnb.presentation.search.SearchViewModel

@Composable
fun TravelScreen(viewModel: SearchViewModel) {
    val scrollState = rememberLazyListState()
    val travelLocations = viewModel.travelLocation.collectAsState().value

    Column(
        modifier = Modifier.padding(start = 16.dp, end = 16.dp)
    ) {
        Text(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 32.dp, bottom = 24.dp),
            text = "가까운 여행지 둘러보기",
            style = MaterialTheme.typography.h6
        )

        LazyRow(state = scrollState) {
            itemsIndexed(travelLocations) { index, location ->
                Column(modifier = Modifier.padding(end = 16.dp)) {
                    if (index % 2 == 0) {
                        Row {
                            ImageScreen(location)
                            Spacer(modifier = Modifier.width(16.dp))
                            Column {
                                Text(
                                    text = location.name,
                                    style = MaterialTheme.typography.h6
                                )
                                Spacer(modifier = Modifier.width(4.dp))
                                Text(
                                    text = location.time,
                                    style = MaterialTheme.typography.body1
                                )
                            }
                        }
                        if (index + 1 < travelLocations.size) {
                            Row {
                                ImageScreen(location)
                                Spacer(modifier = Modifier.width(16.dp))
                                Column {
                                    Text(
                                        text = travelLocations[index + 1].name,
                                        style = MaterialTheme.typography.h6
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text(
                                        text = travelLocations[index + 1].time,
                                        style = MaterialTheme.typography.body1
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun ImageScreen(travel: Travel) {
    Image(
        modifier = Modifier
            .clip(RoundedCornerShape(10.dp))
            .width(70.dp)
            .height(70.dp),
        painter = painterResource(id = R.drawable.ic_loading),
        contentDescription = "travel image",
        contentScale = ContentScale.Crop
    )
}