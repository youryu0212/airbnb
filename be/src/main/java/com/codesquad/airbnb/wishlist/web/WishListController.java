package com.codesquad.airbnb.wishlist.web;

import com.codesquad.airbnb.wishlist.service.WishListService;
import com.codesquad.airbnb.wishlist.web.dto.WishListRequestDto;
import com.codesquad.airbnb.wishlist.web.dto.WishListResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/wishlist")
@RestController
public class WishListController {

    private static final String USER_ID = "USER_ID";

    private final WishListService wishListService;

    @GetMapping
    public List<WishListResponseDto> showList(HttpServletRequest request) {
        Long userId = getUserId(request);
        return wishListService.findAllByUserId(userId);
    }

    @PostMapping()
    public void addWishList(HttpServletRequest request, @RequestBody WishListRequestDto dto) {
        Long userId = getUserId(request);
        wishListService.add(userId, dto.getAccommodationId());
    }

    @DeleteMapping("/{accommodationId}")
    public void deleteWithList(HttpServletRequest request, @PathVariable long accommodationId) {
        Long userId = getUserId(request);
        wishListService.delete(userId, accommodationId);
    }

    private Long getUserId(HttpServletRequest request) {
        return (Long) request.getAttribute(USER_ID);
    }
}
