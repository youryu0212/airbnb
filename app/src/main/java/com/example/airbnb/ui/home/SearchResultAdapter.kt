package com.example.airbnb.ui.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.airbnb.databinding.ItemSearchResultDestinationBinding
import com.example.airbnb.domain.model.SearchResultDestination

class SearchResultAdapter : RecyclerView.Adapter<SearchResultAdapter.ViewHolder>() {

    private var searchResultDestinations = mutableListOf<SearchResultDestination>()
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return ViewHolder(ItemSearchResultDestinationBinding.inflate(inflater, parent, false))
    }

    override fun onBindViewHolder(holder: SearchResultAdapter.ViewHolder, position: Int) {
        holder.bind(searchResultDestinations[position])
    }

    override fun getItemCount(): Int {
        return searchResultDestinations.size
    }

    class ViewHolder(private val binding: ItemSearchResultDestinationBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(destination: SearchResultDestination) {
            binding.destination = destination
            binding.executePendingBindings()
        }
    }

    fun submitSearchResultDestinations(destinations: List<SearchResultDestination>) {
        this.searchResultDestinations= destinations.toMutableList()
        notifyDataSetChanged()
    }
}