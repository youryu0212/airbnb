package team13.kuje.airbnb.domain;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Place {

	@Id
	@GeneratedValue
	private Long id;

	private String title;
	private String imageUrl;

	@Embedded
	private Position position;


	public int calculateTime(Position position) {
		// TODO : 계산로직

		return 0;
	}
}
