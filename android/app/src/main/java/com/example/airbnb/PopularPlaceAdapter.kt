package com.example.airbnb

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.airbnb.data.model.PopularPlaceData
import com.example.airbnb.databinding.ItemPopularDetailBinding
import com.example.airbnb.databinding.ItemPopularExplainBinding

private const val VIEW_TYPE_EXPLAIN = 1
private const val VIEW_TYPE_DETAIL = 2

class PopularPlaceAdapter :
    ListAdapter<PopularPlaceData, RecyclerView.ViewHolder>(
        diffUtil
    ) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        when (viewType) {
            VIEW_TYPE_EXPLAIN -> {
                val binding: ItemPopularExplainBinding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.context),
                    R.layout.item_popular_explain,
                    parent,
                    false
                )
                return PopularPlaceExplainViewHolder(binding)
            }
            VIEW_TYPE_DETAIL -> {
                val binding: ItemPopularDetailBinding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.context),
                    R.layout.item_popular_detail,
                    parent,
                    false
                )
                return PopularPlaceDetailViewHolder(binding)
            }
            else -> error("viewType 을 찾을 수 없습니다.")
        }
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        when (holder) {
            is PopularPlaceExplainViewHolder -> {
                holder.bind(getItem(position) as PopularPlaceData.PopularPlaceExplain)
            }
            is PopularPlaceDetailViewHolder -> {
                holder.bind(getItem(position) as PopularPlaceData.PopularPlaceDetail)
            }
        }
    }

    override fun getItemViewType(position: Int): Int {
        return when (getItem(position)) {
            is PopularPlaceData.PopularPlaceExplain -> VIEW_TYPE_EXPLAIN
            is PopularPlaceData.PopularPlaceDetail -> VIEW_TYPE_DETAIL
        }
    }

    class PopularPlaceExplainViewHolder(private val binding: ItemPopularExplainBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(item: PopularPlaceData.PopularPlaceExplain) {

        }
    }

    class PopularPlaceDetailViewHolder(private val binding: ItemPopularDetailBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(item: PopularPlaceData.PopularPlaceDetail) {
            binding.item = item
        }
    }


    companion object {
        val diffUtil = object : DiffUtil.ItemCallback<PopularPlaceData>() {
            override fun areItemsTheSame(
                oldItem: PopularPlaceData,
                newItem: PopularPlaceData
            ): Boolean {
                return when (oldItem) {
                    is PopularPlaceData.PopularPlaceExplain -> {
                        oldItem.explain == (newItem as? PopularPlaceData.PopularPlaceExplain)?.explain ?: false
                    }
                    is PopularPlaceData.PopularPlaceDetail -> {
                        oldItem.placeName == (newItem as? PopularPlaceData.PopularPlaceDetail)?.placeName ?: false
                    }
                }
            }

            override fun areContentsTheSame(
                oldItem: PopularPlaceData,
                newItem: PopularPlaceData
            ): Boolean {
                return oldItem == newItem
            }
        }
    }
}