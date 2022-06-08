package com.codesquad.airbnb.wishlist.web;

import com.codesquad.airbnb.wishlist.service.WishListService;
import com.codesquad.airbnb.wishlist.web.dto.WishListRequestDto;
import com.codesquad.airbnb.wishlist.web.dto.WishListResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/wishlist")
@RestController
public class WishListController {

    private final WishListService wishListService;

    @GetMapping
    public List<WishListResponseDto> showList() {
        /**
         * input: 유저 인증 정보(JWT)를 통해 조회한 user의 id 값
         * output: DB로부터 해당 유저의 wishlist를 불러와서 출력
         * wishlist를 불러올때 각 숙소의 정보는 accommodation 테이블에 조회하여 가져와야 함.
         */
        return null;
    }

    @PostMapping()
    public void addWishList(WishListRequestDto dto) {
        /**
         * 위시리스트 하고자 하는 숙소의 id를 받아서 위시리스트에 추가
         * DB 상에는 위시리스트를 관리하는 테이블을 별도로 둔다.
         * 위시리스트에 등록되면 테이블에 추가되고, 해제하는 경우에 soft deletion을 이용한다.
         * 이미 soft delete된 숙소를 다시 추가하는 경우에는 새 row를 추가할까? 아니면 soft deletion을 해제할까?
         * -> 반복되는 요청으로 인해 dummy data가 쌓이는 걸 방지하려면 전자가 낫다는 생각이 든다.
         */
        wishListService.add(dto.getAccommodationId());
    }

    @DeleteMapping("/{accommodationId}")
    public void deleteWithList(@PathVariable long accommodationId) {
        /**
         * 위시리스트를 해제하고자 하는 숙소의 id를 받아서 DB에서 soft deletion
         */
        wishListService.delete(accommodationId);
    }
}
