package team13.kuje.airbnb.controller.model;

import lombok.Getter;
import team13.kuje.airbnb.domain.Place;
import team13.kuje.airbnb.domain.Position;

@Getter
public class PlaceDto {

	private final String title;
	private final String imageUrl;
	private final int time;

	public PlaceDto(Place place, Position inputPosition) {
		title = place.getTitle();
		imageUrl = place.getImageUrl();
		time = place.calculateTime(inputPosition);
	}
}
