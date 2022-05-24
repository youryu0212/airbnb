package com.example.airbnb.ui.home

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import com.example.airbnb.R
import com.example.airbnb.databinding.FragmentHomeBinding
import com.example.airbnb.domain.model.NearDestination
import com.example.airbnb.domain.model.RecommendDestination

class HomeFragment : Fragment() {

    private lateinit var binding:FragmentHomeBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding= DataBindingUtil.inflate(inflater, R.layout.fragment_home, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val adapter= NearTravelDestinationAdapter()
        val rAdapter= RecommendAdapter()
        binding.rvNearTravelDestination.adapter= adapter
        binding.rvRecommendTravelDestination.adapter= rAdapter
        val cityList=  mutableListOf<NearDestination>()
        for(i in 0 .. 10){
            cityList.add(NearDestination("imageUrl","서울", "차로30분"))
        }
        adapter.submitNearDestinations(cityList)
        val recommendCityList= mutableListOf<RecommendDestination>()
        val dummy1= RecommendDestination("imageurl", "자연생활을 만끽할 수\n있는  ")
        val dummy2= RecommendDestination("imageurl", "독특한 공간")
        val dummy3= RecommendDestination("imageurl", "도심속 즐거움")
        recommendCityList.add(dummy1)
        recommendCityList.add(dummy2)
        recommendCityList.add(dummy3)
        rAdapter.submitRecommendDestinations(recommendCityList)
    }

}