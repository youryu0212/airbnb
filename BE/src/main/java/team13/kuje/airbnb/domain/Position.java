package team13.kuje.airbnb.domain;

import java.math.BigDecimal;
import javax.persistence.Embeddable;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Embeddable
@NoArgsConstructor
@Getter
public class Position {

	private static final String SEOUL_CITY_HALL_LAT = "37.5666805";
	private static final String SEOUL_CITY_HALL_LNG = "126.9784147";
	private static final BigDecimal MAX_LAT = BigDecimal.valueOf(90);
	private static final BigDecimal MIN_LAT = BigDecimal.valueOf(-90);
	private static final BigDecimal MAX_LNG = BigDecimal.valueOf(180);
	private static final BigDecimal MIN_LNG = BigDecimal.valueOf(-180);

	private BigDecimal lat;
	private BigDecimal lng;

	public Position(String lat, String lng) {
		try {
			if (lat == null && lng == null) {
				this.lat = new BigDecimal(SEOUL_CITY_HALL_LAT);
				this.lng = new BigDecimal(SEOUL_CITY_HALL_LNG);
				return;
			}
			this.lat = new BigDecimal(lat);
			this.lng = new BigDecimal(lng);
			validateRangeOfPosition();
		} catch (RuntimeException e) {
			throw new IllegalArgumentException("lat, lng 데이터가 잘못되었습니다.");
		}
	}

	private void validateRangeOfPosition() {
		if (this.lat.compareTo(MAX_LAT) > 0 || this.lat.compareTo(MIN_LAT) < 0 ||
			this.lng.compareTo(MAX_LNG) > 0 || this.lng.compareTo(MIN_LNG) < 0) {
			throw new IllegalArgumentException();
		}
	}

}
