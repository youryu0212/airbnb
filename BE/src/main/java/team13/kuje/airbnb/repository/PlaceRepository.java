package team13.kuje.airbnb.repository;


import java.util.List;
import javax.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import team13.kuje.airbnb.domain.Place;

@Repository
@RequiredArgsConstructor
public class PlaceRepository {

	private final EntityManager entityManager;

	public List<Place> findAll() {
		return entityManager.createQuery("select p from Place p", Place.class)
			.getResultList();
	}
}
