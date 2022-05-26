package com.team16.airbnb.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.fragment.app.Fragment
import coil.compose.AsyncImage
import coil.compose.SubcomposeAsyncImage
import com.team16.airbnb.R
import com.team16.airbnb.data.NearInfo
import com.team16.airbnb.data.list
import com.team16.airbnb.databinding.FragmentHomeBinding
import com.team16.airbnb.ui.theme.AirbnbTheme
import com.team16.airbnb.ui.theme.Airbnb_Black
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
                    HomeView()
                }
            }
        }
        return binding.root
    }

    @Composable
    fun HomeView() {
        Scaffold(
            topBar = {
                HomeAppbar()
            }
        ) {
            ScrollBoxes()
        }
    }

    @Composable
    fun HomeAppbar() {
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

    @Composable
    fun NearTripView(info: List<NearInfo>) {
        LazyHorizontalGrid(
            rows = GridCells.Fixed(2),
            modifier = Modifier
                .height(200.dp)
                .fillMaxWidth()
        ) {
            items(info) { info ->
                NearDestination(info = info)
            }
        }
    }

    @Composable
    fun ImageLoad(image: String) {
        AsyncImage(
            model = image,
            contentDescription = "image",
        )
    }

    @Composable
    fun NearDestination(info: NearInfo) {
        Row(
            modifier = Modifier
                .width(200.dp)
                .aspectRatio(1 / 1f)
        ) {
            Box (
                modifier = Modifier.size(width = 60.dp, height = 60.dp)
                    ){
                ImageLoad(image = info.image)
            }
            Box(
                modifier = Modifier.size(width = 60.dp, height = 60.dp)
            ) {
                Text("${info.distance}")
            }

        }

    }

    @Composable
    fun ScrollBoxes() {
        Column(
            modifier = Modifier
                .background(Color.White)
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
        ) {

            Image(
                painter = painterResource(id = R.drawable.hero_image),
                contentDescription = "hero_image",
                modifier = Modifier.fillMaxWidth()
            )

            Spacer(modifier = Modifier.height(32.dp))

            Text(
                text = "가까운 여행지 둘러보기",
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp, 0.dp),
                style = TextStyle(
                    color = Airbnb_Black,
                    fontWeight = FontWeight.Bold
                ),
                fontSize = 23.sp
            )

            Spacer(modifier = Modifier.height(120.dp))

            NearTripView(info = list)
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