package project.airbnb.bnb;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Bnb {

	@Id @GeneratedValue
	@Column(name = "bnb_id")
	private Long id;

}
