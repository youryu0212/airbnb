package project.airbnb.wishlist;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WishController {

    private WishService wishlistService;

    public WishController(WishService wishlistService) {
        this.wishlistService = wishlistService;
    }

    @GetMapping("/api/wishlist")
    public WishDto findWishlist() {
        return wishlistService.findWishlist();
    }
}
