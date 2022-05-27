package com.example.airbnb

import android.widget.ImageView
import androidx.databinding.BindingAdapter
import coil.api.load
import coil.transform.RoundedCornersTransformation

@BindingAdapter("imageUrl")
fun setImage(view: ImageView, imageUrl: String?) {
    if (!imageUrl.isNullOrEmpty()) {
        view.load(imageUrl) {
            transformations(RoundedCornersTransformation())
        }
    }
}
