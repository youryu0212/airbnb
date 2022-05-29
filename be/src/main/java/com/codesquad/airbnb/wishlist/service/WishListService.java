package com.codesquad.airbnb.wishlist.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WishListService {

    public void add(long accommodationId) {
        /**
         * 유저 정보, 숙소 정보를 통해 위시리스트 DB에 저장
         */
    }

    public void delete(long accommodationId) {
        /**
         * 유저 정보, 숙소 정보를 통해 DB에서 soft delete
         */
    }
}
