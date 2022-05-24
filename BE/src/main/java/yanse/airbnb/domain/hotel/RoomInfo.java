package yanse.airbnb.domain.hotel;

import javax.persistence.Embeddable;

@Embeddable
public class RoomInfo {

	private String roomType;
	private String room;
	private int peopleCount;
	private int bedCount;
	private int bathroomCount;
}
