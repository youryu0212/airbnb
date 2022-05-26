package team13.kuje.airbnb.domain;

import java.math.BigDecimal;
import javax.persistence.Embeddable;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Embeddable
@NoArgsConstructor
@Getter
public class Position {

	public static final String SEOUL_CITY_HALL_LAT = "37.5666805";
	public static final String SEOUL_CITY_HALL_LNG = "126.9784147";

	private BigDecimal lat;
	private BigDecimal lng;

	public Position(String lat, String lng) {
		try {
			this.lat = new BigDecimal(lat);
			this.lng = new BigDecimal(lng);
		} catch (NullPointerException e) {
			this.lat = new BigDecimal(SEOUL_CITY_HALL_LAT);
			this.lng = new BigDecimal(SEOUL_CITY_HALL_LNG);
		} catch (NumberFormatException e) {
			throw new IllegalArgumentException("lat, lng 데이터가 잘못되었습니다.");
		}
	}


}
