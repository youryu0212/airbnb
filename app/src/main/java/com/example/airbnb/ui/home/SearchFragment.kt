package com.example.airbnb.ui.home

import android.content.res.ColorStateList
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import com.example.airbnb.R
import com.example.airbnb.databinding.FragmentSearchBinding
import com.example.airbnb.domain.model.NearDestination
import com.example.airbnb.domain.model.SearchResultDestination
import com.google.android.material.textfield.TextInputLayout.END_ICON_CLEAR_TEXT
import com.google.android.material.textfield.TextInputLayout.END_ICON_CUSTOM

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
        val searchAdapter= SearchResultAdapter()
        binding.rvSearchNearTravelDestination.adapter= adapter
        binding.rvSearchResultDestination.adapter= searchAdapter
        adapter.submitNearDestinations(makeDummyNearDestinations())
        addSearchListener(searchAdapter)
    }

    private fun addSearchListener(searchAdapter: SearchResultAdapter) {
        binding.etSearch.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

            override fun afterTextChanged(searchKey: Editable?) {
                if (searchKey.isNullOrEmpty()) {
                    displayNearDestination()
                } else {
                    displaySearchResultDestination()
                    val dummyList = makeDummySearchResultByKeyword(searchKey.toString())
                    searchAdapter.submitSearchResultDestinations(dummyList)
                }
            }
        })
    }

    private fun makeDummySearchResultByKeyword(keyword:String):List<SearchResultDestination>{
        val cityList=  mutableListOf<SearchResultDestination>()
        for(i in 0 .. 10 ){
            cityList.add(SearchResultDestination(keyword))
        }
        return cityList
    }

    private fun makeDummyNearDestinations():List<NearDestination>{
        val cityList=  mutableListOf<NearDestination>()
        for(i in 0 .. 10){
            cityList.add(NearDestination("imageUrl","서울", "차로30분"))
        }
        return cityList
    }

    private fun displayNearDestination(){
        binding.clSearchNearTravelDestination.visibility= View.VISIBLE
        binding.rvSearchResultDestination.visibility= View.GONE
        binding.etlSearch.setEndIconDrawable(R.drawable.ic_search)
        binding.etlSearch.endIconMode= END_ICON_CUSTOM
        binding.etlSearch.setEndIconTintList(ColorStateList.valueOf(ContextCompat.getColor(requireContext(),R.color.pink)))
    }

    private fun displaySearchResultDestination(){
        binding.clSearchNearTravelDestination.visibility= View.GONE
        binding.rvSearchResultDestination.visibility= View.VISIBLE
        binding.etlSearch.setEndIconDrawable(R.drawable.ic_clear)
        binding.executePendingBindings()
        binding.etlSearch.endIconMode= END_ICON_CLEAR_TEXT
        binding.etlSearch.setEndIconTintList(ColorStateList.valueOf(ContextCompat.getColor(requireContext(),R.color.grey1)))
    }

}