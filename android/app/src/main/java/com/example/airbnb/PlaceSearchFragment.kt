package com.example.airbnb

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.airbnb.data.model.PopularPlaceData
import com.example.airbnb.databinding.FragmentPlaceSearchBinding

class PlaceSearchFragment : Fragment() {
    private lateinit var binding: FragmentPlaceSearchBinding
    private val adapter: PopularPlaceAdapter = PopularPlaceAdapter()
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding =
            DataBindingUtil.inflate(inflater, R.layout.fragment_place_search, container, false)

        listenBackButton()
        setRecyclerView()




        return binding.root
    }

    private fun setRecyclerView() {
        binding.rvSearchPlace.adapter = adapter
        binding.rvSearchPlace.layoutManager =
            LinearLayoutManager(requireContext(), LinearLayoutManager.VERTICAL, false)
        setDummyOnAdapter()
    }

    private fun setDummyOnAdapter() {
        val image1 =
            "https://s3-alpha-sig.figma.com/img/4ee4/e169/870b792e3a4ae88671095fad825a8ef0?Expires=1654473600&Signature=TQ8Um2PqB135YjD9Nk4L51PJC5kzSV5lsp5oY9n-Y9QHAKzzW4zIrKXIEOjG5IeJUOYG-r3zS2uaWhLlkgDaDT-b5abY~BYGmBetze1xhXIgAWhdiVaYLvosEvFIFfD4RheMMFbCllOX9TgSwJo7FNv8Xv36Y24aGqTSmoaQBYjNzvnY55TgsbGOdAkTNppXZH6Wl1FgT5VuEUerqbfoQ4nqgntyY~P4ZWP7NydW5ksOzv-Wo1aJRm3sxgg~qB7KHeqYfKBxPSGtD4jF4Idozxiyzd~ipWVXLxIXC5xDgR~qGQF~xj2hs7T9JqpX2SbEYCA5ybVLKeGyf41k7o60Qg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
        val image2 =
            "https://s3-alpha-sig.figma.com/img/d11b/fafa/041959faaab5d3d5bd0c98fc56ab6feb?Expires=1654473600&Signature=AIKFWnJfXVMOoFp70Jjbb0liJ8DejemAdMt2sQZFjqeGYqIRY4Y7mGseDcC5b8do8EFRh97Foy-~6gcdyrFefsEIBb06~yV8cQbIcK~sZ1QXu9HobheuNzP-N0~icBA47~qN6KCxUhiDz4lsymM9y41pdeFDAiFPIDqVrkvhNpggFTLsWDgcBe7mjRT6XVe15YYu0oK3yBG57cvDarIDfq4AhH-8fl2Sprk4k2AC3Ia58A9k5kd30Oqy0VbIi6B5Ztclgxjt~2ScmGtRDMJi7g1uwR9kqWyIKtljgPriKKJcC6oUOQjGnb-aWwkBHVY3NcOK9BNH~XxLi-O375akGQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
        val data1 = PopularPlaceData.PopularPlaceDetail("서울", image1, "차로 30분거리")
        val data2 = PopularPlaceData.PopularPlaceDetail("광주", image2, "차로 30분거리")
        adapter.submitList(listOf(PopularPlaceData.PopularPlaceExplain("근처의 인기 여행지"), data1, data2))
        Log.d("TAG" ,adapter.itemCount.toString())
    }

    private fun listenBackButton() {
        binding.btnPlaceSearchBack.setOnClickListener {
            findNavController().navigate(PlaceSearchFragmentDirections.actionPlaceSearchFragmentToSearchFragment())
        }
    }

}