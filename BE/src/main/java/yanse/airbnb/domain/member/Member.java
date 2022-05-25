package yanse.airbnb.domain.member;

import static javax.persistence.FetchType.LAZY;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import yanse.airbnb.domain.reservation.Reservation;
import yanse.airbnb.domain.wish.WishList;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
public class Member {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Long id;

	@Column(length = 100, nullable = false)
	private String name;

	@Column(length = 100, nullable = false)
	private String email;

	@OneToOne(fetch = LAZY)
	@JoinColumn(name = "wishlist_id")
	private WishList wishList;

	@OneToMany(mappedBy = "member")
	private List<Reservation> reservationList = new ArrayList<>();
}
