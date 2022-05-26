package team13.kuje.airbnb.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import team13.kuje.airbnb.domain.Position;

@Service
@RequiredArgsConstructor
public class PlaceService {

	private final PlaceRepository placeRepository;

	public List<PlaceDto> findByPosition(String tag, String lat, String lng) {
		validateTag(tag);

		Position position = new Position(lat, lng);



		return null;
	}

	private void validateTag(String tag) {
		if (tag.equals("map")) {
			return;
		}
		throw new IllegalArgumentException("유효하지 않은 category_tag 입니다.");
	}
}
