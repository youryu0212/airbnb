package com.example.airbnb.ui.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.airbnb.databinding.FragmentSearchBinding
import com.example.airbnb.domain.model.NearDestination
import com.example.airbnb.domain.model.RecommendDestination

class SearchFragment : Fragment() {

    private lateinit var binding: FragmentSearchBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentSearchBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val adapter= NearTravelDestinationAdapter()
        binding.rvSearchNearTravelDestination.adapter= adapter

        val cityList=  mutableListOf<NearDestination>()
        for(i in 0 .. 10){
            cityList.add(NearDestination("imageUrl","서울", "차로30분"))
        }
        adapter.submitNearDestinations(cityList)
    }

}