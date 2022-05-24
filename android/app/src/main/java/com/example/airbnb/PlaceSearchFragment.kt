package com.example.airbnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.navigation.fragment.findNavController
import com.example.airbnb.databinding.FragmentPlaceSearchBinding

class PlaceSearchFragment : Fragment() {
    private lateinit var binding: FragmentPlaceSearchBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        binding =
            DataBindingUtil.inflate(inflater, R.layout.fragment_place_search, container, false)

        listenBackButton()
        
        return binding.root
    }

    private fun listenBackButton() {
        binding.btnPlaceSearchBack.setOnClickListener {
            findNavController().navigate(PlaceSearchFragmentDirections.actionPlaceSearchFragmentToSearchFragment())
        }
    }

}