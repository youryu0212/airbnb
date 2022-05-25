package com.example.airbnb

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.widget.addTextChangedListener
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.lifecycleScope
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.airbnb.databinding.FragmentPlaceSearchBinding
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch


class PlaceSearchFragment : Fragment() {
    private lateinit var binding: FragmentPlaceSearchBinding
    private val adapter = PlaceSearchAdapter()
    private val viewModel: PlaceSearchViewModel by viewModels()
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding =
            DataBindingUtil.inflate(inflater, R.layout.fragment_place_search, container, false)

        listenBackButton()
        setRecyclerView()
        updateAdapter()
        listenSearchWordChange()
        updateSearchWord()
        updateBySearchingWordExist()

        return binding.root
    }

    private fun listenSearchWordChange() {
        binding.etSearchWord.addTextChangedListener {
            viewModel.handleSearchWord(it.toString())
        }
    }

    private fun setRecyclerView() {
        binding.rvSearchPlace.adapter = adapter
        binding.rvSearchPlace.layoutManager =
            LinearLayoutManager(requireContext(), LinearLayoutManager.VERTICAL, false)
        viewModel.getPlaceList("")
    }

    private fun updateSearchWord() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewModel.searchWord.collect {
                viewModel.getPlaceList(it)
            }
        }
    }

    private fun updateAdapter() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewModel.placeList.collect {
                adapter.submitList(it)
            }
        }
    }

    private fun updateBySearchingWordExist() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewModel.popularPlaceExplain.collect {
                binding.btnInitSearchWord.visibility = it?.let {
                    View.INVISIBLE
                } ?: View.VISIBLE

                binding.tvPopularPlaceExplain.visibility =
                    it?.let {
                        binding.tvPopularPlaceExplain.text = it
                        View.VISIBLE
                    } ?: View.GONE
            }
        }
    }


    private fun listenBackButton() {
        binding.btnPlaceSearchBack.setOnClickListener {
            findNavController().navigate(PlaceSearchFragmentDirections.actionPlaceSearchFragmentToSearchFragment())
        }
    }

}
