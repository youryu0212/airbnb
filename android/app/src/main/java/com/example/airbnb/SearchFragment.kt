package com.example.airbnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.databinding.DataBindingUtil
import androidx.navigation.fragment.findNavController
import com.example.airbnb.databinding.FragmentSearchBinding

class SearchFragment : Fragment() {

    lateinit var binding: FragmentSearchBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = DataBindingUtil.inflate(inflater, R.layout.fragment_search, container, false)

        // 추후 스타크가 정의한 버튼으로 대체할 예정입니다.
        binding.btnTemp.setOnClickListener {
            findNavController().navigate(SearchFragmentDirections.actionSearchFragmentToPlaceSearchFragment())
        }

        return binding.root
    }
}