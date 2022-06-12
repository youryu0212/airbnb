package com.codesquad.airbnb.wishlist.service;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.AccommodationCrudRepository;
import com.codesquad.airbnb.user.domain.User;
import com.codesquad.airbnb.user.domain.UserCrudRepository;
import com.codesquad.airbnb.wishlist.domain.WishList;
import com.codesquad.airbnb.wishlist.domain.WishListCrudRepository;
import com.codesquad.airbnb.wishlist.web.dto.WishListResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Transactional
@Service
public class WishListService {

    private final WishListCrudRepository wishListCrudRepository;
    private final UserCrudRepository userCrudRepository;
    private final AccommodationCrudRepository accommodationCrudRepository;

    public void add(long userId, long accommodationId) {

        User user = userCrudRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 유저입니다"));

        Accommodation accommodation = accommodationCrudRepository.findById(accommodationId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 숙소입니다"));

        Optional<WishList> wishListOptional = findByUserIdAndAccommodationId(userId, accommodationId);
        if (wishListOptional.isPresent()) {
            WishList wishList = wishListOptional.get();
            if (!wishList.isDeleted()) {
                throw new IllegalArgumentException("이미 위시리스트에 등록되어 있습니다");
            }
            wishList.restore();
            return;
        }

        wishListCrudRepository.save(
                WishList.builder()
                        .user(user)
                        .accommodation(accommodation)
                        .build()
        );
    }

    public void delete(long userId, long accommodationId) {
        WishList wishList = findByUserIdAndAccommodationId(userId, accommodationId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 위시리스트입니다."));

        wishList.delete();
    }

    public List<WishListResponseDto> findAllByUserId(long userId) {
        return wishListCrudRepository.findByUserIdAndDeleted(userId, false)
                .stream()
                .map(WishListResponseDto::new)
                .collect(Collectors.toList());
    }

    private Optional<WishList> findByUserIdAndAccommodationId(long userId, long accommodationId) {
        return wishListCrudRepository.findByUserIdAndAccommodationId(userId, accommodationId);
    }
}
