package com.example.todo.airbnb.presentation.search

sealed class SearchWidgetState {
    object OPEN : SearchWidgetState()
    object CLOSED : SearchWidgetState()
}