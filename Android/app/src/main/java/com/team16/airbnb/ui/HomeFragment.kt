package com.team16.airbnb.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.fragment.app.Fragment
import com.team16.airbnb.R
import com.team16.airbnb.databinding.FragmentHomeBinding
import com.team16.airbnb.ui.theme.AirbnbTheme
import com.team16.airbnb.ui.theme.Airbnb_Primary
import com.team16.airbnb.ui.theme.Off_White


class HomeFragment : Fragment() {

    private val binding: FragmentHomeBinding by lazy {
        FragmentHomeBinding.inflate(layoutInflater)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding.composeViewInHome.apply {
            setViewCompositionStrategy(ViewCompositionStrategy.DisposeOnViewTreeLifecycleDestroyed)
            setContent {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {

                }
            }
        }
        return binding.root
    }

    @Composable
    fun HomeView() {
        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text("어디로 여행하세요?")
                            },
                    actions = {
                        IconButton(
                            onClick = { /*TODO*/ }
                        ) {
                            Icon(
                                painter = painterResource(
                                    id = R.drawable.ic_search_select
                                ),
                                contentDescription = "search icon",
                                tint = Airbnb_Primary
                            )
                        }
                    },
                    backgroundColor = Off_White,

                )
            }
        ) {
            ScrollBoxes()
        }
    }

    @Composable
    fun ScrollBoxes() {
        Column(
            modifier = Modifier
                .background(Color.LightGray)
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
        ) {
            repeat(10) {
                Text("icon $it")
            }
        }
    }

    @Preview(showBackground = true)
    @Composable
    fun DefaultPreview() {
        AirbnbTheme {
            Column(
                modifier = Modifier.fillMaxSize()
            ) {
                HomeView()
            }
        }
    }


}