package team13.kuje.airbnb.domain;

import javax.persistence.Column;
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
public class Event {

	@Id
	@GeneratedValue
	private Long id;

	private String title;
	private String description;
	private String imageUrl;
	private boolean isMain;

}
