package team13.kuje.airbnb.repository;


import java.util.List;
import javax.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import team13.kuje.airbnb.domain.Place;
import team13.kuje.airbnb.domain.Position;

@Repository
@RequiredArgsConstructor
public class PlaceRepository {

	private final EntityManager entityManager;


	public List<Place> findByPosition(Position inputPosition) {
		throw new UnsupportedOperationException("PlaceRepository#findByPosition 아직 구현하지 않음 :)");
	}
}
