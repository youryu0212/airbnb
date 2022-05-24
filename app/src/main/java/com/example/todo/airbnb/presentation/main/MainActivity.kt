package com.example.todo.airbnb.presentation.main

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.todo.airbnb.presentation.main.components.MainScreen
import com.example.todo.airbnb.ui.theme.AirbnbTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            AirbnbTheme()
        }
    }
}

@Composable
fun AirbnbTheme() {
    AirbnbTheme {
        Surface(modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colors.background) {
            MainScreen()
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    AirbnbTheme {
        MainScreen()
    }
}