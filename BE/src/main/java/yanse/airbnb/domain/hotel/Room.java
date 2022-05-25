package yanse.airbnb.domain.hotel;


import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
public class Room {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "room_id")
	private Long id;

	@Column(nullable = false)
	private int totalRoom;

	@Column(nullable = false)
	private int price;

	@Column(length = 100, nullable = false)
	private String name;

	@Column(columnDefinition = "TEXT")
	private String description;

	private double stars;

	private int review;

	private String imageUrl;

	@Embedded
	private Address address;

	@Embedded
	private RoomInfo roomInfo;

}
