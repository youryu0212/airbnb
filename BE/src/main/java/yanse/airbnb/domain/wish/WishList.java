package yanse.airbnb.domain.wish;

import static javax.persistence.FetchType.LAZY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import yanse.airbnb.domain.hotel.Room;
import yanse.airbnb.domain.member.Member;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
public class WishList {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "wishlist_id")
	private Long id;

	@OneToOne(mappedBy = "wishList", fetch = LAZY)
	private Member member;

	@ManyToOne(fetch = LAZY)
	@JoinColumn(name = "room_id")
	private Room room;
}
