package com.team16.airbnb.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyHorizontalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.fragment.app.Fragment
import coil.compose.AsyncImage
import com.team16.airbnb.R
import com.team16.airbnb.data.NearInfo
import com.team16.airbnb.data.lastList
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
            modifier = Modifier.fillMaxSize(),
            contentScale = ContentScale.FillBounds
        )
    }

    @Composable
    fun NearDestination(info: NearInfo) {
        Row(
            modifier = Modifier
                .width(200.dp)
        ) {
            Box(
                modifier = Modifier.size(40.dp, 40.dp)
            ) {
                ImageLoad(image = info.image)
            }
            
            Spacer(modifier = Modifier.width(20.dp))
            Column(modifier = Modifier.size(100.dp, 60.dp)) {
                Text(text = "${info.name}")
                Spacer(modifier = Modifier.height(10.dp))
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

            Spacer(modifier = Modifier.height(60.dp))

            NearTripView(info = list)
            
            Spacer(modifier = Modifier.height(32.dp))
            
            Text(
                text = "어디에서나, 여행은\n살아보는거야",
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp, 0.dp),
                style = TextStyle(
                    color = Airbnb_Black,
                    fontWeight = FontWeight.Bold
                ),
                fontSize = 23.sp
            )
            
            Spacer(modifier = Modifier.height(30.dp))
            
            HomeLastView(info = lastList)
        }
    }

    @Composable
    fun HomeLastView(info: List<NearInfo>) {
        LazyRow(
            modifier = Modifier
                .fillMaxWidth()
                .height(300.dp),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) { 
            items(info) {
                LastViewItem(info = it)
            }
        }
    }

    @Composable
    fun LastViewItem(info: NearInfo) {
        Column(
            modifier = Modifier
                .wrapContentHeight()
                .width(200.dp)
        ) {
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(242 / 294f),
                shape = RoundedCornerShape(15),
                elevation = 30.dp
            ) {
                ImageLoad(image = info.image)
            }
            
            Spacer(modifier = Modifier.height(10.dp))
            
            Text(text = info.title)
            
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